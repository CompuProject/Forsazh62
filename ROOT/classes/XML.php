<?php

/*
 * НЕ ИЗМЕНЯТЬ И НЕ УДАЛЯТЬ АВТОРСКИЕ ПРАВА И ЗАГОЛОВОК ФАЙЛА
 * 
 * Копирайт © 2010-2016, CompuProject и/или дочерние компании.
 * Все права защищены.
 * 
 * CSystem это программное обеспечение предоставленное и разработанное 
 * CompuProject в рамках проекта CSystem без каких либо сторонних изменений.
 * 
 * Распространение, использование исходного кода в любой форме и/или его 
 * модификация разрешается при условии, что выполняются следующие условия:
 * 
 * 1. При распространении исходного кода должно оставатсья указанное выше 
 *    уведомление об авторских правах, этот список условий и последующий 
 *    отказ от гарантий.
 * 
 * 2. При изменении исходного кода должно оставатсья указанное выше 
 *    уведомление об авторских правах, этот список условий, последующий 
 *    отказ от гарантий и пометка о сделанных изменениях.
 * 
 * 3. Распространение и/или изменение исходного кода должно происходить
 *    на условиях Стандартной общественной лицензии GNU в том виде, в каком 
 *    она была опубликована Фондом свободного программного обеспечения;
 *    либо лицензии версии 3, либо (по вашему выбору) любой более поздней
 *    версии. Вы должны были получить копию Стандартной общественной 
 *    лицензии GNU вместе с этой программой. Если это не так, см. 
 *    <http://www.gnu.org/licenses/>.
 * 
 * CSystem распространяется в надежде, что она будет полезной,
 * но БЕЗО ВСЯКИХ ГАРАНТИЙ; даже без неявной гарантии ТОВАРНОГО ВИДА
 * или ПРИГОДНОСТИ ДЛЯ ОПРЕДЕЛЕННЫХ ЦЕЛЕЙ. Подробнее см. в Стандартной
 * общественной лицензии GNU.
 * 
 * НИ ПРИ КАКИХ УСЛОВИЯХ ПРОЕКТ, ЕГО УЧАСТНИКИ ИЛИ CompuProject НЕ 
 * НЕСУТ ОТВЕТСТВЕННОСТИ ЗА КАКИЕ ЛИБО ПРЯМЫЕ, КОСВЕННЫЕ, СЛУЧАЙНЫЕ, 
 * ОСОБЫЕ, ШТРАФНЫЕ ИЛИ КАКИЕ ЛИБО ДРУГИЕ УБЫТКИ (ВКЛЮЧАЯ, НО НЕ 
 * ОГРАНИЧИВАЯСЬ ПРИОБРЕТЕНИЕМ ИЛИ ЗАМЕНОЙ ТОВАРОВ И УСЛУГ; ПОТЕРЕЙ 
 * ДАННЫХ ИЛИ ПРИБЫЛИ; ПРИОСТАНОВЛЕНИЕ БИЗНЕСА). 
 * 
 * ИСПОЛЬЗОВАНИЕ ДАННОГО ИСХОДНОГО КОДА ОЗНАЧАЕТ, ЧТО ВЫ БЫЛИ ОЗНАКОЛМЛЕНЫ
 * СО ВСЕМИ ПРАВАМИ, СТАНДАРТАМИ И УСЛОВИЯМИ, УКАЗАННЫМИ ВЫШЕ, СОГЛАСНЫ С НИМИ
 * И ОБЯЗУЕТЕСЬ ИХ СОБЛЮДАТЬ.
 * 
 * ЕСЛИ ВЫ НЕ СОГЛАСНЫ С ВЫШЕУКАЗАННЫМИ ПРАВАМИ, СТАНДАРТАМИ И УСЛОВИЯМИ, 
 * ТО ВЫ МОЖЕТЕ ОТКАЗАТЬСЯ ОТ ИСПОЛЬЗОВАНИЯ ДАННОГО ИСХОДНОГО КОДА.
 * 
 * Данная копия CSystem используется для сайта <http://www.forsazh62.ru>
 * 
 */

class XML {
    private $array;
    public function XML() {
        $this->valid = FALSE;
        $this->test = 0;
    }
    public function xmlwebi($file_name, $WHITE=1, $encoding='UTF-8') {
        $data = file_get_contents($file_name);
        $data = str_replace ("&", "&amp;" , $data);
        $ferstData = substr($data, 0,  300);
        $secondData = substr($data, 300);
        $ferstData = preg_replace ("'<\?xml.*\?>'si", "", $ferstData);
        $data = $ferstData.$secondData;
        /*$data = preg_replace ("'<\?xml.*\?>'si", "", $data,0);*/
        $data = "<webi_xml>".$data."</webi_xml>";
        $data = trim($data);
        $vals = $index = $this->array = array();
        $parser = xml_parser_create($encoding);
        xml_parser_set_option($parser, XML_OPTION_CASE_FOLDING, 0);
        xml_parser_set_option($parser, XML_OPTION_SKIP_WHITE, $WHITE);
        $this->valid = xml_parse_into_struct($parser, $data, $vals, $index);
        xml_parser_free($parser);
        $i = 0;
        $tagname = $vals[$i]['tag'];
        
        
        if(isset($vals[$i]['attributes'])) {
            $this->array[$tagname]['@'] = $vals[$i]['attributes'];
        } else {
            $this->array[$tagname]['@'] = array();
        }
        $this->array[$tagname]['#'] = $this->xml_depth($vals, $i);
        return $this->array['webi_xml']['#']; 
    }

    private function xml_depth($vals,&$i) {
        $children = array();
        if (isset($vals[$i]['value'])) {
            array_push($children, $vals[$i]['value']);
        }        
        while (++$i < count($vals)) {
            switch ($vals[$i]['type']) {
                case 'open':
                    if (isset($vals[$i]['tag'])) {
                            $tagname = $vals[$i]['tag'];
                    }
                    else {
                            $tagname = '';
                    }
                    if (isset($children[$tagname])) {
                            $size = sizeof($children[$tagname]);
                    }
                    else {
                            $size = 0;
                    }
                    if ( isset ( $vals[$i]['attributes'] ) ) {
                            $children[$tagname][$size]['@'] = $vals[$i]["attributes"];
                    }
                    $children[$tagname][$size]['#'] = $this->xml_depth($vals, $i);
                    break;
                case 'cdata':
                    array_push($children, nl2br($vals[$i]['value']));
                    break;
                case 'complete':
                    $tagname = $vals[$i]['tag'];
                    if(isset($children[$tagname])) {
                            $size = sizeof($children[$tagname]);
                    }
                    else {
                            $size = 0;
                    }

                    if(isset($vals[$i]['value'])) {
                            $children[$tagname][$size]['#'] = $vals[$i]['value'];
                    }
                    else {
                            $children[$tagname][$size]['#'] = '';
                    }

                    if(isset($vals[$i]['attributes'])) {
                            $children[$tagname][$size]['@'] = $vals[$i]['attributes'];
                    }
                    break;
                case 'close':
                    return $children;
                    break;
            }
        }
        return $children;
    }
}
?>
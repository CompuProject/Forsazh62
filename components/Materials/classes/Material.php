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

class Material {
    private $thisLang;
    private $malerial;
    private $malerialData;
    private $langType;
    private $html;
    private $noData;
    
    public function __construct() {
        $this->noData = false;
        global $_URL_PARAMS;
        global $_PARAM;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->malerial = $_PARAM['name'];
        $this->generateHtml();
    }
    
    private function getMaterialData() {
        $query ="select * from `Materials` where `alias`='$this->malerial'";
        $mySqlHelper = new MySqlHelper($query);
        $this->malerialData = $mySqlHelper->getDataRow(0);
        if(count($this->malerialData) == 0) {
            $this->noData = true;
            return;
        }
        $this->getMaterialDataText();
        $this->getCategories();
    }
    
    private function getMaterialDataText() {        
        $this->langHelper = new LangHelper("Materials_Lang","lang","material",$this->malerial,$this->thisLang);
        $this->langType = $this->langHelper->getLangType();
        if($this->langType != -1){
            $langData = $this->langHelper->getLangData();
            $this->malerialData['title'] = $langData["title"];
            $this->malerialData['text'] = $langData["text"];
        } else {
            $this->malerialData['title'] = "";
            $this->malerialData['text'] = "";
        }
        $this->malerialData['noLocal'] = null;
    }
    
    private function getCategories() {
        $query ="select * from `MaterialsInCategories` where `material`='$this->malerial'";
        $mySqlHelper = new MySqlHelper($query);
        $this->malerialData['categories'] = $mySqlHelper->getAllData();
    }


    private function generateHtml() {
        $this->getMaterialData();
        if($this->noData) {
            $this->html = "404 - Страница не найдена";
            return;
        }
        $out = "";
        if($this->malerialData['showTitle']>0) {
            $out .= "<h1>".$this->malerialData['title']."</h1>\n";
        }
        $out .= "<div class='text'>";
        $out .= $this->malerialData['text'];
        $out .= "</div>";
        $out .= $this->getDate();
        $this->html = $out;
    }
    
    private function getDate() {
        $out = "";
        if($this->malerialData['showCreated']>0) {
            if($this->malerialData['showChange']>0) {
                $date = new DateTime($this->malerialData['lastChange']);
            } else {
                $date = new DateTime($this->malerialData['created']);
            }
            $out .= "<div class='materials_info_panel'><span class='date'>".$date->format('d M Y')."</span></div>";
        }
        return $out;
    }
    
    public function getHtml() {
        echo $this->html;
    }
}
?>

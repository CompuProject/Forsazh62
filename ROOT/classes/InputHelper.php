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

class InputHelper {

    public static function checkbox($name,$id,$class,$mandatory,$value,$checked=null,$JSevents=null) {
        if($mandatory) {
            $required = " required ";
        } else {
            $required = "";
        }
        if($JSevents==null) {
            $JSevents="";
        }
        if($checked!==null && $checked !== false && $checked !== '0' && $checked !== '') {
            $checked = 'checked';
        } else {
            $checked='';
        }
        $out = '<input type="checkbox" class="'.$class.'" name="'.$name.'" value="'.
                $value.'" id="'.$id.'" '.$checked.' '.
                $required.' '.$JSevents.' autocomplete="off" />';
        return $out;
    }

    public static function passwordBox($name,$id,$class,$maxlength,$mandatory,$value,$JSevents=null) {
        if($mandatory) {
            $required = " required ";
        } else {
            $required = "";
        }
        if($JSevents==null) {
            $JSevents="";
        }
        $out = '<input type="password" class="'.$class.'" name="'.$name.'" value="'.
                $value.'" id="'.$id.'" maxlength="'.$maxlength.'" '.
                $required.' '.$JSevents.' autocomplete="off" />';
        return $out;
    }

    public static function paternPasswordBox($name,$id,$class,$maxlength,$mandatory,$placeholder,$pattern,$value,$JSevents=null) {
        if($mandatory) {
            $required = " required ";
        } else {
            $required = "";
        }
        if($JSevents==null) {
            $JSevents="";
        }
        $out = '<input type="password" class="'.$class.'" name="'.$name.'" value="'.$value.'" id="'.
                $id.'" maxlength="'.$maxlength.'"  placeholder="'.
                $placeholder.'" title="'.$placeholder.'"  pattern="'.
                $pattern.'" '.$required.' '.$JSevents.' autocomplete="off" />';
        return $out;
    }
    
    /**
     * 
     * @param type $name
     * @param type $id 
     * @param type $class
     * @param type $maxlength
     * @param type $mandatory - true если поле обязательное
     * @param type $value
     * @return string
     */
    public static function textBox($name,$id,$class,$maxlength,$mandatory,$value,$JSevents=null) {
        if($mandatory) {
            $required = " required ";
        } else {
            $required = "";
        }
        if($JSevents==null) {
            $JSevents="";
        }
        $out = '<input type="text" class="'.$class.'" name="'.$name.'" value="'.
                $value.'" id="'.$id.'" maxlength="'.$maxlength.'" '.
                $required.' '.$JSevents.' autocomplete="off" />';
        return $out;
    }
    
    /**
     * 
     * @param type $name
     * @param type $id
     * @param type $maxlength
     * @param type $mandatory - true если поле обязательное
     * @param type $placeholder - пример
     * @param type $pattern - регулярное выражение
     * @param type $value
     * @return string
     */
    public static function paternTextBox($name,$id,$class,$maxlength,$mandatory,$placeholder,$pattern,$value,$JSevents=null) {
        if($mandatory) {
            $required = " required ";
        } else {
            $required = "";
        }
        if($JSevents==null) {
            $JSevents="";
        }
        $out = '<input type="text" class="'.$class.'" name="'.$name.'" value="'.$value.'" id="'.
                $id.'" maxlength="'.$maxlength.'"  placeholder="'.
                $placeholder.'" title="'.$placeholder.'"  pattern="'.
                $pattern.'" '.$required.' '.$JSevents.' autocomplete="off" />';
        return $out;
    }
    
    /**
     * 
     * @param type $name
     * @param type $id
     * @param type $maxlength
     * @param type $mandatory - true если поле обязательное
     * @param type $value
     * @return string
     */
    public static function textarea($name,$id,$class,$maxlength,$mandatory,$value,$JSevents=null) {
        if($mandatory) {
            $required = " required ";
        } else {
            $required = "";
        }
        if($JSevents==null) {
            $JSevents="";
        }
        $out = '<textarea  class="'.$class.'" name="'.$name.'" value="" id="'.$id.'" maxlength="'.
                $maxlength.'" '.$required.' '.$JSevents.' autocomplete="off" >'.$value.
                '</textarea>';
        return $out;
    }
    
    /**
     * 
     * @param type $name
     * @param type $id
     * @param type $array
     * @param type $mandatory
     * @param type $value
     * @return string
     */
    public static function select($name,$id,$array,$mandatory,$value,$JSevents=null) {
        if($mandatory) {
            $required = " required ";
        } else {
            $required = "";
        }
        if($JSevents==null) {
            $JSevents="";
        }
        $out = '<select class="selectBox" name="'.$name.'" value="" id="'.$id.'" '.$required.' '.$JSevents.' >';
//        $out .= '<option></option>';
        foreach ($array as $val) {
            if($value == $val['value']) {
                $selected = "selected";
            } else {
                $selected = "";
            }
            $out .= '<option class="selectBox" value="'.$val['value'].'" '.$selected.'>'.$val['text'].'</option>';
        }
        $out .= '</select>';
        return $out;
    }
    
    /**
     * Загрузки любых файлов
     * @param type $name - 1) name input
     * @param type $id - 2) id input
     * @param type $class - 3) css класс
     * @param type $mandatory - 4) обязательное поле
     * @param type $multiple - 5) загрузки более одного файла
     * @param type $accept - 6) фильтр на типы файлов. Тип файла указывается как MIME-тип, 
     *          при нескольких значениях они перечисляются через запятую.Если файл не подходит
     *          под установленный фильтр, он не показывается в окне выбора файлов.
     * @return string
     */
    public static function loadFiles($name, $id, $class, $mandatory, $multiple = false, $accept = null) {
        $mandatory ? $required = " required " : $required = '';
        $accept != null ? $acceptHtml = ' accept="'.$accept.'"' : $acceptHtml = '';
        if ($multiple) {
            $multipleHtml = ' multiple ';
            $name = $name.'[]';
        } else {
            $multipleHtml = '';
        }
        $file = '<input type="file" class="'.$class.'" name="'.$name.'" id="'.$id.'" '.$required.$acceptHtml.$multipleHtml.'  autocomplete="off">';
        return $file;
    }

    public static function createFormRow($input,$mandatory,$text,$info=null,$id=null) {
        $mandatoryText = "";
        if($mandatory) {
            $mandatoryText = '* ';
        }
        if($id==null) {
            $id="";
        } else {
            $id = 'id="'.$id.'"';
        }
        $out =  '<tr '.$id.'>';
        $out .=  '<td class="FormTable_Text">';
        $out .=  '<div class="text">'.$mandatoryText.$text.'</div>';
        if($info != null && $info != "") {
            $out .=  '<div class="info">'.$info.'</div>';
        }
        $out .=  '</td>';
        $out .=  '<td class="FormTable_Input">'.$input.'</td>';
        $out .=  '</tr>';
        return $out;
    }
    
    public static function createFormRow_RowText($text) {
        return '<tr><td class="FormTable_RowText" colspan="2">'.$text.'</td></tr>';;
    }
    
    public static function getLengSelect($name,$id,$mandatory,$value=null,$JSevents=null) {
        global $_SQL_HELPER;
        $array = array();
        $query = "SELECT * FROM  `Lang`;";
        $result = $_SQL_HELPER->select($query);
        $i=0;
        foreach ($result as $lang) {
            $array[$i]['value'] = $lang['lang'];
            $array[$i++]['text'] = $lang['langName'];
            if(($value==null || $value=="") && $lang['default']=='1') {
                $value = $lang['lang'];
            }
        }
        return self::select($name,$id,$array,$mandatory,$value,$JSevents=null);
    }
    
    public static function getChekBoxGroup($name,$id,$array,$mandatory,$value=null,$allCheck=false,$JSevents=null,$cssClass=null) {
        if($mandatory) {
            $required = " required ";
        } else {
            $required = "";
        }
        if($JSevents==null) {
            $JSevents="";
        }
        if($cssClass==null) {
            $cssClass="";
        }
        $out = "";
        $out .= '<div class="checkboxGroup '.$cssClass.'">';
        foreach ($array as $key => $element) {
            if($allCheck || ($value!=null && in_array($element['value'],$value))) {
                $checked = 'checked';
            } else {
                $checked = '';
            }
            $out .= '<label class="checkboxElement"><input type="checkbox" name="'.$name.'[]" value="'.
                $element['value'].'" id="'.$id.'" '.
                $required.' '.$checked.' '.$JSevents.' autocomplete="off" />'.$element['text'].'</label>';
        }
        $out .= '<div class="clear"></div>';
        $out .= '</div>';
        return $out;
    }
}
?>

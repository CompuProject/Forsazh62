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

class AdminPanel_ComponentPanelUI_Element_Add {
    protected $SQL_HELPER;
    protected $URL_PARAMS;
    protected $thisLang;
    protected $urlHelper;
    protected $inputHelper;
    protected $insertValue;
    protected $originalInsertValue;
    protected $checkAllValueErrors;
    protected $form;
    protected $message;
    protected $langArray;
    protected $yes_no;


    public function __construct() {
        $this->yes_no = array();
        $this->yes_no[0]['value'] = '0';
        $this->yes_no[0]['text'] = 'НЕТ';
        $this->yes_no[1]['value'] = '1';
        $this->yes_no[1]['text'] = 'ДА';
        
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        global $_URL_PARAMS;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->URL_PARAMS = $_URL_PARAMS['params'];
        $this->urlHelper = new UrlHelper();
        $this->inputHelper = new InputHelper();
        $this->insertValue = array();
        $this->message="";
        $this->getLangArray();
        
        $this->setDefaltInput();
        if(isset($_POST['AP_Submit'])) {
            $this->insert();
        }
        $this->generateForm();
    }
    
    private function goToEdit() {
        $params[0] = $this->URL_PARAMS[0];
        $params[1] = $this->URL_PARAMS[1];
        $params[2] = $this->URL_PARAMS[2];
        $params[3] = $this->URL_PARAMS[3];
        $params[4] = 'edit';
        $params[5] = $this->getElementID();
        echo '<script language="JavaScript">';
        echo 'window.location.href = "'.$this->urlHelper->chengeParams($params).'"';
        echo '</script>';
    }
    
    protected function getElementID() {
        return $this->insertValue['alias'];
    }
    
    private function getLangArray() {
        $this->langArray = array();
        $query = "SELECT * FROM  `Lang`;";
        $this->langArray = $this->SQL_HELPER->select($query);
    }
    
    private function insert() {
        $this->getAllValue();
        if($this->checkAllValue()) {
            $this->message = "Данные были добавлены<br>";
            $this->insertExecute();
//            $this->setDefaltInput();
            $this->goToEdit();
        } else {
            if($this->checkAllValueErrors!=null) {
                $this->message = "Произошла ошибка";
                foreach ($this->checkAllValueErrors as $CVerror) {
                    $this->message .= "<br>".$CVerror;
                }
                $this->message .= "<br>";
            }
        }
    }
    
    private function generateForm() {        
        $this->form = '';
        $this->form .= '<form class="AP_Form" name="AP_Form" action="'.$this->urlHelper->getThisPage().'" enctype="multipart/form-data" method="post" accept-charset="UTF-8"  autocomplete="on">';
        $this->form .= '<center>';
        $this->form .= "<div class='message'>$this->message</div>";
        $this->form .= '<table class="AP_FormTable" >';
        $this->form .= $this->getInputBlocks();
        foreach ($this->langArray as $langData) {
            $langInputBlocks = $this->getInputLangBlocks($langData['lang']);
            if($langInputBlocks!=null && $langInputBlocks!='') {
                $this->form .= $this->inputHelper->createFormRow_RowText($langData['langName']);
                $this->form .= $langInputBlocks;
            }
        }
        $this->form .= '</table>';
        $this->form .= '<center>';
        $this->form .= '<input class="AP_Submit" type="submit" name="AP_Submit" value="Создать">';
        $this->form .= '</center>';
        $this->form .= '</form>';
        $this->form .= $this->backButton();
    }
    
    private function backButton() {
        $params[0] = $this->URL_PARAMS[0];
        $params[1] = $this->URL_PARAMS[1];
        $params[2] = $this->URL_PARAMS[2];
        $params[3] = $this->URL_PARAMS[3];
        $backUrl = $this->urlHelper->chengeParams($params);
        return '<center><a href="'.$backUrl.'"><input class="AP_Submit" type="button" value="К списку"></a></center>';
    }
    
    /**
     * Получение значений
     */
    protected function getAllValue() {
        $this->insertValue = array();
    }
    
    /**
     * Проверка значений
     */
    protected function checkAllValue() {         
        $this->checkAllValueErrors = array();
    }
    
    /**
     * Установка значений ввода по умолчанию
     */
    protected function setDefaltInput() {
        $this->insertValue = array();
        $this->originalInsertValue = array();
    }
    
    /**
     * Выполнение вставки в таблицы
     */
    protected function insertExecute() {
    }
    
    /**
     * Генерация форм ввода не зависимых от языка
     */
    protected function getInputBlocks() { 
        return "";
    }
    
    /**
     * Генерация форм ввода зависимых от языка
     */
    protected function getInputLangBlocks($lang) {
        return "";
    }
    
    
    /* Вспомогательыне функции не для переопределения */
    protected function checkValue($key,$preg=null) {
        return InputValueHelper::checkValue($key, $preg);
    }
    
    protected function getMysqlText($text) {
        return InputValueHelper::getMysqlText($text);
    }
    
    protected function getPostValue($key) {
        return InputValueHelper::getPostValue($key);
    }
    
    protected function getOriginalPostValue($key) {
        return InputValueHelper::getOriginalPostValue($key);
    }
    
    /* Публичные функции */
    public function getForm() {
        return $this->form;
    }
}

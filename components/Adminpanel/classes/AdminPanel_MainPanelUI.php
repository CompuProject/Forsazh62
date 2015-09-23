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

class AdminPanel_MainPanelUI {
    private $elements;
    private $URL_PARAMS;
    private $SQL_HELPER;
    private $thisLang;
    private $urlHelper;
    private $component;
    private $UI;
    private $adminFilePath;
    private $backButton;


    public function __construct() {
        $this->elements = array();
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        global $_URL_PARAMS;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->urlHelper = new UrlHelper();
        $this->URL_PARAMS = $_URL_PARAMS['params'];
        $this->component = $this->URL_PARAMS[1];
        $this->getComponentFilePath();
    }
    
    private function getComponentFilePath() {
        $query = "SELECT `adminDir` FROM `Components` WHERE `alias`='".$this->component."';";
        $result = $this->SQL_HELPER->select($query,1);
        $this->adminFilePath = './components/'.$this->component."/".$result['adminDir']."/elementsUI/";
    }


    public function addElement($alias,$elementName,$fileName) {
        $this->elements[$alias]['elementName'] = $elementName;
        $this->elements[$alias]['fileName'] = $fileName;
    }
    
    public function deletElement($alias) {
        unset($this->elements[$alias]);
    }
    
    private function getElementList() {
        $params = array();
        $params[0]='components';
        $params[1]=$this->component;
        $params[2]='element';
        $this->UI = '';
        $this->UI .= '<div class="AdminPanelListUI ComponentsElementsListUI">';
        foreach ($this->elements as $alias => $element) {
            $params[3]=$alias;
            $this->UI .= '<div class="AdminPanelListElementUI ComponentElementElementUI AP_element_'.$alias.'">';
                $this->UI .= '<a href="'.$this->urlHelper->chengeParams($params).'">';
                    $this->UI .= '<div class="ElementUIText">';
                    $this->UI .= $element['elementName'];
                    $this->UI .= '</div>';
                $this->UI .= '</a>';
            $this->UI .= '</div>';
        }
        $this->UI .= '</div>';
    }
    
    private function includeAdminFile($alias) {
        if($this->adminFilePath!=null) {
            $this->generateBackButton();
            $filePath = $this->adminFilePath.$this->elements[$alias]['fileName'];
            echo '<h2>'.$this->elements[$alias]['elementName'].'</h2>';
            echo $this->backButton;
            if(file_exists($filePath)) {
                include_once $filePath;
            } else {
                echo "<p>Извините. Произошол сбой. Необходимый для подключения файл отсутствует.</p>";
            }
            $params = array();
            $params[0]='components';
            $params[1]=$this->component;
            echo $this->backButton;
        }
    }
    
    private function generateBackButton() {
        $params = array();
        $params[0]='components';
        $params[1]=$this->component;
        $this->backButton = '<center><div class="buttonBack"><a href="'.$this->urlHelper->chengeParams($params).'">Завершить редактирование<div class="buttonBackIcon"></div></a></div></center>';
    }
    
    public function getUI() {
        $this->getElementList();
        if(isset($this->URL_PARAMS[0]) && $this->URL_PARAMS[0]=='components' && isset($this->URL_PARAMS[1]) && 
                isset($this->URL_PARAMS[2]) && $this->URL_PARAMS[2]=='element' && isset($this->URL_PARAMS[3])) {
            echo $this->UI;
            $this->includeAdminFile($this->URL_PARAMS[3]);
        } else {
            echo $this->UI;
        }
    }
}

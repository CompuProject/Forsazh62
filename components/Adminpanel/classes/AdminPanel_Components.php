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


class AdminPanel_Components {
    private $SQL_HELPER;
    private $thisLang;
    private $urlHelper;
    
    private $componentsList;
    private $componentsListName;
    
    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        global $_URL_PARAMS;
        global $_URL_PARAMS;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->urlHelper = new UrlHelper();
        $this->generateComponentList();
    }
    
    private function generateComponentList() {
        $this->componentsList = array();
        $this->componentsListName = array();
        $query = "SELECT * FROM  `Components`;";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $component) {
            $APcomponentElements = new AdminPanel_ComponentElements($component['alias']);
            $componentElements = $APcomponentElements->getComponentElemensList();
            $this->componentsList[$component['alias']] = new AdminPanel_Component($component['alias'], $component, $componentElements);
            $this->componentsListName[] = $component['alias'];
        }
    }
    
    public function getComponents() {
        return $this->componentsList;
    }
    
    public function getComponent($component) {
        return $this->componentsList[$component];
    }
    
    public function getComponentAdminFilePath($component) {
        return $this->componentsList[$component]->getAdminFilePath();
    }
    
    public function getComponentElements($component) {
        return $this->componentsList[$component]->getComponentsElements();
    }
    
    public function getComponentElement($component,$element) {
        return $this->componentsList[$component]->getComponentsElement($element);
    }
    
    public function getComponentElementAdminFilePath($component,$element) {
        return $this->componentsList[$component]->getComponentsElement($element);
    }
    
    public function getComponentsList() {
        return $this->componentsListName;
    }
}

class AdminPanel_Component {
    
    private $alias;
    private $name;
    private $author;
    private $version;
    private $description;
    private $adminDir;
    private $admin;
    private $componentElementsData;
    private $componentElements;
    
    private $adminFilePath;
        
    
    public function __construct($alias,$data,$componentElementsData) {
        $this->alias = $alias;
        $this->name = $data['name'];
        $this->author = $data['author'];
        $this->version = $data['version'];
        $this->description = $data['description'];
        $this->adminDir = $data['adminDir'];
        $this->admin = $data['admin'];
        $this->componentElementsData = $componentElementsData;
        $this->generateAdminFilePath();
        $this->generateComponentsElements();
    }
    
    private function generateComponentsElements() {
        $this->componentElements = array();
        foreach ($this->componentElementsData as $componentElement) {
            $this->componentElements[$componentElement['alias']] = new AdminPanel_ComponentElement($this->alias, $this->adminDir, $componentElement);
        }
        
    }
    
    private function generateAdminFilePath() {
        if($this->admin != "" && $this->admin!=null) {
            $this->adminFilePath = AdminPanel_ComponentHelper::getComponentsDir().$this->alias."/".
                    AdminPanel_ComponentHelper::cutSlesh($this->adminDir)."/".
                    AdminPanel_ComponentHelper::cutSlesh($this->admin);
        } else {
            $this->adminFilePath = null;
        }
    }
    
    public function getComponentsElements() {
        return $this->componentElements;
    }
    
    public function getComponentsElement($element) {
        return $this->componentElements[$element];
    }
    
    public function getAdminFilePath() {
        return $this->adminFilePath;
    }

    public function getAlias() {
        return $this->alias;
    }
    
    public function getName() {
        return $this->name;
    }
    
    public function getAuthor() {
        return $this->author;
    }
    
    public function getVersion() {
        return $this->version;
    }
    
    public function getDesription() {
        return $this->description;
    }
}

class AdminPanel_ComponentElements {
    private $SQL_HELPER;
    private $thisLang;
    private $urlHelper;
    
    private $component;
    private $componentElemensList;
    
    public function __construct($component) {
        $this->component = $component;
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        global $_URL_PARAMS;
        global $_URL_PARAMS;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->urlHelper = new UrlHelper();
        
        $this->generateComponentElemensList();
    }
    
    private function generateComponentElemensList() {
        $query = "SELECT `alias`, `admin`,`name`,`description` FROM  `ComponentsElements` WHERE  `component` =  '".$this->component."';";
        $this->componentElemensList = $this->SQL_HELPER->select($query);
    }
    
    public function getComponentElemensList() {
        return $this->componentElemensList;
    }
}

class AdminPanel_ComponentElement {
    private $component;
    private $adminDir;
    private $alias;
    private $admin;
    private $name;
    private $description;
    
    private $adminFilePath;
    
    public function __construct($component,$adminDir,$data) {
        $this->component = $component;
        $this->adminDir = $adminDir;
        $this->alias = $data['alias'];
        $this->admin = $data['admin'];
        $this->name = $data['name'];
        $this->description = $data['description'];
        $this->generateAdminFilePath();
    }
    
    private function generateAdminFilePath() {
        $this->adminFilePath = AdminPanel_ComponentHelper::getComponentsDir().$this->component."/".
                AdminPanel_ComponentHelper::cutSlesh($this->adminDir)."/".$this->alias."/".
                AdminPanel_ComponentHelper::cutSlesh($this->admin);
    }
    
    public function getAdminFilePath() {
        return $this->adminFilePath;
    }

    public function getAlias() {
        return $this->alias;
    }
    public function getName() {
        return $this->name;
    }
    public function getDesription() {
        return $this->description;
    }
}

class AdminPanel_ComponentHelper {
    
    public static function getComponentsDir() {
        return "./components/";
    }
    
    public static function cutSlesh($string) {
        if($string[0]==".") {
            $string = mb_substr ($string, 1 , (strlen($string)-1), 'UTF-8');
        }
        if($string[0]=="/") {
            $string = mb_substr ($string, 1 , (strlen($string)-1), 'UTF-8');
        }
        if($string[strlen($string)-1]=="/") {
            $string = mb_substr ($string, 0 , (strlen($string)-1), 'UTF-8');
        }
        return $string;
    }
}
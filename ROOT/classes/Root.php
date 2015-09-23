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

/**
 * Основной класс ядра CMS
 */
class Root {
    private $lang;
    private $page;
    private $PAGE;
    private $MODULES;
    private $PLUGINS;
    
    /**
     * Конструктор класса.
     * @global type $_URL_PARAMS - глобальный массив параметров URL.
     */
    public function __construct() {
        global $_URL_PARAMS;
        $this->page = $_URL_PARAMS['page'];
        $this->lang = $_URL_PARAMS['lang'];
        $this->PAGE = new Pages();
        $this->MODULES = new Modules();
        $this->PLUGINS = new Plugins();
    }
    
    /**
     * Подключить основнйо шаблон.
     */
    public function includeTemplate() {
        $this->PAGE->includeTemplate();
    }
    
    /**
     * Подключить шаблон мобильнйо версии.
     */
    public function includeMobileTemplate() {
        $this->PAGE->includeMobileTemplate();
    }
    
    /**
     * Подключить шаблон версии для печати.
     */
    public function includePrintTemplate() {
        $this->PAGE->includePrintTemplate();
    }
    
    /**
     * Выводит на печать путь к папке шаблона.
     */
    public function templatePath() {
        echo $this->PAGE->getTemplatePath();
    }
    
    /**
     * Возвращает путь к папке шаблона.
     * @return String - Путь шаблона.
     */
    public function getTemplatePath() {
        return $this->PAGE->getTemplatePath();
    }

    /**
     * Формирование мета тегов и подключение файлов заголовка.
     * @global type $_SITECONFIG - глобальный массив с настройками сайта.
     */
    public function head() {
        global $_SITECONFIG;
        $meta = '<!-- MAIN Head -->';
        $meta .= "\n";
        $meta .= '<base href="http://'.$_SITECONFIG->getHostName().'/" />';
        $meta .= "\n";
        $meta .= '<title>'.$_SITECONFIG->getSiteName().". ".$this->PAGE->getTitle().'</title>';
        $meta .= "\n";
        $meta .= '<META HTTP-EQUIV="Content-Type" content="text/html; charset='.$_SITECONFIG->getCharset().'">';
        $meta .= "\n";
	$meta .= '<META NAME="author" CONTENT="'.$_SITECONFIG->getCompanyName().'">';
        $meta .= "\n";
	$meta .= '<META NAME="keywords" CONTENT="'.$this->PAGE->getKeywords().'">';
        $meta .= "\n";
	$meta .= '<META NAME="description" CONTENT="'.$this->PAGE->getDescription().'">';
        $meta .= "\n";
	$meta .= '<META NAME="robots" CONTENT="'.$this->PAGE->getRobotString().'">';
        $meta .= "\n\n";
        echo $meta;
        echo "<!-- PLUGINS Head -->\n";
        $this->PLUGINS->includeHead();
        echo "\n\n";
        echo "<!-- PAGE Head -->\n";
        $this->PAGE->includHead();
        echo "\n\n";
        echo "<!-- MODULES Head -->\n";
        $this->MODULES->includeHead();
        echo "\n\n";
    }
    
    /**
     * Подклчюение префиксный файлов и плагинов.
     */
    public function bodyStart() {
        echo "\n\n";
        echo "<!-- PLUGINS -->\n";
        $this->PLUGINS->includePlugin();
        echo "\n\n";
        echo "<!-- PAGE Body Start -->\n";
        $this->PAGE->includBodyStart();
        echo "\n\n";
        echo "<!-- MODULES Body Start -->\n";
        $this->MODULES->includeBodyStart();
        echo "\n\n";
    }
    
    /**
     * Подклчюение постфиксный файлов.
     */
    public function bodyEnd() {
        echo "\n\n";
        echo "<!-- PLUGINS -->\n";
        $this->PLUGINS->includeBodyEnd();
        echo "\n\n";
        echo "<!-- PAGE Body End -->\n";
        $this->PAGE->includBodyEnd();
        echo "\n\n";
        echo "<!-- MODULES Body End -->\n";
        $this->MODULES->includeBodyEnd();
        echo "\n\n";
    }
    
    /**
     * Подклчюение модулей в блоки.
     * @global type $_PARAM - Параметры.
     * @param type $block - имя блока.
     */
    public function block($block){
        $modules = $this->MODULES->getModulesInBlock($block);
        if(count($modules)>0){
            foreach ($modules as $module){
                echo "<div class='m_block ".$module['alias']." ".$module['cssClasses']."'>";
                if($module['showTitle']) {
                    echo "<div class='m_block_title'><h3>";
                    echo "<img src='".$module['icon']."' class='modul_title_icon' ";
                    echo "align='".$module['align']."' ";
                    echo "width='".$module['width']."' ";
                    echo "height='".$module['height']."' />";
                    echo $module['title'];
                    echo "</h3></div>";
                }
                $modulPath = $module['main'];
                global $_PARAM;
                $_PARAM = null;
                if($module['param']!=null) {
                    foreach ($module['param'] as $param) {
                        $_PARAM[$param['param']] = $param['value'];
                    }
                }
                include $modulPath;
                $_PARAM = null;
                echo "</div>";
            }
        }
    }
    
    /**
     * Вставка контента
     */
    public function content() {
        echo "<div class='c_block ".$this->PAGE->getComponent().
                " ".$this->PAGE->getComponentElement().
                " ".$this->PAGE->getCssClass()."'>";
        $this->PAGE->includContent();
        echo "</div>";
    }
    
    /**
     * Вставка страницы для печати
     */
    public function printPage() {
        echo "<div class='pp_block ".$this->PAGE->getComponent().
                " ".$this->PAGE->getComponentElement().
                " ".$this->PAGE->getCssClass()."'>";
        $this->PAGE->includPrintPage();
        echo "</div>";
    }
    
    /**
     * Вставка мобильной версии контента
     */
    public function mobilePage() {
        echo "<div class='mobile_block ".$this->PAGE->getComponent().
                " ".$this->PAGE->getComponentElement().
                " ".$this->PAGE->getCssClass()."'>";
        $this->PAGE->includMobilePage();
        echo "</div>";
    }
    
    /**
     * Вставка заголовка
     */
    public function title() {
        if($this->PAGE->showTitle()){
            echo "<span class='page_title'>";
            echo $this->PAGE->getTitle();
            echo "</span>";
        }
    }
    
    public function setDefaultPageTitle() {
        $this->PAGE->setDefaultPageTitle();
    }
    public function setDefaultTitle() {
        $this->PAGE->setDefaultTitle();
    }
    
    public function setPageTitle($pageTitle) {
        $this->PAGE->setPageTitle($pageTitle);
    }
    public function setTitle($browserTitle) {
        $this->PAGE->setTitle($browserTitle);
    }
    
    public function getPage() {
        return $this->page;
    }
}
?>

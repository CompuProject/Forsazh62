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


class UrlHelper {
    private $thisPage;
    private $thisLang;
    private $thisParam;
    private $mainPage;
    private $defaultLang;
    private $multilanguage;
    private $siteConf;
    
    public function __construct() {
        global $_URL_PARAMS;
        global $_SITECONFIG;
        $this->siteConf = $_SITECONFIG;
        $this->thisPage = $_URL_PARAMS['page'];
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->thisParam = $_URL_PARAMS['params'];
        $this->multilanguage = $this->siteConf->getMultilanguage();
        $this->getMainPageAlias();
        $this->getDefaultLang();
    }
    
    private function getMainPageAlias() {
        $query = "Select `alias` from `Pages` where `isMainPage`='1' limit 0,1;";
        $mySqlHelper = new MySqlHelper($query);
        $pagesInfo = $mySqlHelper->getDataRow(0);
        $this->mainPage = $pagesInfo['alias'];
    }

    private function getDefaultLang() {
        $query = "Select `lang` from `Lang` where `default`='1' limit 0,1;";
        $mySqlHelper = new MySqlHelper($query);
        $langInfo = $mySqlHelper->getDataRow(0);
        $this->defaultLang = $langInfo['lang'];
    }

    private function checkLang($lang) {
        $query = "Select `lang` from `Lang` where `lang`='$lang';";
        $mySqlHelper = new MySqlHelper($query);
        $langInfo = $mySqlHelper->getAllData();
        return count($langInfo)>0 ? true : false;
    }

    private function checkPageAlias($alias) {
        $query = "Select `alias` from `Pages` where `alias`='$alias';";
        $mySqlHelper = new MySqlHelper($query);
        $pagesInfo = $mySqlHelper->getAllData();
        return count($pagesInfo)>0 ? true : false;
    }
    
    private function getPageString($page) {
        $out = "";
        if($page != null && $this->checkPageAlias($page) && $page != $this->mainPage) {
            $out = "/".$page;
        }
        return $out;
    }
    
    private function getLangString($lang) {
        $out = "";
        if($this->multilanguage) {
            if($lang!=null && $this->checkLang($lang)) {
                $out = "/".strtolower($lang);
            } else {
                $out = "/".strtolower($this->defaultLang);
            }
        }
        return $out;
    }

    private function getParamsString($params) {
        $out = "";
        if($params!=null && count($params)>0 && is_array($params)){
            foreach ($params as $param) {
                $out .= "/".$param;
            }
        }
        return $out;
    }

    /**
     * Use $lang = null for default lang
     * Use $page = null for mainPage
     * Use $params = null for url without params
     * @param type $page
     * @param type $lang
     * @param array $params
     */
    public function createUrl($page,$lang,$params) {
        return ".".$this->getPageString($page).
                $this->getLangString($lang).$this->getParamsString($params)."/";
    }
    
    public function getThisPage() {
        return $this->createUrl($this->thisPage,$this->thisLang,$this->thisParam);
    }
    
    public function getThisParentPage() {
        return $this->createUrl($this->thisPage,$this->thisLang,null);
    }
    
    /**
     * Use $lang = null for default lang
     * Use $page = null for mainPage
     * Use $params = null for url without params
     * @param type $page
     * @param type $lang
     * @param array $params
     */
    public function createUrlWithHTTP($page,$lang,$params) {
        return "http://".$this->siteConf->getHostName().$this->getPageString($page).
                $this->getLangString($lang).$this->getParamsString($params)."/";
    }
    public function createThisPageWithHTTP() {
        return "http://".$this->siteConf->getHostName().$this->getPageString($this->thisPage).
                $this->getLangString($this->thisLang).$this->getParamsString($this->thisParam)."/";
    }
    
    /**
     * Use $page = null for mainPage
     * Use $params = null for url without params
     * @param type $page
     * @param type $params
     * @return type
     */
    public function pageUrl($page,$params) {
        return $this->createUrl($page,$this->thisLang,$params);
    }
    
    /**
     * Use $lang = null for default lang
     * @param type $lang
     */
    public function homePageUrlWithLang($lang) {
        return $this->createUrl(null,$lang,null);
    }
    
    public function homePageUrl() {
        return $this->pageUrl(null,null);
    }
    
    public function chengeLangUrl($lang) {
        return $this->createUrl($this->thisPage, $lang, $this->thisParam);
    }
    
    public function chengeParams($params) {
        return $this->createUrl($this->thisPage, $this->thisLang, $params);
    }
}
?>

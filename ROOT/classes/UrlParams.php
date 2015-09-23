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

class UrlParams {
    
    private $urlParams;
    private $siteConf;
    private $multilanguage;
    
    public function __construct() {
        global $_SITECONFIG;
        $this->siteConf = $_SITECONFIG;
        $this->multilanguage = $this->siteConf->getMultilanguage();
        $temp = explode("/", $_SERVER['REQUEST_URI']);
        $allParams = array();
        $params = array();
        $this->urlParams = array();
        $this->urlParams['page'] = null;
        $this->urlParams['lang'] = null;
        $this->urlParams['params'] = null;
        $this->urlParams['isRedirect'] = false;
        foreach ($temp as $value) {
            if($value != null && $value != "") {
                $allParams[] = urldecode($value);
            }
        }
        $position = 0;
        if(count($allParams)>0) {
            if($this->checkPageAlias($allParams[0])) {
                $this->urlParams['page'] = $allParams[0];
                if(count($allParams)>1) {
                    $lang = $this->getLangFromUrl($allParams,1);
                    $this->urlParams['lang'] = $lang['lang'];
                    $lang['isUrlLang'] ? $position = 2 : $position = 1;
                } else {
                    $this->urlParams['lang'] = $this->getDefaultLang();
                    $position = 1;
                }
            } else {
                $this->urlParams['page'] = $this->getMainPageAlias();
                $lang = $this->getLangFromUrl($allParams,0);
                $this->urlParams['lang'] = $lang['lang'];
                $lang['isUrlLang'] ? $position = 1 : $position = 0;
            }
            $params = array();
            for($i=$position; $i<count($allParams);$i++) {
                $params[] = $allParams[$i];
            }
            $this->urlParams['params'] = $params;
        } else {
            $this->urlParams['page'] = $this->getMainPageAlias();
            $this->urlParams['lang'] = $this->getDefaultLang();
        }
    }

    public function getUrlParam() {
        return $this->urlParams;
    }

    private function getLangFromUrl($allParams,$position) {
        if($this->checkLang($allParams[$position])) {
            $lang['lang'] = $allParams[$position];
            $lang['isUrlLang'] = true;
        } else {
            $lang['lang'] = $this->getDefaultLang();
            if($this->multilanguage) {
                $this->urlParams['isRedirect'] = true;
            }
            $lang['isUrlLang'] = false;
        }
        return $lang;
    }

    private function getMainPageAlias() {
        $query = "Select `alias` from `Pages` where `isMainPage`='1' limit 0,1;";
        $mySqlHelper = new MySqlHelper($query);
        $pagesInfo = $mySqlHelper->getDataRow(0);
        return $pagesInfo['alias'];
    }

    private function getDefaultLang() {
        $query = "Select `lang` from `Lang` where `default`='1' limit 0,1;";
        $mySqlHelper = new MySqlHelper($query);
        $langInfo = $mySqlHelper->getDataRow(0);
        return $langInfo['lang'];
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
}
?>

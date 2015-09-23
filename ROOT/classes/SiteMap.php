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
 * Структура данных
 * [<alias группы>][alias]
 * [<alias группы>][name]
 * [<alias группы>][url]
 * [<alias группы>][pages][<порядковый номер>][alias]
 * [<alias группы>][pages][<порядковый номер>][name]
 * [<alias группы>][pages][<порядковый номер>][url]
 */
class SiteMap {
    private $SQL_HELPER;
    private $thisLang;
    private $urlHelper;
    private $siteMapData;
    
    public function __construct() {
        global $_SQL_HELPER;
        global $_URL_PARAMS;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->urlHelper = new UrlHelper();
        $this->getSqlSiteMapData();
    }
    
    private function getUrl($url,$page,$postfix) {
        $out = '';
        if($url != null && $url != '') {
            $out = $url;
        } else if ($page != null && $page != '') {
            if($postfix != null && $postfix != '') {
                $out = $this->urlHelper->pageUrl($page, null).$postfix;
            } else {
                $out = $this->urlHelper->pageUrl($page, null);
            }
        }
        return $out;
    }
    
    private function generateUrlHtml($url, $text) {
        $htmlURL = $text;
        if($url != null && $url != '') {
            $htmlURL = "<a href='".$url."'>".$text."</a>";
        }
        return $htmlURL;
    }
    
    private function getSqlSiteMapData() {
        $query = "SELECT SMG.`alias`, SMG.`url`, SMGP.`page`, SMGP.`postfix`
            FROM `SiteMapGroups` as SMG LEFT JOIN `SiteMapGroupsPages` as SMGP
            on SMG.`alias` = SMGP.`alias`
            ORDER BY SMG.`sequence` ASC;";
        $result = $this->SQL_HELPER->select($query);
        $this->siteMapData = array();
        if($result != null) {
            foreach ($result as $group) {
                $this->siteMapData[$group['alias']]['alias'] = $group['alias'];
                $this->siteMapData[$group['alias']]['name'] = $this->getGroupText($group['alias']);
                $this->siteMapData[$group['alias']]['url'] = $this->getUrl($group['url'],$group['page'],$group['postfix']);
                $this->siteMapData[$group['alias']]['pages'] = $this->getSqlGroupData($group['alias']);
            }
        }
    }
    
    private function getSqlGroupData($group) {
        $query = "SELECT SM.`alias`, SM.`url`, SMP.`page`, SMP.`postfix`
            FROM `SiteMap` as SM LEFT JOIN `SiteMapPages` as SMP
            on SM.`alias` = SMP.`alias`
            where SM.`group` = '".$group."'
            ORDER BY SM.`sequence` ASC;";
        $result = $this->SQL_HELPER->select($query);
        $pages = array();
        if($result != null) {
            foreach ($result as $key => $page) {
                $pages[$key]['alias'] = $page['alias'];
                $pages[$key]['name'] = $this->getPageText($page['alias']);
                $pages[$key]['url'] = $this->getUrl($page['url'],$page['page'],$page['postfix']);
            }
        }
        return $pages;
    }
    
    private function getGroupText($alias) {
        $langHelper = new LangHelper("SiteMapGroups_Lang","lang","alias",$alias,$this->thisLang);
        return $langHelper->getLangValue("name");
    }
    
    private function getPageText($alias) {
        $langHelper = new LangHelper("SiteMap_Lang","lang","alias",$alias,$this->thisLang);
        return $langHelper->getLangValue("name");
    }
    
    private function generateHtml($maxInColumn = null, $noTags = false) {
        $html = '';
        foreach ($this->siteMapData as $element) {
            $html .= $this->generateElementHtml($element['alias'],$maxInColumn,$noTags);
        }
        return $html;
    }
    
    private function generateElementHtml($group, $maxInColumn = null, $noTags = false) {
        if(!isset($this->siteMapData[$group])) {
            return "<div class='SiteMapGroup'>Indefind Group</div>";
        }
        $elementsAmount = $this->siteMapData[$group]['pages'];
        if($maxInColumn == null) {
            $maxInColumn = $elementsAmount;
        }
        $out = '';
        $out .= "<div id='SiteMapGroup_".$group."' class='SiteMapGroup SiteMapGroup_".$group."'>";
        $out .= "<div class='SiteMapGroupTitleWrapper'>";
        $out .= "<div class='SiteMapGroupTitle'>";
        $out .= $this->generateUrlHtml($this->siteMapData[$group]['url'], $this->siteMapData[$group]['name']);
        $out .= "</div>";
        $out .= "</div>";
        $counter = 1;
        $elementsCounter = 1;
        $blockCounter = 1;
        foreach ($this->siteMapData[$group]['pages'] as $element) {
            if($counter == 1) {
                $out .= "<ul class='SiteMapGroupElementBlock ElementBlock_".$blockCounter."'>";
                $blockCounter++;
            }
            $out .= "<li id='SiteMapGroupElement_".$group."_".$element['alias']."' class='SiteMapGroupElement Element_".$element['alias']."'>";
            $out .= "<div class='SiteMapGroupElementTitleWrapper'>";
            $out .= "<div class='SiteMapGroupElementTitle'>";
            if($noTags) {
                $out .= $this->generateUrlHtml($element['url'], strip_tags($element['name']));
            } else {
                $out .= $this->generateUrlHtml($element['url'], $element['name']);
            }
            $out .= "</div>";
            $out .= "</div>";
            $out .= "</li>";
            if($counter == $maxInColumn || $elementsCounter == $elementsAmount) {
                $counter = 1;
                $out .= "</ul>";
            } else {
                $counter++;
            }
            $elementsCounter ++;
        }
        $out .= "</div>";
        return $out;
    }
    
    public function getData($group = null) {
        if($group == null) {
            return $this->siteMapData;
        } else {
            return $this->siteMapData[$group];
        }
    }
    
    public function getHtml($maxInColumn = null, $group = null, $noTags = false) {
        if($group == null) {
            return $this->generateHtml($maxInColumn, $noTags);
        } else {
            return $this->generateElementHtml($group, $maxInColumn, $noTags);
        }
    }
    
    public function get($maxInColumn = null, $group = null, $noTags = false) {
        echo $this->getHtml($maxInColumn, $group, $noTags);
    }
}

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
 * Класс для работы с модулями.
 */
class Modules {
    private $page;
    private $lang;
    private $blocks;
    private $modules;
    private $moduleFile;
    
    /**
     * Конструктор класса.
     * @global type $_URL_PARAMS - глобальный массив параметров URL.
     */
    public function __construct() {
        global $_URL_PARAMS;
        $this->page = $_URL_PARAMS['page'];
        $this->lang = $_URL_PARAMS['lang'];
        $this->getTemplateBlocks();
        $this->getModulesInBlockData();
        $this->getModulesFiles();
    }
    
    /**
     * Получение из базы списка блоков шаблона указанной страницы.
     */
    private function getTemplateBlocks() {
        $query = "select
            TB.`id`,
            TB.`block` 
            from (select
                Te.`alias` as template
                from `Pages` as Pg left join `Templates` as Te
                    on Pg.`template` = Te.`alias`
                    where Pg.`alias` = '$this->page') 
                as Te left join `TemplateBlocks` as TB
                on Te.`template` = TB.`template`";
        $mySqlHelper = new MySqlHelper($query);
        $blocksData = $mySqlHelper->getAllData();
        $this->blocks = array();
        $i=0;
        foreach ($blocksData as $block) {
            $this->blocks[$i]['id'] = $block['id'];
            $this->blocks[$i++]['block'] = $block['block'];
        }
    }
    
    /**
     * Получение информации о модулях по блокам.
     */
    private function getModulesInBlockData() {
        foreach ($this->blocks as $block) {
            $modulesInBlock = new ModulesInBlock($block['id']);
            $this->modules[$block['block']] = $modulesInBlock->getData();
        }
    }
    
    /**
     * Возвращает массив всех модулей.
     * @return array - массив всех модулей.
     */
    public function getModules() {
        return $this->modules;
    }
    
    /**
     * Возвращает массив модулей указанного блока шаблона.
     * @param String $block - alias блока шаблона.
     * @return array - массив модулей указанного блока шаблона.
     */
    public function getModulesInBlock($block) {
        return $this->modules[$block];
    }
    
    /**
     * Получение списка подключаемых файлов.
     */
    private function getModulesFiles() {
        $this->moduleFile = null;
        $i = 0;
        foreach ($this->modules as $modulesInBlocks) {
            if(count($modulesInBlocks)>0) {
                foreach ($modulesInBlocks as $module) {
                    $this->moduleFile[$i]['head'] = $module['head'];
                    $this->moduleFile[$i]['bodyStart'] = $module['bodyStart'];
                    $this->moduleFile[$i]['bodyEnd'] = $module['bodyEnd'];
                    $this->moduleFile[$i]['includeOnceHead'] = $module['includeOnceHead'];
                    $this->moduleFile[$i]['includeOnceBodyStart'] = $module['includeOnceBodyStart'];
                    $this->moduleFile[$i]['includeOnceBodyEnd'] = $module['includeOnceBodyEnd'];
                    $this->moduleFile[$i++]['param'] = $module['param'];
                }
            }
        }
    }
    
    /**
     * Подключение файлов.
     * @global type $_PARAM - глобальный массив параметров.
     * @param type $key - ключ подключаемого файла.
     * @param type $key2 - ключ к переменной includeOnce для подключаемого файла.
     */
    private function includeFile($key,$key2) {
        if(count($this->moduleFile)>0) {
            foreach ($this->moduleFile as $modules) {
                global $_PARAM;
                $_PARAM = null;
                if($modules['param']!=null) {
                    foreach ($modules['param'] as $param) {
                        $_PARAM[$param['param']] = $param['value'];
                    }
                }
                if($modules[$key]!=null && $modules[$key]!="") {
                    if($modules[$key2]>0) {
                        include_once $modules[$key];
                    } else {
                        include $modules[$key];
                    }
                }
                $_PARAM = null;
            }
        }
    }
    
    /**
     * Подключение файлов заголовка
     */
    public function includeHead() {
        $this->includeFile('head','includeOnceHead');
    }
    
    /**
     * Подключение файлов префикса.
     */
    public function includeBodyStart() {
        $this->includeFile('bodyStart','includeOnceBodyStart');
    }
    
    /**
     * Подклчюение файлов постфикса.
     */
    public function includeBodyEnd() {
        $this->includeFile('bodyEnd','includeOnceBodyEnd');
    }
}
?>

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
 * Обработка плагинов дял сайта.
 */
class Plugins {
    private $page;
    private $pluginsDate = array();
    private $pluginsParam = array();
    private $pluginsPath;
    
    /**
     * Конструктор класса.
     * @global type $_URL_PARAMS - глобальный массив параметров URL.
     */
    public function __construct() {
        global $_URL_PARAMS;
        $this->page = $_URL_PARAMS['page'];
        $this->pluginsPath = "./plugins/";
        $this->getPluginsDate();
        foreach ($this->pluginsDate as $pd){
            $this->getPluginParam($pd['id'],$pd['alias']);
        }
    }
    
    /**
     * Получение данных о плагине из базы.
     */
    private function getPluginsDate() {
        $query = "Select
            PlOnPg.`id`, 
            Pl.`alias`, 
            PlOnPg.`page`, 
            Pl.`main`, 
            Pl.`head`,  
            Pl.`bodyEnd`,
            Pl.`sequence`
            from `PluginOnPage` as PlOnPg right join `Plugins` as Pl
            on PlOnPg.`plugin` = Pl.`alias`
            where PlOnPg.`page` = '$this->page' 
            or  Pl.`onAllPages`='1'
            order by Pl.`sequence` asc";
        $mySqlHelper = new MySqlHelper($query);
        $this->pluginsDate = $mySqlHelper->getAllData();
    }
    
    /**
     * Получение списка параметров для плагина.
     * @param type $id - id плагина.
     * @param type $plugin - имя плагина.
     */
    private function getPluginParam($id,$plugin) {
        $query = "Select * from `PluginDefaultParam` where `plugin`='".$plugin."'";
        $mySqlHelper = new MySqlHelper($query);
        $this->pluginsParam[$plugin]['default'] = $mySqlHelper->getAllData();
        $query = "Select * from `PluginParam` where `plugin`='".$id."'";
        $mySqlHelper = new MySqlHelper($query);
        $this->pluginsParam[$plugin]['page'] = $mySqlHelper->getAllData();
    }
    
    /**
     * Подключение файлов.
     * @global type $_PARAM - глобальный массив параметров.
     * @param type $key - ключ.
     */
    private function includeFile($key) {
        foreach ($this->pluginsDate as $plugin) {
            global $_PARAM;
            $_PARAM = null;
            $params = $this->pluginsParam[$plugin['alias']]['default'];
            if($params!=null) {
                foreach ($params as $param) {
                    $_PARAM[$param['param']] = $param['value'];
                }
            }
            $params = $this->pluginsParam[$plugin['alias']]['page'];
            if($params!=null) {
                foreach ($params as $param) {
                    $_PARAM[$param['param']] = $param['value'];
                }
            }
            if(isset($plugin[$key]) && $plugin[$key]!=null && $plugin[$key]!="") {
                include_once $this->pluginsPath.$plugin['alias']."/".$plugin[$key];
            }
            $_PARAM = null;
        }
    }
    
    /**
     * Подключение заголовка.
     */
    public function includeHead() {
        $this->includeFile('head');
    }
    
    /**
     * Подключение основного файла.
     */
    public function includePlugin() {
        $this->includeFile('main');
    }
    
    /**
     * Подключение основного файла.
     */
    public function includeBodyEnd() {
        $this->includeFile('bodyEnd');
    }
}
?>

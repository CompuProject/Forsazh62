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

class AdminPanel_ComponentPanelUI_Element {
    protected $SQL_HELPER;
    protected $thisLang;
    protected $urlHelper;
    protected $URL_PARAMS;
    protected $html;
    protected $repeatAdd = 50;
    protected $data;
    protected $elementAliasID;
    
    protected $AE_TYPE;
    protected $AE_TYPE_NAME;
    protected $AE_SUBTYPE;
    protected $AE_SUBTYPE_NAME;
    protected $AE_ACTION;
    protected $AE_ACTION_ELEMENT;
    protected $AE_DELETE_YES;


    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        
        global $_URL_PARAMS;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->urlHelper = new UrlHelper();
        $this->URL_PARAMS = $_URL_PARAMS['params'];
        $this->setParams();
        if($this->AE_ACTION == null) {
            $this->getData();
            $this->generateHtml();
        } else if($this->AE_ACTION == 'add') {
            $this->generateAddUI();
        } else if($this->AE_ACTION == 'edit' && $this->AE_ACTION_ELEMENT!= null) {
            $this->generateEditUI();
        }  else if($this->AE_ACTION == 'delete' && $this->AE_ACTION_ELEMENT!= null) {
            if($this->AE_DELETE_YES == 'yes') {
                $this->generateDeleteYesUI();
            } else {
                $this->generateDeleteNoUI();
            }
        }
    }
    
    private function setParams() {
        $this->AE_TYPE = null;
        $this->AE_TYPE_NAME = null;
        $this->AE_SUBTYPE = null;
        $this->AE_SUBTYPE_NAME = null;
        $this->AE_ACTION = null;
        $this->AE_ACTION_ELEMENT = null;
        $this->AE_DELETE_YES = null;
        if(isset($this->URL_PARAMS[0])) {
            $this->AE_TYPE = $this->URL_PARAMS[0];
        }
        if(isset($this->URL_PARAMS[1])) {
            $this->AE_TYPE_NAME = $this->URL_PARAMS[1];
        }
        if(isset($this->URL_PARAMS[2])) {
            $this->AE_SUBTYPE = $this->URL_PARAMS[2];
        }
        if(isset($this->URL_PARAMS[3])) {
            $this->AE_SUBTYPE_NAME = $this->URL_PARAMS[3];
        }
        if(isset($this->URL_PARAMS[4])) {
            $this->AE_ACTION = $this->URL_PARAMS[4];
        }
        if(isset($this->URL_PARAMS[5])) {
            $this->AE_ACTION_ELEMENT = $this->URL_PARAMS[5];
        }
        if(isset($this->URL_PARAMS[6])) {
            $this->AE_DELETE_YES = $this->URL_PARAMS[6];
        }
    }

    /**
     * основной UI
     */
    private function generateHtml() {
        $params_add = array();
        $params_edit = array();
        $params_delete = array();
        $params_add[0]=$params_edit[0]=$params_delete[0]=$this->URL_PARAMS[0];
        $params_add[1]=$params_edit[1]=$params_delete[1]=$this->URL_PARAMS[1];
        $params_add[2]=$params_edit[2]=$params_delete[2]=$this->URL_PARAMS[2];
        $params_add[3]=$params_edit[3]=$params_delete[3]=$this->URL_PARAMS[3];
        $params_add[4]='add';
        $params_edit[4]='edit';
        $params_delete[4]='delete';
        
        $this->html = '';
        $this->html .= '<div class="AdminPanelListUI ElementsListUI">';
        $addUrl = $this->urlHelper->chengeParams($params_add);
        $i=0;
        $this->html .= '<div class="ListElementUI ElementUI AdminAddButton"><a href="'.$addUrl.'"><div class="ElementUIText">Добавить</div></a></div>';
        foreach ($this->data as $dataElement) {
            if($i++ == $this->repeatAdd) {
                $i = 0;
                $this->html .= '<div class="ListElementUI ElementUI AdminAddButton"><a href="'.$addUrl.'"><div class="ElementUIText">Добавить</div></a></div>';
            }
            $this->setElementAliasID($dataElement);
            $this->html .= '<div class="ListElementUI ElementUI">';
                $this->html .= '<div class="ElementBlockRightPanel">';
                    $params_edit[5]=$params_delete[5]=$this->elementAliasID;
                    $this->html .= '<div class="Edit">';
                    $this->html .= '<a href="'.$this->urlHelper->chengeParams($params_edit).'">';
                    $this->html .= 'Изменить';
                    $this->html .= '</a>';
                    $this->html .= '</div>';
                    $this->html .= '<div class="Delete">';
                    $this->html .= '<a href="'.$this->urlHelper->chengeParams($params_delete).'">';
                    $this->html .= 'Удалить';
                    $this->html .= '</a>';
                    $this->html .= '</div>';
                $this->html .= '</div>';
                $this->html .= $this->getHtmlUI($dataElement);
                $this->html .= '<div class="clear"></div>';
            $this->html .= '</div>';
        }
        $this->html .= '<div class="ListElementUI ElementUI AdminAddButton"><a href="'.$addUrl.'"><div class="ElementUIText">Добавить</div></a></div>';
        $this->html .= '</div>';
    }
    
    protected function getData() {
        $this->data = array();
    }
    
    protected function setElementAliasID($dataElement) {
        $this->elementAliasID = $dataElement['alias'];
    }
    
    protected function getHtmlUI($dataElement) {
        return $dataElement['alias'];
    }

    /**
     * UI для добавления
     */
    protected function generateAddUI() {
        $this->html = "";
    }
    
    /**
     * UI для редактирования
     */
    protected function generateEditUI() {
        $this->html = "";
    }
    
    /**
     * UI для удаления (удаление подтверждено)
     */
    protected function generateDeleteYesUI() {
        $this->html = "";
    }
    
    /**
     * UI для удаления (удаление не подтверждено)
     */
    protected function generateDeleteNoUI() {
        $this->html = "";
    }
    
    public function getHtml() {
        return $this->html;
    }
}

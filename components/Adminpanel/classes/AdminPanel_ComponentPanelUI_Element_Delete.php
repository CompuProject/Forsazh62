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
 * Description of AdminPanel_ComponentPanelUI_Element_Delete
 *
 * @author maxim
 */
class AdminPanel_ComponentPanelUI_Element_Delete {
    protected $SQL_HELPER;
    protected $URL_PARAMS;
    protected $thisLang;
    protected $urlHelper;
    protected $inputHelper;
    protected $message;
    protected $alias;
    protected $deleteQuery;


    public function __construct($alias) {
        $this->alias = $alias;
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        global $_URL_PARAMS;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->URL_PARAMS = $_URL_PARAMS['params'];
        $this->urlHelper = new UrlHelper();
        $this->inputHelper = new InputHelper();
        $this->insertValue = array();
        $this->message="";
        $this->setDeleteQuery();
    }
    
    protected function setDeleteQuery() {
        $this->deleteQuery = "";
    }

    protected function checkAlias() {
        return true;
    }
    
    protected function clearResours() {
        
    }
    
    public function delete($yes = false) {
        $this->message = "";
        if($this->checkAlias()) {
            if($yes) {
                $this->deleteYes();
            } else {
                $this->deleteNo();
            }
        } else {
            $this->message = "<div class='message'>Запись не найдена</div>";
        }
        return $this->message;
    }

    private function deleteYes() {
        if($this->SQL_HELPER->insert($this->deleteQuery)) {
            $this->clearResours();
            $this->message = "<div class='message'>Запись удалена</div>";
            $this->message .= $this->backButton();
        } else {
            $this->message = "<div class='message'>Сбой при удалении записи</div>";
            $this->message .= $this->backButton();
        }
    }
    private function deleteNo() {
        $params1[0] = $params2[0] = $this->URL_PARAMS[0];
        $params1[1] = $params2[1] = $this->URL_PARAMS[1];
        $params1[2] = $params2[2] = $this->URL_PARAMS[2];
        $params1[3] = $params2[3] = $this->URL_PARAMS[3];
        $params2[4] = $this->URL_PARAMS[4];
        $params2[5] = $this->URL_PARAMS[5];
        $params2[6] = 'yes';
        $noUrl = $this->urlHelper->chengeParams($params1);
        $yesUrl = $this->urlHelper->chengeParams($params2);
        $this->message = "";
        $this->message .= "Вы точно хотите удалить запись c псевдонимом ".$this->alias."?<br />";
        $this->message .= '<center>';
        $this->message .= '<a href="'.$yesUrl.'"><input class="AP_Submit" type="button" value="Да"></a>';
        $this->message .= '<a href="'.$noUrl.'"><input class="AP_Submit" type="button" value="Нет"></a>';
        $this->message .= '</center>';
    }
    
    private function backButton() {
        $params[0] = $this->URL_PARAMS[0];
        $params[1] = $this->URL_PARAMS[1];
        $params[2] = $this->URL_PARAMS[2];
        $params[3] = $this->URL_PARAMS[3];
        $backUrl = $this->urlHelper->chengeParams($params);
        return '<center><a href="'.$backUrl.'"><input class="AP_Submit" type="button" value="Завершить редактирование"></a></center>';
    }
}

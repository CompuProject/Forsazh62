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
 * Description of UsersOnlineApplicationsManagerPanel
 *
 * @author Maxim Zaitsev
 * @copyright © 2010-2016, CompuProjec
 * @created 09.02.2016 17:35:13
 */
class UOAManagerPanel {
    
    private $SQL_HELPER;
    private $HTML = '';
    
    private $yourUser = '';
    private $yourUserData = '';
    private $usersGroups = array('Administrator','Moderator','SuperModerator','Manager');
    
    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->getUserData();
        if($this->checkUser()) {
            $this->generatePanel();
        } else {
            $this->HTML = "У вас нет доступа в данный раздел сайта";
        }
    }
    
    private function getUserData() {
        $this->yourUser = new UserData();
        $this->yourUser->checkAuthorization();
        $this->yourUserData = $this->yourUser->getUserData();
    }
    
    private function checkUser() {
        return strlen($this->yourUserData['group']) > 0 && in_array($this->yourUserData['group'], $this->usersGroups);
    }
    
    private function generatePanel() {
        global $_URL_PARAMS;
        $this->URL_PARAMS = $_URL_PARAMS['params'];
        if(!isset($this->URL_PARAMS[0])) {
            $this->HTML = $this->getApplicationsList();
        } else if (isset($this->URL_PARAMS[0]) && isset($this->URL_PARAMS[1])) {
            $applicationId = $this->URL_PARAMS[0];
            $action = $this->URL_PARAMS[1];
            switch ($action) {
                case 'Show':
                    $showApplication = new UOAManagerPanelShowApplication($applicationId);
                    $this->HTML = $showApplication->getHtml();
                    break;
                case 'TransitionStatus':
                    if(isset($this->URL_PARAMS[2])) {
                        $transitionStatus = new UOAManagerPanelTransitionStatusApplication($applicationId, $this->URL_PARAMS[2], (isset($this->URL_PARAMS[3]) && $this->URL_PARAMS[3]=='apply'));
                        $this->HTML = $transitionStatus->getHtml();
                    } else {
                        $this->HTML = "Не указан конечный статус";
                    }
                    break;
                default:
                    break;
            }
        }
    }
    
    private function getApplicationsList() {
        $applicationsListFilter = new UOAManagerPanelApplicationsListFilter();
        $applicationsList = new UOAManagerPanelApplicationsList();
        $out = "<div class='UOAManagerPanelApplicationsListFilterBlock'>";
        $out .= $applicationsListFilter->getHtml();
        $out .= "</div>";
        $out .= "<div class='UOAManagerPanelApplicationsListMainBlock'>";
        $out .= $applicationsList->getHtml();
        $out .= "</div>";
        return $out;
    }
    
    public function getHtml() {
        return $this->HTML;
    }
    
    public function get() {
        echo $this->getHtml();
    }
}

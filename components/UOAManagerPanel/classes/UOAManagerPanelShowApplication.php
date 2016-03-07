<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of UOAManagerPanelShowApplication
 *
 * @author Maxim Zaitsev
 * @copyright © 2010-2016, CompuProjec
 * @created 07.03.2016 13:36:17
 */
class UOAManagerPanelShowApplication {
    
    private $SQL_HELPER;
    private $urlHelper;
    private $HTML = '';
    
    private $applicationId;
    private $applicationData;
    private $applicationLogStatusTransitionData;
    private $applicationStatusTransitionData;
    private $statusData;
    
    public function __construct($applicationId) {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->urlHelper = new UrlHelper();
        $this->applicationId = $applicationId;
        $this->getData();
        $this->generateHTML();
    }
    
    private function getData() {
        $query = "SELECT * FROM `UsersOnlineApplicationsStatuses`;";
        $rezult = $this->SQL_HELPER->select($query);
        foreach ($rezult as $status) {
            $this->statusData[$status['status']] = $status;
        }
        $query = "SELECT * FROM `UsersOnlineApplications` where `id` = '".$this->applicationId."';";
        $this->applicationData = $this->SQL_HELPER->select($query,1);
        $query = "SELECT * FROM `UsersOnlineApplicationsLogStatusTransition` WHERE `onlineApplication`='".$this->applicationId."' ORDER BY `changed` DESC;";
        $this->applicationLogStatusTransitionData = $this->SQL_HELPER->select($query);
        $query = "SELECT * FROM `UsersOnlineApplicationsStatuseTransition` where `startStatus` = '".$this->applicationData['totalStatus']."';";
        $this->applicationStatusTransitionData = $this->SQL_HELPER->select($query);
    }
    
    private function generateHTML() {
        $this->HTML = "<div class='UOAManagerPanelUserApplication'>";
        
        $creationDate = new DateTime($this->applicationData['creation']);
        $changedDate = new DateTime($this->applicationData['changed']);
        $this->HTML .= "<table class='UOAManagerPanelUserApplicationTable Stylized' cellspacing='0'>";
        $this->HTML .= "<caption>Заявка пользователя</caption>";
        $this->HTML .= $this->generateUserApplicationTableRow("Идентификатор", $this->applicationData['id']);
        $this->HTML .= $this->generateUserApplicationTableRow("Текущий статус", $this->statusData[$this->applicationData['totalStatus']]['name']." - ".$this->statusData[$this->applicationData['totalStatus']]['description']);
        $this->HTML .= $this->generateUserApplicationTableRow("ФИО", $this->applicationData['fio']);
        $this->HTML .= $this->generateUserApplicationTableRow("Контактный номер", $this->applicationData['phone']);
        $this->HTML .= $this->generateUserApplicationTableRow("Создано", $creationDate->format('d M Y H:i'));
        $this->HTML .= $this->generateUserApplicationTableRow("Изменено", $changedDate->format('d M Y H:i'));
        $this->HTML .= "</table>";
        
        $this->HTML .= $this->generateStatuseTransitionPanel();
        
        $this->HTML .= '<a href="'.$this->urlHelper->chengeParams(array()).'"><input '
                . 'class="UOAManagerPanelUserApplicationBackButton" '
                . 'type="button" '
                . 'name="UOAManagerPanelUserApplicationBackButton" '
                . 'value="К списку заявок"></a>';
        
        if(!empty($this->applicationLogStatusTransitionData)) {
            $this->HTML .= "<table class='UOAManagerPanelUserApplicationLogTable Stylized' cellspacing='0'>";
            $this->HTML .= "<caption>история изменения статуса</caption>";
            $this->HTML .= "<tr class='UserApplicationTableRow'>";
            $this->HTML .= "<th class='UserApplicationTableRowChanged'>изменено</th>";
            $this->HTML .= "<th class='UserApplicationTableRowStartStatus'>было</th>";
            $this->HTML .= "<th class='UserApplicationTableRowEndStatus'>стало</th>";
            $this->HTML .= "<th class='UserApplicationTableRowManagerComment'>комментарий менеджера</th>";
            $this->HTML .= "</tr>";
            foreach ($this->applicationLogStatusTransitionData as $status) {
                $changedLogDate = new DateTime($status['changed']);
                $changed = $changedLogDate->format('d M Y H:i');
                $startStatus = $this->statusData[$status['startStatus']]['name'];
                $endStatus = $this->statusData[$status['endStatus']]['name'];
                $managerComment = $status['managerComment'];
                $this->HTML .= $this->generateUserApplicationLogTableRow($changed, $startStatus, $endStatus, $managerComment);
            }
            $this->HTML .= "</table>";
            if(count($this->applicationLogStatusTransitionData) > 50) {
                $this->HTML .= '<a href="'.$this->urlHelper->chengeParams(array()).'"><input '
                        . 'class="UOAManagerPanelUserApplicationBackButton" '
                        . 'type="button" '
                        . 'name="UOAManagerPanelUserApplicationBackButton" '
                        . 'value="К списку заявок"></a>';
            }
        }
        $this->HTML .= "<div class='clear'></div>";
        $this->HTML .= "</div>";
    }
    private function generateUserApplicationTableRow($text, $value) {
        $out = "<tr class='UserApplicationTableRow'>";
        $out .= "<td class='UserApplicationTableRowText'>".$text."</td>";
        $out .= "<td class='UserApplicationTableRowValue'>".$value."</td>";
        $out .= "</tr>";
        return $out;
    }
    
    private function generateUserApplicationLogTableRow($changed, $startStatus, $endStatus, $managerComment) {
        $out = "<tr class='UserApplicationnLogTableRow'>";
        $out .= "<td class='UserApplicationnLogTableRowChanged'>".$changed."</td>";
        $out .= "<td class='UserApplicationnLogTableRowStartStatus'>".$startStatus."</td>";
        $out .= "<td class='UserApplicationnLogTableRowEndStatus'>".$endStatus."</td>";
        $out .= "<td class='UserApplicationnLogTableRowManagerComment'>".$managerComment."</td>";
        $out .= "</tr>";
        return $out;
    }
    
    private function generateStatuseTransitionPanel() {
        $out = "<div class='UserApplicationnStatuseTransitionPanel'>";
//        $out .= "<div class='UserApplicationnStatuseTransitionPanelTitle'>изменить статус</div>";
//        if(empty($this->applicationStatusTransitionData)) {
//            $out .= $out .= "<div class='UserApplicationnStatuseTransitionPanelNoDatae'>Нельзя изменить текущий статус</div>";
//        }
        foreach ($this->applicationStatusTransitionData as $transition) {
            $out .= $this->generateStatuseTransitionPanelButton($transition);
        }
        $out .= "<div class='clear'></div>";
        $out .= "</div>";
        return $out;
    }
    
    private function generateStatuseTransitionPanelButton($transition) {
        $url = $this->urlHelper->chengeParams(array($this->applicationId,'TransitionStatus',$transition['endStatus']));
        $out = "<div class='UserApplicationnStatuseTransitionPanelButton'>";
        $out .= "<a href='".$url."'>".$transition['bottonText']."</a>";
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

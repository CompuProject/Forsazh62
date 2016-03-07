<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of UOAManagerPanelTransitionStatusApplication
 *
 * @author Maxim Zaitsev
 * @copyright © 2010-2016, CompuProjec
 * @created 07.03.2016 15:51:08
 */
class UOAManagerPanelTransitionStatusApplication {
    
    private $SQL_HELPER;
    private $urlHelper;
    private $HTML = '';
    
    private $applicationId;
    private $endStatus;
    private $apply;
    
    private $statusData;
    private $applicationData;
    
    
    public function __construct($applicationId, $endStatus, $apply = false) {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->urlHelper = new UrlHelper();
        $this->applicationId = $applicationId;
        $this->endStatus = $endStatus;
        $this->apply = $apply;
        $this->getData();
        $this->generateHtml();
    }
    private function getData() {
        $query = "SELECT * FROM `UsersOnlineApplicationsStatuses`;";
        $rezult = $this->SQL_HELPER->select($query);
        foreach ($rezult as $status) {
            $this->statusData[$status['status']] = $status;
        }
        $query = "SELECT * FROM `UsersOnlineApplications` where `id` = '".$this->applicationId."';";
        $this->applicationData = $this->SQL_HELPER->select($query,1);
//        $query = "SELECT * FROM `UsersOnlineApplicationsLogStatusTransition` WHERE `onlineApplication`='".$this->applicationId."' ORDER BY `changed` DESC;";
//        $this->applicationLogStatusTransitionData = $this->SQL_HELPER->select($query);
//        $query = "SELECT * FROM `UsersOnlineApplicationsStatuseTransition` where `startStatus` = '".$this->applicationData['totalStatus']."';";
//        $this->applicationStatusTransitionData = $this->SQL_HELPER->select($query);
    }
    
    private function generateHtml() {
        $this->HTML = "<div class='UOAManagerPanelTransitionStatusApplication'>";
        $this->HTML .= $this->generateApplication();
        if($this->apply) {
            if(isset($_POST['TransitionStatusApplicationFormComments']) && $_POST['TransitionStatusApplicationFormComments']!='') {
                $this->applyTransitionStatus();
            } else {
                $this->HTML .= "<div class='TransitionStatusApplicationError'>Вы обязательно должны прокомментировать свои действия</div>";
                $this->HTML .= $this->generateForm();
            }
        } else {
            $this->HTML .= $this->generateForm();
        }
        $this->HTML .= "</div>";
    }
    
    
    private function generateApplication() {
        $out = "<div class='UOAManagerPanelUserApplication'>";
        $creationDate = new DateTime($this->applicationData['creation']);
        $changedDate = new DateTime($this->applicationData['changed']);
        $out .= "<table class='UOAManagerPanelUserApplicationTable Stylized' cellspacing='0'>";
        $out .= "<caption>Вы пытаетесь сменить статус текущей заявки на <span class='status'>".$this->statusData[$this->endStatus]['name']."</span></caption>";
        $out .= $this->generateUserApplicationTableRow("Идентификатор", $this->applicationData['id']);
        $out .= $this->generateUserApplicationTableRow("Текущий статус", $this->statusData[$this->applicationData['totalStatus']]['name']." - ".$this->statusData[$this->applicationData['totalStatus']]['description']);
        $out .= $this->generateUserApplicationTableRow("ФИО", $this->applicationData['fio']);
        $out .= $this->generateUserApplicationTableRow("Контактный номер", $this->applicationData['phone']);
        $out .= $this->generateUserApplicationTableRow("Создано", $creationDate->format('d M Y H:i'));
        $out .= $this->generateUserApplicationTableRow("Изменено", $changedDate->format('d M Y H:i'));
        $out .= "</table>";
        $out .= "<div class='clear'></div>";
        $out .= "</div>";
        return $out;
    }
    private function generateUserApplicationTableRow($text, $value) {
        $out = "<tr class='UserApplicationTableRow'>";
        $out .= "<td class='UserApplicationTableRowText'>".$text."</td>";
        $out .= "<td class='UserApplicationTableRowValue'>".$value."</td>";
        $out .= "</tr>";
        return $out;
    }
    
    
    private function applyTransitionStatus() {
        $query = "INSERT INTO `UsersOnlineApplicationsLogStatusTransition`"
                . "(`onlineApplication`, `changed`, `startStatus`, `endStatus`, `managerComment`) VALUES "
                . "('".$this->applicationId."',now(),'".$this->applicationData['totalStatus']."','".$this->endStatus."','".$_POST['TransitionStatusApplicationFormComments']."');";
        $this->SQL_HELPER->insert($query);
        $query = "UPDATE `UsersOnlineApplications` SET `totalStatus`='".$this->endStatus."' WHERE `id`='".$this->applicationId."';";
        $this->SQL_HELPER->insert($query);
        echo '<script language="JavaScript">';
        echo 'window.location.href = "'.$this->urlHelper->chengeParams(array($this->applicationId,'Show')).'"';
        echo '</script>';
    }
    
    private function generateForm() {
        $form = "<div class='TransitionStatusApplicationFormBlock'>";
        $form .= '<form class="TransitionStatusApplicationForm" '
                . 'name="TransitionStatusApplicationForm" '
                . 'action="'.$this->urlHelper->chengeParams(array($this->applicationId,'TransitionStatus',$this->endStatus,'apply')).'" '
                . 'enctype="multipart/form-data" '
                . 'method="post" '
                . 'accept-charset="UTF-8">';
        $form .= "<div class='TransitionStatusApplicationMessage'>Поясните причину смены статуса</div>";
        $form .= InputHelper::textarea('TransitionStatusApplicationFormComments', 'TransitionStatusApplicationFormComments', 'TransitionStatusApplicationFormComments', 2000, TRUE, '');
        $form .= '<center>';
        $form .= '<input '
                . 'class="TransitionStatusApplicationFormButton Yes" '
                . 'type="submit" '
                . 'name="TransitionStatusApplicationFormSubmit" '
                . 'value="Изменить статус">';
        $form .= '<a href="'.$this->urlHelper->chengeParams(array($this->applicationId,'Show')).'"><input '
                . 'class="TransitionStatusApplicationFormButton No" '
                . 'type="button" '
                . 'name="TransitionStatusApplicationFormButton" '
                . 'value="отменить"></a>';
        $form .= '</center>';
        $form .= "</form>";
        $form .= "</div>";
        return $form;
    }
    
    public function getHtml() {
        return $this->HTML;
    }
    
    public function get() {
        echo $this->getHtml();
    }
}

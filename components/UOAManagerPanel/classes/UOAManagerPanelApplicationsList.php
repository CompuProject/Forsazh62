<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of UOAManagerPanelApplicationsList
 *
 * @author Maxim Zaitsev
 * @copyright © 2010-2016, CompuProjec
 * @created 09.02.2016 17:36:33
 */
class UOAManagerPanelApplicationsList {
    
    private $SQL_HELPER;
    private $urlHelper;
    private $HTML;
    
    private $serchData = array();
    private $ORDER_BY = array();
    private $whereCounter = 0;
    private $whereString = '';
    
    private $listElements = array();
    private $statusData = array();
    
    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->urlHelper = new UrlHelper();
        $this->ORDER_BY = UOAManagerPanelSerchArray::getOrderBy();
        $this->getPostData();
        $this->getStatusData();
        $this->getData();
        $this->generateHTML();
    }
    
    private function getPostData() {
        $this->serchData['fio'] = UOAManagerPanelSerchArray::getSerchData('fio');
        $this->serchData['phone'] = UOAManagerPanelSerchArray::getSerchData('phone');
        $this->serchData['message'] = UOAManagerPanelSerchArray::getSerchData('message');
        $this->serchData['totalStatus'] = UOAManagerPanelSerchArray::getSerchData('totalStatus');
    }
    
    private function getStatusData() {
        $query = "SELECT * FROM `UsersOnlineApplicationsStatuses`;";
        $rezult = $this->SQL_HELPER->select($query);
        foreach ($rezult as $status) {
            $this->statusData[$status['status']] = $status;
        }
    }
    
    private function getData() {
        $this->whereHide();
        $this->whereFio();
        $this->wherePhone();
        $this->whereMessage();
        $this->whereTotalStatus();
        $query = 'SELECT '
                . '`id`, '
                . '`fio`, '
                . '`phone`, '
                . '`message`, '
                . '`creation`, '
                . '`totalStatus`, '
                . '`changed` '
                . 'FROM `UsersOnlineApplications` '.$this->whereString.' '.$this->orderBy();
        $this->listElements = $this->SQL_HELPER->select($query);
    }
    
    private function orderBy() {
        return ' ORDER BY `'.$this->ORDER_BY['column'].'` '.$this->ORDER_BY['asc_desc'];
    }
    
    private function whereString($sql) {
        if($sql !== '') {
            if($this->whereCounter > 0) {
                $this->whereString .= " AND (". $sql . ") ";
            } else {
                $this->whereString .= " WHERE (" . $sql . ") ";
            }
            $this->whereCounter++;
        }
    }
    
    private function whereHide() {
        $this->whereString("`hide` != '1'");
    }
    private function whereFio() {
        if(isset($this->serchData['fio']) && strlen($this->serchData['fio']) > 0)  {
            $string =  preg_replace('/ {2,}/',' ',$this->serchData['fio']);
            $wordsArray = explode(" ",trim($string));
            $sql = '';
            foreach ($wordsArray as $word) {
                $sql .= "LOWER(`fio`) LIKE '%".mb_strtolower($word)."%' OR ";
            }
            if($sql !== '') {
                $sql = mb_substr($sql, 0,  mb_strlen ($sql)-4);
            }
            $this->whereString($sql);
        }
    }
    
    private function wherePhone() {
        if(isset($this->serchData['phone']) && strlen($this->serchData['phone']) > 0)  {
            $this->whereString("`phone` LIKE '%".$this->serchData['phone']."%'");
        }
    }
    
    private function whereMessage() {
        if(isset($this->serchData['message']) && strlen($this->serchData['message']) > 0)  {
            $string =  preg_replace('/ {2,}/',' ',$this->serchData['message']);
            $wordsArray = explode(" ",trim($string));
            $sql = '';
            foreach ($wordsArray as $word) {
                $sql .= "LOWER(`message`) LIKE '%".mb_strtolower($word)."%' OR ";
            }
            if($sql !== '') {
                $sql = mb_substr($sql, 0,  mb_strlen ($sql)-4);
            }
            $this->whereString($sql);
        }
    }
    
    private function whereTotalStatus() {
        if(isset($this->serchData['totalStatus']) && !empty($this->serchData['totalStatus']))  {
            $sql = '';
            foreach ($this->serchData['totalStatus'] as $status) {
                $sql .= "`totalStatus` LIKE '".$status."' OR ";
            }
            if($sql !== '') {
                $sql = mb_substr($sql, 0,  mb_strlen ($sql)-4);
            }
            $this->whereString($sql);
        }
    }
    
    
    private function generateHTML() {
        $this->HTML = "<div class='UOAManagerPanelApplicationsList'>";
        foreach ($this->listElements as $element) {
            $this->HTML .= $this->generateListElement($element);
        }
        $this->HTML .= "<div class='clear'></div>";
        $this->HTML .= "</div>";
    }
    
    private function generateListElement($element) {
        $creationDate = new DateTime($element['creation']);
        $changedDate = new DateTime($element['changed']);
        $statusTitle = $this->statusData[$element['totalStatus']]['description'];
        $out = "<div class='UOAManagerPanelApplicationsListElement ".$element['totalStatus']."'>";
            $out .= "<div class='UOAelementHead'>";
                $out .= "<div class='UOAelementStatusColor'></div>";
                $out .= "<div class='UOAelementID'>".$element['id']."</div>";
                $out .= "<div class='UOAelementStatus' title='".$statusTitle."'>(".$this->statusData[$element['totalStatus']]['name'].")</div>";
                $out .= "<div class='UOAelementShowButton'><a href='".$this->urlHelper->chengeParams(array($element['id'],'Show'))."'>работать с заявкой</a></div>";
                $out .= "<div class='clear'></div>";
            $out .= "</div>";
            $out .= "<div class='UOAelementBody'>";
                $out .= "<div class='UOAelementPersonal'>";
                    $out .= "<div class='UOAelementFio'>".$element['fio']."</div>";
                    $out .= "<div class='UOAelementPhone'>".$element['phone']."</div>";
                    $out .= "<div class='clear'></div>";
                $out .= "</div>";
                $out .= "<div class='UOAelementDatetime'>";
                    $out .= "<div class='UOAelementCreation'>".$creationDate->format('d M Y H:i')."</div>";
                    $out .= "<div class='UOAelementChanged'>".$changedDate->format('d M Y H:i')."</div>";
                    $out .= "<div class='clear'></div>";
                $out .= "</div>";
            $out .= "</div>";
            $out .= "<div class='UOAelementMessage'>";
                $out .= "<div>";
                if($element['message'] != '') {
                    $out .= $element['message'];
                } else {
                    $out .= 'дополнительная информация отсутствует';
                }
                $out .= "</div>";
            $out .= "</div>";
            $out .= "<div class='clear'></div>";
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

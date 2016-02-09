<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of UsersOnlineApplications
 *
 * @author Maxim Zaitsev
 * @copyright © 2010-2016, CompuProjec
 * @created 09.02.2016 14:17:37
 */
class UsersOnlineApplications {
    private $SQL_HELPER;
    private $form;
    private $UI;
    
    private $urlHelper;
    
    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->urlHelper = new UrlHelper();
        $this->execute();
        $this->generateUI();
    }
    
    private function generateForm() {
        $this->form = "";
        $this->form .= '<form class="UsersOnlineApplicationsForm" '
                . 'name="UsersOnlineApplicationsForm" '
                . 'action="'.$this->urlHelper->getThisPage().'" '
                . 'method="post" accept-charset="UTF-8" autocomplete="on">';
        $this->form .= '<table class="UsersOnlineApplicationsFormTable" >';
        $fio = InputHelper::textBox('fio', 'fio', 'fio', 200, true, null);
        $this->form .= InputHelper::createFormRow($fio, true, 'Представьтесь');
        $phone = InputHelper::textBox('phone', 'phone', 'phone', 200, true, null);
        $this->form .= InputHelper::createFormRow($phone, true, 'Контактный номер');
        $message = InputHelper::textarea('message', 'message', 'message', 50000, false, null);
        $this->form .= InputHelper::createFormRow($message, false, 'Дополнительная информация');
        $this->form .= '</table>';
        $this->form .= '<center>';
        $this->form .= '<input class="UsersOnlineApplicationsFormSubmit" type="submit" name="UsersOnlineApplicationsFormSubmit" value="Перезвоните мне">';
        $this->form .= '</center>';
        $this->form .= '</form>';
    }
    
    private function generateUI() {
        $this->generateForm();
        $this->UI = '<a class="fancybox-doc" href="#UsersOnlineApplicationsFormWrapper" title="Обратный звонок">';
        $this->UI .= '<div class="UsersOnlineApplicationsFormShowButton"></div>';
        $this->UI .= '</a>';
        $this->UI .= '<div id="UsersOnlineApplicationsFormWrapper" class="UsersOnlineApplicationsFormWrapper" style="display: none;">';
        $this->UI .= '<div class="UsersOnlineApplicationsFormBlock">';
        $this->UI .= '<div class="UsersOnlineApplicationsFormText">';
        $this->UI .= 'ЗАКАЗАТЬ ЗВОНОК';
        $this->UI .= '</div>';
        $this->UI .= $this->form;
        $this->UI .= '</div>';
        $this->UI .= '</div>';
    }
    
    private function execute() {
        if (InputValueHelper::getPostValue('UsersOnlineApplicationsFormSubmit') != null) {
            $this->addNewApplications();
            echo $this->jsAlert("Спасибо за обращение, наши менеджеры свяжутся с вами.");
        }
    }
    private function addNewApplications() {
        $id = ID_GENERATOR::generateID();
        $fio = InputValueHelper::getPostValue('fio');
        $phone = InputValueHelper::getPostValue('phone');
        $message = InputValueHelper::getPostValue('message');
        $query = "INSERT INTO `UsersOnlineApplications`(`id`, `fio`, `phone`, `message`, `creation`,`totalStatus`,`changed`) VALUES ('".$id."','".$fio."','".$phone."','".$message."',now(),'created',now());";
        $this->SQL_HELPER->insert($query);
    }
    
    private function jsAlert($text) {
        $out = "<script type='text/javascript'>";
        $out .= "alert('".$text."');";
        $out .= "</script>";
        return $out;
    }
    
    public function getHtml() {
        return $this->UI;
    }
    
    public function get() {
        echo $this->getHtml();
    }
}

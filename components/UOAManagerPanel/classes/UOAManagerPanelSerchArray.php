<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of UOAManagerPanelSerchArray
 *
 * @author Maxim Zaitsev
 * @copyright © 2010-2016, CompuProjec
 * @created 06.03.2016 17:08:53
 */
class UOAManagerPanelSerchArray {
    
    static private $object;
    
    private function __construct() {
        if(!isset($_SESSION['UOAManagerPanel'])) {
            $_SESSION['UOAManagerPanel'] = array();
            $_SESSION['UOAManagerPanel']['SERCH_DATA'] = array();
            $_SESSION['UOAManagerPanel']['ORDER_BY'] = array('column' => 'creation', 'asc_desc' => 'desc');
        }
    }
    
    private static function createObject() {
        if (!isset(self::$object)) {
            self::$object = new UOAManagerPanelSerchArray();
        }
    }
    
    
    public static function getPostValue($id) {
        self::createObject();
        if(isset($_POST[$id]) && $_POST[$id]!==NULL && $_POST[$id]!==NULL) {
            return $_POST[$id];
        } else {
            return NULL;
        }
    }
    
    public static function setValue($key, $value) {
        self::createObject();
        if($value != null) {
            $_SESSION['UOAManagerPanel']['SERCH_DATA'][$key] = $value;
        } else {
            if(isset($_SESSION['UOAManagerPanel']['SERCH_DATA'][$key])) {
                unset($_SESSION['UOAManagerPanel']['SERCH_DATA'][$key]);
            }
        }
    }
    
    public static function setOrderBy($column, $asc_desc) {
        self::createObject();
        $_SESSION['UOAManagerPanel']['ORDER_BY']['column'] = $column;
        $_SESSION['UOAManagerPanel']['ORDER_BY']['asc_desc'] = $asc_desc;
    }
    
    public static function updatePostData() {
        self::createObject();
        self::setValue('fio', self::getPostValue('UOAFilter_fio'));
        self::setValue('phone', self::getPostValue('UOAFilter_phone'));
        self::setValue('message', self::getPostValue('UOAFilter_message'));
        self::setValue('totalStatus', self::getPostValue('UOAFilter_totalStatus'));
    }
    
    public static function getSerchData($key) {
        self::createObject();
        if(isset($_SESSION['UOAManagerPanel']['SERCH_DATA'][$key])) {
            return $_SESSION['UOAManagerPanel']['SERCH_DATA'][$key];
        } else {
            return null;
        }
    }
    
    public static function getOrderBy() {
        self::createObject();
        return $_SESSION['UOAManagerPanel']['ORDER_BY'];
    }
    
}

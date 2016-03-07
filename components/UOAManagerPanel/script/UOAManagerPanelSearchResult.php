<?php
ini_set("display_errors", 1);
error_reporting(E_ALL);
header("Content-type: text/html; charset=UTF-8");
@session_start();
include_once '../../../ROOT/functions/includeSistemClasses.php';
includeSistemClasses('../../../ROOT/');

include_once '../classes/UOAManagerPanel.php';
include_once '../classes/UOAManagerPanelApplicationsListFilter.php';
include_once '../classes/UOAManagerPanelApplicationsList.php';
include_once '../classes/UOAManagerPanelSerchArray.php';

global $_SQL_HELPER;
$_SQL_HELPER = new MysqliHelper();

global $_SITECONFIG;
$_SITECONFIG = new SiteConfig();

$urlParams = new UrlParams();
global $_URL_PARAMS;
$_URL_PARAMS = $urlParams->getUrlParam();

$column = UOAManagerPanelSerchArray::getPostValue('UOAFilterListSortColumn');
$asc_desc = UOAManagerPanelSerchArray::getPostValue('UOAFilterListSortASCDESC');

UOAManagerPanelSerchArray::updatePostData();
UOAManagerPanelSerchArray::setOrderBy($column, $asc_desc);

$applicationsList = new UOAManagerPanelApplicationsList();
$applicationsList->get();
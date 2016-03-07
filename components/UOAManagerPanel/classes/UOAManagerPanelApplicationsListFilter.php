<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of UOAManagerPanelApplicationsListFilter
 *
 * @author Maxim Zaitsev
 * @copyright © 2010-2016, CompuProjec
 * @created 07.03.2016 11:14:15
 */
class UOAManagerPanelApplicationsListFilter {
    
    private $SQL_HELPER;
    private $urlHelper;
    private $HTML;
    
    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->urlHelper = new UrlHelper();
        $this->generateHTML();
    }
    
    private function generateHTML() {
        $this->HTML = "<div class='UOAManagerPanelApplicationsListFilters'>";
        $this->HTML .= '<form class="UOAManagerPanelApplicationsListFiltersForm" '
                . 'name="UOAManagerPanelApplicationsListFiltersForm" '
                . 'action="'.$this->urlHelper->getThisPage().'" '
                . 'enctype="multipart/form-data" '
                . 'method="post" '
                . 'accept-charset="UTF-8">';
        $this->HTML .= "<div class='UOAManagerPanelApplicationsListFiltersFerstLine'>";
        $this->HTML .= $this->FilterType_text('fio');
        $this->HTML .= $this->FilterType_text('phone');
        $this->HTML .= $this->FilterType_text('message');
        $this->HTML .= '<div class="clear"></div>';
        $this->HTML .= "</div>";
        $this->HTML .= "<div class='UOAManagerPanelApplicationsListFiltersSecondLine'>";
        $this->HTML .= $this->FilterType_groupSelect('totalStatus');
        $this->HTML .= '<div class="clear"></div>';
        $this->HTML .= "</div>";
        $this->HTML .= $this->ListSort();
        $this->HTML .= '<div class="clear"></div>';
        $this->HTML .= "</form>";
        $this->HTML .= "</div>";
    }
    
    private function getStatusesData($key) {
        $query = "SELECT * FROM `UsersOnlineApplicationsStatuses`;";
        $rezult = $this->SQL_HELPER->select($query);
        $statusesData = array();
        foreach ($rezult as $key => $val) {
            $statusesData[$key]['value'] = $val['status'];
            $statusesData[$key]['text'] = $val['name'];
        }
        return $statusesData;
    }
    
    private function getFilterName($key) {
        switch ($key) {
            case 'fio':
                return 'ФИО';
            case 'phone':
                return 'Телефон';
            case 'message':
                return 'Доп. информация';
            case 'totalStatus':
                return 'Текущий статус';
            default:
                return $key;
        }
    }
    
    private function getDataForFilter($key) {
        switch ($key) {
            case 'totalStatus':
                return $this->getStatusesData($key);
            default:
                return array();
        }
    }
    
    private function FilterType_text($FilterKey) {
        $value = UOAManagerPanelSerchArray::getSerchData($FilterKey);
        $filterId = 'UOAFilter_'.$FilterKey;
        $maxlength = 800;
        $out = '<div class="UOAFilterBlockValues" id="UOAFilterBlockValue_'.$FilterKey.'">';
        $out .= InputHelper::paternTextBox($filterId, $filterId, 'UOAFilter FilterTypeText', $maxlength, FALSE, $this->getFilterName($FilterKey), '', $value, NULL);
        
        $out .= '</div>';
        return $out;
    }
    
    private function FilterType_groupSelect($FilterKey) {
        $value = UOAManagerPanelSerchArray::getSerchData($FilterKey);
        $filterId = 'UOAFilter_'.$FilterKey;
        $filterData = $this->getDataForFilter($FilterKey);
        if(empty($filterData)) {
            return '';
        }
        $out = '<div class="UOAFilterBlockValues" id="UOAFilterBlockValue_'.$FilterKey.'">';
        foreach ($filterData as $key => $val) {
            $out .= '<div class="UOAFilterFilter_GroupSelectElement">';
            $out .= InputHelper::checkbox($filterId.'['.$key.']', $filterId.'_'.$key, 'UOAFilter FilterTypeGroupSelect', FALSE, $val['value'], ($value!==NULL && in_array($val['value'],$value)), NULL);
            $out .= ' <label for="'.$filterId.'_'.$key.'">'.$val['text'].'</label>';
            $out .= '<div></div>';
            $out .= '</div>';
        }
        $out .= '<div class="clear"></div>';
        $out .= '</div>';
        return $out;
    }
    
    private static function ListSort() {
        $orderBy = UOAManagerPanelSerchArray::getOrderBy();
        $columnData = array();
        $ascdescData = array();
        $columnData[0]['value'] = 'creation';
        $columnData[0]['text'] = 'по дате создания';
        $columnData[1]['value'] = 'changed';
        $columnData[1]['text'] = 'по дате изменения';
        $ascdescData[0]['value'] = 'asc';
        $ascdescData[0]['text'] = 'по возрастанию';
        $ascdescData[1]['value'] = 'desc';
        $ascdescData[1]['text'] = 'по убыванию';
        $out = '<div class="UOAFilterBlockListSort" id="UOAFilterBlockListSort">';
        $out .= 'Сортировать данные: ';
        $out .= InputHelper::select('UOAFilterListSortColumn', 'UOAFilterListSortColumn', $columnData, FALSE, $orderBy['column'], NULL);
        $out .= InputHelper::select('UOAFilterListSortASCDESC', 'UOAFilterListSortASCDESC', $ascdescData, FALSE, $orderBy['asc_desc'], NULL);
        $out .= '</div>';
        return $out;
    }
    
    public function getHtml() {
        return $this->HTML;
    }
    
    public function get() {
        echo $this->getHtml();
    }
}

<?php

class DrivingSchoolPrices {
    
    private $SQL_HELPER;
    private $cities;
    private $HTML;
    const idPrefix = 'dspTab_';


    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->generateHTML();
    }
    
    private function getCitiesData() {
        $query = "SELECT * FROM `PricesCoursesCity` ORDER BY `sequence` ASC;";
        $this->cities = $this->SQL_HELPER->select($query);
        foreach ($this->cities as $key => $city) {
            $drivingSchoolPrices = new DrivingSchoolPricesBlock($city['alias']);
            $this->cities[$key]['html'] = $drivingSchoolPrices->getHTML();
        }
    }
    
    private function generateHTML() {
        $ferst = true;
        $ferstClass = 'current';
        $this->getCitiesData();
        $this->HTML = "<div class='DrivingSchoolPricesTabNameWrapper'>";
        foreach ($this->cities as $city) {
            $this->HTML .= "<div class='DrivingSchoolPricesTabName $ferstClass' idCity='".self::idPrefix.$city['alias']."'>".$city['city']."</div>";
            if($ferst) { $ferst = false; $ferstClass = ""; }
        }
        $this->HTML .= "</div>";
        $this->HTML .= "<div class='DrivingSchoolPricesTabAreaWrapper'>";
        foreach ($this->cities as $city) {
            $this->HTML .= "<div class='DrivingSchoolPricesTabBlock' id='".self::idPrefix.$city['alias']."'>".$city['html']."</div>";
        }
        $this->HTML .= "</div>";
        $this->HTML .= $this->generateJS();
    }

    private function generateJS() {
        $js = "
            <script type='text/javascript'>
                jQuery('.DrivingSchoolPricesTabNameWrapper .DrivingSchoolPricesTabName').click(function(){
                    if(!$(this).hasClass('current')) {
                            $('.DrivingSchoolPricesTabNameWrapper .DrivingSchoolPricesTabName.current').removeClass('current');
                            $(this).addClass('current');
                            var idCity = $(this).attr('idCity');
                            $('.DrivingSchoolPricesTabAreaWrapper .DrivingSchoolPricesTabBlock').hide();
                            $('.DrivingSchoolPricesTabAreaWrapper #' + idCity).show();
                    }
                });
            </script>";
        return $js;
    }
    
    public function get() {
        echo $this->HTML;
    }
    
    public function getHTML() {
        return $this->HTML;
    }
}

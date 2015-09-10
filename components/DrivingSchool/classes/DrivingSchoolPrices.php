<?php

class DrivingSchoolPrices {
    
    private $SQL_HELPER;
    private $coursesCategory;
    private $HTML;
    
    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->generateHTML();
    }
    
    private function generateHTML() {
        $this->HTML = $this->generateCoursesCategoryHTML();
        $this->HTML .= $this->generateAdditionalServicesHTML();
    }
    
    private function generateCoursesCategoryHTML() {
        $this->getCoursesCategoryData();
        $out = "<div class='CoursesCategoryBlocks'>";
        foreach ($this->coursesCategory as $cours) {
            $out .= "<div class='CoursesCategoryBlock'>";
            $out .= "<h2 class='CategoryName'>Категория &laquo;".$cours['category']."&raquo;</h2>";
            $out .= "<div class='CategoryDescription'>".$cours['description']."</div>";
            $out .= "<div class='CategoryPrice'>";
            $out .= $this->generatePricesCoursesHTML($cours['prices']);
            $out .= "</div>";
            $out .= "</div>";
        }
        $out .= "</div>";
        return $out;
    }
    
    private function generateAdditionalServicesHTML() {
        $out = "<div class='AdditionalServicesBlock'>";
        $out .= "<h2 class='AdditionalServicesTitle'>Дополнительные услуги</h2>";
        $out .= "<table class='AdditionalServices Stylized' cellspacing='0'>";
        $out .= "<tr>";
        $out .= "<th>Услуга</th>";
        $out .= "<th>Цена</th>";
        $out .= "</tr>";
        foreach ($this->getPricesAdditionalServicesData() as $service) {
            if($service['perHour'] === "1") {
                $costVal = "руб./ч.";
            } else {
                $costVal = "руб.";
            }
            $out .= "<tr>";
            $out .= "<td class='name'>".$service['name']."</td>";
            $out .= "<td class='cost'>".number_format($service['cost'], 0, '.', ' ')." <span class='rub'>".$costVal."</span></td>";
            $out .= "</tr>";
        }
        $out .= "</table>";
        $out .= "</div>";
        return $out;
    }
    
    private function generatePricesCoursesHTML($prices) {
        $out = "<table class='PricesCourses Stylized' cellspacing='0'>";
        $out .= "<tr>";
        $out .= "<th>Курс</th>";
        $out .= "<th>Теория</th>";
        $out .= "<th>Практика</th>";
        $out .= "<th>Время</th>";
        $out .= "<th>Цена</th>";
        $out .= "</tr>";
        foreach ($prices as $price) {
            $out .= "<tr>";
            $out .= "<td class='сours'>".$price['сours']."</td>";
            $out .= "<td class='theory'>".$price['theory']." ч.</td>";
            $out .= "<td class='practice'>".$price['practice']." ч.</td>";
            $out .= "<td class='duration'>".$price['duration']." мес.</td>";
            $out .= "<td class='cost'>".number_format($price['cost'], 0, '.', ' ')." <span class='rub'>руб.</span></td>";
            $out .= "</tr>";
        }
        $out .= "</table>";
        return $out;
    }
    
    private function getCoursesCategoryData() {
        $query = "SELECT * FROM `PricesCoursesCategory` ORDER BY `sequence` ASC;";
        $this->coursesCategory = $this->SQL_HELPER->select($query);
        foreach ($this->coursesCategory as $key => $cours) {
            $this->coursesCategory[$key]['prices'] = $this->getPricesCoursesData($cours['category']);
        }
    }

    private function getPricesCoursesData($category) {
        $query = "SELECT * FROM `PricesCourses` WHERE `category`='".$category."' ORDER BY `sequence` ASC;";
        return $this->SQL_HELPER->select($query);
    }

    private function getPricesAdditionalServicesData() {
        $query = "SELECT * FROM `PricesAdditionalServices` ORDER BY `sequence` ASC;";
        return $this->SQL_HELPER->select($query);
    }
    
    public function get() {
        echo $this->HTML;
    }
    
    public function getHTML() {
        return $this->HTML;
    }
}

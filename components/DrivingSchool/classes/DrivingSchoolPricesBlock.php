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

class DrivingSchoolPricesBlock {
    
    private $SQL_HELPER;
    private $coursesCategory;
    private $city;
    private $title;
    private $HTML;
    
    public function __construct($city, $title="") {
        global $_SQL_HELPER;
        $this->city = $city;
        $this->title = $title;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->generateHTML();
    }
    
    private function generateHTML() {
        $this->HTML = "";
        if($this->title != "") {
            $this->HTML .= "<h1>$this->title</h1>";
        }
        $this->HTML .= $this->generateCoursesCategoryHTML();
        $this->HTML .= $this->generateAdditionalServicesHTML();
    }
    
    private function generateCoursesCategoryHTML() {
        $this->getCoursesCategoryData();
        $out = "<div class='CoursesCategoryBlocks'>";
        foreach ($this->coursesCategory as $cours) {
            if(!empty($cours['prices'])) {
                $ccid = ID_GENERATOR::generateID("CoursesCategory_");
                $out .= "<div class='CoursesCategoryBlock'>";
                $out .= "<h2 class='CategoryName'>";
                $out .= "<a class='fancybox-doc' href='#$ccid' title='Информация о категории &laquo;".$cours['category']."&raquo;'></a>";
                $out .= "<div>Категория &laquo;".$cours['category']."&raquo;</div>";
                $out .= "</h2>";
                $out .= "<div class='doc_div CategoryDescription' id='$ccid'>".$cours['description']."</div>";
                $out .= "<div class='CategoryPrice'>";
                $out .= $this->generatePricesCoursesHTML($cours['prices']);
                $out .= "</div>";
                $out .= "</div>";
            }
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
        $query = "SELECT * FROM `PricesCourses` WHERE `category`='".$category."' AND `city`='".$this->city."' ORDER BY `sequence` ASC;";
        return $this->SQL_HELPER->select($query);
    }

    private function getPricesAdditionalServicesData() {
        $query = "SELECT * FROM `PricesAdditionalServices` WHERE `city`='".$this->city."' ORDER BY `sequence` ASC;";
        return $this->SQL_HELPER->select($query);
    }
    
    public function get() {
        echo $this->HTML;
    }
    
    public function getHTML() {
        return $this->HTML;
    }
}

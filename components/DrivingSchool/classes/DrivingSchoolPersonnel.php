<?php

class DrivingSchoolPersonnel {
    
    private $SQL_HELPER;
    private $HTML;
    const imgPath = "./resources/Components/DrivingSchoolPersonnel/";
    const imgDefault = "default.png";


    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->generateHTML();
    }
    
    private function generateHTML() {
        $this->HTML = "<h1 class='DrivingSchoolPersonnelTitle'>Персонал</h1>";
        foreach ($this->getPersonnelData() as $worker) {
            $this->HTML .= $this->generateWorkerHTML($worker);
        }
        $this->HTML .= "<div class='clear'></div>";
    }
    
    private function generateWorkerHTML($worker) {
        $img = self::imgPath.$worker['id'].".jpg";
        if(!file_exists(self::imgPath.$worker['id'].".jpg")) {
            $img = self::imgPath.$worker['id'].".png";
            if(!file_exists(self::imgPath.$worker['id'].".png")) {
                $img = self::imgPath.self::imgDefault;
            }
        }
        $out = "";
        $out .= "<div class='Worker' id='".$worker['id']."'>";
        $out .= "<div class='fio'>".$worker['fio']."</div>";
        $out .= "<div class='postName'>".$worker['postName']."</div>";
        $out .= "<div class='WorkerPhoto'>";
            $out .= "<a class='fancybox-gallery' href='".$img."'>";
            $out .= "<img src='".$img."'>";
            $out .= "</a>";
        $out .= "</div>";
        $out .= "<div class='WorkerData'>";
            $out .= "<table class='WorkerDataTable'>";
                $out .= "<tr class='birthdate'><td class='text'>Дата рождения:</td><td class='value'>".$worker['birthdate']."</td></tr>";
                if(isset($worker['education']) && $worker['education']!=="") {
                    $out .= "<tr class='education'><td class='text'>Образование:</td><td class='value'>".$worker['education']."</td></tr>";
                }
                if(isset($worker['workExperience']) && $worker['workExperience']!=="") {
                    $out .= "<tr class='workExperience'><td class='text'>Стаж работы:</td><td class='value'>".$worker['workExperience']."</td></tr>";
                }
                if(isset($worker['experience']) && $worker['experience']!=="") {
                    $out .= "<tr class='experience'><td class='text'>Опыт работы:</td><td class='value'>".$worker['experience']."</td></tr>";
                }
                if(isset($worker['drivingExperience']) && $worker['drivingExperience']!=="") {
                    $out .= "<tr class='drivingExperience'><td class='text'>Стаж вождения:</td><td class='value'>".$worker['drivingExperience']."</td></tr>";
                }
            $out .= "</table>";
        $out .= "</div>";
        $out .= "<div class='clear'></div>";
        $out .= "</div>";
        return $out;
    }

    private function getPersonnelData() {
        $query = "SELECT 
            Pe.`id`, 
            Pe.`fio`, 
            Pe.`birthdate`, 
            Pe.`post`, 
            Pe.`education`, 
            Pe.`workExperience`, 
            Pe.`experience`, 
            Pe.`drivingExperience`, 
            pp.`name` as postName, 
            pp.`priority` 
            FROM `Personnel` as Pe
            LEFT JOIN `PersonnelPosts` as pp
            on Pe.`post`=pp.`id`
            ORDER BY pp.`priority` ASC;";
        return $this->SQL_HELPER->select($query);
    }
    
    public function get() {
        echo $this->HTML;
    }
    
    public function getHTML() {
        return $this->HTML;
    }
}

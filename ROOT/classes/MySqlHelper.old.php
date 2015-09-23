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

class MySqlHelper {
    private $data;
    
    public function __construct($query) {
        $this->data = array();
        global $_DBSETTINGS;
        $mysqli = new mysqli($_DBSETTINGS['host'], $_DBSETTINGS['user'], 
                $_DBSETTINGS['password'], $_DBSETTINGS['db_name']);
        $mysqli->set_charset($_DBSETTINGS['charset']);
        if (mysqli_connect_errno()) {
            echo "Ошибка подключения к базе данных : ".mysqli_connect_error();
            echo "<br>Обратитесь к администратору.";
            exit();
        }
        $result = $mysqli->query($query);
        $i=0;
        if($result!=null) {
            while($row = $result->fetch_assoc()){
                foreach (array_keys($row) as $key) {
                    $this->data[$i][$key] = $row[$key];
                }
                $i++;
            }
        } else {
            $this->data = null;
        }
    }
    
    public function getAllData(){
        return $this->data;
    }
    
    public function getDataRow($i){
        if(count($this->data)>($i)) {
            return $this->data[$i];
        } else {
            return null;
        }
    }
    
    public function getDataKeys(){
        $keys = array();
        if(count($this->data)>0){
            foreach ($this->data as $date){
                foreach (array_keys($date) as $key) {
                    if(!in_array($key, $keys)) {
                        $keys[]=$key;
                    }
                }
            }
        }
        return $keys;
    }
}

class MySqlInserHelper {
    private $mysqli;
    private $query;
    
    public function __construct($query) {
        global $_DBSETTINGS;
        $this->query = $query;
        $this->mysqli = new mysqli($_DBSETTINGS['host'], $_DBSETTINGS['user'], 
                $_DBSETTINGS['password'], $_DBSETTINGS['db_name']);
        $this->mysqli->set_charset($_DBSETTINGS['charset']);
        if (mysqli_connect_errno()) {
            echo "Ошибка подключения к базе данных : ".mysqli_connect_error();
            echo "<br>Обратитесь к администратору.";
            exit();
        }
    }
    
    public function insert() {
        $this->mysqli->query($this->query);
    }
}
?>

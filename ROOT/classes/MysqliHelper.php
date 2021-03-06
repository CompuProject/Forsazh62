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

/**
 * Класс для работы с MySql по средством библиотеки MySqli
 */
class MysqliHelper {
    private $mysqli;
    private $error;
    
    /**
     * Конструктор класса.
     * @global array $_DBSETTINGS - глобальный массив с настройками для бд:
     *      host - Хост.
     *      user - Пользователь.
     *      password - Пароль.
     *      db_name - Имя Базы Данных.
     *      charset - Кодировка.
     */
    public function __construct() {
        $this->error = null;
        $this->mysqli = MySqliConnectHelper::getConection();
        if (mysqli_connect_errno()) {
            $this->error = "Ошибка подключения к базе данных : ".mysqli_connect_error();
            $this->error .= "<br>Обратитесь к администратору.";
            echo $this->error;
            exit();
        }
    }
    
    /**
     * Функция получения данных из MySql SELECT запроса.
     * @param String $query - MySql SELECT запрос.
     * @param int $rowNumber - необязательный параметр. 
     *      Указывается если надо получить данные из конкретной строки таблицы.
     *      Важно: Нумирация начинается с 1!
     * @return 
     *  1) вернет null если данных нет.
     *  2) вернет таблицу в формате 
     *      $data[<номер строки>][<имя столбца>] 
     *      если не указана строка.
     *  3) вернет строку из таблицы формата 
     *      $data[<имя столбца>] 
     *      если была указана строка. 
     */
    public function select($query, $rowNumber=null) {
        if($this->error!=null) {
            echo $this->error;
            return array();
        }
        $result = $this->mysqli->query($query);
        $i=0;
        $data = array();
        if($result==null) {
            return array();
        }
        while($row = $result->fetch_assoc()){
            foreach (array_keys($row) as $key) {
                $data[$i][$key] = $row[$key];
            }
            $i++;
        }
        if(count($data)<1) {
            $data=array();
        }
        if($rowNumber!=null && !isset($data[$rowNumber-1])) {
            $data[$rowNumber-1]=null;
        }
        return $rowNumber==null ? $data : $data[$rowNumber-1];
    }
    
    /**
     * Функция выполнения MySql INSERT запроса.
     * @param type $query
     */
    public function insert($query) {
        if($this->error!=null) {
            echo $this->error;
            return;
        }
        $this->mysqli->query($query);
        return $this->mysqli->error==null;
    }
    
    public function escapeString($string) {
        return mysqli_real_escape_string($this->mysqli,$string);
    }
    
    /**
     * получить ID последней записи
     * @return type ID последней записи
     */
    public function lastInsertID() {
        return  mysqli_insert_id($this->mysqli);
    }

    /**
     * Деструктор класса который разрывает соединение с БД.
     */
    public function __destruct() {
        //$this->mysqli->close();
    }
    
    public function sqlFileExec($scriptFile) {
        global $_DBSETTINGS;
        $command = 'mysql'
        . ' --host=' . $_DBSETTINGS['host']
        . ' --user=' . $_DBSETTINGS['user']
        . ' --password=' . $_DBSETTINGS['password']
        . ' --database=' . $_DBSETTINGS['db_name']
        . ' --default_character_set utf8'
        . ' --execute="SOURCE '.$scriptFile.'" 2>&1';
        return shell_exec($command);
    }
}

?>

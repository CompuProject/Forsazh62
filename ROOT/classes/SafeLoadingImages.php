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

class SafeLoadingImages {
    private $uploaddir;
    private $uploadfile;
    private $blacklist;
    private $acceptMas;
    private $actionFile;
    private $accept;
    private $text;
    private $multiple;
    private $files=array();
    private $urlHelper;

    public function __construct($uploaddir,$actionFile,$multiple=false,$accept=null,$text=null) {
        $this->urlHelper = new UrlHelper();
        $this->blacklist = array(".php", ".phtml", ".php3", ".php4");
        $this->uploaddir = $uploaddir;
        $this->actionFile = $actionFile;
        $this->accept = $accept;
        $text!=null ? $this->text = $text.": " : $this->text = "";
        $accept!=null ? $this->accept=$accept : $this->accept = "image/jpeg,image/png,image/gif,image/bmp,image/x-windows-bmp";
        $this->acceptMas = explode(",", $this->accept);
        $multiple ? $this->multiple='multiple="true"' : $this->multiple='';
    }
    
    private function getFileCod() {
        $fcletters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTYVWXYZ123456789'; 
        $fclen = 20;
        $fileCod = '';
        for ($i = 0; $i < $fclen; $i++){
            $fileCod .= $fcletters[rand(0, strlen($fcletters)-1) ];
        }
        return $fileCod;
    }


    public function getForm($count=null) {
        $out = '<form name="upload" action="'.$this->actionFile.'" method="POST" ENCTYPE="multipart/form-data">';
        $out .= $this->text;
        if($count==null || $count<2) {
            $out .= '<input type="file" name="userfile[]" '.$this->multiple.' accept="'.$this->accept.'"><br>';
        } else {
            $out .= "<br>";
            for($i=0;$i<$count;$i++){
                $out .= '<input type="file" name="userfile[]" accept="'.$this->accept.'"><br>';
            }
        }
        $out .= getCaptcha(120, 25,"IMGLoadCaptcha");
        $out .= '<br><input type="text" class="captchaText" name="captcha" placeholder="Введите символы с картинки" value="">';
        $out .= '<br><input type="submit" name="upload" value="Загрузить изображение">';
        $out .= '</form>';
        return $out;
    }

    private function upload($i,$w_min,$h_min,$w_max,$h_max,$fileName=null) {
        foreach ($this->blacklist as $item) {
            if(preg_match("/$item\$/i", $_FILES['userfile']['name'][$i])) {
                echo "Мы не поддерживаем загрузку PHP скриптов<br>";
                echo '<a href="'.$this->urlHelper->getThisPage().'">Еще раз?</a><br>';
                exit;
            }
        }
        $acceptType = false;
        foreach ($this->acceptMas as $item) {
            if($_FILES['userfile']['type'][$i]===$item) {
                $acceptType = true;
            }
        }
        if(!$acceptType) {
            echo "Не поддерживаемый тип<br>";
            echo '<a href="'.$this->urlHelper->getThisPage().'">Еще раз?</a><br>';
            exit;
        }
        
        $size=getimagesize($_FILES['userfile']['tmp_name'][$i]);
        $w=(int)$size[0]; // ширина
        $h=(int)$size[1]; // высота
        if($w>$w_max || $h>$h_max) {
            echo "Максимальный размер изображения ".$w_max."x".$h_max."<br>";
            echo '<a href="'.$this->urlHelper->getThisPage().'">Еще раз?</a><br>';
            exit;
        }
        if($w<$w_min || $h<$h_min) {
            echo "Минимальный размер изображения ".$w_min."x".$h_min."<br>";
            echo '<a href="'.$this->urlHelper->getThisPage().'">Еще раз?</a><br>';
            exit;
        }
        
        if($fileName==null) {
            $this->uploadfile = tempnam($this->uploaddir, $this->getFileCod()."_");
        } else {
            $this->uploadfile = $fileName;
        }
        if (move_uploaded_file($_FILES['userfile']['tmp_name'][$i], $this->uploaddir.$this->uploadfile)) {
            $this->files[$i]['dir']=$this->uploaddir;
            $this->files[$i]['file']=basename($this->uploadfile);
            $this->files[$i]['baseFile']=basename($_FILES['userfile']['name'][$i]);
            $this->files[$i]['type']=$_FILES['userfile']['type'][$i];
        } else {
            echo 'Непредвиденная ошибка<br>';
            echo '<a href="'.$this->urlHelper->getThisPage().'">Еще раз?</a><br>';
        }
    }
    
    public function uploadFile($fileName=null,$w_min=200,$h_min=200,$w_max=800,$h_max=800) {
        if(isset($_POST['upload'])) {
            if(isset($_FILES) && $_FILES!=null) {
                if(isset($_POST['captcha']) && strtoupper($_SESSION['captcha']) == strtoupper($_POST['captcha'])) {
                    $this->files=array();
                    for($i=0; $i<count($_FILES['userfile']['name']); $i++) {                        
                        if(is_array($fileName) && isset($fileName[$i])) {
                            $this->upload($i,$w_min,$h_min,$w_max,$h_max,$fileName[$i]);
                        } else if(!is_array($fileName) && count($_FILES['userfile']['name'])==1 && $fileName!=null && $fileName!="") {
                            $this->upload($i,$w_min,$h_min,$w_max,$h_max,$fileName);
                        } else {
                            $this->upload($i,$w_min,$h_min,$w_max,$h_max);
                        }
                        echo '<script language="JavaScript">';
                        echo 'window.location.href = "'.$this->urlHelper->getThisPage().'"';
                        echo '</script>';
                    }
                } else {
                    echo "Неверная каптча";
                }
            } else {
                echo "Не выбран файл";
            }
        }
    }
    
    public function getFiles() {
        return $this->files;
    }
}
?>
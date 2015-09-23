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

class SafeLoadingFiles {
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
    private $redirectURL = null;
    
    private $message = "";
    private $upload = false;

    public function __construct($uploaddir,$actionFile,$accept,$multiple=false,$text=null) {
        $this->urlHelper = new UrlHelper();
        $this->blacklist = array(".php", ".phtml", ".php3", ".php4");
        $this->uploaddir = $uploaddir;
        $this->actionFile = $actionFile;
        $this->accept = $accept;
        $text!=null ? $this->text = $text.": " : $this->text = "";
        $this->accept=$accept;
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
        $out .= getCaptcha(120, 25,"FileLoadCaptcha");
        $out .= '<br><input type="text" class="captchaText" name="captcha" placeholder="Введите символы с картинки" value="">';
        $out .= '<br><input type="submit" name="upload" value="Загрузить файл">';
        $out .= '</form>';
        return $out;
    }

    private function upload($i,$fileName=null,$extension=false) {
        foreach ($this->blacklist as $item) {
            if(preg_match("/$item\$/i", $_FILES['userfile']['name'][$i])) {
                $this->message .= "Мы не поддерживаем загрузку PHP скриптов<br>";
                $this->message .= '<a href="'.$this->urlHelper->getThisPage().'">Еще раз?</a><br>';
                exit;
            }
        }
        $acceptType = false;
        foreach ($this->acceptMas as $item) {
            //echo $_FILES['userfile']['type'][$i]." - ".$item."<br>";
            if($_FILES['userfile']['type'][$i]===$item) {
                $acceptType = true;
            }
        }
        if(!$acceptType) {
            $this->message .= "Не поддерживаемый тип<br>";
            $this->message .= '<a href="'.$this->urlHelper->getThisPage().'">Еще раз?</a><br>';
            exit;
        }
        if($fileName==null) {
            $this->uploadfile = tempnam($this->uploaddir, $this->getFileCod()."_");
        } else {
            if($extension) {
                $baseName = basename($_FILES['userfile']['name'][$i]);
                $posit = strripos($baseName, ".");
                $fileName .= substr($baseName, $posit);
            }
            $this->uploadfile = $fileName;
        }
        
        if (file_exists($this->uploaddir.$this->uploadfile)) {
            unlink($this->uploaddir.$this->uploadfile);
        }
        if (move_uploaded_file($_FILES['userfile']['tmp_name'][$i], $this->uploaddir.$this->uploadfile)) {
            $this->files[$i]['dir']=$this->uploaddir;
            $this->files[$i]['file']=basename($this->uploadfile);
            $this->files[$i]['baseFile']=basename($_FILES['userfile']['name'][$i]);
            $this->files[$i]['type']=$_FILES['userfile']['type'][$i];
        } else {
            $this->message .= 'Непредвиденная ошибка<br>';
            $this->message .= '<a href="'.$this->urlHelper->getThisPage().'">Еще раз?</a><br>';
        }
    }
    
    public function setRedirectUrl($redirectURL) {
        $this->redirectURL = $redirectURL;
    }
    
    public function isUpload() {
        return $this->upload;
    }

    public function uploadFile($fileName=null,$extension=false,$redirect=true) {
        $this->upload = false;
        if(isset($_POST['upload'])) {
            if(isset($_FILES) && $_FILES!=null) {
                if(isset($_POST['captcha']) && strtoupper($_SESSION['captcha']) == strtoupper($_POST['captcha'])) {
                    $this->files=array();
                    for($i=0; $i<count($_FILES['userfile']['name']); $i++) {                        
                        if(is_array($fileName) && isset($fileName[$i])) {
                            $this->upload($i,$fileName[$i],$extension);
                        } else if(!is_array($fileName) && count($_FILES['userfile']['name'])==1 && $fileName!=null && $fileName!="") {
                            $this->upload($i,$fileName,$extension);
                        } else {
                            $this->upload($i,null,$extension);
                        }
                        $this->upload = true;
                        if($redirect) {
                            $this->redirect();
                        }
                    }
                } else {
                    $this->message .= "Неверная каптча";
                }
            } else {
                $this->message .= "Не выбран файл";
            }
        }
    }
    
    public function redirect($ifUpload = true) {
        if($ifUpload) {
            if(!$this->upload) {
                return;
            }
        }
        if($this->redirectURL==null) {
            $this->redirectURL = $this->urlHelper->getThisPage();
        }
        echo '<script language="JavaScript">';
        echo 'window.location.href = "'.$this->redirectURL.'"';
        echo '</script>';
    }

    public function getFiles() {
        return $this->files;
    }
    
    public function getMessage() {
        return $this->message;
    }
}
?>
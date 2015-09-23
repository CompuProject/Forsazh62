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
 * Description of BackgroundGeneratorHelper
 *
 * @author maxim
 */
class BackgroundGeneratorHelper {
    
    public static function getBackgroundImg(
            $path, $name, 
            $defaultImageFile = NULL, 
            $horizontalAlignment = 'center', 
            $verticalAlignment = 'center', 
            $repeat = 'no-repeat', 
            $backgroundColor = '', 
            $extensions = array('png','jpg','PNG','JPG')) {
        
        if($defaultImageFile !== NULL && file_exists($defaultImageFile)) {
            $imageFile = $defaultImageFile;
        } else {
            $imageFile = NULL;
        }
        foreach ($extensions as $extension) {
            $checkImageFile = $path.$name.'.'.$extension;
            if(file_exists($checkImageFile)) {
                $imageFile = $checkImageFile;
                break;
            }
        }
        if($imageFile !== NULL) {
            $background = "background: ".$backgroundColor.
                    " url('".$imageFile."') ".$horizontalAlignment.
                    " ".$verticalAlignment." ".$repeat.";";
        } else {
            if($backgroundColor !== '') {
                $background = "background: ".$backgroundColor.";";
            } else {
                $background = '';
            }
        }
        return $background;
    }
    
    public static function getBackgroundStyleImg(
            $path, $name, 
            $defaultImageFile = NULL, 
            $horizontalAlignment = 'center', 
            $verticalAlignment = 'center', 
            $repeat = 'no-repeat', 
            $backgroundColor = '', 
            $extensions = array('png','jpg','PNG','JPG')) {
        $background = self::getBackgroundImg($path, $name, $defaultImageFile, $horizontalAlignment, $verticalAlignment, $repeat, $backgroundColor, $extensions);
        if($background !== '') {
            return 'Style="'.$background.'"';
        } else {
            return '';
        }
    }
}

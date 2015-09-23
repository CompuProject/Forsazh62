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

function includeSistemClasses($path = './ROOT/') {
    include_once $path.'configure.php';
    include_once $path.'classes/SiteConfig.php';
    
    include_once $path.'classes/MySqliConnectHelper.php';
    include_once $path.'classes/MySqlHelper.php';
    include_once $path.'classes/MysqliHelper.php';
    include_once $path.'classes/LangHelper.php';
    include_once $path.'classes/UrlHelper.php';
    include_once $path.'classes/InputHelper.php';
    include_once $path.'classes/InputValueHelper.php';
    
    include_once $path.'classes/UrlParams.php';
    include_once $path.'classes/ModulesInBlock.php';
    include_once $path.'classes/Modules.php';
    include_once $path.'classes/Plugins.php';
    include_once $path.'classes/Pages.php';
    include_once $path.'classes/Root.php';
    include_once $path.'classes/Localization.php';
    include_once $path.'classes/XML.php';
    
    include_once $path.'classes/UserData.php';
    include_once $path.'classes/CMSIMG.php';
    include_once $path.'classes/SafeLoadingImages.php';
    include_once $path.'classes/SafeLoadingFiles.php';
    
    include_once $path.'classes/ErrorHelper.php';
    include_once $path.'classes/SiteMap.php';
    include_once $path.'classes/HtmlTemplate.php';
    include_once $path.'classes/ResizeImage.php';
    include_once $path.'classes/DownloadFile.php';
    include_once $path.'classes/DownloadImage.php';
    include_once $path.'classes/pclzip.lib.php';
    
    include_once $path.'classes/ID_GENERATOR.php';
    include_once $path.'classes/BackgroundGeneratorHelper.php';
    
    include_once $path.'classes/TextGenerator.php';
}
?>

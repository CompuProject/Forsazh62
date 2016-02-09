<!DOCTYPE html>
<?php global $ROOT; ?>
<html>
<head>
    <?php $ROOT->head();?>
    <link rel="shortcut icon" href="<?php $ROOT->templatePath();?>favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/main.css" type="text/css" />
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/MainMenu.css" type="text/css" />
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/Materials.css" type="text/css" />
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/DrivingSchoolPrices.css" type="text/css" />
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/DrivingSchoolPersonnel.css" type="text/css" />
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/ContactsUI.css" type="text/css" />
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/Other.css" type="text/css" />
    <!--<link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/newYear.css" type="text/css" />-->
</head>
<body>
    <?php $ROOT->bodyStart();?>
    <div class="RootWrapper">
        <div class="TopPanelWrapper">
            <div class="TopPanelBlock FixWidthBlockMain">
                <div class="MainMenuWrapper">
                    <div class="MainMenuBlock"><?php $ROOT->block('MainMenuBlock');?></div>
                </div>
                <div class="TopPanelLeftWrapper">
                    <div class="TopPanelLeftBlock">
                        <div class="LogoWrapper">
                            <div class="LogoBlock">
                                <a href="./"><img class="SiteMainLogo" src="<?php $ROOT->templatePath();?>img/logo.png"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="TopPanelRightWrapper">
                    <div class="TopPanelRightBlock">
                        <div class="HeadInfoWrapper">
                            <div class="HeadInfoBlock"><?php $ROOT->block('HeadInfoBlock');?></div>
                        </div>
                        <div class="TitleWrapper">
                            <div class="TitleBlock"><h1><?php $ROOT->title();?></h1></div>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="MainWrapper">
            <div class="TopMainWrapper">
                <div class="TopMainBlock FixWidthBlockMain"><?php $ROOT->block('TopMainBlock');?></div>
            </div>
            <div class="ContentWrapper">
                <div class="BeforeContentBlock FixWidthBlockMain"><?php $ROOT->block('BeforeContentBlock');?></div>
                <div class="ContentBlock FixWidthBlockMain"><?php $ROOT->content(); ?></div>
                <div class="AfterContentBlock FixWidthBlockMain"><?php $ROOT->block('AfterContentBlock');?></div>
            </div>
            <div class="MainMapWrapper">
                <?php 
                if($ROOT->getPage() != 'contacts') { 
                    echo '<div class="MainMapBlock FixWidthBlockMain">';
                    include_once './MainMap.php';
                    echo '</div>';
                } 
                ?>
            </div>
            <div class="BottomMainWrapper">
                <div class="BottomMainBlock FixWidthBlockMain"><?php $ROOT->block('BottomMainBlock');?></div>
            </div>
        </div>
        <div class="FooterWrapper">
            <div class="FooterBlock FixWidthBlockMain"><?php $ROOT->block('FooterBlock');?></div>
            <div class="clear"></div>
        </div>
        <div class="PoweredByWrapper">
            <div class="PoweredByBlock FixWidthBlockMain">Powered By CompuProject © 2011-2015</div>
        </div>
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <div class='test'><?php // $ROOT->block('test');?></div>
    <?php $ROOT->bodyEnd();?>
</body>
</html>

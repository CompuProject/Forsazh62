<!DOCTYPE html>
<?php global $ROOT;?>
<html>
<head>
    <?php $ROOT->head();?>
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/AdminPanel.css" type="text/css" />
    <style>
        .Import1cErrWarReport {
            font: 10px/12px monospace;
            color: #5f5f5f;
        }
        .Import1cErrWarReport h1 {
            font: bold 14px/16px monospace;
            margin-bottom: 5px;
        }
        .Import1cErrWarReport .Import1cErrWarReportElement {

        }
        .Import1cErrWarReport .Import1cErrWarReportElement .WarErrTextHead {
            color: #000;
            font-weight: bold;
        }
        .Import1cErrWarReport .Import1cErrWarReportElement .WarErrTextId {
            color: red;
            font-weight: bold;
        }
        .Import1cErrWarReport .Import1cErrWarReportElement .WarErrTextName {
            color: blue;
            font-weight: bold;
        }
    
        .TopPanel {
            height: 30px;
            width: 100%;
            background: #ef7f1a;
            /*display: none;*/
        }
        .TopPanel .m_block{
            float: right;
        }
        .content {
            clear: both;
        }
    </style>
</head>
<body>
<?php $ROOT->bodyStart();?>
<div class='TopPanel'><?php $ROOT->block('TopPanel');?></div>
<div class='content'>
<?php
$ROOT->content();
?>
</div>
<?php $ROOT->bodyEnd();?>
</body>
</html>

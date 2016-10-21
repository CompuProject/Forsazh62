<?php
$mainPanelUI = new AdminPanel_ComponentPanelUI_Main();
$mainPanelUI->addElement('contactsUnitsTypes', 'Редактирование типов контактов', 'contactsUnitsTypesUI.php');
$mainPanelUI->addElement('contactsUnits', 'Редактирование контактов юнитов', 'contactsUnitsUI.php');
$mainPanelUI->addElement('contactsWorkers', 'Редактирование контактов сотрудников', 'contactsWorkersUI.php');
$mainPanelUI->addElement('contactsWorkersPosts', 'Редактирование должностей сотрудников', 'contactsWorkersPosts.php');
$mainPanelUI->getUI();
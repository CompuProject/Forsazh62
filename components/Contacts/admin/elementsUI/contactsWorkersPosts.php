<?php
include_once './contacts/Contacts/admin/classes/AP_contactsWorkersPostsDelete.php';
include_once './contacts/Contacts/admin/classes/AP_contactsWorkersPostsEdit.php';
include_once './contacts/Contacts/admin/classes/AP_contactsWorkersPostsAdd.php';
include_once './contacts/Contacts/admin/classes/AP_contactsWorkersPostsMain.php';
$ap_contactsWorkersPostsMain = new AP_contactsWorkersPostsMain();
echo $ap_contactsWorkersPostsMain->getHtml();
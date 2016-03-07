<script type="text/javascript">
var shopItemsListTimer; // Таймер для запроса данных по задержке;
var shopItemsListTime = 2000; // время на задержку при запросе данных;
var shopItemsListTimeShort = 500; // время на задержку при запросе данных;
var ShopFilterGroupSelectShortValueTextLimit = 300;


jQuery(document).ready(function() {
    cutLongStringAll();
    jQuery("form.UOAManagerPanelApplicationsListFiltersForm .selectBox").change(function(){
        clearTimeout(shopItemsListTimer);
        getUOAManagerPanelApplicationsList();
    });
    jQuery("form.UOAManagerPanelApplicationsListFiltersForm .UOAFilter.FilterTypeGroupSelect").change(function(){
        clearTimeout(shopItemsListTimer);
        shopItemsListTimer = setTimeout(getUOAManagerPanelApplicationsList, shopItemsListTimeShort);
    });
    jQuery("form.UOAManagerPanelApplicationsListFiltersForm .FilterTypeText").keyup(function(){
        clearTimeout(shopItemsListTimer);
        shopItemsListTimer = setTimeout(getUOAManagerPanelApplicationsList, shopItemsListTimeShort);
    });
});

function cutLongStringAll(){
    $(".UOAManagerPanelApplicationsListElement .UOAelementMessage div").each(function() {
        cutLongString($(this), ShopFilterGroupSelectShortValueTextLimit, false);
    });
}

/**
* Функция для сокращения длинного текста
* @var object element - элемент, в котором необходимо укоротить текст
* @var int count_lit - лимит символов
* @var bool light - true|false задать осветление последних символов или нет
*/
function cutLongString(element, count_lit, light){
    var text = element.html();
    var all_len = text.length;
    var new_text;
    if (all_len > count_lit){
        new_text = text.substr(0, (count_lit - 3)) + '...';
        if(light){
            var first_part_text = new_text.substr(0, (count_lit - 10));
            var light_part_text = new_text.substr((count_lit - 10), count_lit);
            var light_text = "";
            var array_color = ["#444444", "#545454", "#646464", "#747474", "#848484", "#949494", "#a4a4a4", "#b4b4b4", "#c4c4c4", "#d4d4d4"];
            for(var i = 0; i < 10; i ++){
                light_text += "<span style='color: " + array_color[i] + "'>" + light_part_text.substr(i, 1) + "</span>";
            }
            new_text = first_part_text + light_text;
        }
        element.html(new_text);
    }
}

function getUOAManagerPanelApplicationsList() {
    var form_data = $("form.UOAManagerPanelApplicationsListFiltersForm").serialize();;
    $.ajax({
        type: "POST",
        url: "./components/UOAManagerPanel/script/UOAManagerPanelSearchResult.php",
        data: form_data,
        cache: false,
        success: function(result) {
            $(".UOAManagerPanelApplicationsListMainBlock").html(result);
        }
    });
    return true;
};
</script>
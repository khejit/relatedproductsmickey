/**
 * Created by khejit on 2015-06-06.
 */
$( document ).ready(function() {

/*
    $('a.exclusive.ajax_add_to_cart_button.btn.btn-default').css("display", "none");
*/

    $(".home-tab-img").mouseover(function(){
        $(this).find('a.exclusive.ajax_add_to_cart_button.btn.btn-default').css("display", "block");
    });

    $(".home-tab-img").mouseleave(function(){
        $(this).find('a.exclusive.ajax_add_to_cart_button.btn.btn-default').css("display", "none");
    });



    $("#product_ship_info").mouseover(function() {

        $(this).addClass("szeroki");
        $("#product_measure_info").hide();

    });

    $("#product_ship_info").mouseleave(function() {

     $(this).removeClass("szeroki");
     setTimeout(function(){$("#product_measure_info").show()}, 300);

     });

    $("#product_measure_info").mouseover(function() {

        $(this).addClass("szeroki");
        $("#product_ship_info").hide();

    });

    $("#product_measure_info").mouseleave(function() {

        $(this).removeClass("szeroki");
        setTimeout(function(){$("#product_ship_info").show()}, 300);

    });

});
<div class="related_products_mickey" class="block products_block clearfix">
    <h4 class="title_block">{l s='Related products' mod='relatedproductsmickey'}</h4>
    <div class="mickey_container row">

        <div id="mickey_slider">
        {if isset($blocks_products2) && $blocks_products2}
            {foreach from=$blocks_products2 item=product name=relatedmickey}
                <div class="item">
                    <div class="home-tab-img">
                        <a class="product_img_link"	href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url">
                            <img src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html'}"
                                 alt="{$product.legend|escape:'html':'UTF-8'}"
                                 class="img-responsive"/>
                        </a>
                        {if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
                            {if ($product.allow_oosp || $product.quantity > 0)}
                                {if isset($static_token)}
                                    <a class="exclusive ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart' mod='posnewproduct'}" data-id-product="{$product.id_product|intval}">
                                        <i class="icon-shopping-cart"></i>{l s='Add to cart' mod='posnewproduct'}
                                    </a>
                                {else}
                                    <a class="exclusive ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, 'add=1&amp;id_product={$product.id_product|intval}', false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart' mod='posnewproduct'}" data-id-product="{$product.id_product|intval}">
                                        <i class="icon-shopping-cart"></i>{l s='Add to cart' mod='posnewproduct'}
                                    </a>
                                {/if}
                            {else}
                                <span class="exclusive ajax_add_to_cart_button btn btn-default disabled">
                                                <i class="icon-shopping-cart"></i>{l s='Add to cart' mod='posnewproduct'}
                                            </span>
                            {/if}
                        {/if}
{*                        <a 	title="{l s='Quick view' mod='posnewproduct'}"
                              class="quick-view"
                              href="{$product.link|escape:'html':'UTF-8'}"
                              rel="{$product.link|escape:'html':'UTF-8'}">
                            <i class="icon-eye-open"></i>
                        </a>
                        <a 	title="{l s='Add to wishlist' mod='posnewproduct'}"
                              class="addToWishlist wishlistProd_{$product.id_product|intval}"
                              href="#"
                              onclick="WishlistCart('wishlist_block_list', 'add', '{$product.id_product|intval}', false, 1); return false;">
                            <i class="icon-heart"></i>
                        </a>*}

                    </div>
                    <div class="home-tab-info">
                        <a class="product-name" href="{$product.link|escape:'html'}" title="{$product.name|truncate:50:'...'|escape:'htmlall':'UTF-8'}">
                            {$product.name|truncate:35:'...'|escape:'htmlall':'UTF-8'}
                        </a>
                        <div class="price-box">
                            <span class="price">{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}</span>
                            {if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
                                <span class="old-price product-price">
                                            {displayWtPrice p=$product.price_without_reduction}
                                        </span>
                            {/if}
                            <meta itemprop="priceCurrency" content="{$priceDisplay}" />
                        </div>
                        <div class="pos-tab-content-bottom">

                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            {/foreach}
        {else}
            <ul class="related_products tab-pane">
                <li class="alert alert-info">{l s='No products at this time.' mod='relatedproductsmickey'}</li>
            </ul>
        {/if}
        </div>

        <a class="prevtab hidden-xs"><i class="icon-chevron-left"></i></a>
        <a class="nexttab hidden-xs"><i class="icon-chevron-right"></i></a>

    </div>
</div>

<script type="text/javascript">
$(document).ready(function() {
var newslider = $("#mickey_slider");
newslider.owlCarousel({
items :4,
itemsDesktop : [1199,3],
itemsDesktopSmall : [992,2],
itemsTablet: [768,2],
itemsMobile : [480,1],
autoPlay :  false
});
// Custom Navigation Events
$(".mickey_container .nexttab").click(function(){
newslider.trigger('owl.next');})
$(".mickey_container .prevtab").click(function(){
newslider.trigger('owl.prev');})
});
</script>

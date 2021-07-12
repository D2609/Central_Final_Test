*** Variables ***
&{dict_common_page}
...    entire_page=xpath=//body
...    search_input_box=xpath=(//input[@id='txt-searchBox-input'])[1]
...    search_button=xpath=(//button[@id='btn-searchBox-input'])[1]
...    search_result_text=css=h1[class='Text-sc-9p67zt-0 dLudwb']
...    shopping_cart_number=css=div [class='MiniCart__CartQty-bJioin bNCDDv'] span
...    shopping_cart_icon=css=div[class='MainHeader__MiniCartContainer-cOzool KbPez'] a[id=btn-openMiniCart]
...    prod_tag=css=[class="Row__Wrapper-v6uxgu-0 kSLyDU"] [class="ProductBadge__Relative-bxGwEa emnXMc"]
...    iframe_target=css=div[classname="sp-fancybox-wrap sp-fancybox-wrap-2405 sp-advanced-css-2405"] iframe[classname="sp-fancybox-iframe sp-fancybox-skin sp-fancybox-iframe-2405"]
...    close_popup_btn=css=#wrap-close-button-1454703945249
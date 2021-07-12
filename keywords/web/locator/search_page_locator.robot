*** Variables ***
&{dict_search_page}
...    screen_size_opt=css=div[title='{title_name}']
...    opt_size_option=xpath=//div[contains(@class,'Padding') and text() = '{size_inch} ${lang_unit}']//parent::div[contains(@class,'Col__Column')]//parent::div[contains(@class,'Row__Wrapper')]/div[1]/div[contains(@class,'Checkbox')]
...    target_product=css=div[data-productid='{sku}']
...    target_product_name=css=div[data-productid='{sku}'] a:last-child span
...    product_container=xpath=//div[@class="ProductGridItem__Label-iQRkAY jLwkyu"]/parent::div/parent::div/parent::div
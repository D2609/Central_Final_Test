*** Setting ***
Resource    ${CURDIR}/../locator/search_page_locator.robot

***Keyword***
Search products by name and specification
    [Arguments]    ${name}    ${specification}
    common_web_keywords.Search desired product by name    ${name}
    Select filter follow option    ${specification}
    BuiltIn.Sleep     5s

Select filter follow option
    [Arguments]    ${size}
    ${screen_size_filter}    String.Format String    ${dict_search_page.screen_size_opt}    title_name=${screen_size_title}
    ${opt_locator}    String.Format String    ${dict_search_page.opt_size_option}    size_inch=${size}
    common_web_keywords.Scroll To Element    ${screen_size_filter}
    common_web_keywords.Click Element    ${opt_locator}

Get sku from search result
    common_web_keywords.Verify Web Element Is Visible    ${dict_search_page.product_container}
    ${sku_lst}    SeleniumLibrary.Get WebElements    ${dict_search_page.product_container}
    ${sku}    SeleniumLibrary.Get Element Attribute    ${sku_lst}[0]    data-productid
    [Return]    ${sku}

Click particular product with SKU
    ${sku}    Get sku from search result
    ${product_name_locator}    String.Format String    ${dict_search_page.target_product}    sku=${sku}
    ${product_name_locator}    String.Format String    ${dict_search_page.target_product_name}    sku=${sku}
    ${name}    common_web_keywords.Get Text Element    ${product_name_locator}
    common_web_keywords.Scroll Down And Wait To Get Available Element    ${product_name_locator}
    Sleep    5s
    common_web_keywords.Click Element    ${product_name_locator}
    BuiltIn.Return From Keyword    ${name}
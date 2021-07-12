*** Setting ***
Resource    ${CURDIR}/../locator/pdp_page_locator.robot

***Keyword***
Check product name and add to cart 
    [Arguments]    ${product_name}
    ${result}    common_web_keywords.Get text and compare value    ${dict_pdp_page.txt_product_name}    ${product_name}
    BuiltIn.Run Keyword If    ${result}==${true}
    ...    common_web_keywords.Click Element    ${dict_pdp_page.btn_add_to_cart}
    ...    ELSE    BuiltIn.Fail    Not same the expected product, refused!
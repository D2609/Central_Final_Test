*** Setting ***
Resource    ${CURDIR}/../locator/cart_page_locator.robot

*** Keywords ***
Check product is existed on cart
    [Arguments]    ${product_name}
    ${name_locator}    String.Format String    ${dict_cart_page.product_name}    product_name=${product_name}
    ${result}    common_web_keywords.Get text and search value    ${name_locator}    ${product_name}
    ${bool}    Run Keyword If     ${result}==${true}    Set Variable    ${true}
    ...    ELSE    Set Variable    ${false}
    [Return]    ${bool}       
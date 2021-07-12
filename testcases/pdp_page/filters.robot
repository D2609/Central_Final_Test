*** Setting ***
Resource    ${CURDIR}/../../keywords/imports/web_import.robot 

*** Variables ***
${filter1}    44 - 55
${filter2}    32 - 43
${search_field}    TV

*** Test Cases ***
Add products then checking shopping cart
    [Tags]    pdp_page    filters
    common_web_keywords.Open browser to page    ${pwb_url}/${language}
    ${product_sku_1}    common_web_keywords.Search and add product to cart    ${search_field}    ${filter1}
    ${product_sku_2}    common_web_keywords.Search and add product to cart    ${search_field}    ${filter2}
    common_web_keywords.Click to shopping cart
    ${check_point1}      cart_page.Check product is existed on cart    ${product_sku_1}
    ${check_point2}      cart_page.Check product is existed on cart    ${product_sku_2}
    Compare and assert final result     ${check_point1}    ${check_point2}
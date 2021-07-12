*** Settings ***
Resource    ${CURDIR}/../imports/api_import.robot

*** Variables ***
${sku_query}    $..products[*].sku
${expected_jsonpath}    $..products[*][?(@.extension_attributes.salable==true)].sku

*** Keywords ***
Post search profuct with filter
    [Arguments]    ${product_type}    ${inchs_size_symbol}
    ${end_point}=   Set Variable    ${api_url}/graphql
    &{header}=    Create Dictionary
    ...    accept=*/*
    ...    accept-encoding=gzip,deflate,br
    ...    accept-language=en-US,en;q=0.9
    ...    bu=pwb
    ...    client=web
    ...    store=${store}
    ...    x-product-attr=free_delivery,free_text_flag,badge,show_badge,free_installation,product_tags,related_to,home_branch,attached_pdf_file,model,barcode,click_collect,shipping_methods,payment_methods,flash_deal_enable,special_to_date,special_from_date
    ${body_request}=    JSONLibrary.Load JSON From File     ${CURDIR}/search_payload.json
    ${body_request}=    JSONLibrary.Update Value To Json    ${body_request}    $..filterGroups[4].filters[0].value    ${inchs_size_symbol}
    ${body_request}=    JSONLibrary.Update Value To Json    ${body_request}    $..filterGroups[5].filters[0].value    ${product_type}
    ${body}=    Evaluate    json.dumps($body_request)    json
    ${response}=    REST.Post    endpoint=${end_point}    headers=&{header}    body=${body}
    REST.Integer    response status    200
    ${quote_id}=    REST.Output    response body
    [Return]    ${quote_id}

Get inch size symbol
    [Arguments]    ${inchs_size}
    ${value}    BuiltIn.Run Keyword If     '${inchs_size}'=='44 - 55'    
    ...    BuiltIn.Set Variable    ${screen_size.s_44_55_inchs}
    ...    ELSE    BuiltIn.Set Variable     ${screen_size.s_32_43_inchs}
    [Return]    ${value}

Get sku of product can add to cart
    [Arguments]    ${product_type}    ${inchs_size}
    ${inchs_size_symbol}    Get inch size symbol    ${inchs_size}
    ${response_body}    Post search profuct with filter    ${product_type}    ${inchs_size_symbol}
    ${json_path}    String.Format String    ${sku_query}    shipping_type=${shipping_method.standard}
    ${data}   JSONLibrary.Get Value From Json    ${response_body}     ${sku_query}
    ${value}    Collections.Get From List    ${data}    1
    [Return]    ${value}
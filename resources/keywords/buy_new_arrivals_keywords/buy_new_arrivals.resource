*** Settings ***
Library    Browser

Resource    ../resources/variables/common_variables.resource
Resource    ../resources/locators/locators.resource
Resource    ../resources/keywords/common_keywords.resource


*** Keywords ***
Add All New Arrivals to Cart
    [Documentation]    Adds all new arrivals from the front page to the shopping cart
    Click             ${FRONT_PAGE}
     ${buttons}=      Get Elements    text=Add to basket
     FOR    ${btn}    IN    @{buttons}
         Click        ${btn}
     END

Add Billing Details
    [Documentation]   Adds billing details on the checkout page from test data
    &{billing_data}=    Get Billing data
    Type Text    ${BILLING_FIRST_NAME}        ${billing_data['first_name']}
    Type Text    ${BILLING_LAST_NAME}         ${billing_data['last_name']}
    Type Text    ${BILLING_PHONE}             ${billing_data['phone_number']}
    Click        ${BILLING_COUNTRY}
    Type Text    ${BILLING_COUNTRY_SEARCH}    ${billing_data['country']}
    Press Keys   ${BILLING_COUNTRY_SEARCH}    Enter
    Type Text    ${BILLING_STREET_ADDRESS}    ${billing_data['street_address']}
    Type Text    ${BILLING_CITY}              ${billing_data['city']}
    Type Text    ${BILLING_POST_CODE}         ${billing_data['post_code']}
    Click        css=div#payment >> text=${billing_data['payment_method']}

Place Order And Verify Order Received
    [Documentation]   Places the order and verifies that the order was received
    Click                      ${PLACE_ORDER}
    Wait For Elements State    ${ORDER_RECEIVED}
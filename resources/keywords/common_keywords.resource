*** Settings ***
Library    Browser
Library    ../../libs/CustomLibrary.py

Resource    ../resources/variables/common_variables.resource
Resource    ../resources/locators/locators.resource


*** Keywords ***
Open New Browser
    New Browser     chromium    headless=False
    New Page        ${URL}
    Click           ${LOGIN_CONSENT_NO}

Login With Valid Credentials
    [Arguments]    ${USERNAME}          ${PASSWORD}
    Click          ${MY_ACCOUNT}
    Type Text      ${LOGIN_USERNAME}    ${USERNAME}
    Type Text      ${LOGIN_PASSWORD}    ${PASSWORD}
    Click          ${LOGIN_BUTTON} 
    Wait For Elements State    ${LOGOUT_BUTTON}

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

Login With Invalid Credentials
    [Arguments]    ${USERNAME}          ${PASSWORD}
    Click          ${MY_ACCOUNT}
    Type Text      ${LOGIN_USERNAME}    ${USERNAME}
    Type Text      ${LOGIN_PASSWORD}    ${PASSWORD}
    Click          ${LOGIN_BUTTON} 
    Wait For Elements State    ${LOGIN_ERROR} 

Register New User Using Valid Credentials
    &{register_data}=    Get Register Data
    Click          ${MY_ACCOUNT}
    Type Text      ${REGISTER_USERNAME}    ${register_data['email']}
    Type Text      ${REGISTER_PASSWORD}    ${register_data['password']}
    Sleep          1s
    Click          ${REGISTER_FORM}
    Wait For Elements State    ${REGISTER_BUTTON}
    Click          ${REGISTER_BUTTON}
    Wait For Elements State    ${LOGOUT_BUTTON}

Register User With Existing Credentials
    Click          ${MY_ACCOUNT}
    Type Text      ${REGISTER_USERNAME}    ${USERNAME}
    Type Text      ${REGISTER_PASSWORD}    ${PASSWORD}
    Sleep          1s
    Click          ${REGISTER_FORM}
    Wait For Elements State    ${REGISTER_BUTTON}
    Click          ${REGISTER_BUTTON}
    Wait For Elements State    ${EXISTING_REGISTER_ERROR}

Register User With Empty Credentials
    Click          ${MY_ACCOUNT}
    Sleep          1s
    Type Text      ${REGISTER_USERNAME}    ${EMPTY}
    Type Text      ${REGISTER_PASSWORD}    ${EMPTY}
    Click          ${REGISTER_FORM}
    ${is_disabled}=    Get Property    ${REGISTER_BUTTON}    disabled
    Should Be True    ${is_disabled}

Register User With Invalid Email
    &{register_data}=    Get Register Data
    Click          ${MY_ACCOUNT}
    Type Text      ${REGISTER_USERNAME}    invalidemail
    Type Text      ${REGISTER_PASSWORD}    ${PASSWORD}
    Sleep          1s
    Click          ${REGISTER_FORM}
    Wait For Elements State    ${REGISTER_BUTTON}
    Click          ${REGISTER_BUTTON}
    ${visible}=    Get Element Count    ${LOGOUT_BUTTON}
    Should Be Equal As Integers    ${visible}    0

Register User With Invalid Password
    &{register_data}=    Get Register Data
    Click          ${MY_ACCOUNT}
    Type Text      ${REGISTER_USERNAME}    ${register_data['email']}
    Type Text      ${REGISTER_PASSWORD}    short
    Sleep          1s
    Click          ${REGISTER_FORM}
    ${is_disabled}=    Get Property    ${REGISTER_BUTTON}    disabled
    Should Be True    ${is_disabled}

Sort Products From Low To High
    Login With Valid Credentials    ${USERNAME}    ${PASSWORD}
    Click                ${SHOP}
    Select Options By    ${SORTING_DROPDOWN}    label    Sort by price: low to high
    ${selected_text}=    Get Text    select.orderby >> option:checked
    Should Be Equal      ${selected_text}    Sort by price: low to high

Sort Products From High To Low
    Login With Valid Credentials    ${USERNAME}    ${PASSWORD}
    Click                ${SHOP}
    Select Options By    ${SORTING_DROPDOWN}    label    Sort by price: high to low
    ${selected_text}=    Get Text    select.orderby >> option:checked
    Should Be Equal      ${selected_text}    Sort by price: high to low

Sort Products By Rating
    Login With Valid Credentials    ${USERNAME}    ${PASSWORD}
    Click                ${SHOP}
    Select Options By    ${SORTING_DROPDOWN}    label    Sort by average rating
    ${selected_text}=    Get Text    select.orderby >> option:checked
    Should Be Equal      ${selected_text}    Sort by average rating

Filter Products With Java Category
    Click    ${SHOP}
    Click    ${PRODUCT_GATEGORY_JAVA}
    ${nav_text}=    Get Text    //*[@id="content"]/nav
    Should Contain    ${nav_text}    JavaScript
    

Add Products To Basket
    ${buttons}=      Get Elements    text=Add to basket
    FOR    ${btn}    IN    @{buttons}
        Click        ${btn}
    END
    Click    ${SHOPPING_CART}

Add Discount Coupon And Verify Discount
    Type Text    ${COUPON_CODE_FIELD}    ${DISCOUNT_CODE}
    Click    ${APPLY_COUPON_BUTTON} 
    Wait For Elements State    //div[@class='woocommerce-message']
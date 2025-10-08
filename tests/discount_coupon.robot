*** Settings ***
Library    Browser

Resource    ../resources/keywords/common_keywords.resource

Suite Setup       Open New Browser
Suite Teardown    Close Browser


*** Test Cases ***
Use Discount Coupon During Purchase
    [Documentation]    Tests to use a discount coupon during the purchase process
    Register New User Using Valid Credentials
    Click    ${SHOP}
    Filter Products With Java Category
    Add Products To Basket
    Add Discount Coupon And Verify Discount
    Click    ${CHECKOUT}
    Add Billing Details
    Place Order And Verify Order Received

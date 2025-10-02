*** Settings ***
Library    Browser

Resource    ../resources/keywords/buy_new_arrivals_keywords/buy_new_arrivals.resource

Suite Setup       Open New Browser
Suite Teardown    Close Browser

     
*** Test Cases ***
Buy All New Arrivals
    [Documentation]    Tests to buy all new arrivals from the shop
    Login With Valid Credentials    ${USERNAME}    ${PASSWORD}
    Add All New Arrivals to Cart
    Click    ${SHOPPING_CART}
    Click    ${CHECKOUT}
    Add Billing Details
    Place Order And Verify Order Received

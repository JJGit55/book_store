*** Settings ***
Resource    ../resources/keywords/common_keywords.resource

Suite Setup       Open New Browser
Suite Teardown    Close Browser


*** Variables ***
${book_name}=    Android Quick Start Guide


*** Test Cases ***
Search Given Book And Buy It
    [Documentation]    Tests to search for a given book and buy it
    Login With Valid Credentials    ${USERNAME}          ${PASSWORD}
    Search For Book    ${book_name}
    Add Products To Basket
    Click              ${CHECKOUT}
    Place Order And Verify Order Received








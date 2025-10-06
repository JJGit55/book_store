*** Settings ***
Library    Browser

Resource    ../resources/keywords/sorting_keywords/sorting.resource

Test Setup       Open New Browser
Test Teardown    Close Browser


*** Keywords ***
Sort Products From Low To High
    Login With Valid Credentials    ${USERNAME}    ${PASSWORD}
    Click    ${SHOP}
    Select Options By    ${SORTING_DROPDOWN}    label    Sort by price: low to high
    ${selected_text}=    Get Text    select.orderby >> option:checked
    Should Be Equal    ${selected_text}    Sort by price: low to high

Sort Products From High To Low
    Login With Valid Credentials    ${USERNAME}    ${PASSWORD}
    Click    ${SHOP}
    Select Options By    ${SORTING_DROPDOWN}    label    Sort by price: high to low
    ${selected_text}=    Get Text    select.orderby >> option:checked
    Should Be Equal    ${selected_text}    Sort by price: high to low

Sort Products By Rating
    Login With Valid Credentials    ${USERNAME}    ${PASSWORD}
    Click    ${SHOP}
    Select Options By    ${SORTING_DROPDOWN}    label    Sort by average rating
    ${selected_text}=    Get Text    select.orderby >> option:checked
    Should Be Equal    ${selected_text}    Sort by average rating

*** Test Cases ***
Sort Products By Price From Low To High
    [Documentation]    Tests to sort products by price from low to high
    Sort Products From Low To High

Sort Products By Price From High To Low
    [Documentation]    Tests to sort products by price from high to low
    Sort Products From High To Low

Sort Products By Average Rating
    [Documentation]    Tests to sort products by average rating
    Sort Products By Rating
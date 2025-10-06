*** Settings ***
Library    Browser

Resource    ../resources/variables/common_variables.resource
Resource    ../resources/locators/locators.resource
Resource    ../resources/keywords/common_keywords.resource


*** Keywords ***
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
*** Settings ***
Resource    ../resources/keywords/common_keywords.resource

Test Setup       Open New Browser
Test Teardown    Close Browser


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
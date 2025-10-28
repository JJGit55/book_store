*** Settings ***
Resource    ../resources/keywords/common_keywords.resource

Test Setup       Open New Browser
Test Teardown    Close Browser


*** Test Cases ***
Sort Shop Items Based On Android Category
    [Documentation]    Sorts shop items based on Android category
    Login With Valid Credentials    ${USERNAME}    ${PASSWORD}
    Filter Products With Android Category

Sort Shop Items Based On HTML Category
    [Documentation]    Sorts shop items based on HTML category
    Login With Valid Credentials    ${USERNAME}    ${PASSWORD}
    Filter Products With HTML Category

Sort Shop Items Based On JavaScript Category
    [Documentation]    Sorts shop items based on JavaScript category
    Login With Valid Credentials    ${USERNAME}    ${PASSWORD}
    Filter Products With Java Category

Sort Products Based On Selenium Category
    [Documentation]    Sorts products based on Selenium category
    Login With Valid Credentials    ${USERNAME}    ${PASSWORD}
    Filter Products With Selenium Category

*** Settings ***
Resource    ../resources/keywords/common_keywords.resource

Test Setup       Open New Browser
Test Teardown    Close Browser


*** Test Cases ***
Sort Shop Items Based On Android Category
    [Documentation]    Sorts shop items based on Android category
    Filter Products With Android Category

Sort Shop Items Based On HTML Category
    [Documentation]    Sorts shop items based on HTML category
    Filter Products With HTML Category

Sort Shop Items Based On JavaScript Category
    [Documentation]    Sorts shop items based on JavaScript category
    Filter Products With Java Category

Sort Products Based On Selenium Category
    [Documentation]    Sorts products based on Selenium category
    Filter Products With Selenium Category

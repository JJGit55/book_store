*** Settings ***
Resource    ../resources/keywords/selenium.resource

Test Setup       Open Selenium Browser Headless
Test Teardown    Close Browser


*** Test Cases ***
Set Price Filter Range From 150 To 250
    [Documentation]    Tests to set price filter range from 150 to 250
    Set Range From 150 To 250

Set Price Filter Range From 251 To 350
    [Documentation]    Tests to set price filter range from 251 to 350
    Set Range From 251 To 350

Set Price Filter Range From 351 To 500
    [Documentation]    Tests to set price filter range from 351 to 500
    Set Range From 351 To 500


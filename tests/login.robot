*** Settings ***
Resource    ../resources/keywords/common_keywords.resource

Test Setup       Open New Browser
Test Teardown    Close Browser


*** Test Cases ***
Login Test with Valid Credentials
    [Documentation]    Tests logging in with valid credentials
    Login With Valid Credentials   ${USERNAME}    ${PASSWORD}

Login Test with Invalid Credentials
    [Documentation]    Tests logging in with invalid credentials
    Login With Invalid Credentials   invalid_user    invalid_pass

Login Test with Empty Credentials
    [Documentation]    Tests logging in with empty credentials
    Login With Invalid Credentials   ${EMPTY}    ${EMPTY}

Login Test with Valid Username and Empty Password
    [Documentation]    Tests logging in with valid username and empty password
    Login With Invalid Credentials   ${USERNAME}    ${EMPTY}

Login Test with Empty Username and Valid Password
    [Documentation]    Tests logging in with empty username and valid password
    Login With Invalid Credentials   ${EMPTY}    ${PASSWORD}


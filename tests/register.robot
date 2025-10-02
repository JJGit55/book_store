*** Settings ***
Resource    ../resources/keywords/register_keywords/register.resource

Test Setup       Open New Browser
Test Teardown    Close Browser


*** Keywords ***
Register New User Using Valid Credentials
    &{register_data}=    Get Register Data
    Click          ${MY_ACCOUNT}
    Type Text      ${REGISTER_USERNAME}    ${register_data['email']}
    Type Text      ${REGISTER_PASSWORD}    ${register_data['password']}
    Sleep          1s
    Click          //*[@id="customer_login"]/div[2]/form/p[3]
    Wait For Elements State    ${REGISTER_BUTTON}
    Click          ${REGISTER_BUTTON}
    Wait For Elements State    ${LOGOUT_BUTTON}

Register User With Existing Credentials
    Click          ${MY_ACCOUNT}
    Type Text      ${REGISTER_USERNAME}    ${USERNAME}
    Type Text      ${REGISTER_PASSWORD}    ${PASSWORD}
    Sleep          1s
    Click          //*[@id="customer_login"]/div[2]/form/p[3]
    Wait For Elements State    ${REGISTER_BUTTON}
    Click          ${REGISTER_BUTTON}
    Wait For Elements State    ${EXISTING_REGISTER_ERROR}

Register User With Empty Credentials
    Click          ${MY_ACCOUNT}
    Sleep          1s
    Type Text      ${REGISTER_USERNAME}    ${EMPTY}
    Type Text      ${REGISTER_PASSWORD}    ${EMPTY}
    Click          //*[@id="customer_login"]/div[2]/form/p[3]
    ${is_disabled}=    Get Property    ${REGISTER_BUTTON}    disabled
    Should Be True    ${is_disabled}
    
    
    


*** Test Cases ***
Register New User With Valid Credentials
    [Documentation]    Tests to register a new user with valid credentials
    Register New User Using Valid Credentials

Register New User With Existing Credentials
    [Documentation]    Tests to register a new user with existing credentials
    Register User With Existing Credentials

Register New User With Empty Credentials
    [Documentation]    Tests to register a new user with empty credentials
    Register User With Empty Credentials
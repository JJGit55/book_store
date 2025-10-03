*** Settings ***
Library    Browser

Resource    ../resources/variables/common_variables.resource
Resource    ../resources/locators/locators.resource
Resource    ../resources/keywords/common_keywords.resource


*** Keywords ***
Register New User Using Valid Credentials
    &{register_data}=    Get Register Data
    Click          ${MY_ACCOUNT}
    Type Text      ${REGISTER_USERNAME}    ${register_data['email']}
    Type Text      ${REGISTER_PASSWORD}    ${register_data['password']}
    Sleep          1s
    Click          ${REGISTER_FORM}
    Wait For Elements State    ${REGISTER_BUTTON}
    Click          ${REGISTER_BUTTON}
    Wait For Elements State    ${LOGOUT_BUTTON}

Register User With Existing Credentials
    Click          ${MY_ACCOUNT}
    Type Text      ${REGISTER_USERNAME}    ${USERNAME}
    Type Text      ${REGISTER_PASSWORD}    ${PASSWORD}
    Sleep          1s
    Click          ${REGISTER_FORM}
    Wait For Elements State    ${REGISTER_BUTTON}
    Click          ${REGISTER_BUTTON}
    Wait For Elements State    ${EXISTING_REGISTER_ERROR}

Register User With Empty Credentials
    Click          ${MY_ACCOUNT}
    Sleep          1s
    Type Text      ${REGISTER_USERNAME}    ${EMPTY}
    Type Text      ${REGISTER_PASSWORD}    ${EMPTY}
    Click          ${REGISTER_FORM}
    ${is_disabled}=    Get Property    ${REGISTER_BUTTON}    disabled
    Should Be True    ${is_disabled}

Register User With Invalid Email
    &{register_data}=    Get Register Data
    Click          ${MY_ACCOUNT}
    Type Text      ${REGISTER_USERNAME}    invalidemail
    Type Text      ${REGISTER_PASSWORD}    ${PASSWORD}
    Sleep          1s
    Click          ${REGISTER_FORM}
    Wait For Elements State    ${REGISTER_BUTTON}
    Click          ${REGISTER_BUTTON}
    ${visible}=    Get Element Count    ${LOGOUT_BUTTON}
    Should Be Equal As Integers    ${visible}    0

Register User With Invalid Password
    &{register_data}=    Get Register Data
    Click          ${MY_ACCOUNT}
    Type Text      ${REGISTER_USERNAME}    ${register_data['email']}
    Type Text      ${REGISTER_PASSWORD}    short
    Sleep          1s
    Click          ${REGISTER_FORM}
    ${is_disabled}=    Get Property    ${REGISTER_BUTTON}    disabled
    Should Be True    ${is_disabled}
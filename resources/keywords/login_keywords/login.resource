*** Settings ***
Library    Browser

Resource    ../resources/variables/common_variables.resource
Resource    ../resources/locators/locators.resource
Resource    ../resources/keywords/common_keywords.resource

*** Keywords ***
Login With Invalid Credentials
    [Arguments]    ${USERNAME}          ${PASSWORD}
    Click          ${MY_ACCOUNT}
    Type Text      ${INPUT_USERNAME}    ${USERNAME}
    Type Text      ${INPUT_PASSWORD}    ${PASSWORD}
    Click          ${LOGIN_BUTTON} 
    Wait For Elements State    ${LOGIN_ERROR} 
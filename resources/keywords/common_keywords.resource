*** Settings ***
Library    Browser
Library    ../../libs/CustomLibrary.py
Resource    ../resources/variables/common_variables.resource
Resource    ../resources/locators/locators.resource



*** Keywords ***
Open New Browser
    New Browser     chromium    headless=False
    New Page        ${URL}
    Click           ${LOGIN_CONSENT_NO}

Login With Valid Credentials
    [Arguments]    ${USERNAME}          ${PASSWORD}
    Click          ${MY_ACCOUNT}
    Type Text      ${INPUT_USERNAME}    ${USERNAME}
    Type Text      ${INPUT_PASSWORD}    ${PASSWORD}
    Click          ${LOGIN_BUTTON} 
    Wait For Elements State    ${LOGOUT_BUTTON}
*** Settings ***
Library    SeleniumLibrary

Resource    ../resources/variables/common_variables.resource
Resource    ../resources/locators/locators.resource


*** Keywords ***
Open Selenium Browser
    Open Browser    ${URL}    ${SELENIUM_BROWSER}
    Maximize Browser Window

Set Range From 150 To 250
    Click Element    ${LOGIN_CONSENT_NO}
    Click Element    ${SHOP}
    ${left_handle}=     Get WebElement    css=.price_slider span:nth-child(2)
    ${right_handle}=    Get WebElement    css=.price_slider span:nth-child(3)
    Drag And Drop By Offset    ${left_handle}    0          0
    Drag And Drop By Offset    ${right_handle}   -143       0
    Click Element    ${FILTER_BUTTON}
    Wait Until Element Is Visible    ${FILTER_PRICE}    3s
    Element Should Contain           ${FILTER_PRICE}    Price: ₹150 — ₹250

Set Range From 251 To 350
    Click Element    ${LOGIN_CONSENT_NO}
    Click Element    ${SHOP}
    ${left_handle}=     Get WebElement    css=.price_slider span:nth-child(2)
    ${right_handle}=    Get WebElement    css=.price_slider span:nth-child(3)
    Drag And Drop By Offset    ${left_handle}    58       0
    Drag And Drop By Offset    ${right_handle}   -86      0
    Click Element    ${FILTER_BUTTON}
    Wait Until Element Is Visible    ${FILTER_PRICE}    3s
    Element Should Contain           ${FILTER_PRICE}    Price: ₹251 — ₹350

Set Range From 351 To 500
    Click Element    ${LOGIN_CONSENT_NO}
    Click Element    ${SHOP}
    ${left_handle}=     Get WebElement    css=.price_slider span:nth-child(2)
    ${right_handle}=    Get WebElement    css=.price_slider span:nth-child(3)
    Drag And Drop By Offset    ${left_handle}    115       0
    Drag And Drop By Offset    ${right_handle}   0         0
    Click Element    ${FILTER_BUTTON}
    Wait Until Element Is Visible    ${FILTER_PRICE}    3s
    Element Should Contain           ${FILTER_PRICE}    Price: ₹351 — ₹500
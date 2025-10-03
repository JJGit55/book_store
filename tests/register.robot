*** Settings ***
Resource    ../resources/keywords/register_keywords/register.resource

Test Setup       Open New Browser
Test Teardown    Close Browser


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

Register New User With Invalid Email
    [Documentation]    Tests to register a new user with invalid email
    Register User With Invalid Email

Register New User With Invalid Password
    [Documentation]    Tests to register a new user with invalid password
    Register User With Invalid Password
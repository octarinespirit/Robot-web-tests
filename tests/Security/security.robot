*** Settings ***
Library    Dialogs
Library    SeleniumLibrary
Resource    ../../keywords/keywords.resource
Resource    ../../resource/locators.resource

Test Teardown    Close Browser


*** Variables ***
${USERNAME}    tester
${PASSWORD}    pass123


*** Test Cases ***
Admin Login With Wrong Credentials, Failing Math Check
    [Documentation]    Admin login with wrong credentials, failing math check, should give error page
    Open Browser To Admin Login
    Input Text    id=user_login    ${USERNAME}
    Input Text    id=user_pass    ${PASSWORD}
    Input Text    id=jetpack_protect_answer    10
    Click Button    ${LOGIN_BUTTON}
    Wait Until Element Is Visible    id=${ERROR_MSG}
    Element Should Contain    ${ERROR_MSG}    You failed to correctly answer the math problem.
    Log    Login fails as expected

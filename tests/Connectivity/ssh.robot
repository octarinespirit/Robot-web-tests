*** Settings ***
Library    Dialogs
Library    SSHLibrary

Suite Teardown    Close All Connections


*** Variables ***
${USERNAME}    tester
${PASSWORD}    test123


*** Test Cases ***
Try Opening SSH Connection
    [Documentation]    Asks user the hostname and tries to log in with the given variable credentials.
    ${HOST}    Get Value From User    "Give hostname for SSH connection: "
    Open Connection    ${HOST}
    ${output}    Run Keyword And Ignore Error    Login    ${USERNAME}    ${PASSWORD}
    Should Contain    ${output}[1]    Authentication failed for user

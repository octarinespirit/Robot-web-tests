*** Settings ***
Library    Dialogs
Library    RequestsLibrary

*** Test Cases ***
Verify API is Reachable
    [Documentation]    Check the Wordpress REST API is available
    ${HOST}            Get Value From User    Give the host address: 
    ${BASE_URL}       Set Variable    https://${HOST}/wp-json/wp/v2
    Create Session     wordpress    ${BASE_URL}
    ${response}       GET On Session    wordpress    /posts
    ${status_code}    Convert To String    ${response.status_code}
    Should Be Equal As Strings    ${status_code}    200

Invalid Endpoint Should Return 404
    [Documentation]    Wrong address should return 404 error
    ${response}    Run Keyword And Ignore Error    GET On Session    wordpress    /wp-json/wp/v2/nonexistent
    ${message}    Set Variable    ${response}[1]    # Error message when failing
    ${msg_str}    Convert To String    ${message}
    Should Match Regexp    ${msg_str}    .*404.*    # 404 inside the error message

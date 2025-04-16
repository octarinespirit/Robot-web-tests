*** Settings ***
Library    Collections
Library    Dialogs
Library    ../../keywords/link.py
Library    SeleniumLibrary
Library    RequestsLibrary


*** Variables ***
@{FAILED_LINKS}


*** Keywords ***
Log Failed Links
    [Documentation]    Logs all failed links at the end of the test
    IF    ${FAILED_LINKS}
        FOR    ${item}    IN    @{FAILED_LINKS}
            Log    ${item}
        END
    ELSE
        Log    No failed links found.
    END


*** Test Cases ***
Check All Links On Page
    [Documentation]    Checks that links are working on a given web page, failed and denied checks are logged to a list
    ${URL}    Get Value From User    Give website address:
    Open Browser    ${URL}/linkit    Chrome
    ${links}    Get WebElements    //a[@href]

    FOR    ${link}    IN    @{links}
        ${href}    Get Element Attribute    ${link}    href
        Log    Checking link: ${href}
        ${status}    ${error}    Check Link    ${href}
        Log    Status: ${status}, Error: ${error}
        IF    '${status}' == 'FAIL'
            Append To List    ${FAILED_LINKS}    ${href} - ${error}
        END
    END

    Close Browser
    Log Failed Links

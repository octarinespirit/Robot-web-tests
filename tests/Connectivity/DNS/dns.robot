*** Settings ***
Library    Dialogs
Library    SeleniumLibrary
Library    ../../../keywords/dnskeywords.py
Resource    ../../../keywords/keywords.resource
Suite Setup    DNS Setup

*** Keywords ***
DNS Setup
    ${URL}     Get Value From User   Enter host addess for DNS checks:
    Set Suite Variable    ${URL}

*** Test Cases ***
Check DNS records
    [Documentation]    Check the given DNS record of the given domain
 
    ${DATA}    Get Value From User    Enter the record to be fetched:
    ${RECORD}    Get Dns Record    ${URL}    ${DATA}
    Log    ${RECORD}

Check The Reverse Name Of IP Address
    [Documentation]    Checks the reverse name of an ip address, does it match the domain name.
    ...                Sometimes reverse is not set.

    ${RECORD}    Get Dns Record    ${URL}    A
    FOR    ${IP}    IN    ${RECORD}
        Log    ${IP}
    END
    ${NAME}    Check Reverse Name    ${IP}
    Log    ${NAME}
    Should Be Equal As Strings    ${URL}    ${NAME}

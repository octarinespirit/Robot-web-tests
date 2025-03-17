*** Settings ***
Library    Dialogs
Library    SeleniumLibrary
Library    ../../../keywords/dnskeywords.py
Resource    ../../../keywords/keywords.resource


*** Test Cases ***
Check DNS records
    [Documentation]    Check the given DNS record of the given domain

    ${URL}     Get Value From User   Enter the website URL:
    ${DATA}    Get Value From User    Enter the record to be fetched:
    ${RECORD}    Get Dns Record    ${URL}    ${DATA}
    Log    ${RECORD}

Check The Reverse Name Of IP Address
    [Documentation]    Checks the reverse name of an ip address, the domain name.

    ${URL}     Get Value From User   Enter the website URL:
    ${RECORD}    Get Dns Record    ${URL}    A
    FOR    ${IP}    IN    ${RECORD}
        Log    ${IP}
    END
    ${NAME}    Check Reverse Name    ${IP}
    Log    ${NAME}
    Should Be Equal As Strings    ${URL}    ${NAME}

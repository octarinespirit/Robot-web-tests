*** Settings ***
Library    Dialogs
Library    ../../keywords/ports.py


*** Variables ***
@{PORT_LIST}    22    80    443    8000
${PORT_START}    1
${PORT_END}    30


*** Keywords ***
Scan Ports From List
    [Documentation]    Scans the given host's ports given in @{PORT_LIST}
    ${HOST}    Get Value From User    "Give host address to scan: "
    FOR    ${port}    IN    @{PORT_LIST}
        ${result}    Scan Port    ${HOST}    ${port}
        Log To Console    Port ${port} is ${result}
    END

Scan Port Range
    [Documentation]    Scans the given host's port range defined by ${PORT_START} and ${PORT_END}
    [Arguments]    ${starting_port}    ${ending_port}
    ${HOST}    Get Value From User    "Give host address to scan: "
    FOR    ${port}    IN RANGE    ${starting_port}    ${ending_port}
        Log To Console    Scanning port ${port}
        ${result}    Scan Port    ${HOST}    ${port}
        Log To Console    Port ${port} is ${result}
    END


*** Test Cases ***
Scan Ports From List
    [Documentation]    Scans the given host's ports given in @{PORT_LIST}
    Scan Ports From List

Scan Ports Range
    [Documentation]    Scans the given host's port range defined by ${PORT_START} and ${PORT_END}
    Scan Port Range    ${PORT_START}    ${PORT_END}

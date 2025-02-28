*** Settings ***
Documentation    This file contains the user-keywords.
Library    Dialogs
Library  SeleniumLibrary
Resource  ../resource/locators.resource


*** Keywords ***
Open The Chrome Browser
    [Documentation]    Opens the Chrome
    ${URL}     Get Value From User   Enter the website URL:
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    2

Click Menu Link And Confirm Page Title
    [Documentation]    Clicks main menu link and confirms the loaded page title
    [Arguments]    ${link}    ${page_title}
    Click Element    id=${link}
    Title Should Be    ${page_title}

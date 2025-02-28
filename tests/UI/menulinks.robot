*** Settings ***
Documentation    This file contains the test for the menu links. To be integrated later to a bigger UI tests file.
Library    Dialogs
Library    SeleniumLibrary
Resource    ../../resource/locators.resource
Resource    ../../keywords/keywords.resource

Test Template    Click Menu Link And Confirm Page Title

Test Setup          Open The Chrome Browser
Test Teardown       Close Browser


*** Test Cases ***
Click Menu Link And Confirm Page Title
    [Documentation]    Clicks menu link and confirms the opened page title
    [Tags]    click-menu
    ${PAIVAKIRJA}    Päiväkirja | Joonas & Jennifer
    ${KUVAT}    Kuvat | Joonas & Jennifer
    ${VIDEOT}    Omat videot | Joonas & Jennifer
    ${FILIPPIINIT}    Filippiinit | Joonas & Jennifer
    ${MUSIIKKI}    Musiikkia | Joonas & Jennifer
    ${MINA}    Minä | Joonas & Jennifer
    ${LINKIT}    Linkit | Joonas & Jennifer

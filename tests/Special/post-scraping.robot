*** Settings ***
Library    Dialogs
Library    SeleniumLibrary
Library    ../../keywords/scraping.py
Resource    ../../keywords/keywords.resource


*** Test Cases ***
Scrape Post
    [Documentation]    Scraping the contents of a blog post and writing them to a text file.

    ${URL}     Get Value From User   Enter the website URL:
    ${blog}    Get Content And Save    ${URL}/2024/06/13/tuliaisten-pakkaamista-rinkkaan/    blog.txt
    Log    ${blog}

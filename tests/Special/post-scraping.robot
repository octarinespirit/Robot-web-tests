*** Settings ***
Library    Collections
Library    Dialogs
Library    SeleniumLibrary
Library    ../../keywords/scraping.py
Resource    ../../keywords/keywords.resource
Suite Setup    Scraping Setup
Suite Teardown    Scraping Teardown



*** Keywords ***
Scraping Setup
    ${BASEURL}     Get Value From User   Enter the website URL:
    VAR    ${URL}
    Set Suite Variable    ${URL}    ${BASEURL}/posts

Scraping Teardown
    Close All Browsers

Get All Post Links
    [Documentation]    Gets all the post links from given page.
    VAR    @{links}
    Wait Until Element Is Visible    xpath=//article/div/header/h4/a    timeout=10s
    ${elements}    Get WebElements    xpath=//article/div/header/h4/a
    FOR    ${element}    IN    @{elements}
        ${href}    Get Element Attribute    ${element}    href
        Append To List    ${links}    ${href}
    END
    RETURN    @{links}

Count Number Of Posts
    [Documentation]    Counts the number of posts.
    ${post_links}    Get All Post Links
    Log    Found ${post_links.__len__()} posts
    RETURN    ${post_links.__len__()}


*** Tasks ***
Scrape Post
    [Documentation]    Scraping the contents of a blog post and writing them to a text file.
    [Tags]    scrape-1
    ${blog}    Get Content And Save    ${URL}    blog.txt
    Log    ${blog}

Post Counter
    [Documentation]    Counts the number of the posts
    [Tags]    count-posts
    Open Browser    ${URL}    chrome
    ${post_links}    Get All Post Links
    Log    Found ${post_links.__len__()} posts

Scrape All Posts
    [Documentation]    Scrapes the text of all the blog posts and saves them to a text file.
    [Tags]    scrape-2
    Open Browser    ${URL}    chrome
    ${post_links}    Get All Post Links
    FOR    ${link}    IN    @{post_links}
        Log    Link: ${link}
        Get Content And Save    ${link}    posts.txt
    END

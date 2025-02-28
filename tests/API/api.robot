*** Settings ***
Library             SeleniumLibrary
Library             RequestsLibrary
Resource            ../resource/locators.resource
Resource            ../keywords/keywords.resource

# Test Template    Click Menu Link And Confirm Page Title

Test Setup          Open The Chrome Browser
Test Teardown       Close Browser


*** Variables ***
${BASE_URL}       http://your-wordpress-site.com/wp-json/wp/v2
${AUTH}           Basic base64encoded_username:password

*** Test Cases ***
Verify API is Reachable
    [Documentation]    Verify the WordPress REST API is reachable
    Create Session     wordpress    ${BASE_URL}
    ${response}=       Get Request  wordpress  /posts
    Status Should Be   ${response}  200

Retrieve All Posts
    [Documentation]    Ensure the /posts endpoint returns a list of posts
    Create Session     wordpress    ${BASE_URL}
    ${response}=       Get Request  wordpress  /posts
    Status Should Be   ${response}  200
    Should Contain     ${response.json()}  title

Create a New Post
    [Documentation]    Test creating a new post using POST
    Create Session     wordpress    ${BASE_URL}  headers=${headers}
    ${headers}=        Create Dictionary  Authorization=${AUTH}  Content-Type=application/json
    ${data}=           Create Dictionary  title=Test Post  content=This is a test post  status=publish
    ${response}=       Post Request  wordpress  /posts  data=${data}  headers=${headers}
    Status Should Be   ${response}  201
    Should Contain     ${response.json()}  id

Update a Post
    [Documentation]    Test updating an existing post
    Create Session     wordpress    ${BASE_URL}  headers=${headers}
    ${headers}=        Create Dictionary  Authorization=${AUTH}  Content-Type=application/json
    ${data}=           Create Dictionary  title=Updated Test Post
    ${response}=       Put Request  wordpress  /posts/1  data=${data}  headers=${headers}
    Status Should Be   ${response}  200
    Should Contain     ${response.json()}  Updated Test Post

Delete a Post
    [Documentation]    Test deleting a post
    Create Session     wordpress    ${BASE_URL}  headers=${headers}
    ${headers}=        Create Dictionary  Authorization=${AUTH}
    ${response}=       Delete Request  wordpress  /posts/1  headers=${headers}
    Status Should Be   ${response}  200

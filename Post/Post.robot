*** Settings ***
Resource    ../Login.txt
Resource    AllKeyword.txt
Suite Setup    Login As Admin User
Suite Teardown    Log Out

*** Test Cases ***
TC-01
    [Tags]    Create Post
    [Setup]    Go To Post Page
    Verify Create Empty Title Post Warning Message Should Be Visible
    Create A New Post    test
    Verify New Post Should Be Exist    test
    [Teardown]    Run Keyword If Test Passed    Create Post's Teardown    test

TC-02
    [Tags]    Edit Post
    [Setup]    Go To Post Page
    Create A New Post    test
    Open Post By Post Title    test
    Edit Post Content    Published    Demo User
    Verify Success Message Is Visible
    Verify Edited Post In Postlist    test    Published    Demo User
    [Teardown]    Run Keyword If Test Passed    Edit Post's Teardown    test

TC-03
    [Tags]    Delete Post
    [Setup]    Go To Post Page
    Create A New Post    test
    Delete Post By Name    test
    Verify Deleted Post Is Not Visible In Postlist    test

TC-04
    [Tags]    Search Post
    [Setup]    Go To Post Page
    Create A New Post    test
    Input Post Filter    test
    Verify Only Filter Post In Postlist    test
    [Teardown]    Run Keyword If Test Passed    Edit Post's Teardown    test
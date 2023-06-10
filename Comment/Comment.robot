*** Settings ***
Resource    ../Login.txt
Resource    ../Post/AllKeyword.txt
Resource    AllKeyword.txt
Suite Setup    Login As Admin User
Suite Teardown    Log Out

*** Test Cases ***
TC-05
    [Tags]    Create Comment
    [Setup]    Run Keywords    Go To Post Page
    ...                 AND    Create A New Post    test
    Go To Comment Page
    Create A New Comment    Demo User    test
    Verify New Comment Should Be Exist    test
    [Teardown]    Run Keywords    Run Keyword If Test Passed    Delete Comment By Post Name    test
    ...                                                  AND    Delete Post By Name    test

TC-06
    [Tags]    Edit Comment
    [Setup]    Run Keywords    Go To Post Page
    ...                 AND    Create A New Post    test
    Go To Comment Page
    Create A New Comment    Demo User    test
    Open Comment By Post Name    test
    Edit Comment Content    Demo User    test    Published
    Verify Success Message Is Visible
    Verify Edited Comment In Commentlist    Demo User    test    Published
    [Teardown]    Run Keywords    Run Keyword If Test Passed    Delete Comment By Post Name    test
    ...                                                  AND    Delete Post By Name    test

TC-07
    [Tags]    Delete Comment
    [Setup]    Run Keywords    Go To Post Page
    ...                 AND    Create A New Post    test
    Go To Comment Page
    Create A New Comment    Demo User    test
    Delete Comment By Post Name    test
    Verify Only Filter Comment In Commentlist    test
    [Teardown]    Run Keyword If Test Passed    Delete Post By Name    test
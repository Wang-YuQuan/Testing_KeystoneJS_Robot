*** Settings ***
Resource    ../Login.txt
Resource    ../Post/AllKeyword.txt
Resource    AllKeyword.txt
Suite Setup    Login As Admin User
Suite Teardown    Log Out

*** Test Cases ***
TC-08
    [Tags]    Create Category
    [Setup]    Run Keywords    Go To Post Page
    ...                 AND    Go To Category Page
    Verify Create Empty Category Title Warning Message Should Be Visible
    Create A New Category    test
    Verify New Category Should Be Exist    test
    [Teardown]    Run Keyword If Test Passed    Delete Category By Name    test
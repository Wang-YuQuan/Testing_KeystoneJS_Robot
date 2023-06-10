*** Settings ***
Resource    ../Login.txt
Resource    ../Post/AllKeyword.txt
Resource    AllKeyword.txt
Suite Setup    Login As Admin User
Suite Teardown    Log Out

*** Test Cases ***
TC-10
    [Tags]    Create Enquire
    [Setup]    Run Keyword    Go To Front Page
    Go To Contact Page
    Create A New Contact    name    test@gmail.com    0900000000    message    test
    Verify New Enquire Should Be Exist    name
    [Teardown]    Run Keyword If Test Passed    Delete Enquire By Name    name
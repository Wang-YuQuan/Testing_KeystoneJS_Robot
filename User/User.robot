*** Settings ***
Resource    ../Login.txt
Resource    ../Post/AllKeyword.txt
Resource    AllKeyword.txt
Suite Setup    Login As Admin User
Suite Teardown    Log Out

*** Test Cases ***
TC-09
    [Tags]    Create User    Iuuse:User can't delete anyway.
    [Setup]    Run Keyword    Go To User Page
    Verify Create Empty Field User Warning Message Should Be Visible
    Create A New User    first    last    test@gmail.com    s96186999    s96186999
    Verify New User Should Be Exist    first last
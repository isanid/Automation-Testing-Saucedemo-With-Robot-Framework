*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}     https://www.saucedemo.com/
${locator_user}    id=user-name
${locator_pass}    //*[@id="password"]
${locator_button}     //*[@id="login-button"]

*** Keywords ***
Input username & password with valid data
    Open Browser   ${url}     chrome
    # yg dibawah cara 1 untuk supaya testing bisa lancar test case logout
    # Set Browser Implicit Wait    1
    Input Text    ${locator_user}   standard_user
    Input Text    ${locator_pass}   secret_sauce
    Click Button    ${locator_button}
    Page Should Contain    Products
    Sleep    2s 
    Close Browser

After Logout cannot go back product page 
    Open Browser   ${url}     chrome
    Input Text    ${locator_user}   standard_user
    Input Text    ${locator_pass}   secret_sauce
    Click Button    ${locator_button}
    Click Button    //*[@id="react-burger-menu-btn"]
    # yg dibawah cara 2 untuk supaya testing bisa lancar test case logout
    # Element Should Be Visible    //*[@id="logout_sidebar_link"]

    # yg dibawah cara 3 untuk supaya testing bisa lancar test case logout
    sleep    1s
    Click Element    //*[@id="logout_sidebar_link"]
    # dibawah cara alternatif supaya mendapatkan locator dari element didapat dari nama atau label :
    # Click Element    link=Logout
    Sleep    2s
    Go Back
    Page Should Contain    Epic sadface: You can only access '/inventory.html' when you are logged in.
    Sleep    2s 
    Close Browser

Input username & password with invalid data
    Open Browser   ${url}     chrome
    Input Text    ${locator_user}   user123
    Input Text    ${locator_pass}   secret
    Click Button    ${locator_button}
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    Sleep    2s
    Close Browser

Input invalid username & valid password 
    Open Browser   ${url}     chrome
    Input Text    ${locator_user}   user123
    Input Text    ${locator_pass}   secret_sauce
    Click Button    ${locator_button}
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    Sleep    2s
    Close Browser

Input valid username & invalid password 
    Open Browser   ${url}     chrome
    Input Text    ${locator_user}   standard_user
    Input Text    ${locator_pass}   123
    Click Button    ${locator_button}
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    Sleep    2s
    Close Browser
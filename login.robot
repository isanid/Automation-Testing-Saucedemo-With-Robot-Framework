*** Settings ***
Library    SeleniumLibrary
Resource    keyword.robot


*** Test Cases ***
Login Web saucedemo with valid data
    Input username & password with valid data

After Logout cannot go back product page
    After Logout cannot go back product page
    
Login Web saucedemo username & password with invalid data 
    Input username & password with invalid data

Login Web saucedemo with input invalid username & valid password 
    Input invalid username & valid password 

Login Web saucedemo with input valid username & invalid password 
    Input valid username & invalid password 

   
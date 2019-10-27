#          For keep keywoeds, variable that we need but no test case

*** Settings ***
Library    SeleniumLibrary    


*** Variables ***
${Target URL}    http://automationpractice.com/index.php
${Browser}    gc


*** Keywords ***
Ecommerce Suite Setup
    Open Browser    url=${Target URL}    browser=${Browser}
    Maximize Browser Window
    
Ecommerce Test Setup
    Delete All Cookies
    Go To    ${Target URL}
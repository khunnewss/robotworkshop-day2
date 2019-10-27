*** Settings ***
Library    SeleniumLibrary    

*** Variables ***
${Target URL}    http://automationpractice.com/index.php
${Browser}    gc

*** Test Cases ***
Open browser demo
 # Open Browser url=https://google.com browser=googlechrome # browser=gc ก็ได้

     Open Browser    url=${Target URL}    browser=${Browser}

Test case2
        Log   ${Target URL}
        
Test Id locator
    Open Browser    url=${Target URL}    browser=${Browser}
    Click Element             css:a.login       #id:contact-link   
    sleep    3 seconds 
    Page should contain    Already registered?
    
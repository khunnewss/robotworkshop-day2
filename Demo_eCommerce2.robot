*** Settings ***
Library    SeleniumLibrary    
Library    String    
Test Setup   Ecommerce Test Setup     #Open Browser    url=${Target URL}    browser=${Browser}  #can setup only one command, so we create our own library(keyword) instead
Test Teardown     Capture Page Screenshot    
Suite Setup    Ecommerce Suite Setup 
Suite Teardown    LOG    Suite Teardown  #logให้ดูว่ามันcallตัวไหนบ้างตอนรัน อันนี้ทำหลังสุดแต่ในreportเค้าแปะไว้ข้างบน


*** Variables ***
${Target URL}    http://automationpractice.com/index.php
${Browser}    gc

*** Test Cases ***
Normal user checkout single product should calculate total price and shipping fee
   # Open Browser    url=${Target URL}    browser=${Browser}
   # Maximize Browser Window
    #Mouse Over    locator
    Click link    css:ul#homefeatured a[data-id-product="7"]    
    # Sleep   3 seconds     # not stable 
    Wait Until Element Is Visible        css:a[title="Proceed to checkout"]    5 seconds
    Click link    css:a[title="Proceed to checkout"]
    # Click link    partial link:Proceed to checkout
    Wait Until Page Contains    Shopping-cart summary    5 seconds    
    ${total product price}=    Get Text    id:total_product
    ${total product price}=    Replace String    ${total product price}      $        ${EMPTY}
    Should Be Equal As Strings    57.96     ${total product price}   #ตัวแปรที่ต้องการตรวจสอบไว้ตัวที่2     
        ${shipping fee}=    Get Text    id:total_shipping
        Should Be Equal As Strings    $2     ${shipping fee}    #เอามาเทียบทั้ง๓ ตามที่เค้าได้มาเลย
           ${total price}=    Get Text    id:total_price
        Should Be Equal As Strings    $2     ${total price}   
   # Close All Browsers    # ปิดหมดทำให้ไม่เปิดหลายๆbrowserเวลารันครั้้งต่อไปไม่มีbrowserมากไป
    
Normal user checkout multiple product should calculate total price and shipping fee
    #Open Browser    ${Target URL}    browser=${Browser} can use setup, tear down instead
    #Maximize Browser Window
    
        #Mouse Over    locator
    Click link    css:ul#homefeatured a[data-id-product="7"]    
    LOG    waiting for implement
   # Close All Browsers
    
*** Keywords ***
Ecommerce Suite Setup
    Open Browser    url=${Target URL}    browser=${Browser}
    Maximize Browser Window

Ecommerce Test Setup
    Delete All Cookies
    Go To    ${Target URL}
      
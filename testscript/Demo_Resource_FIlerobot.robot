*** Settings ***
Library    SeleniumLibrary  
Library    String      
Library    Dialogs    #should use only for debug then remove becoz it block other script to run
Resource    ../resources/Common.resource
Resource    ../resources/Homepage.resource
Resource    ../resources/OrderPage.resource
Suite Setup    Ecommerce Suite Setup
Test Setup    Ecommerce Test Setup
Suite Teardown    Close All Browsers
#Test Teardown    Dialogs.Pause Execution    
#Test Teardown    Capture Page Screenshot    
#ctrl+space to help autocomplete
#ดูกับcheckout.robot
*** Test Cases ***
Test import selenium resource file
    Mouse Over    xpath:(//div[@class="product-image-container"])[1]
    Click Link    css:ul#homefeatured a[data-id-product="1"]  
    
Demo page resource
    Homepage.Add product to shopping cart    1
    Homepage.Checkout product
    OrderPage.Wait until page load success
   OrderPage.verify total product price    16.51
   OrderPage.Verify shipping fee    #20
    OrderPage.Verify total price    #220
    OrderPage.Summary total price

Demo math
    [tags]    SmokeTest
   ${result}    Evaluate    2 + 10 
   
Unauthen user checkout single product should calculate total price and shipping fee
   # [Tags]    ignore     #คือscruptนี้ยังไม่เสดให้ข้ามไป
    Given Unauthen user add product "1" to shopping cart
    When I Checkout product
    Then I should see total product price equal to "$16.51"
    #And I should see total shipping fee equal to "$2.00"
    #And I should see total price equal to "$18.51"
    #And I should see total price equal to summary price
    
#lets dev implement to follow these testcase and ensure that it follow requirement
    
      
*** Settings ***
Library    SeleniumLibrary    
Library    String    

*** Keywords ***
Wait until page load success
     Wait Until Page Contains    Shopping-cart summary    5 seconds
     
verify total product price
    [Arguments]    ${total product input}
      ${total products price} =    Get Text    id:total_product
      #ตัดเครื่องหมาย$ออก
    ${total products price} =    Replace String    ${total products price}    $    ${EMPTY}    
    Should Be Equal As Strings    ${total product input}    ${total products price}    
Verify shipping fee  
    ${shipping fee} =    Get Text    id:total_shipping
    Should Be Equal As Strings    $2.00    ${shipping fee}
     Capture Page Screenshot 
Verify total price
    ${total price} =    Get Text    id:total_price
    Should Be Equal As Strings    $18.51    ${total price}
Summary total price
    
#           ได้string $ 12.21 ต้องทำstringให้เป็นตัวเลขเลยใช้ตัด$ออก
    ${total product}=    Get Text    id:total_product
     ${total product} =    Replace String    ${total product}    $    ${EMPTY}    
    ${total product} =    Convert To Number    ${total product}    
    
     ${total shipping}=    Get Text    id:total_shipping
     
      ${total tax}=    Get Text    id:total_tax
      
       ${total price}=    Get Text    id:total_price
       
    Should Be Equal As Numbers    ${expect total price}    ${total price}     
       

*** Settings ***
Library    SeleniumLibrary    

*** Keywords ***
Add product to shopping cart
   # Mouse Over    xpath:(//div[@class="product-image-container"])[1]
    #Click Link    css:ul#homefeatured a[data-id-product="1"]  
    [Arguments]    ${product id}
    Mouse Over    xpath:(//div[@class="product-image-container"])[${product id}]
    Click Link    css:ul#homefeatured a[data-id-product="${product id}"]  
    
Checkout product
    Wait Until Element Is Visible    css:a[title="Proceed to checkout"]    5 seconds
    Click Link    css:a[title="Proceed to checkout"]
    
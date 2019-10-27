*** Settings ***
Library    SeleniumLibrary    
Resource    ../resources/Homepage.resource
Resource    ../resources/OrderPage.resource

*** Keywords ***
Unauthen user add product "${product id}" to shopping cart
    Homepage.Add product to shopping cart    ${product id}
    
I Checkout product
    Homepage.Checkout product
    
I should see total product price equal to "${total product}"
    OrderPage.Wait until page load success
       OrderPage.verify total product price    ${total product}
*** Settings ***
Documentation    user is able to buy products using “Add to Basket” option in Amazon.com
Library  SeleniumLibrary

*** Test Cases ***
user is able to buy products using “Add to Basket” option in Amazon.com
    [Tags]    Smoke
    open browser  https://www.amazon.de/  googlechrome
    wait until page contains  Sign in
    click element  xpath=//SPAN[@class='a-button-inner']
    input text  id=twotabsearchtextbox  gopro hero 10
    click button  css=[id="nav-search-submit-button"]
    wait until page contains  results for "gopro hero 10"
    click element  xpath=//SPAN[@class='a-size-medium a-color-base a-text-normal']
    Wait Until Page Contains  Back to results
    click button  xpath=//INPUT[@id='add-to-cart-button']
    sleep  5s
    close browser


*** Keywords ***

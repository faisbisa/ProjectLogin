*** Settings ***
Library         SeleniumLibrary
Test Setup      Open Browser        ${base_url}     ${browser_type}
Test Teardown   Close Browser


*** Variables ***
${base_url}        https://pub-eish-dev.keponet.com/frontend/login      
${browser_type}     Chrome
${email_user}       jenareishsatu@yopmail.com
${password_user}    12345678
${invalid_email}       jenareish@yopmail.com
${invalid_password}    1234567
${notFilling_user}       
${notFilling_password}    

*** Test Cases ***
User login with email and password valid
    Maximize Browser Window
    Input Text               //input[@id="email"]       ${email_user} 
    Input Text               //input[@id="password"]    ${password_user}
    Click Element           //button[@type="submit"]
    Element Should Be Visible   //img[@id="menu-logo"]
    
User login with email valid and password unvalid
    Maximize Browser Window
    Input Text                  //input[@id="email"]       ${email_user}
    Input Text                  //input[@id="password"]    ${invalid_password}
    Click Element               //button[@type="submit"]
    Element Should Not Be Visible   //div[@class="alert alert-danger text-danger"]


User login with email unvalid and password valid
    Maximize Browser Window
    Input Text                  //input[@id="email"]       ${invalid_email}
    Input Text                  //input[@id="password"]    ${password_user}
    Click Element               //button[@type="submit"]
    Element Should Not Be Visible   //img[@id="menu-logo"]


User login without filling email and password 
    Maximize Browser Window
    Input Text                  //input[@id="email"]       ${notFilling_user}
    Input Text                  //input[@id="password"]    ${notFilling_password}
    Click Element               //button[@type="submit"]
    Element Should Not Be Visible   //img[@id="menu-logo"]
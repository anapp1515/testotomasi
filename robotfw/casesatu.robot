*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${url}    https://joss.jatimprov.go.id/index.php/login

*** Test Cases ***
Proses Login
    Open Browser    ${url}    chrome
    Input Text    id=pti_user_username    thanos
    Input Password    id=pti_user_password    avenger
    Close Browser
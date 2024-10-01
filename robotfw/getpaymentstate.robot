*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${URL}    https://pad.bpkad.jatimprov.go.id/login
${USR-FIELD}    id=input-14
${PASS-FIELD}    id=input-16
${USRNAME}    rusunawa
${PASSWD}    a12345
${BROWS}    chrome
${SEARCH-FIELD}     id=input-36
${ID-PAD}    38971
${TEST-VAR}    xpath=//span[text()='kw']/../*[@class="Select-value-icon"]
${IsAjaxComplete}    ${EMPTY}
#${bt-login}    class="v-btn__content"

*** Test Cases ***
Open_System
    Open Browser    ${URL}    ${BROWS}
    Maximize Browser Window
Proses_Login
    Input Text    ${USR-FIELD}    ${USRNAME}
    Input Password    ${PASS-FIELD}    ${PASSWD}
    #Click Button    ${bt-login}
    Press Keys    ${PASS-FIELD}    ENTER
    #Click Element    ${bt-login}
Search_Data
    FOR    ${counter}    IN RANGE    1    5000
        ${IsAjaxComplete}    Execute Javascript    return window.jQuery!=undefined && jQuery.active==0
        Log    ${counter}    console=True
        Log    ${IsAjaxComplete}    console=True
        Run Keyword If    ${IsAjaxComplete}==True    Exit For Loop
    END
    
    #Sleep    10s
    #Wait Until Page Contains Element    /html/body/div/div[1]/div/div/main/div/div/form/div[1]/div[2]/div/div[1]/div[3]/div[2]/div/div/input
    #Wait Until Element Is Visible    /html/body/div/div[1]/div/div/main/div/div/form/div[1]/div[2]/div/div[1]/div[3]/div[2]/div/div/input
    #Click Element    xpath=//*[contains(text(), "Cari")]
    #${VAL-ELEMENT}    Get WebElement    ${SEARCH-FIELD}
    #Log To Console    ${VAL-ELEMENT}
    #Sleep    5s
    #Click Element    xpath=//input[@id='input-36']
    
    #Wait Until Page Contains Element    ${SEARCH-FIELD}
    #Input Text    ${SEARCH-FIELD}    ${ID-PAD}
    #Sleep    10s
    #Close Browser
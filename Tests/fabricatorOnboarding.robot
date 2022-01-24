*** Settings ***
Documentation    E2E - Fabricator Onboarding
Library    SeleniumLibrary
Resource    ../Processes/retailerFabricatorOnboardingProcess.robot
Resource    ../Processes/Create Qoute.robot
Library    ../Processes/functions.py

Suite Setup    Login Retailer.Initiate Web Tests    ${BROWSER}    ${BROWSER_OPTIONS}
#Suite Teardown    Common.Terminate Web Tests

*** Variables ***
${BROWSER} =    chrome
${BROWSER_OPTIONS} =    add_argument("--start-maximized");add_argument("--disable-notifications");add_argument("--disable-popup-blocking");add_experimental_option('excludeSwitches', ['enable-logging'])


*** Test Cases ***
Retailer Onboarding- New Account
    [Tags]    New Account
    Choose new account Fabricator
    Create new Fabricator account and fill the fields
    varify New Account created

Fabricator Onboarding- New Contact
    [Tags]    New Contact
    Step 2 - New Contact
    ${VAR}=    get text    xpath:(//*[@class="custom-truncate uiOutputText"])[1]
    Save Contact
    Search Account    ${VAR}
    Select Edit Access to CS Connect & Primary Owner    ${VAR}
    #${VAR}=    get text    xpath:(//*[@class="custom-truncate uiOutputText"])[2]
    #sleep    5s
    #Search Contact    ${VAR}
    wait until page contains element    xpath://*[@title="Edit Access to CS Connect"]    20s

    reload page
    reload page
    Varify Creation By Check Log In




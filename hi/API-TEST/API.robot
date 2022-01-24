*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections


*** Variables ***
${AppURL}    http://thetestingworldapi.com/
${StudentID}    527826


*** Test Cases ***
TestCase1_byID
    create session    FetchData    ${AppURL}
    ${Response}=    get on session    FetchData    api/studentsDetails/${StudentID}
    should be equal as integers    ${Response.status_code}    200

    ${jsonres}=    to json    ${Response.content}

    @{firstNameList}=    get value from json    ${jsonres}    data.first_name
    ${first_name}=    get from list    ${firstNameList}    0
    log to console    ${first_name}
    should be equal     ${first_name}    Hello_Update

    @{lastNameList}=    get value from json    ${jsonres}    data.last_name
    ${last_name}=    get from list    ${lastNameList}    0
    log to console    ${last_name}
    should be equal     ${last_name}    Hello_Last



*** Keywords ***
*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections


*** Variables ***
${AppURL}    http://thetestingworldapi.com/
${StudentID}    527826


*** Test Cases ***
TestCase1_validateDeleteRequest
    create session    FetchData    ${AppURL}
    ${resp}=    delete on session    FetchData   api/studentsDetails/528147
    log to console    ${resp.status_code}
    log to console    ${resp.content}
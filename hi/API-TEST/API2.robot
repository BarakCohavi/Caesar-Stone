*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections


*** Variables ***
${AppURL}    https://reqres.in
${StudentID}    527826


*** Test Cases ***
TestCase1_Get Request With Parameters
    create session    Get_Param    ${AppURL}     verify=true
    &{param}=    create dictionary    page=2
    ${response}=    get on session    Get_Param  /api/users  params=${param}
    log to console  ${response.status_code}
    log to console  ${response.content}
*** Keywords ***
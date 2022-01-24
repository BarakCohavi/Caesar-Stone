*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections


*** Variables ***
${AppURL}    https://test.salesforce.com
#&{body}     grant_type=password    client_id=3MVG9T992fY2Y4vvJxJ55IpDkio0xMNCUY_LWU4Mg4skz_90qwAiTjXF6h17c9xSdQfgzEwz94FqRcrbylyrf   client_secret=05BA1D9BB0922A49E4C0D83DFC8289C7BED0B5000057EF67AFCEABE8B32CDBB4    username=caesarstone.testing@gmail.com.admin    password=qualitest123dCB2UFAh6uQtowtlBVznnuDg
${HEADERS}=   application/x-www-form-urlencoded
#${Cookies}   create dictionary    BrowserId=otGfFk0oEeyD9GNnWHwFQw;    CookieConsentPolicy=0:0;    LSKey-c$CookieConsentPolicy=0:0
#${headers}   create dictionary    application/x-www-form-urlencoded

*** Test Cases ***
Test_AUTHENTICATION
    [Documentation]
    ${body}   create dictionary    grant_type=password    client_id=3MVG9T992fY2Y4vvJxJ55IpDkio0xMNCUY_LWU4Mg4skz_90qwAiTjXF6h17c9xSdQfgzEwz94FqRcrbylyrf   client_secret=05BA1D9BB0922A49E4C0D83DFC8289C7BED0B5000057EF67AFCEABE8B32CDBB4    username=caesarstone.testing@gmail.com.admin    password=qualitest123dCB2UFAh6uQtowtlBVznnuDg
    create session    myssion    ${AppURL}
    ${Response}=    post on session    myssion     /services/oauth2/token    data=&{body}
    should be equal as integers    ${Response.status_code}    200
     ${jsonres}=    set variable    ${Response.json()}
    ${access_token_list}=    get from dictionary     ${jsonres}    access_token
    #${access_token}=     get from list    ${access_token_list}    0

    #log to console     ${Response.content}
    log to console     ${jsonres}
    log to console     11111111111
    log to console     ${access_token_list}
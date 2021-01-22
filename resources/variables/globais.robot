*** Variables ***
${URL}                            https://developer.clashroyale.com
${ELEMENT_LOGIN}                  xpath=//div[@class='login-menu']//a[contains(text(),'Log In')]
${ELEMENT_USER}                   xpath=//input[@id="email"]
${ELEMENT_PASSWORD}               xpath=//input[@id="password"]
${USER}                           fabricioadenir@gmail.com
${PASSWORD}                       testeRPA
${ELEMENT_LOGIN_ENTER}            xpath=//button[@type='submit']
${ELEMENT_MENU}                   xpath=//div[@class="login-menu"]//div[@class="btn-group"]
${ELEMENT_MY_ACCOUNT}             xpath=//div[@class="login-menu"]//div//ul//li//a[contains(text(),'My Account')]
${ELEMENT_CREATE_NEW_KEY}         xpath=//span[contains(text(), "Create New Key")]
${KEY_NAME}                       rpaClashRoyale
${KEY_DESC}                       RPA Clash Royale
${ELEMENT_KEY_NAME}               xpath=//input[@id="name"]
${ELEMENT_KEY_DESC}               xpath=//textarea[@id="description"]
${ELEMENT_IP_ADDRESS}             xpath=//input[@id="range-0"]
${ELEMENT_CREATE_KEY}             xpath=//span[contains(text(), "Create Key")]
${ELEMENT_KEY}                    xpath=//li[@class="api-key"]
${ELEMENT_TOKEN}                  xpath=//samp[contains(@data-reactid,'.0.2.0.1.0.0.0.1.0.0.1.0')]
${ELEMENT_DELETE_TOKE}            xpath=//button[@type='submit'][contains(.,'Delete Key')]
${FILE_NAME}                      membros_do_cla.csv
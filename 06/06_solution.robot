*** Settings ***
Library                     QWeb
Test Setup                  OpenBrowser             https://qentinelqi.github.io/shop/    chrome
Test Teardown               CloseAllBrowsers

*** Test Cases ***
Exercise 06 - Test 1
    [Documentation]         Using default timeout
    VerifyText              this should not be found

Exercise 06 - Test 2
    [Documentation]         Using 15s timeout
    VerifyText              this should not be found    15
    

Exercise 06 - Test 3
    [Documentation]         Using 45s timeout
    VerifyText              this should not be found    timeout=45s

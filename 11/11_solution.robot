*** Settings ***
Library                     QWeb
Resource                    keywords.robot
Suite Setup                 OpenBrowser             https://qentinelqi.github.io/shop/    chrome
Suite Teardown              CloseAllBrowsers

*** Test Cases ***
Exercise 11
    [Documentation]         See repo
    Appstate                Contact
    TypeText                Full Name           Test User
    TypeText                Email Address       myfakeemail@test.com
    TypeText                Message             Do you sell pants?

    ClickText               Send Message
    VerifyText              Your message is sent. We'll be in touch soon.

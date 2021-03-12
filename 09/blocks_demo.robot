*** Settings ***
Library                     QWeb
Suite Teardown              CloseBrowser

*** Test Cases ***
RunBlock demo
    OpenBrowser             file://${CURDIR}/../examples/random.html   chrome
    RunBlock                GiveMeFive      timeout=180s    exp_handler=RebootBrowser
    ClickText               Click Me            # click button again
    ${after_five}           GetText         //*[@id\="demo"]
    Log                     Number after '5' was: ${after_five}

*** Keywords ***
GiveMeFive
    ClickText               Click Me
    VerifyText              5       timeout=2       # Let's only wait for 2 seconds

RebootBrowser
    CloseBrowser
    OpenBrowser             file://${CURDIR}/../examples/random.html   chrome
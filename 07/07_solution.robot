*** Settings ***
Library                     QWeb


*** Test Cases ***
Exercise 07
    [Documentation]         Go to https://info.qentinel.com/events
    ...                     Click "READ MORE" on event "Qentinel Pace Release Demo" using anchor
    ...                     Verify that text "Monthly demo series demonstrates the main features of the latest Qentinel Pace release" appears on detailed info page.
    OpenBrowser             https://info.qentinel.com/events        chrome
    ClickText               READ MORE       anchor=Qentinel Pace Release Demo
    VerifyText              Monthly demo series demonstrates the main features of the latest Qentinel Pace release

    # Log Screenshot here only to get "proof" to log
    LogScreenshot
    CloseAllBrowsers
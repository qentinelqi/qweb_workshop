*** Settings ***
Library                     QWeb


*** Test Cases ***
Exercise 05 - Test 1
    [Documentation]         Open page https://swisnl.github.io/jQuery-contextMenu/demo.html
    ...                     Right-click button "right-click me"
    ...                     Click "Delete" from the context menu when it opens
    
    # 1. Open page https://swisnl.github.io/jQuery-contextMenu/demo.html
    OpenBrowser             https://swisnl.github.io/jQuery-contextMenu/demo.html   chrome
    
    # 2. Right-click button "right-click me"
    RightClick              //span[text()\="right click me"]
    
    # 3. Click "Delete" from the context menu when it opens
    ClickText               Delete            tag=span
    
    # Sleep & Log Screenshot here only for getting screenshot to logs
    Sleep                   2
    LogScreenshot
    CloseAllBrowsers

Exercise 05 - Test 2
    [Documentation]         Open page random.html from ../examples folder
    ...                     Click button "Click Me" until number "8" appears
    
    # 1. Open page random.html from ../examples folder
    OpenBrowser             file://${CURDIR}/../examples/random.html        chrome

    # 2. Click button "Click Me" until number "8" appears
    ClickUntil              8           Click Me  timeout=60   interval=1

    # Log Screenshot here only for getting screenshot to logs
    LogScreenshot
    CloseAllBrowsers

Exercise 05 - Test 3
    [Documentation]         Open page random.html from ../examples folder
    ...                     Click button "Click Me" until "ClickWhile condition was not met" disappears
    ...                     Wait maximum of 45 seconds for this to happen and click button in 2 second intervals
    
    # 1. Open page random.html from ../examples folder
    OpenBrowser             file://${CURDIR}/../examples/random.html        chrome

    # 2. Click button "Click Me" until "ClickWhile condition was not met" disappears
    # Wait maximum of 45 seconds for this to happen and click button in 2 second intervals
    ClickWhile      ClickWhile condition not met       Click Me  timeout=45   interval=2

    # Log Screenshot here only for getting screenshot to logs
    LogScreenshot
    CloseAllBrowsers

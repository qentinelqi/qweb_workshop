*** Settings ***
Library                     QWeb


*** Test Cases ***
Exercise 08
    [Documentation]         Go to https://swisnl.github.io/jQuery-contextMenu/demo.html
    ...                     RightClick button "right click me"
    ...                     Select (click) option "Copy" from the context menu
    ...                     Verify that alert with text "clicked: copy" appears
    ...                     Close the alert (Accept)
    
    # 1. Open page https://swisnl.github.io/jQuery-contextMenu/demo.html
    OpenBrowser             https://swisnl.github.io/jQuery-contextMenu/demo.html   chrome
    
    # 2. Right-click button "right-click me"
    RightClick              //span[text()\="right click me"]
    
    # 3. Click "Copy" from the context menu when it opens
    ClickText               Copy            anchor=Demo: Simple Context Menu
    
    # 4. Verify that alert with text "clicked: copy" appears
    VerifyAlertText         clicked: copy

    # 5. Close the alert (Accept)
    CloseAlert              Accept

    CloseAllBrowsers

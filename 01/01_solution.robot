*** Settings ***
Library                     QWeb

*** Test Cases ***
Exercise 01
    [Documentation]         1. Open Chrome and navigate to https://www.google.com
    ...                     2. Open new tab/window. Navigate to https://qentinelqi.github.io/shop/
    ...                     3. Change browser window size to 1200x900
    ...                     4. Set focus to first window (Google) and navigate to https://qentinelqi.github.io/shop/
    ...                     5. Close all browser windows
    OpenBrowser             https://www.google.com    chrome
    OpenWindow
    GoTo                    https://qentinelqi.github.io/shop/

    SetConfig               WindowSize    1200x900
    SwitchWindow            1
    GoTo                    https://qentinelqi.github.io/shop/

    CloseAllBrowsers
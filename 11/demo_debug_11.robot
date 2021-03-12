*** Settings ***
Library         QWeb

*** Test Cases ***
Use case 1
    OpenBrowser     https://qentinelqi.github.io/shop       chrome
    VerifyText      The animal friendly clothing company
    ClickText       Scar the Lion
    ClickText       Add to cart
    VerifyText      Cart summary
    DropDown        Size                                    Large
    ClickItem       Increment quantity
    DebugOn
    ClickItem       Remove item
    VerifyText      Your cart is empty
    ClickText       Continue shopping
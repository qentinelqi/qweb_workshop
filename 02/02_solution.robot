*** Settings ***
Library                     QWeb

*** Test Cases ***
Exercise 02
    [Documentation]         1. Open Chrome and navigate to Go to https://qentinelqi.github.io/shop/
    ...                     2. Add product "Scar the Lion" to shopping cart
    ...                     3. Select "Large" as size of a t-shirt
    ...                     4. Set quantity of products to 2
    ...                     5. Checkout
    ...                     6. Fill in "Full Name", "Email" and "Billing Address"
    ...                     7. Change your mind and edit cart, remove product from cart and verify cart is empty

    # 1. Open Chrome and navigate to Go to https://qentinelqi.github.io/shop/
    OpenBrowser             https://qentinelqi.github.io/shop/    chrome

    # 2. Add product "Scar the Lion" to shopping cart
    ClickText               Scar the Lion
    ClickText               Add to cart

    # 3. Select "Large" as size of a t-shirt
    Dropdown                Size    Large

    # 4. Set quantity of products to 2
    ClickItem               Increment quantity

    # 5. Checkout
    ClickText               Checkout

    # 6. Fill in "Full Name", "Email" and "Billing Address"
    TypeText                Full name           Test Robot
    TypeText                Email               testrobot@test.com 
    TypeText                Billing address     Demo street 1
    
    # screenshot here just to show these in logs
    LogScreenshot

    # 7. Change your mind and edit cart, remove product from cart and verify cart is empty
    ClickText               Continue shopping
    ClickText               shopping_cart
    ClickItem               Remove item
    VerifyText              Your cart is empty

    CloseAllBrowsers
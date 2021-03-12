*** Settings ***
Library                     QWeb

*** Test Cases ***
Exercise 03
    [Documentation]         1. Open Chrome and navigate to Go to https://qentinelqi.github.io/shop/
    ...                     2. Text "The animal friendly clothing company" is displayed on main page
    ...                     3. Add product "Scar the Lion" to shopping cart
    ...                     4. The total price for item is $9.00 before incrementing quantity
    ...                     5. Select "Large" as size of a t-shirt
    ...                     6. Set quantity of products to 2
    ...                     7. The total price for items is $18.00 after incrementing quantity
    ...                     8. Checkout
    ...                     9. Fill in "Full Name", "Email" and "Billing Address"
    ...                     10. Change your mind and edit cart, remove product from cart and verify cart is empty

    # 1. Open Chrome and navigate to Go to https://qentinelqi.github.io/shop/
    OpenBrowser             https://qentinelqi.github.io/shop/    chrome

    # 2. Text "The animal friendly clothing company" is displayed on main page
    VerifyText              The animal friendly clothing company
   
    # 3. Add product "Scar the Lion" to shopping cart
    ClickText               Scar the Lion
    ClickText               Add to cart

    # 4. The total price for item is $9.00 before incrementing quantity
    VerifyText              $9.00

    # 5. Select "Large" as size of a t-shirt
    Dropdown                Size    Large

    # 6. Set quantity of products to 2
    ClickItem               Increment quantity

    # 7. The total price for items is $18.00 after incrementing quantity
    VerifyText              $18.00
    
    # 8. Checkout
    ClickText               Checkout

    # 9. Fill in "Full Name", "Email" and "Billing Address"
    TypeText                Full name           Test Robot
    TypeText                Email               testrobot@test.com 
    TypeText                Billing address     Demo street 1
    
    # screenshot here just to show these in logs
    LogScreenshot

    # 10. Change your mind and edit cart, remove product from cart and verify cart is empty
    ClickText               Continue shopping
    VerifyText              Add to cart
    ClickText               shopping_cart
    ClickItem               Remove item
    VerifyText              Your cart is empty

    CloseAllBrowsers
*** Settings ***
Library                     QWeb

*** Test Cases ***
Exercise 04
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

    # 4. (NEW): Get price of the item to variable ${item_price} and log it
    VerifyText              Size
    VerifyText              Color
    ${item_price}=          GetText     //span[@class\="snipcart-cart-summary-fees__amount snipcart-cart-summary-fees__amount--highlight snipcart__font--large"]
    # or easier using one attribute and tag:
    # ${item_price}=        GetText      snipcart-cart-summary-fees__amount  tag=span
    Log                     ${item_price}
    
    # 5. Select "Large" as size of a t-shirt
    Dropdown                Size    Large

    # 6. Set quantity of products to 2
    ClickItem               Increment quantity

    # 7. Checkout
    ClickText               Checkout

    # 8. Fill in "Full Name", "Email" and "Billing Address"
    TypeText                Full name           Test Robot
    TypeText                Email               testrobot@test.com 
    TypeText                Billing address     Demo street 1
    
    # 9. (NEW): Get total price of all items to variable ${total_price} and log it
    ${total_price}=         GetText      snipcart-cart-summary-fees__amount  tag=span
    Log                     ${total_price}

    # screenshot here just to show these in logs
    LogScreenshot

    # 10. Change your mind and edit cart, remove product from cart and verify cart is empty
    ClickText               Continue shopping
    VerifyText              Add to cart
    ClickText               shopping_cart
    ClickItem               Remove item
    VerifyText              Your cart is empty

    CloseAllBrowsers
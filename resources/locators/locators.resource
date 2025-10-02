*** Variables ***

# Common variables
${LOGIN_CONSENT_NO}    //button[@aria-label='Do not consent']

# Frontpage locators
${FRONT_PAGE}       //img[@title='Automation Practice Site']
${SHOP}             //a[normalize-space()='Shop']
${MY_ACCOUNT}       //a[normalize-space()='My Account']
${TEST_CASES}       //a[normalize-space()='Test Cases']
${AT_SITES}         //a[normalize-space()='AT Site']
${DEMO_SITES}       //a[normalize-space()='Demo Site'] 
${SHOPPING_CART}    //a[@title='View your shopping cart'] 
${SEARCH_BAR}       //input[@id='s']

# My account page locators
${LOGIN_USERNAME}    //input[@id='username']
${LOGIN_PASSWORD}    //input[@id='password']
${LOGIN_BUTTON}      //input[@name='login']
${LOGOUT_BUTTON}     //a[normalize-space()='Logout']
${DASHBOARD}         //a[normalize-space()='Dashboard']
${ORDERS}            //a[normalize-space()='Orders']
${DOWNLOADS}         //a[normalize-space()='Downloads']
${ADDRESSES}         //a[normalize-space()='Addresses']
${ACCOUNT_DETAILS}   //a[normalize-space()='Account details']
${LOGIN_ERROR}       //ul[@class='woocommerce-error']
${REGISTER_USERNAME}    //input[@id='reg_email']
${REGISTER_PASSWORD}    //input[@id='reg_password']
${REGISTER_BUTTON}      //input[@name='register']
${EXISTING_REGISTER_ERROR}       //li[contains(text(),'An account is already registered with your email a')]

# Shopping cart locators
${APPLY_COUPON}      //input[@name='apply_coupon']
${UPDATE_BASKET}     //input[@name='update_cart']
${CHECKOUT}          //a[normalize-space()='Proceed to Checkout']

#Billing details locators
${BILLING_FIRST_NAME}    //input[@id='billing_first_name']
${BILLING_LAST_NAME}     //input[@id='billing_last_name']
${BILLING_PHONE}         //input[@id='billing_phone']
${BILLING_COUNTRY}       //*[@id="select2-chosen-1"]
${BILLING_COUNTRY_SEARCH}    //input[@id="s2id_autogen1_search"]
${BILLING_STREET_ADDRESS}        //input[@id='billing_address_1']
${BILLING_CITY}          //input[@id='billing_city']
${BILLING_POST_CODE}     //input[@id='billing_postcode']
${BILLING_PAYMENT_METHOD}    //ul[@class='wc_payment_methods payment_methods methods']
${PLACE_ORDER}           //input[@id='place_order']
${ORDER_RECEIVED}        //p[@class='woocommerce-thankyou-order-received']
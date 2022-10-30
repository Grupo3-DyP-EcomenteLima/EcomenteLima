workspace "Ecomente-Lima" "Workplace for the advancement of DyP TB4" {

    model {
    client = person "Client" "Buys ecological products directly from brands and sellers" "Person"
    seller = person "Seller" "Registers and modifies products in the catalog to expand his brand" "Person"
    email = softwaresystem "Internet E-mail System" "Allows user to see and sends e.mails through the net" "Existing System"
    IBsystem = softwareSystem "Internet banking System" "Allows users to see their monetary accounts and make payments" "Existing System"
    
    mainframe = softwareSystem "EcomenteLima" "Platform for ecological commerce in Lima" {
         mobileApp = container "Mobile App" "Provides complete functionality to users via their mobile device." "Java" "Mobile App"
         userdatabase = container "User database" "Contains information on users" "Relational Database" "Database"
         productdatabase = container "Product database" "Contains information on products" "Relational Database" "Database"
         apiApplication = container "API Application" "System for buying and selling ecological products" "Java and Spring MVC"{
                    systemManager = component "System Manager" "Controls the menus and the creation of user accounts" "Java"
                    userAccount = component "User Account" "Contains user information and interacts with other parts of the system" "Java"
                    catalog = component "Product Catalog Component" "Contains the products registered by seller users and shows them to all users" "Java"
                    shoppingCart = component "Shopping Cart Component" "Contains products from the catalog selected by the user and gives the option to buy them" "Java"
                    receipt = component "Proof of payment Controller" "controls the generation of receipts from purchases and their interactions with the program" "Java"
                    mailcomp = component "E-mail Component" "Has the capability to send e-mails through the internet to users" "Java"
                    
            }
        }
    
    #relaciones de contexto
    client -> mainframe "Registers and modifies his brand's registered products in the catalog"
    seller -> mainframe "Buys through his account's shooping cart ecological products in the app"
    mainframe -> email "Sends e-mail using"
    mainframe -> IBsystem "makes payments using"
    #relaciones de containers
    client -> mobileApp "Uses"
    seller -> mobileApp "Uses"
    mobileApp -> apiApplication "Uses"
    apiApplication -> email "Sends e-mails containing proof of pay trough"
    email -> client "sends e-mails to"
    apiApplication -> IBsystem "Uses for payments"
    apiApplication -> productdatabase "Interacts by reading, editing or deleting information on products"
    apiApplication -> userdatabase "Obtains and edits user information"
    #relaciones de componentes
    mobileApp -> systemManager "Uses"
    systemManager -> userAccount "Grants access"
    systemManager -> catalog "initializes"
    userAccount -> catalog "Visualizes and interacts with"
    userAccount -> shoppingCart "Uses"
    userAccount -> userdatabase "Obtains it's data from"
    shoppingCart -> catalog "Adds to itself product from"
    catalog -> productdatabase "obtains products from"
    shoppingCart -> receipt "Uses when buying"
    shoppingCart -> IBsystem "Solicits temporal acces to the account at"
    IBsystem -> receipt "Sends back the monetary transference info"
    receipt -> userAccount "Sends proof of payment to"
    receipt -> mailcomp "Sends proof of payment to"
    mailcomp -> email "Sends e-mails with receipts towards"
    }
    
    views {
        systemContext mainframe {
            include *
            autolayout lr
        }
        
        container mainframe "Containers" {
            include *
            autoLayout
        }
        
        component apiApplication "Components" {
            include *
            autoLayout
        }
        
        theme default
        
    }
    
   # styles{
       # element "Database"{
       #     shape Cylinder
       # }
        
       # element "Person"{
       #     shape Person
       # }
        
   # }
    
}

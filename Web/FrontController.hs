module Web.FrontController where
import IHP.RouterPrelude
import IHP.ControllerSupport
import Generated.Types
import Web.Types

-- Controller Imports
import Web.Controller.ProjectProducts
import Web.Controller.Products
import Web.Controller.Projects
import IHP.Welcome.Controller

instance FrontController WebApplication where
    controllers = 
        [ startPage WelcomeAction
        -- Generator Marker
        , parseRoute @ProjectProductsController
        , parseRoute @ProductsController
        , parseRoute @ProjectsController
        ]

instance InitControllerContext WebApplication

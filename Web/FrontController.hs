module Web.FrontController where
import IHP.RouterPrelude
import IHP.ControllerSupport
import Generated.Types
import Web.Types

-- Controller Imports
<<<<<<< HEAD
=======
import Web.Controller.ProjectProducts
import Web.Controller.Products
>>>>>>> e85f1aa3eb2488addc3c47d3f51d34cb531020cd
import Web.Controller.Projects
import IHP.Welcome.Controller

instance FrontController WebApplication where
    controllers = 
        [ startPage WelcomeAction
        -- Generator Marker
<<<<<<< HEAD
=======
        , parseRoute @ProjectProductsController
        , parseRoute @ProductsController
>>>>>>> e85f1aa3eb2488addc3c47d3f51d34cb531020cd
        , parseRoute @ProjectsController
        ]

instance InitControllerContext WebApplication

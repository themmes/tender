module Web.Routes where
import IHP.RouterPrelude
import Generated.Types
import Web.Types

-- Generator Marker
instance AutoRoute ProjectsController
type instance ModelControllerMap WebApplication Project = ProjectsController

<<<<<<< HEAD
=======
instance AutoRoute ProductsController
type instance ModelControllerMap WebApplication Product = ProductsController

instance AutoRoute ProjectProductsController
type instance ModelControllerMap WebApplication ProjectProduct = ProjectProductsController

>>>>>>> e85f1aa3eb2488addc3c47d3f51d34cb531020cd

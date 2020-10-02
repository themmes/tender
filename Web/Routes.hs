module Web.Routes where
import IHP.RouterPrelude
import Generated.Types
import Web.Types

-- Generator Marker
instance AutoRoute ProjectsController
type instance ModelControllerMap WebApplication Project = ProjectsController

instance AutoRoute ProductsController
type instance ModelControllerMap WebApplication Product = ProductsController

instance AutoRoute ProjectProductsController
type instance ModelControllerMap WebApplication ProjectProduct = ProjectProductsController

module Web.Controller.ProjectProducts where

import Web.Controller.Prelude
import Web.View.ProjectProducts.Index
import Web.View.ProjectProducts.New
import Web.View.ProjectProducts.Edit
import Web.View.ProjectProducts.Show
import Web.View.ProjectProducts.Index
import Web.View.ProjectProducts.New
import Web.View.ProjectProducts.Show
import Web.View.ProjectProducts.Edit

instance Controller ProjectProductsController where
    action ProjectProductsAction = do
        projectProducts <- query @ProjectProduct |> fetch
        render IndexView { .. }

    action NewProjectProductAction = do
        let projectProduct = newRecord
        products <- query @Product |> fetch
        render NewView { .. }

    action ShowProjectProductAction { projectProductId } = do
        projectProduct <- fetch projectProductId
        render ShowView { .. }

    action EditProjectProductAction { projectProductId } = do
        projectProduct <- fetch projectProductId
        products <- query @Product |> fetch
        render EditView { .. }

    action UpdateProjectProductAction { projectProductId } = do
        projectProduct <- fetch projectProductId
        projectProduct
            |> buildProjectProduct
            |> ifValid \case
                Left projectProduct -> render EditView { .. }
                Right projectProduct -> do
                    projectProduct <- projectProduct |> updateRecord
                    setSuccessMessage "ProjectProduct updated"
                    redirectTo EditProjectProductAction { .. }

    action CreateProjectProductAction = do
        let projectProduct = newRecord @ProjectProduct
        projectProduct
            |> buildProjectProduct
            |> ifValid \case
                Left projectProduct -> do
                    products <- query @Product |> fetch
                    render NewView { .. }
                Right projectProduct -> do
                    projectProduct <- projectProduct |> createRecord
                    setSuccessMessage "ProjectProduct created"
                    redirectTo ProjectProductsAction

    action DeleteProjectProductAction { projectProductId } = do
        projectProduct <- fetch projectProductId
        deleteRecord projectProduct
        setSuccessMessage "ProjectProduct deleted"
        redirectTo ProjectProductsAction

buildProjectProduct projectProduct = projectProduct
    |> fill @["projectId","productId","quantity"]

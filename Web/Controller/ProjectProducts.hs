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

    action NewProjectProductAction { projectId } = do
        project <- fetch projectId
        let projectProduct = newRecord
              |> set #projectId projectId
        products <- query @Product |> fetch
        render NewView { .. }

    action ShowProjectProductAction { projectProductId } = do
        projectProduct <- fetch projectProductId
        render ShowView { .. }

    action EditProjectProductAction { projectProductId } = do
        projectProduct <- fetch projectProductId
        project <- fetch (get #projectId projectProduct)
        products <- query @Product |> fetch
        render EditView { .. }

    action UpdateProjectProductAction { projectProductId } = do
        projectProduct <- fetch projectProductId
        projectProduct
            |> buildProjectProduct
            |> ifValid \case
                Left projectProduct -> do
                  project <- fetch (get #projectId projectProduct)
                  products <- query @Product |> fetch
                  render EditView { .. }
                Right projectProduct -> do
                    projectProduct <- projectProduct |> updateRecord
                    setSuccessMessage "ProjectProduct updated"
                    let projectId = get #projectId projectProduct
                    redirectTo ShowProjectAction { .. }

    action CreateProjectProductAction = do
        let projectProduct = newRecord @ProjectProduct
        projectProduct
            |> buildProjectProduct
            |> fill @'["projectId"]
            |> ifValid \case
                Left projectProduct -> do
                    project <- fetch (get #projectId projectProduct)
                    products <- query @Product |> fetch
                    render NewView { .. }
                Right projectProduct -> do
                    projectProduct <- projectProduct |> createRecord
                    setSuccessMessage "ProjectProduct created"
                    let projectId = get #projectId projectProduct
                    redirectTo ShowProjectAction { .. }

    action DeleteProjectProductAction { projectProductId } = do
        projectProduct <- fetch projectProductId
        deleteRecord projectProduct
        setSuccessMessage "ProjectProduct deleted"
        let projectId = get #projectId projectProduct
        redirectTo ShowProjectAction { .. }

buildProjectProduct projectProduct = projectProduct
    |> fill @["projectId","productId","quantity"]
    |> validateField #productId productIsSelected

productIsSelected productId | productId == def = Failure "Please pick a product"
productIsSelected _ = Success

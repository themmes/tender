module Web.Controller.Products where

import Web.Controller.Prelude
import Web.View.Products.Index
import Web.View.Products.New
import Web.View.Products.Edit
import Web.View.Products.Show
import Web.View.Products.Index
import Web.View.Products.New
import Web.View.Products.Show
import Web.View.Products.Edit

instance Controller ProductsController where
    action ProductsAction = do
        products <- query @Product |> fetch
        render IndexView { .. }

    action NewProductAction = do
        let product = newRecord
        render NewView { .. }

    action ShowProductAction { productId } = do
        product <- fetch productId
        render ShowView { .. }

    action EditProductAction { productId } = do
        product <- fetch productId
        render EditView { .. }

    action UpdateProductAction { productId } = do
        product <- fetch productId
        product
            |> buildProduct
            |> ifValid \case
                Left product -> render EditView { .. }
                Right product -> do
                    product <- product |> updateRecord
                    setSuccessMessage "Product updated"
                    redirectTo EditProductAction { .. }

    action CreateProductAction = do
        let product = newRecord @Product
        product
            |> buildProduct
            |> ifValid \case
                Left product -> render NewView { .. }
                Right product -> do
                    product <- product |> createRecord
                    setSuccessMessage "Product created"
                    redirectTo ProductsAction

    action DeleteProductAction { productId } = do
        product <- fetch productId
        deleteRecord product
        setSuccessMessage "Product deleted"
        redirectTo ProductsAction

buildProduct product = product
    |> fill @["title","price", "category"]

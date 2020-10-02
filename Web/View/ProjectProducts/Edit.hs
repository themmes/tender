module Web.View.ProjectProducts.Edit where
import Web.View.Prelude

data EditView = EditView { projectProduct :: ProjectProduct, products :: [Product] }

instance View EditView ViewContext where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ProjectProductsAction}>Added products</a></li>
                <li class="breadcrumb-item active">Edit added product</li>
            </ol>
        </nav>
        <h1>Edit added product</h1>
        {renderForm projectProduct}
    |]



renderForm :: ProjectProduct -> Html
renderForm projectProduct = formFor projectProduct [hsx|
    {hiddenField #projectId}
    {selectField #productId products}
    {textField #quantity}
    {submitButton}
|]

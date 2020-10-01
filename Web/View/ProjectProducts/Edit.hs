module Web.View.ProjectProducts.Edit where
import Web.View.Prelude

data EditView = EditView { projectProduct :: ProjectProduct }

instance View EditView ViewContext where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ProjectProductsAction}>ProjectProducts</a></li>
                <li class="breadcrumb-item active">Edit ProjectProduct</li>
            </ol>
        </nav>
        <h1>Edit ProjectProduct</h1>
        {renderForm projectProduct}
    |]

renderForm :: ProjectProduct -> Html
renderForm projectProduct = formFor projectProduct [hsx|
    {textField #project_id}
    {textField #product_id}
    {textField #quantity}
    {submitButton}
|]

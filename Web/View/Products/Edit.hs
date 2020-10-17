module Web.View.Products.Edit where
import Web.View.Prelude

data EditView = EditView { product :: Product }

instance View EditView ViewContext where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ProductsAction}>Products</a></li>
                <li class="breadcrumb-item active">Edit Product</li>
            </ol>
        </nav>
        <h1>Edit Product</h1>
        {renderForm product}
    |]

renderForm :: Product -> Html
renderForm product = formFor product [hsx|
    {textField #title}
    {textField #category}
    {textField #price}
    {submitButton}
|]

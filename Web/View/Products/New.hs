module Web.View.Products.New where
import Web.View.Prelude

data NewView = NewView { product :: Product }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ProductsAction}>Products</a></li>
                <li class="breadcrumb-item active">New Product</li>
            </ol>
        </nav>
        <h1>New Product</h1>
        {renderForm product}
    |]

renderForm :: Product -> Html
renderForm product = formFor product [hsx|
    {textField #title}
    {textField #price}
    {submitButton}
|]

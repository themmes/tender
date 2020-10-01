module Web.View.ProjectProducts.New where
import Web.View.Prelude

data NewView = NewView { projectProduct :: ProjectProduct }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ProjectProductsAction}>ProjectProducts</a></li>
                <li class="breadcrumb-item active">New ProjectProduct</li>
            </ol>
        </nav>
        <h1>New ProjectProduct</h1>
        {renderForm projectProduct}
    |]

renderForm :: ProjectProduct -> Html
renderForm projectProduct = formFor projectProduct [hsx|
    {textField #project_id}
    {textField #product_id}
    {textField #quantity}
    {submitButton}
|]

module Web.View.ProjectProducts.New where
import Web.View.Prelude

data NewView = NewView {
  projectProduct :: ProjectProduct
  , project :: Project
  , products :: [Product]
  }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ProjectProductsAction}>Added products</a></li>
                <li class="breadcrumb-item active">Add new product</li>
            </ol>
        </nav>
        <h1>Add new product</h1>
        {renderForm projectProduct}
    |]
      where
        renderForm :: ProjectProduct -> Html
        renderForm projectProduct = formFor projectProduct [hsx|
            {hiddenField #projectId}
            {selectField #productId products}
            {textField #quantity}
            {submitButton}
            |]

instance CanSelect Product where
  type SelectValue Product = Id Product
  selectValue = get #id
  selectLabel product = get #title product

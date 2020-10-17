module Web.View.Products.Show where
import Web.View.Prelude

data ShowView = ShowView { product :: Product }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ProductsAction}>Products</a></li>
                <li class="breadcrumb-item active">{get #title product}</li>
            </ol>
        </nav>
        <h1>{get #title product}</h1>
        <p>Category: {get #category product}</p>
        <p>Price: {get #price product}</p>
    |]

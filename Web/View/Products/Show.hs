module Web.View.Products.Show where
import Web.View.Prelude

data ShowView = ShowView { product :: Product }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ProductsAction}>Products</a></li>
                <li class="breadcrumb-item active">Show Product</li>
            </ol>
        </nav>
        <h1>Show Product</h1>
    |]

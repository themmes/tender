module Web.View.ProjectProducts.Show where
import Web.View.Prelude

data ShowView = ShowView { projectProduct :: ProjectProduct }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ProjectProductsAction}>ProjectProducts</a></li>
                <li class="breadcrumb-item active">Show ProjectProduct</li>
            </ol>
        </nav>
        <h1>Show ProjectProduct</h1>
    |]

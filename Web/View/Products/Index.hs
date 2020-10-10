module Web.View.Products.Index where
import Web.View.Prelude

data IndexView = IndexView { products :: [Product] }

instance View IndexView ViewContext where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={ProductsAction}>Products</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewProductAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach products renderProduct}</tbody>
            </table>
        </div>
    |]


renderProduct product = [hsx|
    <tr>
        <td>{get #title product}</td>
        <td><a href={ShowProductAction (get #id product)}>Show</a></td>
        <td><a href={EditProductAction (get #id product)} class="text-muted">Edit</a></td>
        <td><a href={DeleteProductAction (get #id product)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]

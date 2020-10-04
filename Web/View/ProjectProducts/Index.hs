module Web.View.ProjectProducts.Index where
import Web.View.Prelude

data IndexView = IndexView { projectProducts :: [ProjectProduct] }

instance View IndexView ViewContext where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={ProjectProductsAction}>ProjectProducts</a></li>
            </ol>
        </nav>
        <h1>Index</h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>ProjectProduct</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach projectProducts renderProjectProduct}</tbody>
            </table>
        </div>
    |]


renderProjectProduct projectProduct = [hsx|
    <tr>
        <td>{projectProduct}</td>
        <td><a href={ShowProjectProductAction (get #id projectProduct)}>Show</a></td>
        <td><a href={EditProjectProductAction (get #id projectProduct)} class="text-muted">Edit</a></td>
        <td><a href={DeleteProjectProductAction (get #id projectProduct)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]

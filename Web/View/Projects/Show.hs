module Web.View.Projects.Show where
import Web.View.Prelude

data ShowView = ShowView
  { project :: Project
  , projectProducts :: [Include "productId" ProjectProduct]
  }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ProjectsAction}>Projects</a></li>
                <li class="breadcrumb-item active">Show Project</li>
            </ol>
        </nav>
        <h1>{get #title project}</h1>
                  <table class="table">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total Price</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach projectProducts renderProjectProduct}</tbody>
            </table>
        <a class="btn btn-primary" href={NewProjectProductAction (get #id project)}>Add Product</a>
    |]
      where
        renderProjectProduct :: Include "productId" ProjectProduct -> Html
        renderProjectProduct projectProduct = [hsx|
            <tr>
            <td><a href={ShowProductAction (get #productId projectProduct |> get #id)}>{get #productId projectProduct |> get #title}</a></td>
            <td>{ quantity }</td>
            <td>{ price }</td>
            <td>{ totalPrice }</td>
            <td><a href={EditProjectProductAction (get #id projectProduct)} class="text-muted">Edit</a></td>
            <td><a href={DeleteProjectProductAction (get #id projectProduct)} class="js-delete text-muted">Delete</a></td>
            </tr>
            |]
          where
            quantity = get #quantity projectProduct
            price = get #productId projectProduct |> get #price
            totalPrice :: Double = fromIntegral quantity * price

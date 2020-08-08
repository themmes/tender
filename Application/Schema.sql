CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE TABLE projects (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    title TEXT NOT NULL
);
CREATE TABLE products (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    title TEXT NOT NULL,
    price REAL NOT NULL
);
CREATE TABLE project_products (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    project_id UUID NOT NULL,
    product_id UUID NOT NULL,
    quantity INT NOT NULL
);
ALTER TABLE project_products ADD CONSTRAINT project_products_ref_project_id FOREIGN KEY (project_id) REFERENCES projects (id) ON DELETE NO ACTION;
ALTER TABLE project_products ADD CONSTRAINT project_products_ref_product_id FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE NO ACTION;

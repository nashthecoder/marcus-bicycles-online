# Marcus Bicycles Online

## [App Link](https://marcus-bikes-online.onrender.com/)

Welcome to Marcus Bicycles Online! This application is designed to provide a seamless online shopping experience for bicycle enthusiasts.

## Features

- **Product Catalog**: Browse through a wide range of bicycles and accessories. - *DONE*
- **Product Details**: View detailed information about each product, including specifications and pricing. - *DONE*
- **Admin Account**: Create and manage products, offers and restrict customizations. - *PARTLY DONE*
- **Shopping Cart**: Add items to your cart and manage your selections.
- **Checkout**: Securely complete your purchase with our streamlined checkout process.
- **Payment**: Securely complete your purchase with our streamlined checkout process. - *Basic UI only*
- **User Accounts**: Create and manage your user profile for a personalized shopping experience. - *Basic UI only*

## Data Model

Used PostgreSQL.

### Data Tables

**Users**  

- `id` (Primary Key)  
- `name` (String)  
- `email` (String, Unique)  
- `password_digest` (String)  

**Products**  

- `id` (Primary Key)  
- `name` (String)  
- `description` (Text)  
- `base_price` (Decimal)  

**Variants** (For product variations like different rim colors)  

- `id` (Primary Key)  
- `product_id` (Foreign Key → Products)  
- `name` (String)  
- `additional_price` (Decimal)  

**Carts**  

- `id` (Primary Key)  
- `user_id` (Foreign Key → Users)  
- `status` (Enum: active, completed)  

**Cart_Items**  

- `id` (Primary Key)  
- `cart_id` (Foreign Key → Carts)  
- `product_id` (Foreign Key → Products)  
- `variant_id` (Foreign Key → Variants, Nullable)  
- `quantity` (Integer)  

**Orders**  

- `id` (Primary Key)  
- `user_id` (Foreign Key → Users)  
- `status` (Enum: pending, shipped, completed)  
- `total_price` (Decimal)  

---

## [Main User Actions](https://marcus-bikes-online.onrender.com/)

### Test User:

  email: 'marcus@example.com',
  password: 'password123',

1. Browse Products: Users can browse through a list of products.
2. View Product Details: Users can view detailed information about a product, including available variants.
3. Add to Cart: Users can add products (with selected variants) to their cart.
4. View Cart: Users can view the contents of their cart.
5. Checkout: Users can proceed to checkout and place an order.
6. Manage Orders: Users can view their order history and track the status of their orders.

## Product Page

- **UI Presentation**: Display product details including name, description, base price, and available variants.
- **Available Options** Calculation: Fetch product variants from the database and display them as selectable options.
- **Price Calculation**: Calculate the total price based on the base price of the product and the additional price of the selected variant.

## Add to Cart Action

- **Button Click**: When the "add to cart" button is clicked, the selected product and variant are added to the user's cart.
- **Database Persistence**: Create a new CartItem record with the cart_id, product_id, variant_id, and quantity.

## [Administrative Workflows](https://marcus-bikes-online.onrender.com/avo/resources/products/new)

- **New Product Creation**: Marcus can create a new product by providing the name, description, and base price. This creates a new Product record in the database.
- **Adding a New Part Choice**: Marcus can introduce a new variant (e.g., rim color) by creating a new Variant record associated with the product.
- **Setting Prices**: Marcus can change the price of a specific part or specify pricing for combinations of choices by updating the base_price of the product or the additional_price of the variant.
New Product Creation
- **Required Information**: Name, description, base price.
- **Database Changes**: Insert a new record into the Products table.

## Adding a New Part Choice

- **UI**: Provide a form to enter the name and additional price of the new variant.
- **Database Changes**: Insert a new record into the Variants table with the product_id of the associated product.

## Setting Prices

- **UI**: Provide forms to update the base price of a product and the additional price of variants.
- **Database Handling**: Update the base_price in the Products table and the additional_price in the Variants table.

## Product Page
---

### UI Presentation

- A clean product page with:  
  - Product images  
  - Name and description  
  - Base price and additional price for each variation  
  - A dropdown or selection grid for available options  
  - "Add to Cart" button  

### Availability Calculation

- The system queries available variants from the `Variants` table.  
- If a variant is out of stock (if stock tracking is implemented), it is disabled on the UI.  

### Price Calculation  

- `Final Price = base_price + additional_price (if variant selected)`  

---
## Add to Cart Action 

### Process Flow

1. User selects a product and variant.  
2. Clicks "Add to Cart."  
3. A new row is added to `Cart_Items`, associating the cart with the selected product and variant.  
4. UI updates to show items in the cart.  

### Database Changes

- Inserts a new row into `Cart_Items` with:  
  - `cart_id` (current user's active cart)  
  - `product_id`  
  - `variant_id` (if applicable)  
  - `quantity`  

---

## Administrative Workflows  

### 1. New Product Creation  

- Marcus needs to provide:  
  - Product name, description, and base price.  
  - At least one image.  
- **Database Changes:**  
  - New row in `Products` table.  

### 2. Adding a New Part Choice (e.g., New Rim Color) 

- **UI**: Marcus selects an existing product and adds a new variant via the admin panel.

- **Database Changes:**  
  - New row in `Variants` table linked to the product.  

### 3. Setting Prices  

- Marcus can update:  
  - Base product price in `Products` table.  
  - Variant-specific pricing in `Variants` table.  

- **UI & Database Handling:**  

  - Admin UI allows Marcus to input a base price and additional prices for each variant.  
  - Changes update the respective tables.  

## Installation

To get started with the application, follow these steps:

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/marcus-bicycles-online.git
    ```

2. Navigate to the project directory:

    ```bash
    cd marcus-bicycles-online
    ```

3. Install dependencies:

    ```bash
    bundle install
    ```

4. Start the development server:

    ```bash
    rails s
    ```

## Technologies Used

- **Frontend**: Ruby on Rails
- **Database**: Postgres
- **Styling**: TailwindCss
- **Admin**: AVO Admin Community
- **Deployment**: Render

## Contributing

We welcome contributions from the community. To contribute, please fork the repository and create a pull request with your changes.

## License

This project is licensed under the MIT License.

## Contact

For any questions or feedback, please contact us at support@marcus.com

Design your ride, define your style, Happy Cycling!
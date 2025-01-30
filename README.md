# Marcus Bicycles Online

## [App Link](https://marcus-bikes-online.onrender.com/)

Welcome to Marcus Bicycles Online! This application is designed to provide a seamless online shopping experience for bicycle enthusiasts.

## Features

- **Product Catalog**: Browse through a wide range of bicycles and accessories. - *DONE*
- **Product Details**: View detailed information about each product, including specifications and pricing. - DONE
- **Admin Account**: Create and manage products, offers and restrict customizations. - DONE
- **Shopping Cart**: Add items to your cart and manage your selections.
- **Checkout**: Securely complete your purchase with our streamlined checkout process.
- **User Accounts**: Create and manage your user profile for a personalized shopping experience.

## Data Model

The best data model for this application depends on its complexity and scalability needs. A relational database like PostgreSQL would work well for structured relationships, while a NoSQL database like MongoDB could offer flexibility for product variations. Below is a relational model:

### Tables

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

## Main User Actions  

### 1. Browsing and Viewing Products  

- Users can view a list of available products.  
- Clicking on a product displays its details, including available variations, pricing, and images.  

### 2. Selecting Product Options & Adding to Cart 

- Customers choose a product and select available customization options (e.g., rim color).  
- Clicking “Add to Cart” saves the product and selected options in their cart.  

### 3. Checkout & Payment  

- Users proceed to checkout, where they can review their cart, enter shipping details, and complete payment.  

### 4. Order Management

- Users can track their order status (e.g., pending, shipped, completed).  
- Admin (Marcus) can update order status via the admin panel.  

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

- UI: Marcus selects an existing product and adds a new variant via the admin panel.  
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

- [x] This is a checked item
- [x] **Product Catalog**: Browse through a wide range of bicycles and accessories.

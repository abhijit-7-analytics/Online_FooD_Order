# 🍔 Online Food Ordering System

A web-based **Online Food Ordering System** that allows users to browse food items, place orders, and manage their purchases through an easy-to-use interface.
The system also includes an **Admin Panel** to manage food items, orders, and users.

This project was built using **ASP.NET Web Forms with SQL Server** and demonstrates full-stack web development including frontend UI, backend logic, and database integration.

---

## 🚀 Features

### User Side

* User registration and login
* Browse food items and categories
* Add food items to cart
* Place food orders
* View order history
* Secure logout

### Admin Side

* Admin login panel
* Add / update / delete food items
* Manage categories
* View and manage customer orders
* Manage users

---

## 🛠️ Technologies Used

* **Frontend**

  * HTML
  * CSS
  * JavaScript

* **Backend**

  * ASP.NET Web Forms
  * C#

* **Database**

  * SQL Server

* **Tools**

  * Visual Studio
  * SQL Server Management Studio (SSMS)

---

## 🗂️ Project Structure

```
Online-Food-Ordering-System
│
├── Admin
│   ├── Dashboard.aspx
│   ├── ManageFood.aspx
│   └── ManageOrders.aspx
│
├── User
│   ├── Home.aspx
│   ├── Menu.aspx
│   ├── Cart.aspx
│   └── Order.aspx
│
├── Database
│   └── food_order.sql
│
├── CSS
├── JS
└── README.md
```

---

## ⚙️ Installation & Setup

1. Clone the repository

```
git clone https://github.com/yourusername/online-food-ordering-system.git
```

2. Open the project in **Visual Studio**

3. Import the database into **SQL Server**

4. Update the **connection string** in `web.config`

```
<connectionStrings>
  <add name="dbcon"
       connectionString="Data Source=SERVER_NAME;Initial Catalog=FoodDB;Integrated Security=True"/>
</connectionStrings>
```

5. Run the project using **IIS Express**

---

## 📊 Database Tables (Example)

* Users
* Admin
* Food_Items
* Categories
* Orders
* Order_Details

---

## 🎯 Project Objective

The goal of this project is to build a **complete food ordering platform** that simulates real-world restaurant ordering systems.
It demonstrates skills in **web development, database design, and user interface development**.

---

## 📌 Future Improvements

* Online payment integration
* Real-time order tracking
* Mobile responsive design
* Food delivery status updates

---

## 👨‍💻 Author

**Abhijit Sahoo**
BSc Computer Science – Utkal University
Kendrapara, Odisha

GitHub: https://github.com/abhijit-7-analytics

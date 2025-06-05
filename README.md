# 🧾 Amenitiz Cash Register

## Prerequisites

[![Ruby Style Guide](https://img.shields.io/badge/Ruby-3.4.3-red)](https://www.ruby-lang.org/en/news/2025/04/14/ruby-3-4-3-released/)
[![Ruby Style Guide](https://img.shields.io/badge/Rails-8.0.2-brightgreen)](https://rubygems.org/gems/rails/versions/8.0.2)

A minimalist yet functional cash register prototype built with **Ruby on Rails**, **React**, **Bootstrap**, and **Vite**.

This challenge demonstrates clean code, scalable architecture, grouped cart logic, and dynamic pricing strategies.

---

## ✨ Features

- 🛒 Add products to a cart (with grouped display and counts)
- 🔁 Remove individual items from the cart
- 💸 Dynamic pricing rules applied at checkout
- 📦 Built with Rails 7 API + React (via Vite)
- 🎨 Clean UI using Bootstrap 5
- ✅ CSRF-protected requests between Rails and React

---

## 💡 Pricing Rules

| Product       | Code | Price | Special Rule |
|---------------|------|-------|---------------|
| Green Tea     | GR1  | €3.11 | **Buy-One-Get-One-Free** |
| Strawberries  | SR1  | €5.00 | **Buy 3+, drops to €4.50 each** |
| Coffee        | CF1  | €11.23| **Buy 3+, price drops to €7.49 each** |

---

## 📦 Tech Stack

- **Backend**: Ruby on Rails 8
- **Frontend**: React (via Vite)
- **Styling**: Bootstrap 5
- **Database**: PostgreSQL (default)
- **Testing**: RSpec (backend unit tests)

---

## 🚀 Getting Started

### 1. Clone the Repo

```bash
git clone https://github.com/crisnahine/amenitiz_cash_register.git
cd amenitiz_cash_register
````

### 2. Install Dependencies

```bash
bundle install
npm install
```

### 3. Setup Database

```bash
rails db:create db:migrate db:seed
```

> This seeds the initial product list.

### 4. Start the App

```bash
bin/vite dev        # Runs Vite frontend dev server
bin/rails server    # Runs Rails backend server
```

Then visit: [http://localhost:3000](http://localhost:3000)

---

## 🧪 Example Products

| Code | Name         | Price  |
| ---- | ------------ | ------ |
| GR1  | Green Tea    | €3.11  |
| SR1  | Strawberries | €5.00  |
| CF1  | Coffee       | €11.23 |

---

## 🧠 Design Decisions

* **Vite** is used instead of Webpacker for a modern JS toolchain.
* CSRF protection is **enabled** via meta tag + `fetch` header.
* Product pricing logic is encapsulated in the `Cart` model.
* Cart items are **grouped by product code** in the UI for clarity.
* UI/UX uses Bootstrap’s utility classes for quick and clean styling.

---

## 📁 Key File Structure

```
app/
├── controllers/api/carts_controller.rb   # Checkout endpoint
├── models/cart.rb                        # Pricing rules logic
├── models/cart_item.rb
├── frontend/
│   ├── entrypoints/application.jsx       # Main React app
│   └── stylesheets/bootstrap.css         # Bootstrap via npm
├── views/pages/index.html.erb           # Mounts React via Vite
```

---

## ✅ Test

```bash
bundle exec rspec
```

Tests cover pricing logic and special rules inside `Cart` model.

---

## 🧑‍💻 Author Notes

This project was built as part of the **Amenitiz Senior Backend Engineer (Ruby)** technical evaluation.

* Designed with extensibility and flexibility in mind.
* Simple UI, clean state handling, and proper API boundaries.
* Easily extendable to support discounts, promo codes, or auth.

---
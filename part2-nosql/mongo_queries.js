// OP1:
db.products.insertMany([
  {
    _id: "E101",
    name: "Smartphone X",
    category: "Electronics",
    price: 30000,
    brand: "Samsung",
    specs: { warranty_years: 2, voltage: "220V" }
  },
  {
    _id: "C201",
    name: "Men's Jacket",
    category: "Clothing",
    price: 2500,
    brand: "Zara"
  },
  {
    _id: "G301",
    name: "Organic Milk",
    category: "Groceries",
    price: 60,
    expiry_date: new Date("2024-12-01")
  }
]);

// OP2:
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3:
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});

// OP4:
db.products.updateOne(
  { _id: "E101" },
  { $set: { discount_percent: 10 } }
);

// OP5:
db.products.createIndex({ category: 1 });

// This improves query performance when filtering by category

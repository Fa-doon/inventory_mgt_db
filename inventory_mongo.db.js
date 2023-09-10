//  to create collections

db.createCollection("user");
db.createCollection("category");
db.createCollection("supplier");
db.createCollection("product");
db.createCollection("admin");
db.createCollection("customer");
db.createCollection("inventory_item");
db.createCollection("orders");
db.createCollection("order_item");

// insert records into collections
// insert into user
db.user.insertMany([
  {
    _id: 1,
    name: "Jane Doe",
    email: "janedoe@example.com",
    password: "jadoe321",
    contact: "+256780273662",
    user_type: "customer",
  },
  {
    _id: 2,
    name: "Rob Smith",
    email: "jrobsmith@example.com",
    password: "rob12bie",
    contact: "+24376376632",
    user_type: "admin",
  },
]);

// insert into category
db.category.insertMany([
  {
    _id: 1,
    name: "electronics",
  },
  {
    _id: 2,
    name: "skincare",
  },
]);

// insert into supplier
db.supplier.insertMany([
  {
    _id: 1,
    name: "The ordinary",
    email: "deceim@example.com",
    address: "Texas",
    phone_number: "+24673552638",
  },
  {
    _id: 2,
    name: "DEO ltd",
    email: "deo@example.com",
    address: "Uganda",
    phone_number: "+226536813637",
  },
]);

//insert into product
db.product.insertOne({
  _id: 1,
  name: "lactic acid",
  price: 10.5,
  size: "m",
  description: "for texture",
  category_id: 2,
  supplier_id: 1,
});

// getting records
db.user.find();
db.supplier.find();
db.user.find({ _id: 2 });

// updating records
db.product.updateOne({ _id: 1 }, { $set: { name: "mandelic acid" } });
db.user.updateOne({ _id: 1 }, { $set: { name: "Janis Doe" } });

// deleting records
db.product.deleteOne({ _id: 1 });

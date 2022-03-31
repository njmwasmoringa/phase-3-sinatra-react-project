puts "🌱 Seeding spices..."

# Seed your database here
Product.create(name:"Milk", description:"", image_url:"", code:"2098230948023", stock:100, ratail_price:55.0, wholesale_price:50.0, purchase_price:40.0)
Product.create(name:"Bread", description:"", image_url:"", code:"97984569896787", stock:100, ratail_price:50.0, wholesale_price:45.0, purchase_price:30.0)
Product.create(name:"Soap", description:"", image_url:"", code:"8798234092392093", stock:100, ratail_price:120.0, wholesale_price:110.0, purchase_price:90.0)
Product.create(name:"Tissue Paper", description:"", image_url:"", code:"948792399458374", stock:100, ratail_price:85.50, wholesale_price:80.0, purchase_price:50.0)
Product.create(name:"1kg Rice", description:"", image_url:"", code:"898756645343", stock:100, ratail_price:115.50, wholesale_price:100.0, purchase_price:70.0)
Product.create(name:"2kg Sugar", description:"", image_url:"", code:"65784596782482", stock:100, ratail_price:125.85, wholesale_price:120.0, purchase_price:80.0)

puts "✅ Done seeding!"

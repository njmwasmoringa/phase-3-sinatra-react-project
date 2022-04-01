class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "The AIPoS Api" }.to_json
  end

  post "/auth" do
    user = User.find_by(:email => params[:username])
    if user && user.authenticate(params[:password])
      {
        id: user.id,
        name: user.name,
        email: user.email,
        phone: user.phone,
        role: user.role
      }.to_json
    elsif
      status 401
      { error: "Unauthorized" }.to_json
    end
  end

  #start product endpoints
  get "/products" do
    Product.all.to_json
  end

  get "/product/:id" do
    Product.find(params["id"].to_i).to_json;
  end

  post "/product" do 
    product = Product.create(
      name: params[:name],
      description: params[:description],
      image_url: params[:image_url],
      code: params[:code],
      ratail_price: params[:ratail_price],
      wholesale_price: params[:wholesale_price],
      purchase_price: params[:purchase_price],
      stock: params[:stock],
    );
    product.to_json
  end

  patch "/product/:id" do
    product = Product.find(params[:id])
    product.update(
      name: params[:name],
      description: params[:description],
      image_url: params[:image_url],
      code: params[:code],
      ratail_price: params[:ratail_price],
      wholesale_price: params[:wholesale_price],
      purchase_price: params[:purchase_price],
      stock: params[:stock],
    )
    product.to_json
  end
  #end product endpoints

  #start order endpoints
  get "/orders" do
    Order.all.to_json
    orders = []
    Order.all.map do |o|
      order = o.as_json
      order["customer"] = o.customer
      order["order_products"] = o.order_products.map do |p|
        order_product = p.as_json
        order_product["product"] = p.product
        order_product
      end
      orders << order
    end
    orders.to_json
  end

  get "/order/:id" do
    order = Order.find(params[:id])
    order.json
  end

  post "/order" do
    puts params
    customer_params = params[:customer]
    customer = customer_params[:phone] != "" ? Customer.find_by(:phone => customer_params[:phone]) : nil

    unless customer
      customer = Customer.create({
        name: customer_params[:name],
        phone: customer_params[:phone],
        email:""
      })
    end

    order = Order.create({
      customer_id: customer.id,
      order_number: params[:orderNumber],
      total_cost: params[:total]
    })

    params[:products].each do |p| 
      OrderProduct.create({ product_id:p[:id], order_id:order.id, quantity:p[:qty] })
    end
    order.to_json
  end

  patch "/order" do
    order = Order.find(params[:id])
    data = {}
    params.keys.each do |key|
      data[key.to_s] = params[key]
    end
    order.update(data)
    order.to_json
  end

  patch "/order/checkout" do
    order = Order.find(params[:id])
    order.update({status:"checked_out"})
    order.order_products.map do |order_product|
      product = order_product.product
      product.update({
        stock: product.stock - order_product.quantity
      })
    end
    order.to_json
  end
  #end order endpoints

end

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "The AIPoS Api" }.to_json
  end

  #start products endpoints
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
  #end products endpoints

  get "/users" do
    User.all.to_json
  end

end

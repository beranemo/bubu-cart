namespace :dev do
  task fake_products: :environment do
    Product.delete_all
    Product.create(
      title: 'Programming Ruby 1.9',
      description: %{Ruby is the fastest growing and most exciting dynamic.},
      quantity: 5,
      price: 200)
    Product.create(
      title: 'java',
      description: %{java is good},
      quantity: 7,
      price: 900)
    Product.create(
      title: 'design pattern of as3',
      description: %{ design pattern is good },
      quantity: 3,
      price: 200)
    Product.create(
      title: 'Python',
      description: %{ hello python },
      quantity: 6,
      price: 1200)
    puts "Product #{Product.count} data created"
  end
end
namespace :dev do
  def rand_in_range(from, to)
    rand * (to - from) + from
  end
  
  def rand_time(from, to=Time.now)
    Time.at(rand_in_range(from.to_f, to.to_f))
  end
  
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
    
    50.times do
      Product.create(
      title: 'Python',
      description: %{ hello python },
      quantity: 6,
      price: 1200,
      created_at: FFaker::Time
      ) 
    end
    
    
    products = Product.all
    
    products.each do |g|
      dat = rand_time(107.days.ago).to_s
      first = dat[0..10]
      middle = 10 + rand(11)
      last = dat[13..-1]
      rand_date = first + middle.to_s + last
      
      g.created_at = rand_date
      g.save
    end
    
    puts "Product #{Product.count} data created"
  end
end
namespace :dev do
  task :fake_products => :environment do
    Product.delete_all
    100.times do
      p = Product.create!( :name => Faker::Lorem.word, :description => Faker::Lorem.paragraph, :price => (rand(100) + 1) * 100 )
      puts "Create product #{p.id}"
    end
  end
end

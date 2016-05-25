class Seed

  def self.start
    seed = Seed.new
    seed.generate_categories
    seed.generate_items
  end

  def generate_categories
    [
      Category.create!(name: 'Appetizers'),
      Category.create!(name: 'Tacos'),
      Category.create!(name: 'Ceviches'),
      Category.create!(name: 'Fish'),
      Category.create!(name: 'Shrimp'),
      Category.create!(name: 'Pasta'),
      Category.create!(name: 'Chicken and Beef'),
      Category.create!(name: 'Specialties'),
      Category.create!(name: 'Lobster'),
      Category.create!(name: 'Dessert') ]
    puts "#{Category.all.count} categories created"
  end

  def generate_items
    45.times do |i|
      item = Item.create!(name: Faker::Beer.name,
                          description: Faker::Hipster.sentence(5, true, 8),
                          price: Faker::Number.decimal(2))
      category = Category.limit(1).order("RANDOM()").first.items

      category << item
      puts "#{item.name} created for #{item.category.name} category"
    end
  end

end

Seed.start

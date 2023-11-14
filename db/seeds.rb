# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create Users

user1 = User.create(name: "John Doe");

user2 = User.create(name: "Jane Doe");

# Create Inventories

inventory1 = Inventory.create(name: "Fridge", user: user1);

inventory2 = Inventory.create(name: "Pantry", user: user1);

inventory3 = Inventory.create(name: "Fridge", user: user2);

inventory4 = Inventory.create(name: "Pantry", user: user2);

# Create Foods

food1 = Food.create(name: "Eggs", measurement_unit: "dozen", price_dollars: 2.99);

food2 = Food.create(name: "Milk", measurement_unit: "gallon", price_dollars: 3.99);

food3 = Food.create(name: "Bread", measurement_unit: "loaf", price_dollars: 1.99);

# Create InventoryFoods

inventory_food1 = InventoryFood.create(inventory: inventory1, food: food1, quantity: 1);

inventory_food2 = InventoryFood.create(inventory: inventory1, food: food2, quantity: 1);

inventory_food3 = InventoryFood.create(inventory: inventory1, food: food3, quantity: 1);

inventory_food4 = InventoryFood.create(inventory: inventory2, food: food1, quantity: 1);

inventory_food5 = InventoryFood.create(inventory: inventory2, food: food2, quantity: 1);

inventory_food6 = InventoryFood.create(inventory: inventory2, food: food3, quantity: 1);

# Create Recipes

recipe1 = Recipe.create(name: "Scrambled Eggs", preparation_time_minutes: 5, cooking_time_minutes: 5, description: "Scrambled eggs are a staple breakfast food.", public: true, user: user1);

recipe2 = Recipe.create(name: "French Toast", preparation_time_minutes: 10, cooking_time_minutes: 10, description: "French toast is a staple breakfast food.", public: true, user: user1);

recipe3 = Recipe.create(name: "Grilled Cheese", preparation_time_minutes: 5, cooking_time_minutes: 5, description: "Grilled cheese is a staple lunch food.", public: true, user: user1);

recipe4 = Recipe.create(name: "Scrambled Eggs", preparation_time_minutes: 5, cooking_time_minutes: 5, description: "Scrambled eggs are a staple breakfast food.", public: true, user: user2);

recipe5 = Recipe.create(name: "French Toast", preparation_time_minutes: 10, cooking_time_minutes: 10, description: "French toast is a staple breakfast food.", public: true, user: user2);

recipe6 = Recipe.create(name: "Grilled Cheese", preparation_time_minutes: 5, cooking_time_minutes: 5, description: "Grilled cheese is a staple lunch food.", public: true, user: user2);

# Create RecipeFoods

recipe_food1 = RecipeFood.create(recipe: recipe1, food: food1, quantity: 1);

recipe_food2 = RecipeFood.create(recipe: recipe1, food: food2, quantity: 1);

recipe_food3 = RecipeFood.create(recipe: recipe1, food: food3, quantity: 1);

recipe_food4 = RecipeFood.create(recipe: recipe2, food: food1, quantity: 1);

recipe_food5 = RecipeFood.create(recipe: recipe2, food: food2, quantity: 1);

recipe_food6 = RecipeFood.create(recipe: recipe2, food: food3, quantity: 1);

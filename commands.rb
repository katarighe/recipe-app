rails generate migration CreateUsers name:string

rails generate migration CreateInventories name:string user:references

rails generate migration CreateRecipes name:string preparation_time:decimal cooking_time:decimal description:text public:boolean user:references

rails generate migration CreateFoods name:string measurement_unit(kg):decimal price:decimal

rails generate migration CreateInventoryFoods quantity(kg):decimal inventory:references food:references

rails generate migration CreateRecipeFoods quantity(kg):decimal recipe:references food:references




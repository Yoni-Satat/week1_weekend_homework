def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash)
  pet_shop[:admin][:total_cash] += cash
end

def pets_sold(pet_shop)
  pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, sold)
  pet_shop[:admin][:pets_sold] += sold
end

def stock_count(pet_shop)
  pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed)
  pets_found = []
  for pet in pet_shop[:pets]
    if (breed == pet[:breed])
      pets_found.push(pet)
    end
  end
  return pets_found
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if (name == pet[:name])
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if(pet[:name] == name)
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_pet_count(customers)
  customers[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

# Optional

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] > new_pet[:price]
    return true
  end
  return false
end

def sell_pet_to_customer(pet_shop, pet, customer)
  return nil if pet == nil
  find_pet_by_name(pet_shop, pet)
  add_pet_to_customer(customer, pet)
  add_or_remove_cash(pet_shop, pet[:price])
  increase_pets_sold(pet_shop, 1)
end

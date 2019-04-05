require 'rails_helper'

RSpec.describe 'When a user visits a machines show page' do
  it 'they see each snack and its price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    chips = dons.snacks.create(name: 'chips', price: 1.75)
    soda = dons.snacks.create(name: 'soda', price: 1.25)
    candy = dons.snacks.create(name: 'candy', price: 2.25)
    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
    expect(page).to have_content("chips: $1.75")
    expect(page).to have_content("soda: $1.25")
    expect(page).to have_content("candy: $2.25")
  end
  it 'they see average price of snacks' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    chips = dons.snacks.create(name: 'chips', price: 1.75)
    soda = dons.snacks.create(name: 'soda', price: 1.25)
    candy = dons.snacks.create(name: 'candy', price: 2.25)
    visit machine_path(dons)

    expect(page).to have_content("average snack price: $1.75")

  end

end

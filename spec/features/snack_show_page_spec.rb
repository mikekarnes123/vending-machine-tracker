require 'rails_helper'

RSpec.describe 'When a user vists a snack show page' do
  it 'they see each proper snack stats' do
    owner = Owner.create(name: "Sam's Snacks")
    owner_2 = Owner.create(name: "Bob's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    bobs  = owner_2.machines.create(location: "Bobs's Bar")
    chips = dons.snacks.create(name: 'chips', price: 1.75)
    chips_2 = bobs.snacks.create(name: 'chips', price: 1.75)
    soda = dons.snacks.create(name: 'soda', price: 1.75)
    soda_2 = bobs.snacks.create(name: 'soda', price: 8.25)
    candy = dons.snacks.create(name: 'candy', price: 2.25)
    visit snack_path(chips)

    expect(page).to have_content("chips")
    expect(page).to have_content("price: $1.75")
    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content("3 kinds of snacks")
    expect(page).to have_content("average price of: $1.90")
  end
end

require_relative './spec_helper'
require_relative '../day1'

RSpec.describe 'fuel' do
  it 'returns correct fuel' do
    expect(fuel(12)).to eq(2)
    expect(fuel(14)).to eq(2)
    expect(fuel(1969)).to eq(654)
    expect(fuel(100756)).to eq(33583)
  end
end

RSpec.describe 'fuel_with_fuels_fuel' do
  it 'returns fuels fuel requirements' do
    expect(fuel_with_fuels_fuel(14)).to eq(2)
    expect(fuel_with_fuels_fuel(1969)).to eq(966)
    expect(fuel_with_fuels_fuel(100756)).to eq(50346)
  end
end
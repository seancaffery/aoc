require_relative './spec_helper'
require_relative '../day2'

RSpec.describe 'run_program' do
  it 'calculates position 1' do
    expect(run_program([1,9,10,3,2,3,11,0,99,30,40,50], false, 0, 0)).to eq(3500)
  end
end
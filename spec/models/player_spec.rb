require 'rails_helper'

RSpec.describe Player, type: :model do


  describe "Validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:rut)}
    it { should validate_uniqueness_of :rut }
  end
end

require 'rails_helper'

RSpec.describe Student, type: :model do
  let(:student) { build :student, :full_data }
  let(:student2) { build :student, first_name: "Brendan", last_name: "O'Sullivan" }

  it { should validate_presence_of(:first_name) }

  it { should validate_presence_of(:last_name) }

  describe "#full_name" do
    it "returns the full name of a student" do
      expect(student.full_name).to eq "#{student.title} #{student.first_name} #{student.middle_name} #{student.last_name}" 
    end
    
    it "returns only fields which are not nil" do
      expect(student2.full_name).to eq "Brendan O'Sullivan" 
    end
  end
end

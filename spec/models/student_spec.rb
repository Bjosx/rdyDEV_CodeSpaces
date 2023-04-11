require 'rails_helper'

RSpec.describe Student, type: :model do
  let(:student) { build :student_with_data }
  let(:student2) { build :least_data_student }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  describe "#full_name" do
    it "returns the full name of a student" do
      expect(student.full_name).to eq "#{student.title} #{student.first_name} #{student.middle_name} #{student.last_name}" 
    end
    it "returns only fields which are not nil" do
      expect(student2.full_name).to eq "#{student2.first_name} #{student2.last_name}" 
    end
  end
end

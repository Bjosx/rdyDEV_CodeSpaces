require 'rails_helper'

RSpec.describe Student, type: :model do
  let(:student) { build :student_with_data }
  describe "#full_name" do
    it "returns the full name of a student" do
      expect(student.full_name).to eq "#{student.title} #{student.first_name} #{student.middle_name} #{student.last_name}" 
    end
  end
end

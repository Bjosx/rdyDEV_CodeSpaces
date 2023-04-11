class Student < ActiveRecord::Base
  validates :first_name, :last_name, presence: true

  def full_name
    [title, first_name, middle_name, last_name].compact.join(" ")
  end
end
#Model for student, where basic personal information of any students is stored.
class Student < ActiveRecord::Base
    #returns a student's full name and title as a string
    #uses the compact method to remove any values that do not exist
    def full_name
        [title, first_name, middle_name, last_name].compact.join(" ")
    end
end
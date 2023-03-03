class CreateStudents < ActiveRecord::Migration
    def change
        create_table :students do |t|
            t.string :title
            t.string :first_name
            t.string :middle_name
            t.string :last_name
            t.string :email
            t.date :birth_date
            t.string :gender
        end
    end
end
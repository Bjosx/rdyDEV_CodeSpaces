require 'rails_helper'

RSpec.describe WillPaginateHelper do
  describe "will_paginate_nicely" do
    #using sixty as that is when the divider is first introduced.
    context "There is six pages worth of records in the collection and page 1 is loaded" do
      let!(:create_students) { create_list(:student, 60, :full_data) }
      let(:students) { Student.paginate(page: 1, per_page: 10) }

      it "returns a list" do
        expect(helper.will_paginate_nicely(students)).to match /<ul class=\"pagination\">/
      end

      it "includes links to /students pages" do
        expect(helper.will_paginate_nicely(students).scan("href='/students?page=").size).to be >= 1
      end

      it "gives the link to the current page a class of active" do
        expect(helper.will_paginate_nicely(students)).to match Regexp.escape("<li class=\"active\"><a href='/students?page=1'>1</a>")
      end

      it "does not set any other pages as active" do
        expect(helper.will_paginate_nicely(students).scan("<li class=\"active\">").size).to eq(1)
      end

      it "includes a divider (...)" do
        expect(helper.will_paginate_nicely(students)).to match Regexp.escape("...</a></li>")
      end
    end

    context "There is six pages worth of records in the collection and page 3 is loaded" do
      let!(:create_students) { create_list(:student, 60, :full_data) }
      let(:students) { Student.paginate(page: 3, per_page: 10) }

      it "sets the current page (three) as active" do
        expect(helper.will_paginate_nicely(students)).to match Regexp.escape("<li class=\"active\"><a href='/students?page=3'>3</a>")
      end

      it "does not set any other pages as active" do
        expect(helper.will_paginate_nicely(students).scan("<li class=\"active\">").size).to eq(1)
      end
    end
  end
end
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

      it "includes five page links" do
        expect(helper.will_paginate_nicely(students).scan("href='/students?page=").size).to eq(5)
      end

      it "sets the < button as disabled" do
        expect(helper.will_paginate_nicely(students)).to match Regexp.escape("<li class=\"disabled\"><a><</a></li>")
      end

      it "sets page one as active" do
        expect(helper.will_paginate_nicely(students)).to match Regexp.escape("<li class=\"active\"><a href='/students?page=1'>1</a>")
      end

      it "includes a divider (...)" do
        expect(helper.will_paginate_nicely(students)).to match Regexp.escape("...</a></li>")
      end

      it "makes > a link to page 2" do
        expect(helper.will_paginate_nicely(students)).to match Regexp.escape("<li><a href='/students?page=2'>></a></li>")
      end
    end

    context "There is six pages worth of records in the collection and page 3 is loaded" do
      let!(:create_students) { create_list(:student, 60, :full_data) }
      let(:students) { Student.paginate(page: 3, per_page: 10) }

      it "includes eight page links" do
        expect(helper.will_paginate_nicely(students).scan("href='/students?page=").size).to eq(8)
      end

      it "makes > a link to page 4" do
        expect(helper.will_paginate_nicely(students)).to match Regexp.escape("<li><a href='/students?page=4'>></a></li>")
      end

      it "makes < a link to page 2" do
        expect(helper.will_paginate_nicely(students)).to match Regexp.escape("<li><a href='/students?page=2'><</a></li>")
      end

      it "sets page three as active" do
        expect(helper.will_paginate_nicely(students)).to match Regexp.escape("<li class=\"active\"><a href='/students?page=3'>3</a>")
      end

      it "doesn't includes a divider (...)" do
        expect(helper.will_paginate_nicely(students)).not_to match Regexp.escape("...</a></li>")
      end
    end
    
    context "There is less than a page worth of records" do
      let!(:create_students) { create_list(:student, 7, :full_data) }
      let(:students) { Student.paginate(page: 1, per_page: 10) }
      it "returns nothing" do
        expect(helper.will_paginate_nicely(students)).to be_nil
      end
    end
  end
end
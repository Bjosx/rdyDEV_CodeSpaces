require 'rails_helper'

RSpec.describe "students/index" do 
  context "when 20 students exist" do
    before(:each) do 
      create_list(:student, 20, :full_data) 
      assign(:students, Student.paginate(:page => params[:page], :per_page => 10))
      render
    end
    #One link for page one, one for page two and one for the next page button. Doubled because the pagination is included twice.
    it "renders six page links" do
      expect(rendered.scan("students?page=").size).to eq(6)
    end
    it "renders the student partial" do
      expect(view).to render_template(partial: "_student")
    end
    it "renders 10 students" do
      expect(rendered.scan("<tr>").size).to eq(11)
    end
  end
  context "when 8 students exist" do
    before(:each) do 
      create_list(:student, 8, :full_data) 
      assign(:students, Student.paginate(:page => params[:page], :per_page => 10))
      render
    end
    it "renders no page links" do
      expect(rendered.scan("students?page=").size).to eq(0)
    end
    it "renders the student partial" do
      expect(view).to render_template(partial: "_student")
    end
    it "renders 8 students" do
      expect(rendered.scan("<tr>").size).to eq(9)
    end
  end
  context "when no students exist" do
    before(:each) do 
      assign(:students, Student.paginate(:page => params[:page], :per_page => 10))
      render
    end
    it "prints a message to indicate there are no students" do
      expect(rendered.scan("There are no students currently in your system.").size).to eq(1)
    end
  end
end
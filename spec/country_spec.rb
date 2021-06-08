# frozen_string_literal: true

RSpec.describe Country do
  describe ".Country" do
    let(:dummy) do
      Class.new do
        include Country
      end.new
    end

    it "returns the country name given the iso_code and locale" do
      expect(dummy.Country("AL", "pt_br")).to eq("Albânia")
    end
  end
end

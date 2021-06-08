# frozen_string_literal: true

RSpec.describe Llaxta do
  describe "t" do
    it "returns the country name given the iso_code and locale" do
      expect(Llaxta.t("AL", "pt_br")).to eq("Albânia")
    end
  end
end

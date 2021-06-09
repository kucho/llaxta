# frozen_string_literal: true

RSpec.describe Llaxta do
  describe "t" do
    context "when locale is valid" do
      it "returns the country name given the iso_code and locale" do
        expect(Llaxta.t("AL", "pt_br")).to eq("Albânia")
      end
    end

    context "when locale is NOT valid" do
      it "raises" do
        expect { Llaxta.t("PE", "2GFA") }.to raise_exception Exceptions::LocaleNotFound
      end
    end

    context "when alpha is blank" do
      it "raises" do
        expect { Llaxta.t(nil, "br") }.to raise_exception Exceptions::AlphaMissing
      end
    end

    context "when locale is missing" do
      it "raises" do
        expect { Llaxta.t("PE", nil) }.to raise_exception Exceptions::LocaleMissing
      end
    end
  end
end

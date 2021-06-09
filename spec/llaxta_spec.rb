# frozen_string_literal: true

RSpec.describe Llaxta do
  describe ".t" do
    context "when locale is valid" do
      context "with locale en_us" do
        it "returns the country name given the iso_code and locale" do
          expect(Llaxta.t("CH", "en_us")).to eq("Switzerland")
        end
      end

      context "with locale es" do
        it "returns the country name given the iso_code and locale" do
          expect(Llaxta.t("CH", "es")).to eq("Suiza")
        end
      end

      context "with locale pt_br" do
        it "returns the country name given the iso_code and locale" do
          expect(Llaxta.t("CH", "pt_br")).to eq("Suíça")
        end
      end

      context "with locale pt_br" do
        it "returns the country name given the iso_code and locale" do
          expect(Llaxta.t("CH", "zh_cn")).to eq("瑞士")
        end
      end
    end

    context "using a short-version locale" do
      context "with locale us" do
        it { expect(Llaxta.t("CH", "us")).to eq("Switzerland") }
      end

      context "with locale br" do
        it { expect(Llaxta.t("CH", "br")).to eq("Suíça") }
      end

      context "with locale cn" do
        it { expect(Llaxta.t("CH", "cn")).to eq("瑞士") }
      end
    end
  end

  describe "exceptions" do
    context "when locale is NOT valid" do
      it "raises" do
        expect { Llaxta.t("PE", "2GFA") }.to raise_exception Exceptions::LocaleNotFound
      end
    end

    context "when alpha is nil" do
      it "raises" do
        expect { Llaxta.t(nil, "br") }.to raise_exception Exceptions::AlphaMissing
      end
    end

    context "when locale is nil" do
      it "raises" do
        expect { Llaxta.t("PE", nil) }.to raise_exception Exceptions::LocaleMissing
      end
    end
  end
end

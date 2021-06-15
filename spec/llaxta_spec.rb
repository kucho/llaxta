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

  describe ".alpha2" do
    context "when country exists in the file for the given language" do
      context "with locale br" do
        it { expect(Llaxta.alpha2("Etiópia", "br")).to eq("ET") }
      end

      context "with locale cn" do
        it { expect(Llaxta.alpha2("埃塞俄比亚", "cn")).to eq("ET") }
      end

      context "with locale es" do
        it { expect(Llaxta.alpha2("Etiopía", "es")).to eq("ET") }
      end

      context "with locale us" do
        it { expect(Llaxta.alpha2("Ethiopia", "us")).to eq("ET") }
      end
    end

    context "when country does not exist in the file for the given language" do
      it { expect(Llaxta.alpha2("NA", "us")).to be_nil }
    end

    context "with an unsupported locale" do
      it "raises a LocaleNotFound exception" do
        expect { Llaxta.alpha2("Chile", "oa") }.to raise_exception Exceptions::LocaleNotFound
      end
    end
  end

  describe "exceptions" do
    context "when locale is NOT valid" do
      it "raises a LocaleNotFound exception" do
        expect { Llaxta.t("PE", "2GFA") }.to raise_exception Exceptions::LocaleNotFound
      end
    end

    context "when alpha is nil" do
      it "raises a AlphaMissing exception" do
        expect { Llaxta.t(nil, "br") }.to raise_exception Exceptions::AlphaMissing
      end
    end

    context "when locale is nil" do
      it "raises a LocaleMissing exception" do
        expect { Llaxta.t("PE", nil) }.to raise_exception Exceptions::LocaleMissing
      end
    end
  end
end

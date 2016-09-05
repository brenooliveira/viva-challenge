require 'spec_helper'

describe Entity::Province do
  context "locate Gode" do
    it { expect(described_class.find(3, 501)).to include("Gode") }
  end

  context "locate Ruja" do
    it { expect(described_class.find(401, 501)).to include("Ruja") }
  end

  context "locate Scavy" do
    it { expect(described_class.find(1, 1)).to include("Scavy") }
  end

  context "locate Groola" do
    it { expect(described_class.find(601, 1)).to include("Groola") }
  end

  context "locate Nova" do
    it { expect(described_class.find(801, 1)).to include("Nova") }
  end

  context "locate Ruja and Gode" do
    it { expect(described_class.find(501, 501)).to include("Gode") }
    it { expect(described_class.find(501, 501)).to include("Ruja") }
  end
end

require 'spec_helper'

describe SerializeYAML2JSON do
  subject { w = Widget.create!(data: {one:1}); w.reload; w }

  it "dumps JSON" do
    expect(subject.read_attribute_before_type_cast(:data).value).to eq '{"one":1}'
  end

  it "loads JSON" do
    expect(subject.read_attribute_before_type_cast(:data).value).to eq '{"one":1}'
    expect(subject.data).to be_a Hash
    expect(subject.data['one']).to eq 1
    expect(subject.data[:one]).to eq 1
  end

  describe "with an existing YAML record" do
    before do
      subject.class.connection.update("UPDATE widgets SET data = '---\n:one: 1\n'")
      subject.reload
    end

    it "loads YAML" do
      expect(subject.read_attribute_before_type_cast(:data).value).to eq "---\n:one: 1\n"
      expect(subject.data).to be_a Hash
      expect(subject.data['one']).to eq 1
      expect(subject.data[:one]).to eq 1
    end

    it "dumps JSON" do
      subject.data = {two:2}
      subject.save!
      subject.reload
      expect(subject.read_attribute_before_type_cast(:data).value).to eq '{"two":2}'
      expect(subject.data).to be_a Hash
      expect(subject.data['two']).to eq 2
      expect(subject.data[:two]).to eq 2
    end

  end

end

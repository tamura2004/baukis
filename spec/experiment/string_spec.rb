require "spec_helper"

describe String do
  describe "#<<" do

    example "文字を追加する" do
      s = "ABC"
      s << "あい"
      expect(s.size).to be(5)
    end

    example "nilは追加できない", :exception do
      s = "ABC"
      expect { s << nil }.to raise_error(TypeError)
    end

  end
end

require 'rails_helper'

RSpec.describe Administrator, type: :model do
  describe "password=" do
    example "文字列を与えると、hashed_passwordに長さ60の文字列をセットする" do
      administrator = Administrator.new
      administrator.password = "foobar"
      expect(administrator.hashed_password).to be_kind_of(String)
      expect(administrator.hashed_password.size).to be(60)
    end

    example "nilを与えると、hashed_passwordはnilになる" do
      administrator = Administrator.new(password: "abc")
      administrator.password = nil
      expect(administrator.hashed_password).to be_nil
    end
  end
end

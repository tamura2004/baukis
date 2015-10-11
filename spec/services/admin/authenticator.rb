require "spec_helper"

describe Admin::Authenticator do
  describe "#authenticate" do

    example "正しいメールアドレスで停止フラグが立っていないならtrueを返す" do
      m = build(:administrator)
      a = Admin::Authenticator.new(m)
      check = a.authenticate!
      expect(check).to be_truthy
      expect(a.message).to eq("ログインしました。")
    end

    example "正しくないメールアドレス（引数nil）ならfalseとエラーメッセージを返す" do
      a = Admin::Authenticator.new(nil)
      check = a.authenticate!
      expect(check).to be_falsey
      expect(a.message).to eq("メールアドレスが正しくありません。")
    end

    example "停止フラグが立っていればfalseを返す" do
      m = build(:administrator, suspended: true)
      a = Admin::Authenticator.new(m)
      check = a.authenticate!
      expect(check).to be_falsey
      expect(a.message).to eq("アカウントが停止されています。")
    end

  end
end


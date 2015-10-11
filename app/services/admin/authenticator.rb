class Admin::Authenticator
  attr_reader :message, :administrator

  def initialize(administrator)
    @administrator = administrator
    @message = nil
  end

  def authenticate!
    result = false

    if !@administrator
      @message = "メールアドレスが正しくありません。"

    elsif administrator.suspended?
      @message = "アカウントが停止されています。"

    else
      @message = "ログインしました。"
      result = true
    end

    result
  end

end
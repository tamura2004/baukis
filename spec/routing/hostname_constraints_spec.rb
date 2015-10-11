require "spec_helper"

describe "ルーティング" do
  example "職員トップページ" do
    expect(get: "http://baukis.example.com").to route_to(
      host: "baukis.example.com",
      controller: "staff/top",
      action: "index"
    )
  end

  example "管理者ログインフォーム" do
    expect(get: "http://baukis.example.com/admin/login").to route_to(
      host: "baukis.example.com",
      controller: "admin/sessions",
      action: "new"
    )
  end

  example "ホスト名が対象外ならerrors/not_foundへ" do
    expect(get: "http://foo.example.jp").to route_to(
      controller: "errors",
      action: "routing_error"
    )
  end

  example "存在しないパスならerrors/not_foundへ" do
    expect(get: "http://baukis.example.com/xyz").to route_to(
      controller: "errors",
      action: "routing_error",
      anything: "xyz"
    )
  end

  example "対象ホスト名とカスタマイズされた顧客パスの解決" do
    config = Rails.application.config.baukis
    host = config[:customer][:host]
    path = config[:customer][:path]
    expect(get: "http://#{host}/#{path}").to route_to(
      host: host,
      controller: "customer/top",
      action: "index"
      )
  end

end

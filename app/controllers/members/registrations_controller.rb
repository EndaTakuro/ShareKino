class Members::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: %i[destroy]

  #2名以上ログイン時強制ログアウトされないようゲストユーザーを削除できないようにする
  def check_guest
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの変更・削除はできません。'
    end
  end
end
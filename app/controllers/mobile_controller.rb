class MobileController < ApplicationController
  def helloWorld
    userAge = 10
    height = 180.3
    myJson = {"이름" => "조경진", "키" => height, "나이" => userAge, "메세지" => "HelloWorld!"}
    render json: myJson
  end

  def sign_up

    u = User.new
    u.loginId = params[:id]
    u.password = params[:pw]
    u.name = params[:name]
    u.save

    myJson = {"result" => TRUE, "userInfo" => u}
    render json: myJson

  end

  def sign_in
    # 아이디와 비번이 올바른 사용자가 있는가?
    # 커밋용 주석

    if User.where(loginId: params[:id], password: params[:pw]).exists?
      myJson = {"result" => TRUE, "메세지" => "로그인 성공"}
      render json: myJson
    else
      myJson = {"result" => FALSE, "메세지" => "로그인 실패"}
      render json: myJson
    end

  end

end

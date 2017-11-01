class LmController < ApplicationController
  def register_user
    # 회원가입 : 사용자에게 학생정보를 받아 회원으로 DB에 추가.

    # 사용자 클래스 하나 생성 => 생성된 클래스 내부는 텅 비어있음.
    s = Student.new

    # 학생 클래스에 들어있는 loginId 항목은
    # 클라이언트가 studentId라고 꼬리표를 달아서 보내주는 항목으로 대입.
    s.loginId = params[:studentId]
    s.loginPw = params[:studentPw]
    s.name = params[:studentName]
    s.phone = params[:studentPhone]

    # 클래스 정보를 DB에 저장
    s.save

    #동작을 하고나면 클라이언트에게 결과를 전송
    # 클라이언트는 JSON을 받는게 제일 편함. => JSON으로 가공해서 전송

    #수행 결과를 저장할 객체
    resultJson = {"result" => TRUE, "message" => "user registered successfully"}
    render json: resultJson

  end
end

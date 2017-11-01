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

  def login
    # 로그인? 클라이언트가 요청하는
    # 아이디/비밀번호가 우리의 회원 장부에 있는지 검사.

    # 아이디와 비밀번호가 모두 일치하는 학생[Student]이 있는가? 검색.
    if Student.where(loginId: params[:studentId], loginPw: params[:studentPw]).exists?
      # 아이디와 비번 모두 일치하는 학생이 존재.
      # 우리의 회원이 맞으므로 => 로그인에 성공.
      # 로그인에 성공했음을 앱한테 전파.
      # 앱에다 메세지를 날리는건 ? JSON 만들어서 render json:

      # 로그인에 성공하면 해당 학생의 정보를 첨부.
      # 검색 결과중 첫번째 학생이 해당 학생이라고 가정.

      std = Student.where(loginId: params[:studentId], loginPw: params[:studentPw]).first()

      # 결과 JSON에 항목 추가.
      # student => std객체

      resultJson = {"result" => TRUE, "message" => "login ok!", "student" => std}
      render json: resultJson
    else
      # 존재 하지 않는다. => 회원이 아니다. => 로그인 실패.

      resultJson = {"result" => FALSE, "message" => "login failed"}
      render json: resultJson

    end
  end

end

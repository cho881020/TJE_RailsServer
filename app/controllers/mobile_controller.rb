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
    # 커밋용 주석 1

    if User.where(loginId: params[:id], password: params[:pw]).exists?
      myJson = {"result" => TRUE, "메세지" => "로그인 성공"}
      render json: myJson
    else
      myJson = {"result" => FALSE, "메세지" => "로그인 실패"}
      render json: myJson
    end

  end

  def getAllPost

    posts = Post.all()
    myJson = {"result" => TRUE, "posts" => posts}
    render json: myJson
  end

  def insertDummys
    s = Student.new
    s.name = "A학생"
    s.phone = "010-1111-1111"
    s.save

    s = Student.new
    s.name = "B학생"
    s.phone = "010-2222-2222"
    s.save

    ab = Absent.new
    ab.absentDate = "2017-10-01"
    ab.reason = "1번 사유"
    ab.student_id = 1
    ab.save

    ab = Absent.new
    ab.absentDate = "2017-10-02"
    ab.reason = "2번 사유"
    ab.student_id = 1
    ab.save

    ab = Absent.new
    ab.absentDate = "2017-10-03"
    ab.reason = "3번 사유"
    ab.student_id = 1
    ab.save


    render plain: "토드에서 확인"

  end

  def getFirstStudentAbsentList

    s = Student.find(1)
    myJson = {"1번학생 결석목록" => s.absents}
    render json: myJson

  end

end

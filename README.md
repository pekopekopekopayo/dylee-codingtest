# 랭디 코드테스트

## Task목록

- 필수 모델

  - 필수모델 lesson, teacher, student
  - 추가적인 모델 허용
   
- Task1 IP차단기능만들기

  - LandingPage에는 차단된 IP여도 접속가능해야함

- Task2 수업예약 서비스인 lessons_controller 작성하기
   - 수업예약 시스템 구축
   - 학생 및 선생이 스케줄이 있을경우 예약이 되면 안됨

- Task3 수업예약이 완료시 Mail을 발송
  - 수업이 예약이 완료가 되면 선생에게 수업에 대한 메일을 발송
  
- Task4 수업예약이 완료시 앱에 Push메세지를 발송
  - 수업이 예약이 완료되면 학생에게 수업에 대한 앱 Push메세지를 발송
  - 앱이 없으므로 코드 트리거만 하는 형식으로 작성
  
  ---
  ## Task해결

- 모델
  - Student
    - email: 이메일을 발송하기 위함
    - name: 학생이름을 인지하기위함
  - Teacher
    - email: 이메일을 발송하기 위함
    - name: 선생이름을 인지하기 위함
  - Device
    - target_id: 학생 및 선생 ID(외래키)
    - target_type: 학생 및 선생 구별키
    - token: 실제 앱에 Push메세지를 발송하기위해서는 Device의 Token이 필요
    - os: FCM에서 APN등록으로 Apple기기에도 알림이 가능하므로 Os는 필요없음, 혹시나 하는 마음에 추가
  - BlackList
    - ip_address: ip를 확인하기위함
    - name: ip에 대한 이름
  - Lesson
    - student_id: 학생아이디
    - teacher_id: 선생아이디
    - started_at: 학습 시작시간
    - ended_at: 학습 종료시간
     
- Task1 IP차단기능만들기

  - LandingPage에는 차단된 IP여도 접속가능해야함
    - LandingPage는 'domain/'으로 구현
    - 항상 BlackList는 관리가 되어야하므로 휘발성으로 관리하는 것은 좋지않다고 판단함 그러므로 BlackList테이블을 만들고 첫 요청이 올 경우만 BlackList를 불러오고 BlackList의 IP를 Caching한다. 만약 BlackList의 IP가 있을 경우 '귀하의 IP는 차단 되어있습니다.'라는 메세지와 Forbidden(403)에러를 발생시킨다. 
    - BlackList를 추가 할 경우 CachingData에 추가된다.
    - BlackList에서 제거 될 경우 CachingData에서 제거된다.
    
    - ApplicationController before_action과 해당 Controller에서 skip_before_action으로 LandingPage는 IP추적을 하지않는 형식으로 구현

- Task2 수업예약 서비스인 lessons_controller 작성하기
   - 수업예약 시스템 구축
   - 학생 및 선생이 스케줄이 있을경우 예약이 되면 안됨
     - started_at으로만으로는 스케줄에 대한 검증이 되지않으며 서비스 적으로도 시작시간이 있으면 끝나는 시간이 없으면 안되므로 ended_at 컬럼 추가(임의)
     - 학생과 선생의 스케줄에 대한 Custom Validation을 추가

- Task3 수업예약이 완료시 Mail을 발송
  - 수업이 예약이 완료가 되면 선생에게 수업에 대한 메일을 발송
    - Lesson의 Row가 만들어지면 수업에 대한 유효성 검사는 끝났으므로 Mail을 송신
    - 선생에게만 메일을 발신을 하는 것은 무언가 위화감이 느껴졌으므로 학생에게도 메일을 보내는형식으로 변경(임의)
    - Mailer를 메일을 발송
    - 메일서버를 가지고 있지 않기 때문에 Gmail을 이용하여 구축(테스트 完)
  
- Task4 수업예약이 완료시 앱에 Push메세지를 발송
  - 수업이 예약이 완료되면 학생에게 수업에 대한 앱 Push메세지를 발송
  - 앱이 없으므로 코드 트리거만 하는 형식으로 작성
    - Lesson의 Row가 만들어지면 수업에 대한 유효성 검사는 끝났으므로 Push메세지 송신
    - 학생에게만 메일을 발신을 하는 것은 무언가 위화감이 느껴졌으므로 선생에게도 메일을 보내는형식으로 변경(임의)
    - 앱이 없으므로 트리거 코드만 주석으로 하여 작성

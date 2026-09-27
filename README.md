# 전자·임베디드·정보이론 실습

Arduino 로봇청소기, EE305 회로 측정, EE326 압축·채널 부호화의 실제 구현과 설계 자료를 묶었습니다.

| 폴더 | 수행 내용 | 산출물 |
|---|---|---|
| `arduino-cleaner/` | 초음파 센서로 장애물을 감지하고 모터를 구동하는 로봇청소기 제작 | Arduino sketch, 섀시 CAD DXF |
| `circuits/` | RC/RL/RLC·필터·오디오 증폭 회로 측정 및 분석 | 실험 소개·개인 측정 보고서 |
| `information-theory/lz77/` | LZ77 encoding/decoding과 압축률 실험 | MATLAB 구현 |
| `information-theory/channel-coding/` | 코드워드 생성, binary symmetric channel, 복호·오류율 실험 | MATLAB 구현 |

## 실행

Arduino IDE에서 `arduino-cleaner/cleaner/cleaner.ino`를 열고 실제 보드·포트와 배선을 확인한 뒤 빌드·업로드합니다. 정확한 보드 모델은 보관 코드만으로 확정하지 않았습니다. 핀 정의는 sketch를 기준으로 하며 모터 전원과 드라이버는 사용 장비에 맞춰야 합니다. CAD는 `arduino-cleaner/cad/chassis.dxf`입니다.

MATLAB에서 원하는 실험 폴더로 이동해 `script`를 실행합니다. LZ77 합성 왕복 검사는 해당 폴더에서 `test_roundtrip`입니다. 공개 정리 과정에서 문자열 마지막 위치를 넘는 평가를 막도록 encoder의 `&`를 `&&`로 바꾸고 빈 입력의 표현을 빈 행렬로 통일했습니다.

## 역할과 검증

학업 프로젝트에서 구현·제작·측정·분석을 수행한 기록입니다. 당시 제출 자료를 원본으로 유지하고 선별한 사본을 정리했습니다. 2018 로봇청소기와 2021 MATLAB 실습, 2026 회로 실험의 수행 시점을 구분합니다.

현재 환경에는 MATLAB/Octave와 Arduino toolchain이 없어 해당 도구의 재컴파일·실기기 구동은 확인하지 않았습니다. 소스·파일 구조를 점검했으며 새 실기기 성공률이나 측정 결과는 제시하지 않습니다.

Arduino 코드는 `Ultrasonic.h`의 `Ultrasonic(trigger, echo)`·`distanceRead()` API를 사용합니다. 이 API를 제공하는 라이브러리를 설치해야 합니다. 센서 trigger/echo 핀은 13/12, 11/10, 9/8이고 좌우 모터 드라이버 입력은 7/6, 5/4입니다.

## 시연 자료

[2018 Arduino 로봇청소기 시연](https://drive.google.com/file/d/11UY_fbOLHmjJ5oGViqylE3oVhj3N_lSz/view)에서 제작물의 주행을 볼 수 있습니다. 당시 보관 영상 원본과 동일한 공개 사본이며 이번에 실기기를 다시 구동한 영상은 아닙니다. 조교의 YouTube 게시본과 동일한 파일인지는 확인되지 않았습니다.

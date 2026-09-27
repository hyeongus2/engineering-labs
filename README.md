# 전자·임베디드·정보이론 실습

센서와 모터를 연결한 로봇청소기 제작, 회로의 시간·주파수 응답 측정, 압축·채널 부호화 알고리즘 구현을 다룹니다.

## 프로젝트

| 폴더 | 목적과 구현 | 자료 |
|---|---|---|
| `arduino-cleaner/` | 초음파 센서로 장애물을 감지하고 좌우 모터를 제어하는 로봇청소기 제작 (2018) | Arduino sketch, 섀시 CAD DXF |
| `circuits/` | RC/RL/RLC·필터·오디오 증폭 회로의 응답 측정과 분석 (2026) | 실험 보고서, 측정표·파형 |
| `information-theory/lz77/` | LZ77 encoding/decoding과 압축률 실험 (2021) | MATLAB 구현 |
| `information-theory/channel-coding/` | 코드워드 생성, binary symmetric channel, 복호·오류율 실험 (2021) | MATLAB 구현 |

## Arduino 실행

Arduino IDE에서 `arduino-cleaner/cleaner/cleaner.ino`를 엽니다. 사용하는 보드·포트를 선택하고 모터 드라이버·전원을 연결합니다. 센서는 `Ultrasonic(trigger, echo)`와 `distanceRead()` API를 제공하는 `Ultrasonic.h` 라이브러리를 사용합니다.

| 연결 | 핀 |
|---|---|
| 초음파 센서 trigger/echo | 13/12, 11/10, 9/8 |
| 좌우 모터 드라이버 입력 | 7/6, 5/4 |

섀시 도면은 `arduino-cleaner/cad/chassis.dxf`입니다.

## MATLAB 실행과 테스트

실험 폴더로 이동해 `script`를 실행합니다. LZ77의 `test_roundtrip`은 빈 입력을 포함한 문자열의 압축·복원 일치를 검사합니다. Encoder는 short-circuit 조건으로 문자열 경계를 검사하고, 빈 입력을 빈 행렬로 반환합니다.

MATLAB/Octave 실행 및 Arduino 빌드·장치 실행은 검증 전입니다.

## 시연

[2018 Arduino 로봇청소기 주행 시연](https://drive.google.com/file/d/11UY_fbOLHmjJ5oGViqylE3oVhj3N_lSz/view)

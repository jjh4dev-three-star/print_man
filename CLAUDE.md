# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 프로젝트 개요

**PrintMan** - 배송 송장(CJ 대한통운 등) 출력을 HTTP 요청으로 처리하는 Windows VCL 데스크톱 애플리케이션 (Delphi 12 / RAD Studio 18.6).

포트 8080에서 HTTP 요청을 수신하고, JSON 파싱 후 FastReport 템플릿으로 프린터에 출력한다. 트레이 아이콘 형태로 백그라운드에서 동작한다.

## 빌드 방법

IDE에서 빌드: `src/PrintMan.dproj` 를 Delphi IDE(RAD Studio 18.6 이상)에서 열고 `Ctrl+F9` (컴파일) 또는 `F9` (실행).

- 출력 EXE: `bin/PrintMan.exe`
- 중간 DCU: `dcu/`
- 플랫폼: Win32 (기본), Win64 (보조)

별도의 빌드 스크립트(Makefile, 배치파일)는 없다. Oracle 클라이언트 DLL들이 `bin/`에 있어야 실행된다.

## 아키텍처

### 애플리케이션 실행 흐름

```
PrintMan.exe 시작
  └─ Mutex 체크 (중복 실행 방지)
  └─ Tfrm_Main.FormShow() → Tfrm_Login (자동 성공 처리)
  └─ Timer1 (0.01초) → 메인 폼 최소화(트레이 아이콘), BeginListen() 호출
  └─ IdHTTPServer (포트 8080) 활성화 → HTTP 요청 대기
```

### HTTP 요청 처리 흐름

```
HTTP POST (JSON: access_key, user_id, bunch_id)
  → unt_HttpReqListen.pas (IdHTTPServer)
  → JSON 파싱 (uJSON.pas)
  → unt_CJ_Korea.do_Print_CJ() 또는 unt_Barcode_Sample.do_Print_CJ()
  → TKorexMaster 레코드에 데이터 구성
  → FastReport (frxReport1) 렌더링 + 프린터 출력
  → JSON 응답 반환
```

### 핵심 소스 파일

| 파일 | 역할 |
|------|------|
| `src/unt_HttpReqListen.pas` | HTTP 서버 (Indy IdHTTPServer), JSON 파싱, 라우팅 |
| `src/unt_CJ_Korea.pas` | CJ 대한통운 송장 출력 로직 (활성 사용 중) |
| `src/unt_Barcode_Sample.pas` | 바코드 출력 (신규 기능, 2026.03 추가) |
| `src/unt_CJ_Daetong.pas` | 구버전 대통 송장 (2026.03.12 이후 미사용) |
| `src/unt_Main.pas` | 메인 폼, 트레이 아이콘, 타이머 |
| `src/unt_Login.pas` | 로그인 폼, settings.ini 관리 |
| `src/library/untDatabase.pas` | DB 연결 데이터모듈 (dmMain) |
| `src/library/colib/untGlobal.pas` | 전역 변수, `TKorexMaster`/`TPrintInfo`/`TRefineAddr` 타입 정의 |
| `src/library/colib/unt_CommLib.pas` | 공통 통신 유틸리티 |
| `src/uJSON.pas` | JSON 파싱 라이브러리 |

### 주요 데이터 타입 (untGlobal.pas)

- **`TKorexMaster`**: 송장 마스터 레코드 (50+ 필드) — 송장번호, 발송인/수취인, 상품 정보, 운송비, 박스 타입, 폰트 크기 등
- **`TPrintInfo`**: 프린터 설정 (delivery_code, print_type, 프린터명, 여백 등)
- **`TRefineAddr`**: 주소 정제 정보

### 데이터베이스 연결

`src/library/untDatabase.pas` (dmMain 데이터모듈):

- **dbLinkage** (FireDAC MSSQL): `jjh103.iptime.org:64707` / DB: `teak_bae` — 송장 정보 조회
- **db_Oracle** (FireDAC Oracle): `221.149.104.164:31521/ORCL` — 배송사 연동
- **dbZipNo** (ADO): 우편번호 DB

### FastReport 템플릿

- `src/barcode_test.fr3`: 바코드 출력 템플릿
- `bin/barcode/`: 바코드 관련 리소스
- `bin/invoice/`: 인보이스 출력 관련 리소스

### 3rd Party 라이브러리

- **DevExpress**: cxGrid, cxButton, dxSkin 등 UI 컴포넌트
- **FastReport (frx26)**: 송장/바코드 출력 템플릿 엔진
- **Indy (IndyCore/IndyProtocols)**: HTTP 서버
- **FireDAC**: MSSQL, Oracle DB 연결

## 전역 상태 변수 (untGlobal.pas)

| 변수 | 타입 | 용도 |
|------|------|------|
| `gszLoginYN` | String | 로그인 여부 |
| `gszUser_Id` | String | 로그인 사용자 ID |
| `gszHomePath` | String | 실행 파일 기준 홈 경로 |
| `gInvPrinting` | Boolean | 송장 출력 중 여부 (동시 출력 방지) |
| `gHttpRecieving` | Boolean | HTTP 요청 수신 중 여부 |

## 설정 파일

- `bin/settings.ini`: 로그인 ID/PW 저장 (평문), 로컬에만 존재 (gitignore)

## 주의 사항

- `unt_Login.pas`의 `Login()` 함수는 현재 DB 검증 없이 항상 성공 처리됨
- `unt_CJ_Daetong.pas`는 미사용 상태이지만 프로젝트에 포함되어 있음
- HTTP CORS는 `Access-Control-Allow-Origin: *`로 완전 개방 상태
- 에러 로그: `bin/ERROR_PrintMan_YYYYMMDD_HHMMSS.txt`

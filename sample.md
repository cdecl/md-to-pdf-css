# Markdown 렌더링 종합 테스트 문서

이 문서는 **Markdown** 문법으로 작성된 다양한 태그와 요소들이 `styles.css` 및 PDF 변환 도구(`pdf.sh` / `md-to-pdf`)에서 올바르게 렌더링되는지 점검하기 위한 종합 테스트 문서입니다.

---

## 1. 텍스트 서식 및 인라인 요소 (Typography & Inline Elements)

본문 문단(Paragraph)의 가독성과 행간, 자간, 그리고 한글 단어 끊김 방지(`word-break: keep-all`)가 정상 작동하는지 확인합니다. 자연스러운 줄바꿈과 여백을 점검하기 위해 긴 텍스트를 배치합니다.

다람쥐 헌 쳇바퀴에 타고파. 키스의 고유조건은 입술끼리 만나야 하고 특별한 기술은 필요치 않다. The quick brown fox jumps over the lazy dog. 1234567890 및 특수문자 `!@#$%^&*()_+-=[]{}|;':",.<>?/` 테스트.

### 다양한 인라인 텍스트 스타일
* **굵은 글씨 (Bold / Strong)**: **중요한 핵심 내용 강조**
* *기울임 (Italic / Emphasis)*: *부연 설명 또는 외래어/용어 표기*
* ***굵고 기울임 (Bold & Italic)***: ***매우 강력한 강조 표현***
* ~~취소선 (Strikethrough)~~: ~~이전 버전의 변경된 내용~~
* `인라인 코드 (Inline Code)`: `const serverPort = 8080;` 또는 `npm run build`
* [하이퍼링크 (Link)](https://github.com/simonhaenisch/md-to-pdf): 외부 링크 밑줄 및 호버 효과 테스트
* **인라인 혼합**: **굵은 글씨 안의 `코드`** 와 [링크가 포함된 *기울임 텍스트*](https://example.com)
* HTML 인라인 태그:
  * 형광펜/마크: <mark>하이라이트(Mark) 텍스트</mark>
  * 키보드 단축키: <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd>
  * 첨자: H<sub>2</sub>O (아래첨자) 및 E = mc<sup>2</sup> (위첨자)
  * 밑줄: <u>밑줄 텍스트(Underline)</u>

---

## 2. 제목 계층 구조 (Headings Hierarchy)

각 제목 태그(`h1` ~ `h6`)의 크기, 굵기, 색상, 테두리(border-bottom) 및 여백이 계층적으로 적절한지 테스트합니다.

# H1 Header (문서 최상위 대제목)
## H2 Header (주요 섹션 구분 - 파란색 하단 라인)
### H3 Header (하위 섹션 - 연한 회색 라인)
#### H4 Header (상세 단락 헤더)
##### H5 Header (소단락 포인트 헤더 - 민트색)
###### H6 Header (최하위 헤더)

> **인쇄 팁**: 제목 요소 뒤에는 `break-after: avoid;`가 적용되어 제목만 페이지 하단에 홀로 남는 현상이 방지됩니다.

---

## 3. 목록 및 작업 목록 (Lists & Tasks)

### 3.1 순서 없는 목록 (Unordered List)
* 최상위 항목 1 (기본 불릿 스타일 및 `::marker` 색상 확인)
  * 2단계 중첩 항목 A
    * 3단계 중첩 항목 (원형/사각형 불릿)
    * 3단계 중첩 항목 2
  * 2단계 중첩 항목 B
* 최상위 항목 2: 긴 설명이 포함된 목록입니다. 줄바꿈이 발생할 때 들여쓰기와 마커 정렬이 어색하지 않고 자연스럽게 이어지는지 점검합니다.
* 최상위 항목 3

### 3.2 순서 있는 목록 (Ordered List)
1. 첫 번째 단계: 요구사항 분석 및 환경 설정
2. 두 번째 단계: 스타일시트 작성 및 컴포넌트 디자인
   1. 세부 단계 2-1: 폰트 스택 정의 (`Noto Sans KR`, `Inter`)
   2. 세부 단계 2-2: 인쇄 여백 및 페이지 분할 옵션 검증
3. 세 번째 단계: PDF 출력 및 레이아웃 검증

### 3.3 작업 목록 (Task List / Checklist)
- [x] 모던 CSS 변수 팔레트 구성 완료
- [x] A4 인쇄 규격 여백 최적화 (상하좌우 18mm)
- [x] 제목 및 테이블 페이지 경계 잘림 방지 스타일 적용
- [ ] 다크 모드 스타일시트 추가 검토
- [ ] 복합 다이어그램 렌더링 테스트

---

## 4. 인용구 및 콜아웃 (Blockquotes)

### 기본 인용구
> "디자인은 단순히 어떻게 보이고 느껴지는가의 문제가 아닙니다. 디자인은 어떻게 작동하느냐의 문제입니다."  
> — *스티브 잡스 (Steve Jobs)*

### 다중 단락 및 복합 요소가 포함된 인용구
> 인용구 내부에는 일반 텍스트뿐만 아니라 다양한 마크다운 서식이 함께 포함될 수 있습니다.
> 
> * 인용구 내 목록 1: `border-left` 민트색 포인트 바 점검
> * 인용구 내 목록 2: 이탤릭 폰트 및 부드러운 배경색(`--accent` 틴트)
> 
> ```bash
> echo "인용구 내부의 코드 블록도 문제없이 표시되어야 합니다."
> ```

### 중첩 인용구 (Nested Blockquote)
> 1단계 인용문 영역
>> 2단계 중첩 인용문: 추가 참고 사항이나 세부 권고사항을 기술할 때 사용됩니다.

---

## 5. 데이터 표 (Tables)

표의 헤더 배경색(`var(--primary-lt)`), 짝수 행 줄무늬(Zebra striping), 셀 여백(Padding), 텍스트 정렬, 테두리 반경이 정상적인지 테스트합니다.

### 5.1 기본 데이터 테이블 (정렬 테스트)

| HTTP 상태 코드 | 의미 (상태 설명) | 분류 (Category) | 권장 조치 |
| :--- | :---: | :--- | ---: |
| `200 OK` | 요청이 성공적으로 완료됨 | 성공 (Success) | 데이터 반환 |
| `201 Created` | 신규 리소스 생성 완료 | 성공 (Success) | 생성된 URI 반환 |
| `400 Bad Request` | 클라이언트의 잘못된 문법 | 오류 (Client Error) | 입력값 검증 필요 |
| `401 Unauthorized` | 유효한 인증 자격 증명 부재 | 보안 (Auth Error) | 로그인 페이지 리다이렉트 |
| `404 Not Found` | 요청 리소스를 찾을 수 없음 | 오류 (Client Error) | 리소스 경로 확인 |
| `500 Server Error` | 서버 내부 처리 중 예외 발생 | 오류 (Server Error) | 서버 로그 확인 필요 |

### 5.2 긴 콘텐츠와 복합 서식이 포함된 테이블

| 구성 요소 | 기술 스택 / 문법 | 적용 특징 및 비고 | 상태 |
| :--- | :--- | :--- | :---: |
| **타이포그래피** | `Noto Sans KR`, `Inter` | 한글 단어 끊김 방지(`keep-all`), 최적의 줄간격 `1.75` | <mark>적용됨</mark> |
| **코드 하이라이트** | Prism.js / Highlight.js | 다크 배경(`#1e2235`), 고정폭 폰트(`JetBrains Mono`) | <mark>적용됨</mark> |
| **페이지 분할** | `break-inside: avoid;` | 표나 코드 블록 중간이 페이지 경계에서 잘리지 않도록 보호 | <mark>적용됨</mark> |
| **반복 헤더** | `display: table-header-group;` | 테이블이 2페이지 이상 이어질 때 표 상단 헤더 자동 반복 | <mark>적용됨</mark> |

---

## 6. 코드 블록 (Code Blocks)

코드 블록의 어두운 배경 테마, 폰트 패밀리, 패딩, 테두리 둥글기 및 문법 하이라이팅을 점검합니다.

### 6.1 Bash 스크립트 (`pdf.sh`)
```bash
#!/usr/bin/env bash
set -e

# PDF 변환 기본 실행 스크립트 예제
TARGET_FILE="sample.md"

if [ -f "$TARGET_FILE" ]; then
  echo "📄 변환 시작: $TARGET_FILE"
  ./pdf.sh -p "$TARGET_FILE"
  echo "✅ 변환 완료: ${TARGET_FILE%.md}.pdf"
else
  echo "❌ 파일을 찾을 수 없습니다: $TARGET_FILE"
fi
```

### 6.2 JavaScript / TypeScript
```typescript
interface PdfOptions {
  format: 'A4' | 'Letter';
  printBackground: boolean;
  margin: {
    top: string;
    bottom: string;
    left: string;
    right: string;
  };
}

export function generatePdfConfig(marginMm: number = 18): PdfOptions {
  const marginStr = `${marginMm}mm`;
  return {
    format: 'A4',
    printBackground: true,
    margin: {
      top: marginStr,
      bottom: marginStr,
      left: marginStr,
      right: marginStr,
    },
  };
}
```

### 6.3 Python
```python
from pathlib import Path
from dataclasses import dataclass

@dataclass
class DocumentMetadata:
    title: str
    author: str
    version: str = "1.0.0"

    def summary(self) -> str:
        return f"[{self.version}] {self.title} by {self.author}"

if __name__ == "__main__":
    doc = DocumentMetadata(title="PDF Style Guide", author="Design Team")
    print(doc.summary())
```

### 6.4 JSON 설정
```json
{
  "name": "md-to-pdf-css-sample",
  "version": "1.0.0",
  "description": "Comprehensive markdown testing document",
  "scripts": {
    "build:pdf": "./pdf.sh sample.md",
    "build:pdf:paged": "./pdf.sh -p sample.md"
  },
  "keywords": ["markdown", "pdf", "css", "printing"],
  "license": "MIT"
}
```

---

## 7. 미디어 및 이미지 (Media & Images)

외부 이미지 및 인라인 벡터(SVG) 렌더링과 테두리 둥글기(`border-radius: var(--radius)`) 적용 상태를 확인합니다.

### 외부 이미지 (SVG 플레이스홀더 배지)
![Build Status](https://img.shields.io/badge/build-passing-brightgreen?style=flat-square)
![PDF Ready](https://img.shields.io/badge/A4_PDF-Optimized-3b6ef6?style=flat-square)
![License](https://img.shields.io/badge/license-MIT-blue?style=flat-square)

### 반응형 그래픽 샘플 (인라인 SVG)
<svg width="100%" height="60" viewBox="0 0 600 60" xmlns="http://www.w3.org/2000/svg" style="border-radius: 6px; overflow: hidden;">
  <defs>
    <linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#3b6ef6;stop-opacity:1" />
      <stop offset="50%" style="stop-color:#00b89c;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#e8445a;stop-opacity:1" />
    </linearGradient>
  </defs>
  <rect width="600" height="60" fill="url(#grad1)" />
  <text x="50%" y="50%" fill="#ffffff" font-family="'Noto Sans KR', sans-serif" font-size="16" font-weight="bold" dominant-baseline="middle" text-anchor="middle">
    🎨 md-to-pdf-css 컬러 그라디언트 배너 테스트
  </text>
</svg>

---

## 8. 특수 요소 및 HTML 컴포넌트

### 8.1 접기/펼치기 (Details & Summary)
<details>
<summary>▶ <strong>클릭하여 세부 기술 명세 확인</strong></summary>

이 영역은 기본적으로 숨겨져 있거나 브라우저 환경에 따라 펼쳐진 상태로 인쇄될 수 있는 `<details>` 태그입니다.
- 지원 환경: 최신 Chromium 렌더러
- 주요 용도: FAQ, 세부 로그, 부록(Appendix)
</details>

### 8.2 수평 분할선 (Horizontal Rules)
수평선은 그라디언트 페이드아웃 효과(`linear-gradient(to right, var(--primary), transparent)`)가 적용되어 있습니다.

---

### 8.3 페이지 분할 방지 묶음 테스트 (Keep Together)

특정 `h2`, `h3`와 하위 콘텐츠가 페이지 경계선에 걸치더라도 중간에서 잘리지 않고 한 덩어리로 유지되도록 하려면 `<section class="keep-together">` 또는 `<div class="keep-together">` 태그로 감싸줍니다:

<section class="keep-together">

#### 📌 한 페이지에 함께 유지되는 블록 (Keep-together Sample)
이 블록 내부의 콘텐츠(헤더, 문단, 표, 코드)는 페이지 경계선에 걸치더라도 중간에서 쪼개지지 않고 **통째로 한 페이지에 유지**됩니다.

| 항목 | 상태 | 설명 |
| :--- | :---: | :--- |
| `break-inside: avoid` | 적용됨 | 컨테이너 내부 분할 방지 |
| CSS 클래스 | `.keep-together` | `section` 및 `div` 태그 지원 |

```bash
# 한 묶음으로 유지되는 코드 블록
echo "이 코드 블록과 위 표는 절대 분리되지 않습니다."
```

</section>

---

### 8.4 수동 페이지 나누기 테스트 (Manual Page Break)
다음 단락 전에 명시적으로 페이지를 나누고 싶을 때 사용하는 태그입니다:
```html
<div style="page-break-after: always;"></div>
```

<div style="page-break-after: always;"></div>

## 9. 분할 페이지 검증 섹션 (Page Break Verification)

이 섹션은 위에서 실행된 수동 페이지 나누기(`<div style="page-break-after: always;"></div>`) 또는 `./pdf.sh -p` 옵션에 의해 새로운 페이지 상단에 단독으로 위치해야 하는 섹션입니다.

* **상단 여백**: 페이지 최상단에서 적절한 여백(18mm 마진)을 유지하는지 확인
* **헤더 렌더링**: 새로운 페이지의 첫 번째 헤더로 깔끔하게 렌더링되는지 확인
* **문서 종료**: 모든 테스트 케이스가 성공적으로 렌더링되었습니다.

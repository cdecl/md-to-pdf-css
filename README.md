# md-to-pdf-css

마크다운(`.md`) 문서를 깔끔하고 정돈된 A4 규격의 PDF 문서로 변환해 주는 툴킷입니다.  
Chromium 기반의 [`md-to-pdf`](https://github.com/simonhaenisch/md-to-pdf) 엔진과 인쇄에 최적화된 모던 스타일시트(`styles.css`), 그리고 가벼운 변환 스크립트(`pdf.sh`)로 구성되어 있습니다.

---

## 📁 디렉토리 구성

```text
md-to-pdf-css/
├── pdf.sh        # PDF 변환 실행 스크립트 (CLI)
├── styles.css    # 인쇄 및 A4 규격 최적화 CSS 스타일시트
└── README.md     # 매뉴얼 및 가이드
```

---

## 🛠️ 준비 작업 (Installation)

### 1. Node.js 확인
Node.js(18버전 이상 권장)가 설치되어 있어야 합니다.
```bash
node -v
```

### 2. md-to-pdf 글로벌 설치
```bash
npm install -g md-to-pdf
```

### 3. 스크립트 실행 권한 부여
```bash
chmod +x pdf.sh
```

> **Tip**: 어디서나 실행할 수 있도록 `~/bin` 또는 `PATH`에 등록하여 사용하는 것을 권장합니다.
> ```bash
> ln -s "$(pwd)/pdf.sh" ~/bin/pdf.sh
> ```

---

## 🚀 사용법 (Usage)

```bash
# 마크다운 파일을 PDF로 변환
./pdf.sh document.md
```

실행이 완료되면 마크다운 파일과 동일한 위치에 `document.pdf` 파일이 생성됩니다.

---

## ⚙️ `pdf.sh` 주요 로직

* **임시 파일 없는 심플한 파이프라인**:  
  임시 디렉토리(`mktemp`) 생성, 텍스트 치환(`awk`/`sed`), 파일 이동(`mv`) 등의 부가 과정을 없애고 원본 파일을 직접 가리켜 제자리에서 빠르게 PDF를 생성합니다.
* **고정 인쇄 규격 적용**:  
  `A4` 규격, 상하좌우 `18mm` 여백, 배경 그래픽 및 색상 인쇄(`printBackground: true`)를 기본 보장합니다.

---

## 🎨 `styles.css` 주요 스타일 특징

### 1. 타이포그래피 및 가독성
* **폰트 스택**: `Noto Sans KR`, `Apple SD Gothic Neo`, `Inter` 등 한글과 영문 가독성에 최적화된 산세리프 폰트 적용
* **기본 여백 & 줄간격**: 줄간격 `1.75`, `word-break: keep-all`로 한글 단어 끊김 현상 방지
* **색상 팔레트**: 신뢰감을 주는 모던 블루(`--primary: #3b6ef6`)를 기반으로 부드러운 배경색과 경계선 적용

### 2. 제목(Headings) 계층
* **`h1` (`#`)**: 대제목으로서 시각적 무게감을 주되, 불필요한 언더라인을 제거하여 깔끔하게 표시
* **`h2` (`##`)**: 주요 장/섹션 구분용. 포인트 컬러와 하단 언더라인 적용
* **`h3`, `h4` (`###`, `####`)**: 세로 바(`|`)를 제거하여 인용문처럼 보이지 않도록 개선하고, 은은한 연한 언더라인(`1px solid var(--border)`)으로 계층 분리

### 3. 인쇄 & 페이지 분할 최적화 (Print Pagination)
PDF 출력 시 페이지 경계선에서 내용이 잘리거나 어색해지는 현상을 CSS로 완벽히 방지합니다:

* **고아 제목(Orphan Heading) 및 제목-본문 분리 방지**:
  ```css
  h1, h2, h3, h4, h5, h6 {
    break-after: avoid;
    page-break-after: avoid;
  }
  h1 + *, h2 + *, h3 + *, h4 + *, h5 + *, h6 + * {
    break-before: avoid;
    page-break-before: avoid;
  }
  ```
  제목만 페이지 맨 밑에 홀로 남거나, 제목 바로 뒤의 첫 번째 콘텐츠가 다음 페이지로 분리되는 현상을 원천 차단합니다.
* **섹션 및 블록 한 덩어리로 묶기 (`keep-together`)**:
  `h2`나 `h3` 하위의 여러 문단/표/코드 블록이 페이지 경계에서 쪼개지지 않고 **한 페이지에 온전히 함께 유지**되도록 하려면 `<section class="keep-together">` 태그를 사용합니다:
  ```markdown
  <section class="keep-together">

  ### 세부 설정 가이드
  이곳의 설명 문단과 아래 표는 페이지 중간에서 잘리지 않고 항상 한 페이지에 묶여 표시됩니다.

  | 항목 | 값 |
  | :--- | :--- |
  | 설정A | 기본값 |

  </section>
  ```
  > **주의**: 블록 전체 높이가 A4 1페이지를 초과하면 인쇄 엔진에서 페이지 하단이 잘릴 수 있으므로, A4 1페이지 이내의 단위(주로 `h3` 하위 섹션)에 적용하는 것을 권장합니다.
* **콘텐츠 중간 잘림 방지 (`break-inside: avoid`)**:
  ```css
  table, tr, td, th, img, svg, figure, pre, blockquote, ul, ol, li {
    break-inside: avoid;
    page-break-inside: avoid;
  }
  ```
  * **표(`table`, `tr`)**: 행 중간에서 텍스트가 위아래로 갈라지지 않음
  * **이미지(`img`)**: 페이지 경계선에서 이미지가 반으로 쪼개지지 않음
  * **코드 블록(`pre`) / 인용구(`blockquote`)**: 박스 테두리와 코드가 온전한 블록 형태로 유지
  * **목록(`ul`, `ol`, `li`)**: 목록 아이템이 페이지 경계선에서 낱개로 쪼개지지 않고 목록 전체가 온전한 그룹으로 유지
* **표 헤더 자동 반복**:
  ```css
  thead {
    display: table-header-group;
  }
  ```
  긴 표가 다음 페이지로 이어질 경우 컬럼 헤더(`thead`)가 다음 페이지 상단에 자동으로 다시 출력됩니다.

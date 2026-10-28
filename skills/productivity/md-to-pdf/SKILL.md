---
name: md-to-pdf
description: "Convert markdown to professional A4 PDFs with custom CSS."
version: 0.1.0
author: cdecl, Hermes Agent
license: MIT
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [markdown, pdf, document, typography, printing, css]
    related_skills: [obsidian, docx, pdf]
---

# Markdown to PDF Skill

Convert markdown (`.md`) files into clean, professional A4 PDF documents using the `md-to-pdf-css` toolkit via `~/bin/pdf.sh`, ensuring proper pagination, typography, and layout.

## When to Use
- When converting documentation, reports, or notes from Markdown to a styled A4 PDF.
- When generating printable PDFs with consistent typography (`Noto Sans KR`, `Inter`) and page break protection.

## Prerequisites
- Node.js (v18+) and `md-to-pdf` installed globally (`npm install -g md-to-pdf`).
- Executable script available at `~/bin/pdf.sh`.

## How to Run
Convert any markdown file using the global bin script via `terminal`:
```python
terminal(command="pdf.sh path/to/document.md")
# or absolute path:
terminal(command="~/bin/pdf.sh path/to/document.md")
```

## CSS Pagination Rules
To prevent orphan headings or awkward page splits, use:
- `<section class="keep-together"> ... </section>` around sections that should stay on one page.
- Headings automatically avoid breaking after them.

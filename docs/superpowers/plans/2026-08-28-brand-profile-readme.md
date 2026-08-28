# Brand Profile README Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the plain centered GitHub profile README with the approved left-aligned Brand Authority design for Pavel Sorokin.

**Architecture:** GitHub renders the profile from one Markdown document and repository-owned SVG artwork. The header is a self-contained SVG so the branded gradient and typography render consistently; navigation, courses, and programs remain native Markdown links for accessibility and maintainability.

**Tech Stack:** GitHub Flavored Markdown, SVG 1.1, Shields.io badges, Git.

**Spec:** `/Users/pavelsorokin/.codex/visualizations/2026/08/27/01a0455a-4fea-7311-9c59-4ce35eefc620/.superpowers/brainstorm/84507-1787902579/content/github-profile-directions-v3.html` — option A (`brand-authority`).

## Global Constraints

- Keep all profile content left-aligned.
- Use Sorokin School purple `#B061FF` and `#7900F1` as the primary accent colors.
- Do not include the `JAVA · BACKEND · EDUCATION` eyebrow.
- Do not include selected projects or any project section.
- Show Telegram as a blue `#229ED9` button with the Telegram icon.
- Preserve six free YouTube courses and three paid Sorokin School programs.
- Use Russian copy.

---

### Task 1: Branded Header and Profile Content

**Files:**
- Create: `assets/profile-header.svg`
- Modify: `README.md`

**Interfaces:**
- Consumes: the approved option A layout and the existing public course/program URLs.
- Produces: a GitHub profile README rendered from `README.md` with a repository-owned banner at `assets/profile-header.svg`.

- [ ] **Step 1: Create the branded SVG header**

Create a `1200 × 300` SVG with rounded corners, a dark-to-purple gradient (`#100C15`, `#28133B`, `#7900F1`), subtle code decoration, and left-aligned copy:

```text
Павел Сорокин
Java Backend Engineer · Основатель Sorokin School
YooMoney, ВТБ · карточный эквайринг · инвестиционные продукты
Высоконагруженные банковские системы
```

- [ ] **Step 2: Validate the SVG**

Run: `xmllint --noout assets/profile-header.svg`

Expected: exit code `0` and no diagnostics.

- [ ] **Step 3: Replace the README structure**

Use the SVG as the first element with `align="left"`. Add three Shields.io link badges in this order:

```text
Sorokin School — #7900F1 — https://sorokin.school/
YouTube — #FF0000 — https://www.youtube.com/@sorokinpavel
Telegram — #229ED9 with Telegram logo — https://t.me/S0R0KlN
```

Add `Бесплатные курсы на YouTube` with these six native Markdown links:

```text
Spring Core с нуля — https://www.youtube.com/watch?v=7cDjSm-GasU
Redis + Spring Boot — https://www.youtube.com/watch?v=vW9O_FIg_70&t=47170s
Spring Boot с нуля до PRO — https://www.youtube.com/watch?v=KDrNL-uw3oc
Hibernate с нуля — https://www.youtube.com/watch?v=c7TIkimWk4g
Kafka для начинающих — https://www.youtube.com/watch?v=X2hCdgjvp00
Микросервисы на практике — https://www.youtube.com/watch?v=qkz5EFwKZuI
```

Add `Программы Sorokin School` with three visually accented program links:

```text
Java Backend, как в BigTech — https://sorokin.school/javabackend
Многопоточность в Java — https://sorokin.school/multithreading
Livecoding и алгоритмы — https://sorokin.school/livecoding
```

- [ ] **Step 4: Run local content checks**

Run:

```bash
rg -n "Избранные проекты|Mini Yandex|Spring Redis Course|Mini Payment System" README.md
rg -o "https://[^)> ]+" README.md | sort -u
```

Expected: the first command returns no matches; the second lists the school, social, six free-course, three program, and badge URLs.

- [ ] **Step 5: Verify external destinations**

Request every non-Shields URL listed in `README.md` with redirects enabled and record its HTTP status. GitHub, YouTube, Telegram, and Sorokin School URLs must return a reachable HTTP response rather than a DNS or connection error.

- [ ] **Step 6: Commit and publish**

Run:

```bash
git add README.md assets/profile-header.svg docs/superpowers/plans/2026-08-28-brand-profile-readme.md
git commit -m "feat: redesign profile README"
git push origin main
```

Expected: push succeeds and `origin/main` points to the new commit.

- [ ] **Step 7: Verify the public profile**

Open `https://github.com/psorokin02` and confirm the banner, three colored buttons, six free courses, and three Sorokin School programs render while no project section appears.

# Гайд по скиллам

## Совместимый набор (проверено)

Эти скиллы не конфликтуют между собой и дополняют друг друга.

### 1. Get Shit Done (GSD) -- workflow engine

**Что даёт:** spec-driven разработка, борьба с потерей контекста.

```bash
npx get-shit-done-cc@latest
# Выбрать: Claude Code → Global
# Проверить: /gsd:help
```

**Команды:**
- `/gsd:spec` -- создать спецификацию
- `/gsd:build` -- начать разработку по спеку
- `/gsd:verify` -- проверить результат

**Репо:** [github.com/gsd-build/get-shit-done](https://github.com/gsd-build/get-shit-done)

---

### 2. Claude Mem -- память между сессиями

**Что даёт:** автоматически сохраняет контекст. Агент "помнит" прошлые сессии.

```bash
# В Claude Code написать:
# "Install claude-mem from github.com/thedotmack/claude-mem"
# Или клонировать и следовать README
```

**Репо:** [github.com/thedotmack/claude-mem](https://github.com/thedotmack/claude-mem)

---

### 3. Everything Claude Code (выборочно) -- команды и правила

**Что даёт:** утилитарные команды для разработки.

```bash
git clone https://github.com/affaan-m/everything-claude-code.git /tmp/ecc

# Ставим ТОЛЬКО commands и rules:
cp -r /tmp/ecc/commands/* ~/.claude/commands/
cp -r /tmp/ecc/rules/* ~/.claude/rules/

# НЕ ставим agents/ и hooks/ (конфликт с GSD и Claude Mem)
```

**Команды:**
- `/tdd` -- test-driven development
- `/code-review` -- ревью кода
- `/learn` -- извлечь уроки из сессии
- `/plan` -- спланировать задачу
- `/build-fix` -- починить сборку

**Репо:** [github.com/affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code)

---

### 4. UI/UX Pro Max -- дизайн интерфейсов (опционально)

**Что даёт:** генерация design system, стилей, компонентов.

```bash
npm install -g uipro-cli
```

**Когда ставить:** если делаешь фронтенд/дизайн.

**Репо:** [github.com/nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)

---

### 5. Server Doctor -- диагностика серверов (для OpenClaw)

**Что даёт:** диагностика и ремонт серверов с OpenClaw, ботами, systemd/launchd.

```bash
mkdir -p ~/.claude/skills/server-doctor/
# Скопировать SKILL.md из репо OpenClaw
```

**Когда ставить:** если используешь OpenClaw на сервере.

---

## Важно: совместимость

| Скилл | Совместим с | Конфликтует с |
|-------|------------|---------------|
| GSD | Claude Mem, ECC commands, UI/UX, Server Doctor | Superpowers (не ставить оба!) |
| Claude Mem | GSD, ECC commands, UI/UX, Server Doctor | ECC hooks (не ставить оба!) |
| ECC commands/rules | Все | ECC agents/hooks с GSD/Claude Mem |
| UI/UX Pro Max | Все | Нет конфликтов |
| Server Doctor | Все | Нет конфликтов |

## Альтернативы (если не подходит GSD)

| Вместо | Альтернатива | Звёзды |
|--------|-------------|--------|
| GSD | **Superpowers** (`obra/superpowers`) | 104K |
| Claude Mem | **ECC hooks** (из everything-claude-code) | 94K |

Но не ставить GSD + Superpowers или Claude Mem + ECC hooks одновременно.

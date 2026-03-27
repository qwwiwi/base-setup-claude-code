# Base Setup Claude Code

Базовая настройка Claude Code для продуктивной работы. Шаблоны, скиллы, правила безопасности.

## Что внутри

```
├── CLAUDE.md                 # Шаблон правил для агента
├── .claude/
│   └── settings.json         # Permissions (deny/ask/allow)
├── tasks/
│   ├── todo.md               # Текущий план с чекбоксами
│   └── lessons.md            # Уроки из ошибок
├── docs/
│   ├── theory.md             # Теория: как работает Claude Code
│   ├── skills-guide.md       # Гайд по скиллам: что ставить
│   └── architecture.md       # Шаблон описания архитектуры
└── scripts/
    └── setup.sh              # Автоматическая установка скиллов
```

## Быстрый старт

### 1. Установи Claude Code
```bash
npm install -g @anthropic-ai/claude-code
claude  # авторизация через браузер
```

### 2. Склонируй этот репо в свой проект
```bash
git clone https://github.com/qwwiwi/base-setup-claude-code.git
cp -r base-setup-claude-code/{CLAUDE.md,.claude,tasks,docs} /путь/к/твоему/проекту/
```

### 3. Установи скиллы
```bash
# Автоматически:
bash scripts/setup.sh

# Или вручную (см. docs/skills-guide.md)
```

### 4. Отредактируй CLAUDE.md под свой проект
Замени `[плейсхолдеры]` на реальные данные проекта.

### 5. Проверь
```bash
cd /путь/к/проекту
claude
# Напиши: "Проверь структуру проекта и опиши что видишь"
```

## Совместимые скиллы

| Скилл | Роль | Установка |
|-------|------|-----------|
| **GSD** | Workflow: spec → plan → build | `npx get-shit-done-cc@latest` |
| **Claude Mem** | Память между сессиями | [README](https://github.com/thedotmack/claude-mem) |
| **ECC** (частично) | /tdd, /code-review, /learn | [README](https://github.com/affaan-m/everything-claude-code) |
| **UI/UX Pro Max** | Дизайн интерфейсов | `npm install -g uipro-cli` |
| **Server Doctor** | Диагностика серверов | Ручная установка |

Подробнее: [docs/skills-guide.md](docs/skills-guide.md)

## Чеклист готовности

- [ ] Claude Code установлен
- [ ] Авторизация пройдена
- [ ] settings.json с deny/ask правилами
- [ ] CLAUDE.md в корне проекта (до 150 строк)
- [ ] Папки tasks/, docs/ созданы
- [ ] GSD установлен: `/gsd:help` работает
- [ ] Claude Mem установлен
- [ ] Первый тест пройден

## Ссылки

- [Claude Code документация](https://docs.anthropic.com/en/docs/claude-code)
- [Awesome Claude Code](https://github.com/hesreallyhim/awesome-claude-code)
- [HLAB.SU](https://hlab.su) -- платформа с уроками

---

Made with Edge Lab

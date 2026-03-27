#!/bin/bash
# Base Setup Claude Code -- установка скиллов
# Использование: bash scripts/setup.sh

set -e

echo "=== Base Setup Claude Code ==="
echo ""

# Проверка Claude Code
if ! command -v claude &> /dev/null; then
    echo "Claude Code не установлен."
    echo "Установи: npm install -g @anthropic-ai/claude-code"
    exit 1
fi

echo "Claude Code: $(claude --version 2>/dev/null || echo 'установлен')"
echo ""

# Проверка npx
if ! command -v npx &> /dev/null; then
    echo "npx не найден. Установи Node.js 18+"
    exit 1
fi

# 1. GSD
echo "--- [1/3] Get Shit Done (GSD) ---"
echo "Устанавливаем..."
npx get-shit-done-cc@latest --claude --global 2>/dev/null && echo "GSD установлен." || {
    echo "Автоустановка не удалась. Запусти вручную:"
    echo "  npx get-shit-done-cc@latest"
    echo "  Выбери: Claude Code → Global"
}
echo ""

# 2. Claude Mem
echo "--- [2/3] Claude Mem ---"
CMEM_DIR="/tmp/claude-mem-install"
if [ ! -d "$CMEM_DIR" ]; then
    echo "Клонируем claude-mem..."
    git clone --depth 1 https://github.com/thedotmack/claude-mem.git "$CMEM_DIR" 2>/dev/null || true
fi
if [ -d "$CMEM_DIR" ] && [ -f "$CMEM_DIR/package.json" ]; then
    cd "$CMEM_DIR" && npm install 2>/dev/null && cd - > /dev/null
    echo "Claude Mem склонирован. Для активации:"
    echo "  В Claude Code напиши: /install-plugin $CMEM_DIR"
else
    echo "Установи вручную: git clone https://github.com/thedotmack/claude-mem.git"
fi
echo ""

# 3. ECC commands + rules
echo "--- [3/3] Everything Claude Code (commands + rules) ---"
ECC_DIR="/tmp/ecc-install"
if [ ! -d "$ECC_DIR" ]; then
    echo "Клонируем Everything Claude Code..."
    git clone --depth 1 https://github.com/affaan-m/everything-claude-code.git "$ECC_DIR" 2>/dev/null || true
fi

INSTALLED=0
if [ -d "$ECC_DIR/commands" ]; then
    mkdir -p ~/.claude/commands
    cp -r "$ECC_DIR/commands/"* ~/.claude/commands/ 2>/dev/null || true
    echo "Commands скопированы в ~/.claude/commands/"
    INSTALLED=1
fi

if [ -d "$ECC_DIR/rules" ]; then
    mkdir -p ~/.claude/rules
    cp -r "$ECC_DIR/rules/"* ~/.claude/rules/ 2>/dev/null || true
    echo "Rules скопированы в ~/.claude/rules/"
    INSTALLED=1
fi

if [ "$INSTALLED" -eq 0 ]; then
    echo "Не удалось установить ECC. Установи вручную:"
    echo "  git clone https://github.com/affaan-m/everything-claude-code.git /tmp/ecc"
    echo "  cp -r /tmp/ecc/commands/* ~/.claude/commands/"
    echo "  cp -r /tmp/ecc/rules/* ~/.claude/rules/"
fi

echo ""
echo "=== Установка завершена ==="
echo ""
echo "Проверь:"
echo "  1. Запусти: claude"
echo "  2. Напиши: /gsd:help"
echo "  3. Если работает -- всё готово"
echo ""
echo "Подробнее: docs/skills-guide.md"

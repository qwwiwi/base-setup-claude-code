#!/bin/bash
# Base Setup Claude Code -- автоматическая установка скиллов
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

# 1. GSD
echo "--- [1/3] Установка Get Shit Done (GSD) ---"
echo "Запусти вручную: npx get-shit-done-cc@latest"
echo "Выбери: Claude Code → Global"
echo ""

# 2. Claude Mem
echo "--- [2/3] Claude Mem ---"
echo "Установи через Claude Code:"
echo '  Написать: "Install claude-mem from github.com/thedotmack/claude-mem"'
echo ""

# 3. ECC commands + rules
echo "--- [3/3] Everything Claude Code (commands + rules) ---"
ECC_DIR="/tmp/ecc-install"

if [ ! -d "$ECC_DIR" ]; then
    echo "Клонируем Everything Claude Code..."
    git clone --depth 1 https://github.com/affaan-m/everything-claude-code.git "$ECC_DIR" 2>/dev/null
fi

if [ -d "$ECC_DIR/commands" ]; then
    mkdir -p ~/.claude/commands
    cp -r "$ECC_DIR/commands/"* ~/.claude/commands/ 2>/dev/null || true
    echo "Commands скопированы в ~/.claude/commands/"
fi

if [ -d "$ECC_DIR/rules" ]; then
    mkdir -p ~/.claude/rules
    cp -r "$ECC_DIR/rules/"* ~/.claude/rules/ 2>/dev/null || true
    echo "Rules скопированы в ~/.claude/rules/"
fi

echo ""
echo "=== Готово ==="
echo ""
echo "Чеклист:"
echo "  [1] GSD: npx get-shit-done-cc@latest"
echo "  [2] Claude Mem: установи через Claude Code"
echo "  [3] ECC commands/rules: установлены"
echo ""
echo "Проверь: запусти claude и напиши /gsd:help"

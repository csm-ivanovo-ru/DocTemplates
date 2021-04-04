"use strict";

module.exports = {
  // Добавим описание на русском языке ко всем типам
  types: [
    { value: "feat", name: "✨ - добавление нового функционала" },
    { value: "update", name: "  - Обновление функционала" },
    { value: "fix", name: "🐞 - исправление ошибок" },
    { value: "chore", name: "🔧 - changes to the build process or auxiliary tools and libraries such as documentation generation" },
    { value: "docs", name: "📝 - documentation only changes" },
    { value: "style", name: "🎨 - правки по стилю (отступы, точки, запятые и т.д.)" },
    { value: "refactor", name: "👷‍ - правки без исправления ошибок или добавления новых функций" },
    { value: "perf", name: "⚡️ - исправления, улучшающие производительность" },
    { value: "ci", name: "💨 - CONTINUOUS INTEGRATION: изменения в процессе сборки" },
    { value: "test", name: "✅ - Добавление тестов или исправления существующих тестов" },
    { value: "revert", name: "  - Откат на предыдущие версии" },
    { value: "WIP", name: "  - В процессе реализации..." },
    { value: "init", name: "  - Initial commit" }
  ],

  // Область. Она характеризует фрагмент кода, которую затронули изменения
  scopes: [
    { name: "ott" },
    { name: "odt" },
    { name: "design" },
    { name: "git" },
    { name: "other" },
    { name: "changelog" },
    { name: "readme" }
  ],

  // Возможность задать спец ОБЛАСТЬ для определенного типа типа изменения
  scopeOverrides: {
    init: [],
    ci: [],
    test: [
      { name: "ott" },
      { name: "odt" },
    ],
    docs: [
      { name: "changelog" },
      { name: "readme" },
      { name: "ott" },
      { name: "ci" },
      { name: "design" },
      { name: "git" },
      { name: "other" },
    ],
    perf: [
      { name: "ci" }
    ],
  },

  // Поменяем вопросы
  messages: {
    type: "ℹ️  - Укажите тип вносимых изменений:",
    scope: "⤴️  - Выберите ОБЛАСТЬ, в которую вносите измерения (опционально):",
    customScope: "⤴️  - Укажите свою ОБЛАСТЬ:",
    subject: "✏️  - Напишите КОРОТКОЕ описание в ПОВЕЛИТЕЛЬНОМ наклонении:\n",
    body: "📚  - Напишите ПОДРОБНОЕ описание (опционально). Используйте " | " для новой строки:\n",
    breaking: "💥  - Список BREAKING CHANGES (опционально):\n",
    footer: "📌  - Место для мета данных (билетов, ссылок и остального). Например: #5:\n",
    confirmCommit: "☑️  - Вас устраивает получившийся комментарий к изменению?"
  },

  allowCustomScopes: false,
  allowBreakingChanges: ["feat", "fix"],
  subjectLimit: 72,
  ticketNumberPrefix: "ISSUES:",
  breakingPrefix: "BREAKING CHANGE:",
  footerPrefix: "ISSUES",
  allowTicketNumber: true,
  isTicketNumberRequired: false,
  ticketNumberPrefix: '#',
  ticketNumberRegExp: '\\d{1,5}'
};

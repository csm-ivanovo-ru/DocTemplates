# Изменения, несовместимые с предыдущими версиями

Любые изменения, вызывающие несовместимость с предыдущими версиями,
должны быть документированы в этом файле.

Формат этого файла базируется на рекомендациях
[Keep a Changelog](https://keepachangelog.com/ru/1.0.0/).

Этот проект придерживается
[![Semantic Versioning](https://img.shields.io/static/v1?label=Semantic%20Versioning&message=v2.0.0&color=green&logo=semver)](https://semver.org/lang/ru/spec/v2.0.0.html).

<!--

## [Unreleased] Неопубликованные изменения (не вошедшие в релиз)

### Изменено

- поведение

### Устарело

- скоро будут удалены

### Удалено

- удалённые возможности

-->

## [3.0.0]

### Удалены

- убран бланк должностной / профессиональной инструкции
  (переведёны на продольный бланк по ГОСТ Р 7.0.97-2016)
  [csm-ivanovo-ru/DocTemplates#3](https://github.com/csm-ivanovo-ru/DocTemplates/issues/3)
- убран бланк доверенности / справки на фирменном бланке
  (переведены на продольный бланк по ГОСТ Р 7.0.97-2016)
  [csm-ivanovo-ru/DocTemplates#3](https://github.com/csm-ivanovo-ru/DocTemplates/issues/3)
- убраны стили, использованные для фирменных бланков ФБУ "Тест-С.-Петербург"
  [csm-ivanovo-ru/DocTemplates#3](https://github.com/csm-ivanovo-ru/DocTemplates/issues/3)
- убраны шрифты, использованные для фирменных бланков ФБУ "Тест-С.-Петербург"
  [csm-ivanovo-ru/DocTemplates#3](https://github.com/csm-ivanovo-ru/DocTemplates/issues/3)
- убраны стили поддержки оформления подписей, виз, сведений об ознакомлении
  в виде таблиц
  [csm-ivanovo-ru/DocTemplates#3](https://github.com/csm-ivanovo-ru/DocTemplates/issues/3)

### Изменено

- устранены использование стиля `Salutation` не по назначению
  [csm-ivanovo-ru/DocTemplates#13](https://github.com/csm-ivanovo-ru/DocTemplates/issues/13)
- стиль `Виза2` переименован в `Виза`
  (с переименованием зависимых стилей)
- стиль `ЗаписьОбОзнакомлении2` переименован в `ЗаписьОбОзнакомлении`
  (с переименованием зависимых стилей)

## [2.4.0]

### Изменено

- заполнение обращения к адресату реализовано через
  переменную `ВступительноеОбращение` (вместо `ПолучателиВОбращении`)
- оформление даты сведений об ознакомлении реализовано
  без таблиц, с помощью позиций табуляции
  [test-st-petersburg/DocTemplates#91](https://github.com/test-st-petersburg/DocTemplates/issues/91)
- оформление даты виз реализовано без таблиц, с помощью позиций табуляции
  [test-st-petersburg/DocTemplates#91](https://github.com/test-st-petersburg/DocTemplates/issues/91)
- оформление подписей (Подпись) и виз (Виза) реализовано без
  таблиц, с помощью позиций табуляции
  [test-st-petersburg/DocTemplates#91](https://github.com/test-st-petersburg/DocTemplates/issues/91)
- переменная документа `Название` переименована в `НазваниеДокумента`
  (Переменная `Название` воспринимается LibreOffice как переменная `Caption`)
- вступительное обращение в Письме перенесено в шаблон первой страницы
  [test-st-petersburg/DocTemplates#67](https://github.com/test-st-petersburg/DocTemplates/issues/67)
- шаблон Письмо включен в состав шаблона ОРД v2
  [test-st-petersburg/DocTemplates#67](https://github.com/test-st-petersburg/DocTemplates/issues/67)

## [2.3.0]

### Изменено

- команда **clean** теперь очищает не исходные каталоги,
  а каталоги с временными файлами и собранными документами и их шаблонами

## [2.0.0]

### Изменено

- шаблон Записки объединён с шаблоном ОРД
  (добавлен шаблон первого листа записки).
  Отдельный шаблон Записки более не поддерживается
  [test-st-petersburg/DocTemplates#67](https://github.com/test-st-petersburg/DocTemplates/issues/67)
- шаблон Документа СМК объединён с шаблоном ОРД
  (добавлен шаблон титульного листа).
  Отдельный шаблон Документа СМК более не поддерживается
  [test-st-petersburg/DocTemplates#46](https://github.com/test-st-petersburg/DocTemplates/issues/46)
  [test-st-petersburg/DocTemplates#67](https://github.com/test-st-petersburg/DocTemplates/issues/67)
- шаблон Внутренние документы преобразован в шаблон ОРД v2
  (Приказы, Распоряжения, Инструкции без титульного листа).
  Отдельный шаблон Внутренние документы более не поддерживается
  [test-st-petersburg/DocTemplates#46](https://github.com/test-st-petersburg/DocTemplates/issues/46)
- исключены стили абзацев Нумерованный список, Маркированный список
  (Письмо, ОРД)
  [test-st-petersburg/DocTemplates#68](https://github.com/test-st-petersburg/DocTemplates/issues/68)
- переименована библиотека макросов в `TestStPetersburg`
  (Письмо, ОРД)
  [test-st-petersburg/DocTemplates#71](https://github.com/test-st-petersburg/DocTemplates/issues/71)

[3.0.0]: https://github.com/csm-ivanovo-ru/DocTemplates/compare/2.9.11...3.0.0
[2.4.0]: https://github.com/test-st-petersburg/DocTemplates/compare/2.3.0...2.4.0
[2.3.0]: https://github.com/test-st-petersburg/DocTemplates/compare/2.2.0...2.3.0
[2.0.0]: https://github.com/test-st-petersburg/DocTemplates/compare/1.8.2...2.0.0

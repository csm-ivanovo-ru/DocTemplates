# Изменения, несовместимые с предыдущими версиями

Любые изменения, вызывающие несовместимость с предыдущими версиями,
должны быть документированы в этом файле.

Формат этого файла базируется на рекомендациях
[Keep a Changelog](https://keepachangelog.com/ru/1.0.0/).

Этот проект придерживается
[![Semantic Versioning](https://img.shields.io/static/v1?label=Semantic%20Versioning&message=v2.0.0&color=green&logo=semver)](https://semver.org/lang/ru/spec/v2.0.0.html).

## [Unreleased] Неопубликованные изменения (не вошедшие в релиз)

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

- устранены использование стиля `Salutation`не по назначению
  [csm-ivanovo-ru/DocTemplates#13](https://github.com/csm-ivanovo-ru/DocTemplates/issues/13)
- стиль `Виза2` переименован в `Виза`
  (с переименованием зависимых стилей)
- стиль `ЗаписьОбОзнакомлении2` переименован в `ЗаписьОбОзнакомлении`
  (с переименованием зависимых стилей)

## [2.4.0]

### Изменено

- заполнение обращения к адресату реализовано через
  переменную "ВступительноеОбращение" (вместо "ПолучателиВОбращении")
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

[Unreleased]: https://github.com/csm-ivanovo-ru/DocTemplates/compare/2.9.11...HEAD
[2.9.11]: https://github.com/csm-ivanovo-ru/DocTemplates/compare/2.9.10...2.9.11
[2.9.10]: https://github.com/csm-ivanovo-ru/DocTemplates/compare/2.9.9...2.9.10
[2.9.9]: https://github.com/test-st-petersburg/DocTemplates/compare/2.9.8...2.9.9
[2.9.8]: https://github.com/test-st-petersburg/DocTemplates/compare/2.9.7...2.9.8
[2.9.7]: https://github.com/test-st-petersburg/DocTemplates/compare/2.9.6...2.9.7
[2.9.6]: https://github.com/test-st-petersburg/DocTemplates/compare/2.9.5...2.9.6
[2.9.5]: https://github.com/test-st-petersburg/DocTemplates/compare/2.9.4...2.9.5
[2.9.4]: https://github.com/test-st-petersburg/DocTemplates/compare/2.9.3...2.9.4
[2.9.3]: https://github.com/test-st-petersburg/DocTemplates/compare/2.9.2...2.9.3
[2.9.2]: https://github.com/test-st-petersburg/DocTemplates/compare/2.9.1...2.9.2
[2.9.1]: https://github.com/test-st-petersburg/DocTemplates/compare/2.9.0...2.9.1
[2.9.0]: https://github.com/test-st-petersburg/DocTemplates/compare/2.8.19...2.9.0
[2.8.19]: https://github.com/test-st-petersburg/DocTemplates/compare/2.8.18...2.8.19
[2.8.18]: https://github.com/test-st-petersburg/DocTemplates/compare/2.8.17...2.8.18
[2.8.17]: https://github.com/test-st-petersburg/DocTemplates/compare/2.8.16...2.8.17
[2.8.16]: https://github.com/test-st-petersburg/DocTemplates/compare/2.8.15...2.8.16
[2.8.15]: https://github.com/test-st-petersburg/DocTemplates/compare/2.8.14...2.8.15
[2.8.14]: https://github.com/test-st-petersburg/DocTemplates/compare/2.8.13...2.8.14
[2.8.13]: https://github.com/test-st-petersburg/DocTemplates/compare/2.8.12...2.8.13
[2.8.12]: https://github.com/test-st-petersburg/DocTemplates/compare/2.8.11...2.8.12
[2.8.11]: https://github.com/test-st-petersburg/DocTemplates/compare/2.8.10...2.8.11
[2.8.10]: https://github.com/test-st-petersburg/DocTemplates/compare/2.8.9...2.8.10
[2.8.9]: https://github.com/test-st-petersburg/DocTemplates/compare/2.8.8...2.8.9
[2.8.8]: https://github.com/test-st-petersburg/DocTemplates/compare/2.8.7...2.8.8
[2.8.7]: https://github.com/test-st-petersburg/DocTemplates/compare/2.8.6...2.8.7
[2.8.6]: https://github.com/test-st-petersburg/DocTemplates/compare/2.8.5...2.8.6
[2.8.5]: https://github.com/test-st-petersburg/DocTemplates/compare/2.8.4...2.8.5
[2.8.4]: https://github.com/test-st-petersburg/DocTemplates/compare/2.8.3...2.8.4
[2.8.3]: https://github.com/test-st-petersburg/DocTemplates/compare/2.8.2...2.8.3
[2.8.1]: https://github.com/test-st-petersburg/DocTemplates/compare/2.8.0...2.8.1
[2.8.0]: https://github.com/test-st-petersburg/DocTemplates/compare/2.7.1...2.8.0
[2.7.1]: https://github.com/test-st-petersburg/DocTemplates/compare/2.7.0...2.7.1
[2.7.0]: https://github.com/test-st-petersburg/DocTemplates/compare/2.6.8...2.7.0
[2.6.8]: https://github.com/test-st-petersburg/DocTemplates/compare/2.6.7...2.6.8
[2.6.7]: https://github.com/test-st-petersburg/DocTemplates/compare/2.6.6...2.6.7
[2.6.6]: https://github.com/test-st-petersburg/DocTemplates/compare/2.6.5...2.6.6
[2.6.5]: https://github.com/test-st-petersburg/DocTemplates/compare/2.6.4...2.6.5
[2.6.4]: https://github.com/test-st-petersburg/DocTemplates/compare/2.6.3...2.6.4
[2.6.3]: https://github.com/test-st-petersburg/DocTemplates/compare/2.6.2...2.6.3
[2.6.2]: https://github.com/test-st-petersburg/DocTemplates/compare/2.6.1...2.6.2
[2.6.1]: https://github.com/test-st-petersburg/DocTemplates/compare/2.6.0...2.6.1
[2.6.0]: https://github.com/test-st-petersburg/DocTemplates/compare/2.5.3...2.6.0
[2.5.3]: https://github.com/test-st-petersburg/DocTemplates/compare/2.5.2...2.5.3
[2.5.2]: https://github.com/test-st-petersburg/DocTemplates/compare/2.5.1...2.5.2
[2.5.1]: https://github.com/test-st-petersburg/DocTemplates/compare/2.5.0...2.5.1
[2.5.0]: https://github.com/test-st-petersburg/DocTemplates/compare/2.4.0...2.5.0
[2.4.0]: https://github.com/test-st-petersburg/DocTemplates/compare/2.3.0...2.4.0
[2.3.0]: https://github.com/test-st-petersburg/DocTemplates/compare/2.2.0...2.3.0
[2.2.0]: https://github.com/test-st-petersburg/DocTemplates/compare/2.1.0...2.2.0
[2.1.0]: https://github.com/test-st-petersburg/DocTemplates/compare/2.0.0...2.1.0
[2.0.0]: https://github.com/test-st-petersburg/DocTemplates/compare/1.8.2...2.0.0
[1.8.2]: https://github.com/test-st-petersburg/DocTemplates/compare/1.8.1...1.8.2
[1.8.1]: https://github.com/test-st-petersburg/DocTemplates/compare/1.8.0...1.8.1
[1.8.0]: https://github.com/test-st-petersburg/DocTemplates/compare/1.7.0...1.8.0
[1.7.0]: https://github.com/test-st-petersburg/DocTemplates/compare/1.6.17...1.7.0
[1.6.17]: https://github.com/test-st-petersburg/DocTemplates/compare/1.6.16...1.6.17
[1.6.16]: https://github.com/test-st-petersburg/DocTemplates/compare/1.6.15...1.6.16
[1.6.15]: https://github.com/test-st-petersburg/DocTemplates/compare/1.6.14...1.6.15
[1.6.14]: https://github.com/test-st-petersburg/DocTemplates/compare/1.6.13...1.6.14
[1.6.13]: https://github.com/test-st-petersburg/DocTemplates/compare/1.6.12...1.6.13
[1.6.12]: https://github.com/test-st-petersburg/DocTemplates/compare/1.6.11...1.6.12
[1.6.11]: https://github.com/test-st-petersburg/DocTemplates/compare/1.6.10...1.6.11
[1.6.10]: https://github.com/test-st-petersburg/DocTemplates/compare/1.6.9...1.6.10
[1.6.9]: https://github.com/test-st-petersburg/DocTemplates/compare/1.6.8...1.6.9
[1.6.8]: https://github.com/test-st-petersburg/DocTemplates/compare/1.6.7...1.6.8
[1.6.7]: https://github.com/test-st-petersburg/DocTemplates/compare/1.6.6...1.6.7
[1.6.6]: https://github.com/test-st-petersburg/DocTemplates/compare/1.6.5...1.6.6
[1.6.5]: https://github.com/test-st-petersburg/DocTemplates/compare/1.6.4...1.6.5
[1.6.4]: https://github.com/test-st-petersburg/DocTemplates/compare/1.6.3...1.6.4
[1.6.3]: https://github.com/test-st-petersburg/DocTemplates/compare/1.6.2...1.6.3
[1.6.2]: https://github.com/test-st-petersburg/DocTemplates/compare/1.6.1...1.6.2
[1.6.1]: https://github.com/test-st-petersburg/DocTemplates/compare/1.6.0...1.6.1
[1.6.0]: https://github.com/test-st-petersburg/DocTemplates/compare/1.5.6...1.6.0
[1.5.6]: https://github.com/test-st-petersburg/DocTemplates/compare/1.5.5...1.5.6
[1.5.5]: https://github.com/test-st-petersburg/DocTemplates/compare/1.5.4...1.5.5
[1.5.4]: https://github.com/test-st-petersburg/DocTemplates/compare/1.5.1...1.5.4
[1.5.1]: https://github.com/test-st-petersburg/DocTemplates/compare/1.5.0...1.5.1
[1.5.0]: https://github.com/test-st-petersburg/DocTemplates/compare/1.4.3...1.5.0
[1.4.3]: https://github.com/test-st-petersburg/DocTemplates/compare/1.4.2...1.4.3
[1.4.2]: https://github.com/test-st-petersburg/DocTemplates/compare/1.4.1...1.4.2
[1.4.1]: https://github.com/test-st-petersburg/DocTemplates/compare/1.4.0...1.4.1
[1.4.0]: https://github.com/test-st-petersburg/DocTemplates/compare/1.3.0...1.4.0
[1.3.0]: https://github.com/test-st-petersburg/DocTemplates/compare/1.2.0...1.3.0
[1.2.0]: https://github.com/test-st-petersburg/DocTemplates/compare/1.1.0...1.2.0
[1.1.0]: https://github.com/test-st-petersburg/DocTemplates/compare/1.0.0...1.1.0
[1.0.0]: https://github.com/test-st-petersburg/DocTemplates/compare/0.2.0...1.0.0
[0.2.0]: https://github.com/test-st-petersburg/DocTemplates/compare/0.1.0...0.2.0
[0.1.0]: https://github.com/test-st-petersburg/DocTemplates/releases/tag/0.1.0

# Журнал изменений

Формат этого файла базируется на рекомендациях
[Keep a Changelog](https://keepachangelog.com/ru/1.0.0/).

Этот проект придерживается
[![Semantic Versioning](https://img.shields.io/static/v1?label=Semantic%20Versioning&message=v2.0.0&color=green&logo=semver)](https://semver.org/lang/ru/spec/v2.0.0.html).

<!--

## [Unreleased] Неопубликованные изменения (не вошедшие в релиз)

### Добавлено

- feature

### Изменено

- поведение

### Устарело

- скоро будут удалены

### Удалено

- удалённые возможности

### Исправлено

- исправлены ошибки

### Безопасность

- устранены уязвимости

-->

## [Unreleased] Неопубликованные изменения (не вошедшие в релиз)

### Добавлено

- для телефонов в справочных сведениях об учреждении
  добавлена гиперссылка
  по [RFC 3966](https://www.ietf.org/rfc/rfc3966.html)
  [csm-ivanovo-ru/DocTemplates#19](https://github.com/csm-ivanovo-ru/DocTemplates/issues/19)
- для адреса сайта в справочных сведениях об учреждении
  добавлена гиперссылка
  [csm-ivanovo-ru/DocTemplates#19](https://github.com/csm-ivanovo-ru/DocTemplates/issues/19)
- для адреса почты в справочных сведениях об учреждении
  добавлена гиперссылка
  по [RFC 6068](https://www.ietf.org/rfc/rfc6068.html)
  [csm-ivanovo-ru/DocTemplates#19](https://github.com/csm-ivanovo-ru/DocTemplates/issues/19)
- для адреса регистрации в справочных сведениях об учреждении
  добавлена гиперссылка (для карт Яндекса).
  [RFC 5870](https://www.ietf.org/rfc/rfc5870.html)
  не используем из-за отсутствия должной поддержки в Windows
  [csm-ivanovo-ru/DocTemplates#19](https://github.com/csm-ivanovo-ru/DocTemplates/issues/19)

## [3.0.2]

### Исправлено

- исправлена пунктуация в справочных сведениях об учреждении
  [csm-ivanovo-ru/DocTemplates#20](https://github.com/csm-ivanovo-ru/DocTemplates/issues/20)

## [3.0.1]

### Исправлено

- исправлены ошибки в `IT-Service/New-ReleaseNotesFromChangeLog@v1.2.0`
  при публикации релиза на GitHub
  [csm-ivanovo-ru/DocTemplates#6](https://github.com/csm-ivanovo-ru/DocTemplates/issues/6)

## [3.0.0]

### Добавлено

- добавлен шаблон первой страницы исходящего документа,
  продольный бланк организации по ГОСТ Р 7.0.97-2016
  `БланкОРДПервыйЛистПисьмаГОСТПродольный`
  [csm-ivanovo-ru/DocTemplates#3](https://github.com/csm-ivanovo-ru/DocTemplates/issues/3)
- добавлен шаблон первой страницы исходящего документа,
  угловой бланк организации по ГОСТ Р 7.0.97-2016
  `БланкОРДПервыйЛистПисьмаГОСТУгловой`
  [csm-ivanovo-ru/DocTemplates#3](https://github.com/csm-ivanovo-ru/DocTemplates/issues/3)

### Изменено

- логотип организации заменён на Герб РФ
  [csm-ivanovo-ru/DocTemplates#1](https://github.com/csm-ivanovo-ru/DocTemplates/issues/1)
- исправлено оформление вида документа во внутренней переписке
  (по ГОСТ Р 7.0.97-2016)
  [csm-ivanovo-ru/DocTemplates#3](https://github.com/csm-ivanovo-ru/DocTemplates/issues/3)
- оформление первого листа должностной инструкции приведено в соответствие
  с ГОСТ Р 7.0.97-2016
  [csm-ivanovo-ru/DocTemplates#3](https://github.com/csm-ivanovo-ru/DocTemplates/issues/3)
- нормализованы разделы "Сведения об исполнителе и деле"
- нормализованы разделы первого листа служебных записок
  и горизонтального бланка письма по ГОСТ Р 7.0.97-2016
- добавлена информация о федеральном агентстве
  [csm-ivanovo-ru/DocTemplates#3](https://github.com/csm-ivanovo-ru/DocTemplates/issues/3)
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
- стиль `Виза2` переименован в `Виза`
  (с переименованием зависимых стилей)
- стиль `ЗаписьОбОзнакомлении2` переименован в `ЗаписьОбОзнакомлении`
  (с переименованием зависимых стилей)

### Исправлено

- восстановлено выравнивание подписей для Libre Writer 7.1+
  (добавлена опция `TabOverSpacing`)
  [csm-ivanovo-ru/DocTemplates#2](https://github.com/csm-ivanovo-ru/DocTemplates/issues/2)
- устранены ошибки при использовании `GitVersion`
  [csm-ivanovo-ru/DocTemplates#12](https://github.com/csm-ivanovo-ru/DocTemplates/issues/12)
- устранены использование стиля `Salutation`не по назначению
  [csm-ivanovo-ru/DocTemplates#13](https://github.com/csm-ivanovo-ru/DocTemplates/issues/13)

## [2.9.11]

### Исправлено

- устранена несовместимость с новой версией `gitversion`
  (переименован исполняемый файл в `dotnet-gitversion`)

## [2.9.10]

### Изменено

- заимствован проект из test-st-petersburg в csm-ivanovo-ru

## [2.9.9]

### Изменено

- изменены описания GitHub Actions и добавлены к ним свойства
  (по примеру https://github.com/actions/starter-workflows)

## [2.9.8]

### Исправлено

- устранены ошибки при восстановлении nuget пакетов
  при отсутствии конфигурации nuget
  [test-st-petersburg/DocTemplates#176](https://github.com/test-st-petersburg/DocTemplates/issues/176)

## [2.9.7]

### Исправлено

- устранены замечания по качеству кода (build сценариев)

## [2.9.6]

### Изменено

- необходимые зависимости устанавливаются через PSDepend
  [test-st-petersburg/DocTemplates#34](https://github.com/test-st-petersburg/DocTemplates/pull/34)

## [2.9.5]

### Добавлено

- публикация результатов тестирования на GitHub (в комментариях к запуску workflow)

### Изменено

- расширена проверка PowerShell сценариев (сценарии сборки, тестирования)

## [2.9.4]

### Изменено

- версия Saxon HE обновлена до 10.6.0
  [test-st-petersburg/DocTemplates#170](https://github.com/test-st-petersburg/DocTemplates/pull/170)
- убран fix-saxon.xslt

## [2.9.3]

### Добавлено

- автоматическое обновление пакетов QRCoder, Saxon HE, ODFValidator
  [test-st-petersburg/DocTemplates#165](https://github.com/test-st-petersburg/DocTemplates/issues/165)

## [2.9.2]

### Исправлено

- исправлена ошибка загрузки артефактов doc при сборке на GitHub
  (GitHub action 'Build ant test')

### Изменено

- добавлена задача сборки 'pre-build' в целях установки необходимых инструментов
  для сборки
- выделена задача для установки nuget
- добавлена задача сборки 'distclean' в целях соответствия
  [стандартным целям make](https://www.gnu.org/software/make/manual/html_node/Standard-Targets.html)
- добавлена задача сборки 'maintainer-clean' в целях соответствия
  [стандартным целям make](https://www.gnu.org/software/make/manual/html_node/Standard-Targets.html)
- добавлена задача сборки 'check' в целях соответствия
  [стандартным целям make](https://www.gnu.org/software/make/manual/html_node/Standard-Targets.html)
- добавлена задача сборки 'all' в целях соответствия
  [стандартным целям make](https://www.gnu.org/software/make/manual/html_node/Standard-Targets.html)
- переименованы задачи сборки в целях соответствия
  [стандартным целям make](https://www.gnu.org/software/make/manual/html_node/Standard-Targets.html)
- сборка для XSLT 3.0 Saxon HE устанавливается с помощью NuGet CLI и
  packages.config
  [test-st-petersburg/DocTemplates#161](https://github.com/test-st-petersburg/DocTemplates/issues/161)

## [2.9.1]

### Исправлено

- исправлена ошибка при сборке на GitHub (убран параметр Version для build.ps1)
  (GitHub action 'Release to GihHub')
- устранено замечание по качеству кода Update-FileLastWriteTime.ps1:
  "Command accepts pipeline input but has not defined a process block".
- устранено замечание по качеству кода:
  "The cmdlet 'Write-CompilerWarningAndErrors' uses a plural noun.
  A singular noun should be used instead".
- устранено замечание по качеству кода Out-vCardFile.ps1:
  "Command accepts pipeline input but has not defined a process block".

## [2.9.0]

### Добавлено

- добавлен дополнительный этап обработки в XSLT при подготовке для Android
  [test-st-petersburg/DocTemplates#126](https://github.com/test-st-petersburg/DocTemplates/issues/126)
- добавлена в XML схему (XSD) для визитных карт (xCard)
  поддержка `X-GROUP-MEMBERSHIP`
  [test-st-petersburg/DocTemplates#126](https://github.com/test-st-petersburg/DocTemplates/issues/126)
- добавлена XML схема (XSD) для визитных карт (xCard)
  [test-st-petersburg/DocTemplates#117](https://github.com/test-st-petersburg/DocTemplates/issues/117)
- добавлена конвертация xCard в vCard версии 4.0
  [test-st-petersburg/DocTemplates#118](https://github.com/test-st-petersburg/DocTemplates/issues/118)

### Изменено

- выделены сценарии сборки библиотек и их контейнеров
  [test-st-petersburg/DocTemplates#133](https://github.com/test-st-petersburg/DocTemplates/issues/133)
- выделены сценарии сборки QR кодов для URI
  [test-st-petersburg/DocTemplates#133](https://github.com/test-st-petersburg/DocTemplates/issues/133)
- выделены сценарии сборки QR кодов для xCard/vCard
  [test-st-petersburg/DocTemplates#133](https://github.com/test-st-petersburg/DocTemplates/issues/133)
- выделены сценарии сборки шаблонов документов
  [test-st-petersburg/DocTemplates#133](https://github.com/test-st-petersburg/DocTemplates/issues/133)
- выделены отдельные папки для объединения нескольких генерируемых файлов
  документов
  [test-st-petersburg/DocTemplates#132](https://github.com/test-st-petersburg/DocTemplates/issues/132)
- выделены сценарии сборки документов
  [test-st-petersburg/DocTemplates#133](https://github.com/test-st-petersburg/DocTemplates/issues/133)
- сборка для обработки QR кодов устанавливается с помощью NuGet CLI и
  packages.config
  [test-st-petersburg/DocTemplates#167](https://github.com/test-st-petersburg/DocTemplates/issues/167)

### Исправлено

- fix XSLT.resources.xsltPackages paths

## [2.8.19]

### Исправлено

- устранено замечание по качеству кода:
  "The cmdlet 'Write-CompilerWarningAndErrors' uses a plural noun.
  A singular noun should be used instead".

## [2.8.18]

### Исправлено

- исправлены ошибки тестов PS-Rule

## [2.8.17]

### Изменено

- ODF Validator загружается при помощи maven и pom.xml
  [test-st-petersburg/DocTemplates#159](https://github.com/test-st-petersburg/DocTemplates/issues/159)

## [2.8.16]

### Изменено

- разделы подписи в документах на фирменном бланке заменены
  ссылкой (`text:section-source`) в целях нормализации
  [test-st-petersburg/DocTemplates#135](https://github.com/test-st-petersburg/DocTemplates/issues/135)

### Исправлено

- исправлена ошибка сборки документов для случая, когда
  `text:section-source[ not @xlink:title ]`
- восстановление включение разделов (`text:section-source`)
  во время сборки документов и шаблонов
  [test-st-petersburg/DocTemplates#81](https://github.com/test-st-petersburg/DocTemplates/issues/81)

## [2.8.15]

### Исправлено

- исправлена ошибка выравнивания при использовании нумерованного списка
  для заголовков
  (исключено использование отступа для первой строки из стилей списков)
  [test-st-petersburg/DocTemplates#111](https://github.com/test-st-petersburg/DocTemplates/issues/111)

## [2.8.14]

### Исправлено

- исправлены ошибки при создании релиза без соответствующей вехи
  [test-st-petersburg/DocTemplates#153](https://github.com/test-st-petersburg/DocTemplates/issues/153)

### Изменено

- изменено тестирование через Pester,
  обеспечена поддержка консоли тестирования в VSCode
  [test-st-petersburg/DocTemplates#156](https://github.com/test-st-petersburg/DocTemplates/issues/156)

## [2.8.13]

### Исправлено

- исправлена генерация release notes

## [2.8.12]

### Добавлено

- добавлена проверка собранных файлов документов с помощью ODF Validator
  [test-st-petersburg/DocTemplates#146](https://github.com/test-st-petersburg/DocTemplates/issues/146)
- добавлено тестирование через Pester,
  в том числе - и через [ODF Validator](https://odfvalidator.org)
  [test-st-petersburg/DocTemplates#156](https://github.com/test-st-petersburg/DocTemplates/issues/156)

## [2.8.11]

### Исправлено

- исправлены ошибки проверки [ODF Validator](https://odfvalidator.org)
  [test-st-petersburg/DocTemplates#147](https://github.com/test-st-petersburg/DocTemplates/issues/147)

## [2.8.10]

### Исправлено

- удалены декларации DOCTYPE из XML файлов документов
  [test-st-petersburg/DocTemplates#110](https://github.com/test-st-petersburg/DocTemplates/issues/110)
- добавлена Relax NG схема .odt файлов и .ott файлов
  [test-st-petersburg/DocTemplates#110](https://github.com/test-st-petersburg/DocTemplates/issues/110)

## [2.8.9]

### Исправлено

- исправлена конфигурация в commitlint.config.js,
  для исправления ошибок проверки сообщений dependabot
  [test-st-petersburg/DocTemplates#144](https://github.com/test-st-petersburg/DocTemplates/issues/144)

## [2.8.8]

### Добавлено

- добавлена проверка комментариев к commit для запросов слияния
  [test-st-petersburg/DocTemplates#141](https://github.com/test-st-petersburg/DocTemplates/issues/141)

## [2.8.7]

### Исправлено

- исправлено оформление подписи в письме на бланке (курсив, полужирный)
  [test-st-petersburg/DocTemplates#135](https://github.com/test-st-petersburg/DocTemplates/issues/135)

## [2.8.6]

### Исправлено

- исправлено поведение Release to GitHub при отсутствии опубликованного релиза
  [test-st-petersburg/DocTemplates#140](https://github.com/test-st-petersburg/DocTemplates/issues/140)

## [2.8.5]

### Исправлено

- убраны из readme упоминания о работе без GIT.
  [test-st-petersburg/DocTemplates#136](https://github.com/test-st-petersburg/DocTemplates/issues/136)

## [2.8.4]

### Исправлено

- отключен Static Scan GitHub Action для Dependabot "push" событий.
  Оставлена активация только для Dependabot "pull_request" событий
  [test-st-petersburg/DocTemplates#137](https://github.com/test-st-petersburg/DocTemplates/issues/137)

## [2.8.3]

### Добавлено

- автоматизировано создание выпуска (release) на GitHub Releases
  и заполнение его информацией
  [test-st-petersburg/DocTemplates#37](https://github.com/test-st-petersburg/DocTemplates/issues/37)
- настроена сборка файлов через GitHub Actions и их публикация
  в GitHub Releases
  [test-st-petersburg/DocTemplates#37](https://github.com/test-st-petersburg/DocTemplates/issues/37)

## [2.8.1]

### Исправлено

- после абзаца со стилем "ЗаголовокВиз" должен следовать абзац со стилем визы (Виза)
  [test-st-petersburg/DocTemplates#112](https://github.com/test-st-petersburg/DocTemplates/issues/112)
- заменены в шаблоне распоряжения слова "приказываю" на "обязываю" либо "предлагаю".
  [test-st-petersburg/DocTemplates#113](https://github.com/test-st-petersburg/DocTemplates/issues/113)

## [2.8.0]

### Добавлено

- добавлена заготовка справки на фирменном бланке
  [test-st-petersburg/DocTemplates#92](https://github.com/test-st-petersburg/DocTemplates/issues/92)
- добавлен шаблон справки на фирменном бланке
  [test-st-petersburg/DocTemplates#92](https://github.com/test-st-petersburg/DocTemplates/issues/92)
- добавлена заготовка профессиональной инструкции
  [test-st-petersburg/DocTemplates#92](https://github.com/test-st-petersburg/DocTemplates/issues/92)
- добавлен шаблон профессиональной инструкции
  [test-st-petersburg/DocTemplates#92](https://github.com/test-st-petersburg/DocTemplates/issues/92)

## [2.7.1]

### Исправлено

- исправлена конфигурация commitizen
  (ради восстановления записи номеров issues в текст сообщения)

## [2.7.0]

### Добавлено

- добавлена заготовка доверенности на фирменном бланке
  [test-st-petersburg/DocTemplates#45](https://github.com/test-st-petersburg/DocTemplates/issues/45)
- добавлен шаблон доверенности на фирменном бланке
  [test-st-petersburg/DocTemplates#45](https://github.com/test-st-petersburg/DocTemplates/issues/45)

## [2.6.8]

### Исправлено

- Убрать ошибочное определение в качестве ошибки сообщения
  "Skipping up-to-date output..."
  [test-st-petersburg/DocTemplates#106](https://github.com/test-st-petersburg/DocTemplates/issues/106)

## [2.6.7]

### Изменено

- при подготовке для печати на типографский бланк отключаем печать не только для
  врезок (текстовых фреймов), но и для графики, наименование которой начинается
  с префикса "Бланки:"

## [2.6.6]

### Исправлено

- отключен вывод "шкалы" РСТ и QR кода в подвале на печать
  при печати на типографском бланке
  [test-st-petersburg/DocTemplates#105](https://github.com/test-st-petersburg/DocTemplates/issues/105)

### Изменено

- восстановлена панель инструментов "Бланки" в ОРД
  (для подготовки документов к печати на типографском фирменном бланке)

## [2.6.5]

### Добавлено

- добавлена заготовка сопроводительного письма (со связанным документом)

## [2.6.4]

### Добавлено

- добавлена заготовка письма сопроводительного к актам сверки

## [2.6.3]

### Исправлено

- в "заготовки" писем добавлены переменные из устаревших
  версий шаблона ОРД (для обеспечения совместимости новых версий
  правил автозаполнения со старыми версиями файлов)
  [test-st-petersburg/DocTemplates#109](https://github.com/test-st-petersburg/DocTemplates/issues/109)

## [2.6.2]

### Исправлено

- "шкала" РСТ и QR код в подвале защищены от изменений
  [test-st-petersburg/DocTemplates#105](https://github.com/test-st-petersburg/DocTemplates/issues/105)

## [2.6.1]

### Исправлено

- Убрать ошибочное определение в качестве ошибки сообщения
  "Skipping up-to-date output..."
  [test-st-petersburg/DocTemplates#106](https://github.com/test-st-petersburg/DocTemplates/issues/106)

## [2.6.0]

### Добавлено

- добавлена заготовка письма о коммерческом предложении
  на работы в сфере обеспечения единства измерений
  [test-st-petersburg/DocTemplates#104](https://github.com/test-st-petersburg/DocTemplates/issues/104)

### Изменено

- изменена форма фирменного бланка в соответствии с требованиями
  приказа ФБУ "Тест-С.-Петербург" от 05.03.2021 № 35/ахд
  [test-st-petersburg/DocTemplates#105](https://github.com/test-st-petersburg/DocTemplates/issues/105)
- QR-код из фирменного бланка изменён для указания на раздел сайта
  с контактами филиала
  [test-st-petersburg/DocTemplates#105](https://github.com/test-st-petersburg/DocTemplates/issues/105)
- при оптимизации удаляем автоматические стили
  (для минимизации изменений из-за перенумерации автоматических стилей).
  При сборке - автоматически генерируем автоматические стили
  [test-st-petersburg/DocTemplates#62](https://github.com/test-st-petersburg/DocTemplates/issues/62)

## [2.5.3]

### Исправлено

- В визах должна быть указана дата
  [test-st-petersburg/DocTemplates#66](https://github.com/test-st-petersburg/DocTemplates/issues/66)

## [2.5.2]

### Исправлено

- в "заготовку" служебной записки добавлены переменные из устаревших
  версий шаблона ОРД (для обеспечения совместимости новых версий
  правил автозаполнения со старыми версиями файлов)

## [2.5.1]

### Добавлено

- исправлена заготовка должностной инструкции
  [test-st-petersburg/DocTemplates#92](https://github.com/test-st-petersburg/DocTemplates/issues/92)

### Исправлено

- титульный лист должностной инструкции приведён в соответствие с требованиями
  СТО организации
  [test-st-petersburg/DocTemplates#95](https://github.com/test-st-petersburg/DocTemplates/issues/95)

## [2.5.0]

### Добавлено

- добавлена заготовка распоряжения
  [test-st-petersburg/DocTemplates#92](https://github.com/test-st-petersburg/DocTemplates/issues/92)

### Исправлено

- отключена проверка орфографии для стиля `Штрихкод`
  [test-st-petersburg/DocTemplates#95](https://github.com/test-st-petersburg/DocTemplates/issues/95)
- устранена проблема с падением просмотра перед печатью
  распоряжений и приказов
  [test-st-petersburg/DocTemplates#93](https://github.com/test-st-petersburg/DocTemplates/issues/93)

### Изменено

- добавлен шаблон страницы `БланкОРДПервыйЛистСГрифомУтверждения`,
  из шаблона страницы `БланкОРДПервыйЛист` убран гриф утверждения
  [test-st-petersburg/DocTemplates#93](https://github.com/test-st-petersburg/DocTemplates/issues/93)
- добавлен служебный скрытый раздел "РазделяемыеКомпоненты" в content.xml.
  Добавлено его слияние с шаблоном при сборке документов.
  Сейчас в этом разделе размещён шаблон оформления даты подписи.
  В местах использование дублирование кода исключено за счёт
  `text:section-source`
  (замещается кодом при сборке шаблонов и документов)
  [test-st-petersburg/DocTemplates#81](https://github.com/test-st-petersburg/DocTemplates/issues/81)

## [2.4.0]

### Добавлено

- при сборке документа из него удаляются внедрённые шрифты,
  если в настройках установлен запрет внедрения шрифтов
  (необходимо в случае, когда в шаблон внедрены шрифты, но для конкретного
  документа на базе этого шаблона внедрения шрифтов не требуется)
  [test-st-petersburg/DocTemplates#90](https://github.com/test-st-petersburg/DocTemplates/issues/90)
- добавление слияние настроек документа и шаблона при сборке документов
  [test-st-petersburg/DocTemplates#90](https://github.com/test-st-petersburg/DocTemplates/issues/90)

### Изменено

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

- в документы и шаблоны включаются только файлы, указанные в манифесте
  [test-st-petersburg/DocTemplates#74](https://github.com/test-st-petersburg/DocTemplates/issues/74)
- реализована сборка документов на базе шаблонов репозитория
  с включением файлов шаблонов в документа.
  (на этапе препроцессирования).
  В том числе объединяются разделы следующие разделы content.xml:

  - `office:document-content/office:scripts/office:event-listeners`
  - `office:document-content/office:font-face-decls`
  - `office:document-content/office:body/office:text/text:variable-decls`
  - `office:document-content/office:body/office:text/text:section[@text:name="Служебный"]`

  [test-st-petersburg/DocTemplates#75](https://github.com/test-st-petersburg/DocTemplates/issues/75)
- библиотека TestStPetersburg удалена из состава шаблонов документов
  и внедряется на этапе сборки шаблонов документов
  (на этапе препроцессирования)
  [test-st-petersburg/DocTemplates#83](https://github.com/test-st-petersburg/DocTemplates/issues/83)
- "исходные" файлы документов и шаблонов после препроцессора
  хранятся в подкаталоге 'tmp/template' рабочего каталога
  [test-st-petersburg/DocTemplates#83](https://github.com/test-st-petersburg/DocTemplates/issues/83)
- добавлена возможность подготовки контейнеров библиотек
  для последующего включения в состав документов, шаблонов документов
  (команда сборки `BuildLibContainers`)
  [test-st-petersburg/DocTemplates#83](https://github.com/test-st-petersburg/DocTemplates/issues/83)
- добавлена возможность сборки библиотек макросов из "исходных" файлов
  (команда сборки `BuildLibs`)
  [test-st-petersburg/DocTemplates#43](https://github.com/test-st-petersburg/DocTemplates/issues/43)
- добавлено восстановление реквизитов `@manifest:media-type` в манифесте
  для раздела `Configurations2`.
  Libre Office генерирует их пустыми.
  [test-st-petersburg/DocTemplates#89](https://github.com/test-st-petersburg/DocTemplates/issues/89)
- исключены thumbnails из репозитория и генерируемых документов
  и отключена в настройках документов их генерация
  [test-st-petersburg/DocTemplates#88](https://github.com/test-st-petersburg/DocTemplates/issues/88)
- метаданные `meta:generator` указываются с учётом RFC 2616
  [test-st-petersburg/DocTemplates#84](https://github.com/test-st-petersburg/DocTemplates/issues/84)
- метаданные (свойства) документа обновляются при сохранении документа
  из его переменных
  [test-st-petersburg/DocTemplates#82](https://github.com/test-st-petersburg/DocTemplates/issues/82)

## [2.2.0]

### Изменено

- вычисляемые при сборке метаданных убираем из `meta.xml`
  [test-st-petersburg/DocTemplates#64](https://github.com/test-st-petersburg/DocTemplates/issues/64)
- при сборке указывается версия в свойствах файла
  [test-st-petersburg/DocTemplates#20](https://github.com/test-st-petersburg/DocTemplates/issues/20)
- при подстановке разделов вместо `text:section-source` осуществляется
  переименование вставляемых разделов, таблиц, врезок с учётом реквизита
  `text:section-source/@xlink:title`
  [test-st-petersburg/DocTemplates#81](https://github.com/test-st-petersburg/DocTemplates/issues/81)
- убраны дублирования в оформлении стилей страниц
  (за счёт применения `text:section-source`)
  [test-st-petersburg/DocTemplates#81](https://github.com/test-st-petersburg/DocTemplates/issues/81)
- обновление метаданных документа при сборке
  (`meta:editing-cycles`, `dc:date`)
  выделено в отдельный XSLT пакет
  (oo-preprocessor.xslt, режим `p:document-meta-updating`)
  [test-st-petersburg/DocTemplates#47](https://github.com/test-st-petersburg/DocTemplates/issues/47)
- убраны файлы `mimetype` из репозитория
  (добавлена автоматическая их генерация при сборке из манифеста)
  [test-st-petersburg/DocTemplates#80](https://github.com/test-st-petersburg/DocTemplates/issues/80)

## [2.1.0]

### Исправлено

- добавлен отдельный стиль страницы для должностной инструкции
  (в соответствии с СТО СК 03-07-16)
  [test-st-petersburg/DocTemplates#76](https://github.com/test-st-petersburg/DocTemplates/issues/76)

### Изменено

- добавлены отдельные стили первого абзаца для каждого вида документа
  [test-st-petersburg/DocTemplates#76](https://github.com/test-st-petersburg/DocTemplates/issues/76)
- и размещены в защищённом от редактирования разделе
  [test-st-petersburg/DocTemplates#76](https://github.com/test-st-petersburg/DocTemplates/issues/76)
- удалены доступные на типовой рабочей станции встроенные шрифты
  (Письмо)
  [test-st-petersburg/DocTemplates#73](https://github.com/test-st-petersburg/DocTemplates/issues/73)
- при оптимизации из content.xml убираем неиспользуемые автоматические стили
  таблиц, графики, врезок, разделов
  [test-st-petersburg/DocTemplates#72](https://github.com/test-st-petersburg/DocTemplates/issues/72)

## [2.0.0]

### Исправлено

- исправлены поля страниц и размеры полей в соответствии с ГОСТ Р 7.0.97-2016

### Изменено

- убран промежуток между верхним колонтитулом на первых страницах
  и текстом. Все интервалы должны определяться стилями абзацев
  (ОРД)
- ФИО в подписи выравнены по аналогии с подписью в сведениях об ознакомлении
  (ОРД)
  [test-st-petersburg/DocTemplates#65](https://github.com/test-st-petersburg/DocTemplates/issues/65)
- шаблон Записки объединён с шаблоном ОРД
  (добавлен шаблон первого листа записки)
  [test-st-petersburg/DocTemplates#67](https://github.com/test-st-petersburg/DocTemplates/issues/67)
- шаблон Документа СМК объединён с шаблоном ОРД
  (добавлен шаблон титульного листа)
  [test-st-petersburg/DocTemplates#46](https://github.com/test-st-petersburg/DocTemplates/issues/46)
  [test-st-petersburg/DocTemplates#67](https://github.com/test-st-petersburg/DocTemplates/issues/67)
- шаблон Внутренние документы преобразован в шаблон ОРД
  (Приказы, Распоряжения, Инструкции без титульного листа)
  [test-st-petersburg/DocTemplates#46](https://github.com/test-st-petersburg/DocTemplates/issues/46)
- исключены стили абзацев Нумерованный список, Маркированный список
  (Письмо, Внутренний документ, Записка, Документ СМК)
  [test-st-petersburg/DocTemplates#68](https://github.com/test-st-petersburg/DocTemplates/issues/68)
- переименована библиотека макросов в `TestStPetersburg`
  (Письмо, Внутренний документ, Записка, Документ СМК)
  [test-st-petersburg/DocTemplates#71](https://github.com/test-st-petersburg/DocTemplates/issues/71)
- удаляются `style:layout-*` при `style:layout-grid-mode="none"`
  [test-st-petersburg/DocTemplates#70](https://github.com/test-st-petersburg/DocTemplates/issues/70)

## [1.8.2]

### Исправлено

- на с/з в Центр восстановлен вывод регистрационных данных в подвале
  [test-st-petersburg/DocTemplates#60](https://github.com/test-st-petersburg/DocTemplates/issues/60)

## [1.8.1]

### Исправлено

- добавлено место составление документа на титульный лист
  (см. ГОСТ Р 7.0.97-2016, Приложение А)
  [test-st-petersburg/DocTemplates#69](https://github.com/test-st-petersburg/DocTemplates/issues/69)

## [1.8.0]

### Добавлено

- добавлен гриф утверждения в шаблон Внутренних документов
  [test-st-petersburg/DocTemplates#46](https://github.com/test-st-petersburg/DocTemplates/issues/46)

### Изменено

- стили Внутреннего документа унифицированы со стилями Документа СМК

## [1.7.0]

### Добавлено

- добавлен шаблон Документ системы менеджмента
  (основа для Положений о подразделениях, Должностных инструкций,
  Стандартов организации, Инструкций).
  В настоящее время обеспечена подготовка только Положений о подразделениях
  [test-st-petersburg/DocTemplates#46](https://github.com/test-st-petersburg/DocTemplates/issues/46)

## [1.6.17]

### Исправлено

- ошибка при обновлении стилей из шаблона (Записка)
  [test-st-petersburg/DocTemplates#52](https://github.com/test-st-petersburg/DocTemplates/issues/52)

### Изменено

- все поля обновляются перед сохранением и печатью
  (Записка, Внутренний документ, Письмо)
  [test-st-petersburg/DocTemplates#52](https://github.com/test-st-petersburg/DocTemplates/issues/52)

## [1.6.16]

### Исправлено

- некорректно определяются файлы, подлежащие сборке и разборке
  [test-st-petersburg/DocTemplates#61](https://github.com/test-st-petersburg/DocTemplates/issues/61)

## [1.6.15]

### Исправлено

- некорректно определяются файлы, подлежащие сборке и разборке
  [test-st-petersburg/DocTemplates#61](https://github.com/test-st-petersburg/DocTemplates/issues/61)

## [1.6.14]

### Исправлено

- сведения о подписанте сбрасываются в "0" во Внутренних документах

## [1.6.13]

### Исправлено

- не обновляется приветствие в Письмах
  [test-st-petersburg/DocTemplates#59](https://github.com/test-st-petersburg/DocTemplates/issues/59)

## [1.6.12]

### Исправлено

- ошибка при обновлении стилей из шаблона Внутреннего документа
  [test-st-petersburg/DocTemplates#52](https://github.com/test-st-petersburg/DocTemplates/issues/52)

## [1.6.11]

### Исправлено

- поле Получатель в письме не укладывается в поля бланка
  [test-st-petersburg/DocTemplates#55](https://github.com/test-st-petersburg/DocTemplates/issues/55)
- поле Исполнитель в письме не укладывается в поля бланка

## [1.6.10]

### Исправлено

- переносы не должны допускаться в поле Получатель в Письмах
  [test-st-petersburg/DocTemplates#54](https://github.com/test-st-petersburg/DocTemplates/issues/54)

## [1.6.9]

### Исправлено

- исправлено описание `@menu:style` в menubar.dtd
  [test-st-petersburg/DocTemplates#42](https://github.com/test-st-petersburg/DocTemplates/issues/42)

### Изменено

- опционально восстанавливаем DTD в XML файлах документов
  [test-st-petersburg/DocTemplates#42](https://github.com/test-st-petersburg/DocTemplates/issues/42)

## [1.6.8]

### Изменено

- при сборке документа обновляется количество циклов редактирования
  (`meta:editing-cycles`), [test-st-petersburg/DocTemplates#47](https://github.com/test-st-petersburg/DocTemplates/issues/47)

## [1.6.7]

### Изменено

- при сборке документа устанавливается дата и время в метаданных
  (`dc:date`), [test-st-petersburg/DocTemplates#47](https://github.com/test-st-petersburg/DocTemplates/issues/47)

## [1.6.6]

### Исправлено

- восстановлено обновление стилей из шаблона документа при открытии документа
  (выдаётся запрос на обновление в случае изменения шаблона с последнего
  сохранения документа, #44)

## [1.6.5]

### Исправлено

- дата регистрации с/з в Центр не помещалась при печати на листе (#40)

## [1.6.4]

### Исправлено

- обработка DTD в XML файлах документов

## [1.6.3]

### Исправлено

- при открытии Внутреннего документа выполняем обновление полей (ради подписи)

## [1.6.2]

### Исправлено

- исправлен иерархический список в Записке
- исправлен иерархический список в Письме

## [1.6.1]

### Исправлено

- убраны лишние переменные в шаблоне Внутренних документов

## [1.6.0]

### Добавлено

- добавлен шаблон Внутренний документ

## [1.5.6]

### Исправлено

- изменено расстояние между символами в наименовании организации в шапке Записки
  в соответствии с СТО

## [1.5.5]

### Исправлено

- в сведениях об исполнителе в Письме должны быть пробелы после знаков препинания

## [1.5.4]

### Исправлено

- при заполнении с/з в Центр регистрационные данные в шапке не должны отображаться
- при заполнении с/з в Центр регистрационные данные должны отображаться в подвале
- аналогичные изменения обработки условий в Письма

## [1.5.1]

### Изменено

- дополнено описание шаблона Записки

## [1.5.0]

### Добавлено

- добавлен шаблон Записка

### Изменено

- оформление бланка внутренних записок (служебных, докладных, объяснительных).
  Шаблон Записки переделан на базе шаблона Письма
- унифицирован перечень переменных документа по аналогии с шаблоном Письма
- добавлено описание шаблона Записки
- изменены инструменты для обработки XML:
  - все файлы одного документа обрабатываются одной XSLT трансформацией
  - XSLT трансформации разделены на модули (packages)

## [1.4.3]

### Изменено

- добавлен вывод подробных ошибок компиляции XSLT
- настроен problem matcher в VSCode для фиксации ошибок компиляции XSLT

## [1.4.2]

### Изменено

- дополнено описание шаблона Письмо описанием механизма печати на бланках

## [1.4.1]

### Изменено

- несущественные правки readme.md

## [1.4.0]

### Добавлено

- добавлена генерация документации на ReadTheDocs

### Изменено

- переоформлены поля в шаблоне Письмо с помощью подстрочника

## [1.3.0]

### Добавлено

- добавлена иерархия шаблонов
- добавлен шаблон Справки (на бланке)
- для условного отображения вида документа в шапке при обновлении
  стилей из шаблона подключены макрокоманды, выполняемые при открытии и
  создании документа

### Изменено

- для задач VSCode использован Invoke-Build
- переименованы стили (убрано наименование документа, утвердившего формы бланков)

## [1.2.0]

### Исправлено

- оформление бланка Письма полностью перенесено в колонтитулы,
  что позволяет при обновлении стилей полностью обновлять оформление бланка
- устранена потеря данных в шапке и подвале бланка Письма при обновлении
  стилей из шаблона (все переменные перенесены в служебную страницу)

### Изменено

- Шаблон Записка переименован в Письмо

## [1.1.0]

### Исправлено

- внедрены шрифты в шаблоны документов
- реализована проверка DTD в XML

## [1.0.0]

### Добавлено

- для работы с XML использован Saxon HE
- форматирование атрибутов
- нормализация пробелов и пустых строк в модулях макросов

## [0.2.0]

### Добавлено

- добавлены инструменты для "чистки" xml
- очищен XML и удалены неиспользуемые стили

## [0.1.0]

### Добавлено

- шаблон стандарта учреждения (СТО).
  Он применим и для документированных процедур системы менеджмента
- шаблона переписки, внутренней и внешней (писем,
  служебных, докладных и объяснительных записок)

[Unreleased]: https://github.com/csm-ivanovo-ru/DocTemplates/compare/3.0.2...HEAD
[3.0.2]: https://github.com/csm-ivanovo-ru/DocTemplates/compare/3.0.1...3.0.2
[3.0.1]: https://github.com/csm-ivanovo-ru/DocTemplates/compare/3.0.0...3.0.1
[3.0.0]: https://github.com/csm-ivanovo-ru/DocTemplates/compare/2.9.11...3.0.0
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

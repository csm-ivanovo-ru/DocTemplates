# Libre Office шаблоны документов

[![GitHub release](https://img.shields.io/github/v/release/csm-ivanovo-ru/DocTemplates.svg?sort=semver&logo=github)](https://github.com/csm-ivanovo-ru/DocTemplates/releases)
[![Build and Test Status](https://github.com/csm-ivanovo-ru/DocTemplates/workflows/Tests/badge.svg?branch=master)](https://github.com/csm-ivanovo-ru/DocTemplates/actions/workflows/tests.yml)

[![Semantic Versioning](https://img.shields.io/static/v1?label=Semantic%20Versioning&message=v2.0.0&color=green&logo=semver)](https://semver.org/lang/ru/spec/v2.0.0.html)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-v1.0.0-yellow.svg?logo=git)](https://conventionalcommits.org)

Данный проект - Шаблоны внутренних и исходящих документов учреждения.

В качестве формата документов и шаблонов используется
формат Open Document для офисных приложений (OpenDocument)
([ГОСТ Р ИСО/МЭК 26300-2010][]).

## Документация

Описание решений по данному проекту расширения формируется с помощью сервиса [ReadTheDocs][].

[![Documentation Status](https://readthedocs.org/projects/doctemplates/badge/?version=master)](https://doctemplates.readthedocs.io/ru/master/?badge=master)

Исходные файлы документации размещены в репозитории в каталоге
[docs](/docs).

Подготовленная документация доступна в сети:
[https://doctemplates.readthedocs.io](https://doctemplates.readthedocs.io).

## Подготовка среды

Для внесения изменений в пакет и повторной сборки проекта потребуются следующие продукты:

Под Windows:

- [Git][]
- текстовый редактор, настоятельно рекомендую [VSCode][]
- [LibreOffice][]
- [7Zip4Powershell][]
- [Saxon HE][]
- [GitVersion][]
- [ODFValidator][]

Для [VSCode][] рекомендую установить расширения, указанные в рабочей области.

Далее следует скопировать исходные файлы проекта, клонировав git репозиторий.
Для сборки документов используется [GitVersion][], а он требует наличия именно
репозитория со всей историей.

Для подготовки среды (установки необходимых приложений)
следует воспользоваться сценарием `prepare.ps1` (запускать от имени администратора):

    install\prepare.ps1

Указанный сценарий установит все необходимые компоненты.

Дополнительно см. [CONTRIBUTING.md](/.github/CONTRIBUTING.md).

## Подготовка документов, шаблонов, библиотек макросов

Как известно, файлы Open Document представляют из себя zip архив,
в котором размещены XML файлы и бинарные файлы изображений и прочих вложений.

### Подготовка шаблонов документов

В репозитории файлы шаблонов документов хранятся в виде каталогов с XML и
бинарными файлами (см. [/src/template](/src/template)).
Описание схемы xml файлов, входящих в состав документа: [OASIS][].

При сборке шаблонов из "исходных" файлов подготовленные шаблоны
размещаются в каталоге [/output/template](/output/template)

Распаковка, форматирование, оптимизация XML файлов осуществляется
с помощью инструментария, размещённого в репозитории.
Через задачи в среде Visual Studio Code:

- Remove sources:
  очистка каталогов с "исходными"
  XML и бинарными файлами ([/src/template](/src/template)).

- **clean**:
  очистка каталогов с временными файлами, собранными файлами
  документов и их шаблонов.

- distclean:
  очистка каталогов с временными файлами, собранными файлами
  документов, их шаблонов, а также удаление всех автоматически
  установленных пакетов и инструментов.

- Convert Open Office files to plain XML:
  преобразование файлов шаблонов документов в каталоги "исходных"
  (XML и бинарных) файлов.

- Optimize Open Office XML files:
  оптимизация XML файлов документов.
  При этом инструменты оптимизации удаляют ряд атрибутов в стилях,
  сортируют отдельные элементы в целях минимизации количества изменений
  при сохранении документа.
  Кроме того, выполняется ряд дополнительных оптимизаций
  (удаляются автоматические стили символов и прочее).

- Unpack and optimize Open Office XML files:
  преобразование файлов шаблонов документов в каталоги "исходных"
  (XML и бинарных) файлов с оптимизацией
  (комбинация двух приведённых выше задач).

- **Unpack and optimize modified Open Office XML files**:
  преобразование только изменённых файлов шаблонов документов
  в каталоги "исходных" (XML и бинарных) файлов с оптимизацией.
  Изменёнными считаются файлы, время изменения которых более позднее,
  чем время изменения файла манифеста в каталоге документа.

- **Build Open Office files from plain XML**:
  создание .ott файлов шаблонов документов из каталогов
  с XML и бинарными файлами.

- **Build Open Office files from plain XML and open**:
  обновление .ott файлов шаблонов документов из каталогов
  с XML и бинарными файлами и открытие их ассоциированным
  приложением (только для Windows).
  Обновляются и открываются только изменённые шаблоны.
  Данная задача является задачей сборки по умолчанию
  и может быть выполнена в Visual Studio Code через Ctrl+Shift+B.

### Подготовка библиотек макросов

В репозитории библиотеки макросов в виде каталогов,
наименование которого совпадает с наименованием библиотеки,
с "исходными" текстовыми файлами (*.bas).
Корневой каталог для исходных файлов библиотек: [/src/basic](/src/basic).

Подготовленные библиотеки (как каталоги)
размещаются в каталоге [/output/basic](/output/basic).

Сборка библиотек осуществляется с помощью инструментария, размещённого в репозитории.
Через задачи в среде Visual Studio Code:

- **clean**:
  очистка каталогов с временными файлами, собранными библиотеками.

- **Build Open Office macro libraries**:
  создание каталогов с библиотеками макрокоманд Open Office
  для последующего использования как в составе шаблонов документов,
  так и отдельно.

## Внесение изменений

Репозиторий проекта размещён по адресу
[github.com/csm-ivanovo-ru/DocTemplates](https://github.com/csm-ivanovo-ru/DocTemplates).
Стратегия ветвления - Git Flow.

При необходимости внесения изменений в сам проект предложите Pull Request в основной
репозиторий в ветку `develop`.

[Git]: https://github.com/git-guides/install-git#install-git-on-windows "Install Git on Windows"
[VSCode]: https://code.visualstudio.com/ "Visual Studio Code"
[PowerShellCore]: https://github.com/PowerShell/PowerShell "PowerShell Core"
[LibreOffice]: https://ru.libreoffice.org "Libre Office"
[7Zip4Powershell]: https://github.com/thoemmi/7Zip4Powershell
[Saxon HE]: https://saxonica.com/products/products.xml "Saxon Home Edition"
[ReadTheDocs]: https://readthedocs.org
[OASIS]: https://docs.oasis-open.org/office/OpenDocument/v1.3/cs01/part3-schema/OpenDocument-v1.3-cs01-part3-schema.html "Open Document Format for Office Applications (OpenDocument) Version 1.3. Part 3: OpenDocument Schema"
[ODFValidator]: https://odftoolkit.org/conformance/ODFValidator.html "ODF Validator"
[GitVersion]: https://github.com/GitTools/GitVersion "Easy Semantic Versioning for projects using Git"
[ГОСТ Р ИСО/МЭК 26300-2010]: http://protect.gost.ru/document.aspx?control=7&id=177075 "Информационная технология. Формат Open Document для офисных приложений (OpenDocument) v1.0"

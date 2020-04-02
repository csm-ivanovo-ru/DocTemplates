# Libre Office шаблоны документов

[![GitHub release](https://img.shields.io/github/release/test-st-petersburg/DocTemplates.svg)](https://github.com/test-st-petersburg/DocTemplates/releases)

Данный проект - Шаблоны внутренних и исходящих документов учреждения.

## Подготовка среды

Для внесения изменений в пакет и повторной сборки проекта потребуются следующие продукты:

Под Windows:

- текстовый редактор, настоятельно рекомендую [VSCode][]
- [LibreOffice][]

Под Linux:

- [PowerShellCore][]
- [VSCode][]
- [LibreOffice][]

Для [VSCode][] рекомендую установить расширения, указанные в рабочей области.

Существенно удобнее будет работать с репозиторием, имея установленный `git`.

Далее следует скопировать репозиторий проекта либо как zip архив из [последнего
релиза](https://github.com/test-st-petersburg/DocTemplates), либо клонировав
git репозиторий.
Последнее - предпочтительнее.

Для подготовки среды (установки необходимых приложений)
следует воспользоваться сценарием `prepare.ps1` (запускать от имени администратора):

    install\prepare.ps1

Указанный сценарий установит все необходимые компоненты.

## Внесение изменений

Репозиторий проекта размещён по адресу [github.com/test-st-petersburg/DocTemplates](https://github.com/test-st-petersburg/DocTemplates).
Стратегия ветвления - Git Flow.

При необходимости внесения изменений в сам проект предложите Pull Request в основной
репозиторий в ветку `develop`.

[VSCode]: https://code.visualstudio.com/ "Visual Studio Code"
[PowerShellCore]: https://github.com/PowerShell/PowerShell "PowerShell Core"
[LibreOffice]: https://ru.libreoffice.org "Libre Office"

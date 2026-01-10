# Коллективное участие в проекте

## Прежде чем создавать задачи `GitHub`

* старайтесь ознакомиться с документацией по проекту в
  [readme.md](https://github.com/csm-ivanovo-ru/DocTemplates/blob/master/readme.md)
* старайтесь ознакомиться с уже имеющимися задачами с помощью поиска,
  включая закрытые задачи
* будьте в курсе изменений по проекту
  * нажмите watch и star чтобы получать оповещения об изменениях

## Как добавить функционал к проекту

Помимо задач, можно использовать концепцию Git-flow.

### Процесс коллективной разработки

Мы используем

* итеративный подход к разработке
* первоначально мы решаем недочёты, а уже затем дорабатываем функционал

### Pull-request

Если вы администратор

* сделайте `fork` репозитория
* создайте отдельную `feature/*` ветку на базе `develop`
* реализуйте функционал или возьмите в работу какую-то задачу
* после завершения работы получите последние изменения в ветку `develop`
  из основного репозитория
* слейте Вашу `feature/*` ветку с Вашей веткой `develop` (squash merge)
* сделайте `pull-request` в `develop` ветку основного репозитория

## О подготовке рабочего места разработчика

Для подготовки рабочего места выполните следующие действия:

* зарегистрируйтесь на [GitHub](https://github.com/)

* [создайте новый SSH ключ и зарегистрируйте его в своей учётной записи на github.com](https://docs.github.com/ru/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).

* Если у Вас не установлен [WinGet][], [установите его](https://github.com/microsoft/winget-cli/releases/download/v1.8.1911/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle)
(если у Вас Windows 10 или старше, он уже установлен, вероятнее всего)

* установите [NodeJS][]:

  ```cmd
  winget install -e --id OpenJS.NodeJS
  ```

* установите [NVM][]:

  ```cmd
  winget install -e --id CoreyButler.NVMforWindows
  ```

* установите [VSCode][]:

  ```cmd
  winget install -e --id Microsoft.VisualStudioCode
  ```

* установите [git][]:

  ```cmd
  winget install -e --id Git.Git
  ```

* клонируйте репозиторий проекта:

  ```git
  cd %userprofile%\documents
  git clone git@github.com:csm-ivanovo-ru/DocTemplates.git
  ```

* запустите [VSCode][] в корне проекта:

  ```cmd
  code %userprofile%\documents\DocTemplates
  ```

* выполните установку рекомендуемых расширений для [VSCode][]:
  выполните из VSCode команду `Show Recommended Extensions`

* выполните из VSCode команду инициализации окружения:
  `Run Task`, `установить инструменты`

Необходимые действия до запуска среды разработки одним сценарием:

```cmd
winget install -e --id OpenJS.NodeJS
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id Git.Git

cd %userprofile%\documents
git clone git@github.com:csm-ivanovo-ru/DocTemplates.git
code %userprofile%\documents\DocTemplates
```

## CLA - лицензия на коллективное участие

Мы придерживаемся [CLA](https://cla.github.com/agreement),
что означает Ваш вклад не нарушает никаких наших прав
и не накладывает на нас никаких ограничений и обязательств.

[WinGet]: https://github.com/microsoft/winget-cli
[Git]: https://github.com/git-guides/install-git#install-git-on-windows "Install Git on Windows"
[VSCode]: https://code.visualstudio.com "Visual Studio Code"
[NodeJS]: https://nodejs.org/
[NVM]: https://github.com/coreybutler/nvm-windows "A node.js version management utility for Windows"

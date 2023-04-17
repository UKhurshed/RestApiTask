# RestApiTask

Задача:
Требуется создать простое приложение на iOS, используя язык программирования Swift, которое будет отображать список пользователей и их подробную информацию, полученную из публичного API.
Требования:
1. Приложение должно использовать публичное API для получения списка пользователей. Мы рекомендуем использовать Random User Generator API или любой другой подобный API.
2. Приложение должно отображать список пользователей в виде таблицы, где каждая ячейка содержит основную информацию о пользователе, такую как имя, фамилия, фотография и/или другая доступная информация.
3. Приложение должно иметь экран с подробной информацией о выбранном пользователе, отображающий дополнительные данные, такие как пол, дата рождения, адрес и т.д.
4. Приложение должно быть способно обрабатывать ошибки при загрузке данных из API и отображать соответствующие сообщения об ошибке пользователю.
5. Приложение должно иметь приятный интерфейс, соответствующий стандартам iOS и хорошую пользовательскую доступность.
6. Приложение должно быть написано на Swift и использовать стандартные iOS-технологии, такие как UITableView, UINavigationController, URLSession и другие, при необходимости.
7. Весь код должен быть написан в соответствии с принципами хорошего кодирования, такими как разделение кода на отдельные слои, использование моделей данных, использование решений MVC или MVVM и других архитектурных паттернов, если это уместно.
8. Приложение должно быть загружено на репозиторий на GitHub, снабжено README-файлом, описывающим процесс сборки и запуск

Приложение реализует чистую архитектуру с разделенным View от ViewController, реализован простой способ пагинации для получение поочередной части данных от API.
Для проверки работоспособности приложение, нужно склонировать проект в свой рабочий стол и запустить нажав кнопку Run.

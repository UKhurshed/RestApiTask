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


Task:
You need to create a simple iOS application using the Swift programming language, which will display a list of users and their detailed information obtained from the public API.
Requirements:
1. The application must use a public API to get a list of users. We recommend using the Random User Generator API or any other similar API.
2. The application should display a list of users in the form of a table, where each cell contains basic information about the user, such as first name, last name, photo and/or other available information.
3. The application should have a screen with detailed information about the selected user, displaying additional data such as gender, date of birth, address, etc.
4. The application must be able to handle errors when loading data from the API and display appropriate error messages to the user.
5. The application should have a nice interface that meets iOS standards and good user accessibility.
6. The application should be written in Swift and use standard iOS technologies, such as UITableView, UINavigationController, URLSession and others, if necessary.
7. All code should be written in accordance with the principles of good coding, such as dividing the code into separate layers, using data models, using MVC or MVVM solutions and other architectural patterns, if appropriate.
8. The application must be uploaded to the repository on GitHub, provided with a README file describing the build and launch process

The application implements a clean architecture with a split View from the ViewController, a simple pagination method is implemented to receive a sequential part of the data from the API.
To check the functionality of the application, you need to clone the project to your desktop and launch it by pressing the Run button.

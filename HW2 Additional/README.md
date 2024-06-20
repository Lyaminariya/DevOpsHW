Команда для инициализации Molecule и запуска тестов:

molecule init scenario --role-name ansible-role-user-setup --driver-name docker molecule test

После запуска команды получим базовую конфигурацию для роли Ansible, которая создаёт пользователя, настраивает SSH авторизацию по ключам, отключает аутентификацию по паролю и создаёт директорию в /opt/.
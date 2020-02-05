# Анонимный онлайн чат Insomnia Chat

Анонимный онлайн чат без регистрации и смс

#### Установка
```
git clone git@github.com:fixel92/insomnia-talking-rooms.git
cd insomnia-talking-rooms/
bundle install
```

#### Настройка
Установите на сервере Redis

Если вы деплоите на Heroku, выплните команду
```
heroku addons:add redistogo
heroku config
```
Скопируйте содержимое и настройте адаптер в файле `config/cable.yml`

Обновите строки в файле `config/environments/production.rb`
```
config.action_cable.url = 'wss://YOUR_DOMAIN/cable'
config.action_cable.allowed_request_origins = [
  'http://YOUR_DOMAIN/cable',
  'https://YOUR_DOMAIN/cable'
]
```

#### Зависимости
* Ruby версии не ниже 2.6.0
### Создать контроллер, модель, вьюху, RESTful маршруты, миграцию: ###

    $ rails generate scaffold User name:string email:string
    $ rails generate scaffold Micropost content:string user_id:integer
    $ rake db:migrate
    $ rake routes
            Prefix Verb   URI Pattern                    Controller#Action
        microposts GET    /microposts(.:format)          microposts#index
                   POST   /microposts(.:format)          microposts#create
     new_micropost GET    /microposts/new(.:format)      microposts#new
    edit_micropost GET    /microposts/:id/edit(.:format) microposts#edit
         micropost GET    /microposts/:id(.:format)      microposts#show
                   PATCH  /microposts/:id(.:format)      microposts#update
                   PUT    /microposts/:id(.:format)      microposts#update
                   DELETE /microposts/:id(.:format)      microposts#destroy
             users GET    /users(.:format)               users#index
                   POST   /users(.:format)               users#create
          new_user GET    /users/new(.:format)           users#new
         edit_user GET    /users/:id/edit(.:format)      users#edit
              user GET    /users/:id(.:format)           users#show
                   PATCH  /users/:id(.:format)           users#update
                   PUT    /users/:id(.:format)           users#update
                   DELETE /users/:id(.:format)           users#destroy

## Оперируем с моделями ##

### Добавить валидацию: ###

    class Micropost < ActiveRecord::Base
      validates :content, length: {maximum: 140}
    end

### Пользователь имеет много сообщений: ###

    class User < ActiveRecord::Base
      has_many :microposts
    end

### Пост принадлежит одному пользователю: ###

    class Micropost < ActiveRecord::Base
      belongs_to :user
      validates :content, length: {maximum: 140}
    end

### Просмотр постов пользователя: ###

    $ rails c
    user = User.first
    user.microposts



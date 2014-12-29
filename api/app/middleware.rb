class Tiendita::Api::App
  module Middleware
    autoload  :Base, './api/app/middleware/base'
    autoload  :Sessions, './api/app/middleware/sessions'
  end
end

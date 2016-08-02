from system.core.router import routes

routes['default_controller'] = 'Welcome'
routes['POST']['/register'] = 'Welcome#add'
routes['POST']['/logincheck'] = 'Welcome#logincheck'
routes['GET']['/login'] = 'Welcome#login'
routes['GET']['/travels'] = 'Welcome#travels'
routes['GET']['/travels/destination/<int:t_id>'] = 'Welcome#tripsd'
routes['GET']['/travels/add'] = 'Welcome#addtravel1'
routes['POST']['/travels/add_one'] = 'Welcome#add_one'
routes['GET']['/logout'] = 'Welcome#logout'

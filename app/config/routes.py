from system.core.router import routes

routes['default_controller'] = 'Loginreg'
routes['POST']['/loginreg/add'] = 'Loginreg#add'
# routes['GET']['/loginreg/success'] = 'Loginreg#success'
routes['POST']['/loginreg/login'] = 'Loginreg#login'
routes['GET']['/loginreg/logout'] = 'Loginreg#logout'

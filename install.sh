#!/bin/bash

# Install Codeigniter
cp -r vendor/codeigniter/framework/application app

# Setting Index Path
cp vendor/codeigniter/framework/index.php public/
sed -i.bak "s/$system_path\= 'system';/$system_path\= '..\/vendor\/codeigniter\/framework\/system';/" public/index.php && rm public/index.php.bak
sed -i.bak "s/$application_folder\= 'application';/$application_folder\= '..\/app';/" public/index.php && rm public/index.php.bak
sed -i.bak "s/$config['composer_autoload']\= FALSE;/$config['composer_autoload']\= TRUE;/" app/config/config.php && rm app/config/config.php.bak

# Setting Session
mkdir app/sessions
sed -i.bak "s/$config['sess_save_path']\= NULL;/$config['sess_save_path']\= '../app/sessions';/" app/config/config.php && rm app/config/config.php.bak

# Setting Cookie
mkdir app/cookies
sed -i.bak "s/$config['cookie_path']\= '/';/$config['cookie_path']\= '../app/cookies';/" app/config/config.php && rm app/config/config.php.bak

# Install codeigniter-cache
cp vendor/codeigniter-cache/config/cache.php app/config/
cp vendor/codeigniter-cache/libraries/Cache.php app/libraries/

# Install codeigniter-restserver
cp vendor/codeigniter-restserver/application/config/rest.php app/config/
cp vendor/codeigniter-restserver/application/libraries/Format.php app/libraries/
cp vendor/codeigniter-restserver/application/libraries/REST_Controller.php app/libraries/

# Install CodeIgniter-i18n
cp vendor/CodeIgniter-i18n/application/config/language.php app/config/
cp vendor/CodeIgniter-i18n/application/core/MY_Lang.php app/core/

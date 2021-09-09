#!/bin/sh

command=$1

if [ "$command" = "deploy" ]; then
	echo "Deploying all Froala Demo Application"
	git clone https://github.com/froala/angular-froala-wysiwyg
	git clone https://github.com/froala/angular-froala 
	git clone https://github.com/kapil2704/aurelia-test

	rm -rf django
	mkdir django
	cd django
	git clone https://github.com/froala/wysiwyg-editor-python-sdk.git
	cd ../

	git clone https://github.com/froala/wysiwyg-editor-dotnet-sdk
	git clone https://github.com/froala/ember-froala-editor.git

	rm -rf flask
	mkdir flask
	cd flask
	git clone https://github.com/froala/wysiwyg-editor-python-sdk
	cd ../

	git clone https://github.com/froala/knockout-froala
	git clone https://github.com/froala/wysiwyg-editor-node-sdk
	git clone https://github.com/froala/editor-php-sdk-example
	git clone https://github.com/harasunu-narayan/rails-demo
	git clone https://github.com/froala/editor-ruby-sdk-example
	git clone https://github.com/harasunu-narayan/symfony-froala-demo
	git clone https://github.com/froala/vue-froala-wysiwyg
	git clone https://github.com/froala/wordpress-froala-wysiwyg
	git clone https://github.com/harasunu-narayan/yii-demo
	git clone https://github.com/froala/react-froala-wysiwyg
	git clone https://github.com/harasunu-narayan/cakephp3-froala-demo
	cp angular-froala-wysiwyg_Dockerfile angular-froala-wysiwyg
	cp angular-froala_Dockerfile angular-froala
	cp aurelia-test_Dockerfile aurelia-test
	cp django_Dockerfile django/wysiwyg-editor-python-sdk/
	cp fix_dotnet_run.patch dotnet_Dockerfile wysiwyg-editor-dotnet-sdk
	cp ember_Dockerfile ember-froala-editor
	cp flask_Dockerfile flask/wysiwyg-editor-python-sdk
	cp knockout_Dockerfile knockout-froala
	cp node_Dockerfile wysiwyg-editor-node-sdk
	cp php-editor_Dockerfile editor-php-sdk-example
	cp rails_Dockerfile rails-demo
	cp ruby_Dockerfile ruby_fix_gemfile_error.patch editor-ruby-sdk-example
	cp symfony_Dockerfile symfony-froala-demo
	cp vue_fix.patch vue_Dockerfile vue-froala-wysiwyg
	cp wordpress_Dockerfile wordpress-froala-wysiwyg
	cp yii_Dockerfile yii-demo
	cp cake3_Dockerfile cakephp3-froala-demo
	cp react_Dockerfile react-froala-wysiwyg/
	rm -f symfony-froala-demo/composer.lock

	cd vue-froala-wysiwyg/
	patch -p1 < ../vue_fix.patch

	cd ../wysiwyg-editor-dotnet-sdk/
	patch -p1 < ../fix_dotnet_run.patch

	cd ../editor-ruby-sdk-example/
	patch -p1 < ../ruby_fix_gemfile_error.patch

	cd ../angular-froala-wysiwyg
	patch -p1 < ../fix_angular-froala-wysiwyg_run_on_localhost.patch

	cd ../react-froala-wysiwyg
	patch -p1 < ../react_fix_running_on_ip-port.patch
	cd ../

	docker-compose -p froala-demo-apps up -d --build --force-recreate
	fi
if [ "$command" = "clean" ]; then
	echo "Deleting all the repositories and deployed applications"
	docker-compose -p froala-demo-apps down
	rm -rf cakephp3-froala-demo/ react-froala-wysiwyg/ angular-froala-wysiwyg/ angular-froala/ aurelia-test/ django/ editor-php-sdk-example/ editor-ruby-sdk-example/ ember-froala-editor/ flask/ knockout-froala/ rails-demo/ symfony-froala-demo/ vue-froala-wysiwyg/ wordpress-froala-wysiwyg/ wysiwyg-editor-dotnet-sdk/ wysiwyg-editor-node-sdk/ wysiwyg-editor-python-sdk/ yii-demo/

fi

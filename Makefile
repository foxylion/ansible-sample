site:
	export ANSIBLE_HOST_KEY_CHECKING=False
	ansible-playbook -i hosts site.yml

init-db:
	ssh -o StrictHostKeyChecking=no -i /mnt/c/Users/jakob/Repositories/ansible-sample/.vagrant/machines/db1/virtualbox/private_key vagrant@127.0.0.1 -p 2201 "curl https://raw.githubusercontent.com/foxylion/Simple_AJAX_Todo_List/master/task_list.sql | mysql -u root foodb"

rolling-update:
	export ANSIBLE_HOST_KEY_CHECKING=False
	ansible-playbook -i hosts rolling_update.yml

ssh-lb:
	ssh -o StrictHostKeyChecking=no -i /mnt/c/Users/jakob/Repositories/ansible-sample/.vagrant/machines/lb/virtualbox/private_key vagrant@127.0.0.1 -p 2202

ssh-db1:
	ssh -o StrictHostKeyChecking=no -i /mnt/c/Users/jakob/Repositories/ansible-sample/.vagrant/machines/db1/virtualbox/private_key vagrant@127.0.0.1 -p 2201

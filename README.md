LAMP Stack + HAProxy: Example Playbooks
-----------------------------------------------------------------------------

This is forked from https://github.com/ansible/ansible-examples/tree/master/lamp_haproxy

- Requires Ansible 1.2
- Expects CentOS/RHEL 6 hosts

This example is an extension of the simple LAMP deployment. Here we'll install
and configure a web server with an HAProxy load balancer in front, and deploy
an application to the web servers. This set of playbooks also have the
capability to dynamically add and remove web server nodes from the deployment.
It also includes examples to do a rolling update of a stack without affecting
the service.

### Starting Machines

Using `vagrant up` you can initialize Vagrant machines preconfigured to work
with the predefined inventory (This requires Vagrant and VitualBox to be installed).

Note: This spins up 5 machines with 1GB of RAM each, if you've not that much spare
RAM - modify the Vagrantfile and reduce the usage.

### Initial Site Setup

Now we execute the following command to deploy the site:

```
ansible-playbook -i hosts site.yml
```

### Setup the database

```
vagrant ssh db1
curl https://raw.githubusercontent.com/mattlitzinger/Simple_AJAX_Todo_List/master/task_list.sql | mysql -u root foodb
```

The deployment can be verified by accessing the IP address of your load
balancer host in a web browser: http://10.78.212.30. Reloading the page
should have you hit different webservers.

The Nagios web interface can be reached at http://10.78.212.40/nagios/

The default username and password are "nagiosadmin" / "nagiosadmin".

### Removing and Adding a Node

Removal and addition of nodes to the cluster is as simple as editing the
hosts inventory and re-running:

        ansible-playbook -i hosts site.yml

### Rolling Update

Rolling updates are the preferred way to update the web server software or
deployed application, since the load balancer can be dynamically configured
to take the hosts to be updated out of the pool. This will keep the service
running on other servers so that the users are not interrupted.

In this example the hosts are updated in serial fashion, which means that
only one server will be updated at one time. If you have a lot of web server
hosts, this behaviour can be changed by setting the 'serial' keyword in
webservers.yml file.

Once the code has been updated in the source repository for your application
which can be defined in the group_vars/all file, execute the following
command:

	 ansible-playbook -i hosts rolling_update.yml

You can optionally pass: -e webapp_version=xxx to the rolling_update
playbook to specify a specific version of the example webapp to deploy.

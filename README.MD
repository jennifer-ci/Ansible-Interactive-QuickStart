
#Start test from here
After ansible installation, how to test this project:
1. Update the nodes setting in macNodes.yml
2. 

3. Test custom module in local:
   Enter the python folder, execute as:
   echo ‘{“msg”: “hello”}’ | python3 HttpRequest.py < testJson.json

#Presettings
sudo visudo
add text: %admin ALL = (ALL) NOPASSWD: ALL
if local(local connect local),  ssh user@ip , accept host ecdsa key fingerprint


#Useful commands
1. ansible-playbook example.yml --tags "configuration,packages" --list-tasks
2. ansible-inventory -i ${inventoryPath} --list   //validate
3. ansible-playbook -i inventories/nodes_vars/macNodes.yml site.yml  -K //execute
4. --start-at-task='taskName'  //start with specific task
5. hosts: "{{ nodes | default('NodeName111') }}";   set by:  -e '{"nodes":"JenniferMac"}'
6. Switch Shell
echo $SHELL
https://www.howtogeek.com/444596/how-to-change-the-default-shell-to-bash-in-macos-catalina/


#Reference

###Ansible Modules, Custom modules

http://people.cs.uchicago.edu/~kauffman/brocade/icx/ansible_modules/dev_guide/debugging.html
https://docs.ansible.com/ansible/2.10/dev_guide/developing_locally.html#modules-and-plugins-what-is-the-difference

###Ansible AWX
https://github.com/ansible/awx
project： import ansible projects to execute


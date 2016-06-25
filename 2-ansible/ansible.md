Commandes adhoc
=====

Vocabulaire
-----

* Configuration management
* Provisioning tool


Ansible.exe
---

Type :

        ansible -v
        ansible all -m ping # should fail

Ouvrir des terminaux

        ssh jug@xxx
        ssh jug@yyy

Configuration
----

* Configuration globale
* Configuration locale      <---- nous :=)
    - copy/paste à chaque projet


        #local machine
        cd /2-ansible/project-start
        cat ansible.cfg
        vim inventory.ini   <------- change ips !

        213.167.242.147
        213.167.243.97
        213.167.241.214


Command
----

     ansible all -a reboot -u jug
     ansible all -a reboot -u jug

     ansible all -a reboot -u root

     # terms should be closed

Everything is module
----

* Par défaut, le module est 'shell'

<br/>

        ansible all -m shell -a reboot -u root

        # check on host : docker -v  => obviously not found
        ansible all -m apt -a 'name=docker.io state=present update_cache=yes'

        # not so easy....
        ansible jenkins -m docker -a 'name=jenkins image=jenkins state=started expose=["8080:8080"]'


Idempotence
-----


        echo "toto" > toto.txt
        ansible -m copy -a 'src=toto.txt dest=~/toto.txt' -u jug
        # note the changed : true

        #then again
        ansible -m copy -a 'src=toto.txt dest=~/toto.txt' -u jug


















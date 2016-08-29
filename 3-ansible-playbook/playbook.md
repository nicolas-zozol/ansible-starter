 Playbook
=========

Objectifs
-----

* ne pas taper 1000 commandes à la suite
* Réutiliser


Serie de commandes (1)
----

Dans `3-playbook/1-commands`

        #in 1-commands
        ansible-playbook --version
        ansible-playbook commands.yml

Astuce : dans ~/.bashrc

        alias ap='ansible-playbook'



Name et Tags
----

* Chaque *Task* peut avoir un *name* ou des *tags*


        ansible-playbook commands.yaml  --start-at-task=install_stuff


User (2)
----

* Sudo n'existe pas chez Gandi
* On ne veut pas tout faire en root


        Créer un autre user




Assembler : les roles
-----


Structure d'un playbook...

Exemple :


        - hosts: mongos
          remote_user: nicorama

          roles:
            - {role: client-mongo, tags: ["mongo"]}
            - {role: data-container, tags: ["mongo", "docker"]}
            - {role: create-user, tags: ["mongo", "docker"]}
            - {role: replica-mongo, tags: ["mongo", "docker"]}


Git (3)
---












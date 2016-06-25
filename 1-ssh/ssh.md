SSH
====

Vocabulaire
---

* ssh client
* sshd : daemon autorisant les connexions



Clés ssh
----

* Défaut : id_rsa et id_rsa.pub
* Ici : jug_rsa et jug_rsa.pub



        http://www.robusta.io/public
        jug_rsa, jug_rsa.pub -> ~/.ssh/
        cd ~/.ssh    # stay here for now
        chmod go-rwx jug_rsa   # laissez jug_rsa.pub visible !

        # Test ssh
        ssh 213.167.242.234 # you're down to mud
        ssh -vvvv 213.167.242.234 # so useful !
        ssh -i jug_rsa jug@213.167.242.234 # you're cool


Details ssh
---

La clé publique finit par :

        p6u0ReNQ== nicorama@toulousejug.org

* Email : Juste une indication (comment)
* Il n'y a pas d'identité dans une clé


Configuration du client
---

### ssh-agent

* Met en memoire les clés
* Evite de devoir deverouiller la clé
* On n'a pas mis de keypass
* Pas de soucis sous linux, plus sous mac

<br/>

        #Almost the same :
        eval `ssh-agent`  # slightly different on Windows
        exec ssh-agent bash

        # add key to agent
        ssh-add ~/.ssh/jug_rsa



Exportation de la clé
----

        #Go gandi :
        ssh -i jug_rsa jug@213.167.242.234
        cat ~/.ssh/authorized_keys  # checker notre clé



Si besoin : Associer une autre clé pour un autre user

        cd /home/johndoe/.ssh
        cat ~/id_rsa.pub >> ~/.ssh/authorized_keys
        ssh-copy-id -i ~/.ssh/id_dsa.pub user@machine



# Chef cookbooks for MongoDB, DataDog and SSH keys Injection with guide to setup Workstation, Chef Server and Chef Nodes

1. Download ChefDK from [here](https://downloads.chef.io/chefdk/) to setup Chef workstation.

2. To setup a Chef server, follow the instructions given in this guide [here](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-chef-12-configuration-management-system-on-ubuntu-14-04-servers). 

3. Make sure the Workstation and Chef Server can communicate with eachother through the **knife** tool.
4. Upload all the required cookbooks to the Chef server with the knife tool.

Now you're ready to bootstrap nodes and apply configurations to those nodes.

## Nodes

To bootstrap nodes, launch EC2 instances (as many as you need) and then apply the following command from the Workstation.

```sh
$ knife bootstrap <instance-ip> -U <ssh-user-name> -i "<path-to-sshkey>" -N <name-of-node> -p 22 -y --sudo -r "<roles-and-recipes>"
```

## DataDog

The DataDog cookbook will setup datadog agents to nodes which have its recipe in their runlists.

The datadog cookbook recipe has already been mentioned in the **base** role `(roles/base.rb)`. Just fill in the values of `api_key` and `application_key` for your datadog account and then add the role to the nodes' runlist by applying:

```sh
$ export EDITOR = <name-of-your-favorite-editor>
$ knife node edit <name-of-node>
```

Note: Runlists can also be added while bootstrapping the nodes as shown in the previous command.

## MongoDB

The MongoDB cookbook will setup MongoDB replicaset in the nodes which have its recipe in their runlists.

The MongoDB cookbook recipes have already been added in the nodes roles. Just add the role named `node1role` to the runlist of the node you want to be the primary one and add the roles named `node2role` and`node3role` to the runlist of the nodes you want to be the secondary and arbiter **AFTER** entering the name of MongoDB cluster into those roles `(roles/)` and then follow the instructions from this guide [here](https://eladnava.com/deploy-a-highly-available-mongodb-replica-set-on-aws/) to **initialize** the replicaset and setup the **hostnames** in the nodes for communication between the replicaset members.

## SSH KEYS

This cookbook injects the ssh-keys of any users into the nodes which have its recipe in their runlists. 

The guide to use this cookbook can be found [here](https://supermarket.chef.io/cookbooks/ssh_authorized_keys). Just add the ssh keys of the users in the default recipe `(ssh_authorized_keys/recipes/default.rb)` of this cookbook as shown in the guide.

## References and helpful resources

https://www.digitalocean.com/community/tutorials/how-to-set-up-a-chef-12-configuration-management-system-on-ubuntu-14-04-servers

https://supermarket.chef.io/cookbooks/sc-mongodb#readme

https://supermarket.chef.io/cookbooks/ssh_authorized_keys

https://stackoverflow.com/questions/26337557/badvalue-invalid-or-no-user-locale-set-please-ensure-lang-and-or-lc-environme

https://eladnava.com/deploy-a-highly-available-mongodb-replica-set-on-aws/

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/set-hostname.html 
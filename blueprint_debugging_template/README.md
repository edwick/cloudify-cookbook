This is a template for blueprint debugging. Nodes in a template should be designed to be as modular and self-
contained as possible, and this blueprint will exploit that fact to allow you to test a node quickly. To use this
blueprint template:
   
   1. Deploy a VM on your cloud environment. You can do this directly (via the OpenStack/AWS/whatever dashboard) or by
   deploying a known functioning blueprint that you wish to enhance.
   2. Copy this entire blueprint template to a new directory.
   3. Fix the inputs template to use your inputs (specifying things like ssh keys, users for agents or Fabric ssh
   calls). The most important thing you will need is the IP of the VM you deployed in step #1, which you connect to in
   the "base_vm" node_template below.
   4. Implement your new node in your debugging blueprint. This blueprint will deploy that node and ONLY that node, and
   thus can be deployed much faster than your entire blueprint.
   5. You will almost certainly need a way to revert your VM back to its original state to retest as you find bugs.
   You can do this via a manually-written shell script (which can itself be invoked as a blueprint step if you feel
   like being really meta) or by saving an image of your deployed VM as a snapshot and then re-deploying the VM from 
   your cloud provider.
   6. Test until you are satisfied with your new node, and then add it to your original blueprint (along with any new
   inputs or imports) and re-test to ensure you don't get weird cross-talk between nodes.
  
This repository contains two different blueprint testing templates:
* blueprint_debugging_template.yaml: This blueprint will install an agent on the remote VM, which can then be used with
the Script plugin or a plugin of your own devising.
* blueprint_debugging_template_fabric.yaml: This blueprint assumes you are running agentless and using the Fabric
plugin for RPC calls on the remote VM. You can also use this blueprint template for general agentless Cloudify testing.
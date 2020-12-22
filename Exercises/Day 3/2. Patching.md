# Patching
 - To enable patch management, create a node group for nodes you want to patch and add the node group to the PE Patch Management parent node group.

	- In the console, click Node groups, and click Add group.
	- Specify options for the new node group, then click Add.
		- Parent name – Select PE Patch Management.
		- Group name – Enter a name that describes the role of the node group, for example, patch test.
		- Environment – Select production.
		- Environment group – Do not select this option.
	- Select the patching node group you created.
	- On the Node group details page, on the Rules tab, add nodes to the group
	- Select Run > Puppet in the top right corner of the page.

	- Results: PE can now manage patches for the nodes in your new node group. Repeat these steps to add any additional node groups you want under patch management.

## Specify patching parameters
 - Set parameters for node groups under patch management by first applying the pe_patch class to them, then specifying your desired parameters in the console.
	1. On the Node groups page, select the patching node group you want to add parameters to.
	1. On the Classes tab, enter pe_patch and select Add class. You must add the pe_patch class before you can specify parameters.
	1. Commit changes.
	1. On the Classes tab, under Parameter, add the desired parameters to the pe_patch class.
	1. Commit changes.


## Patch nodes
1. On the Patches page, in the Apply patches section, use the filters to specify which patches to apply to which nodes
1. Select Run > Task.
1. The Run a task page appears with patching information pre-filled for the pe_patch::patch_server task.
1. Select Run task to apply patches.

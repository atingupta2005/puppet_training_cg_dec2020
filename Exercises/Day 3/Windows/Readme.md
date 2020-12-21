# For Windows Automation
## Install the Windows module pack
puppet module install puppetlabs/windows

### View file permissions with ACL
puppet resource acl c:\Users

### Create a Puppet managed permission
Run this code to create your first Puppet managed permission
Then, save it as 1.perms.pp

puppet apply 1.perms.pp

 - Review the permissions in your Windows UI. In Windows Explorer, right-click tempperms and click Properties. Then, click the Security tab. It should appear similar to the image below.

### View registry keys and values with puppet resource
1. In your command prompt, run: puppet resource registry_key 'HKLM\Software\Microsoft\Windows'
1. Enter puppet resource registry_value 'HKLM\SYSTEM\CurrentControlSet\Services\BITS\DisplayName'

### Create managed keys 
 - Create your first Puppet managed registry keys and values
	- file-name: 7.registry-Create-managed-keys.pp
 - Run - puppet apply 7.registry-Create-managed-keys.pp
 - Next, inspect the registry and see what you have. Press Start + R, then type regedit and press Enter. Once the Registry Editor opens, find your keys under HKEY_LOCAL_MACHINE.
	- Note that the 32-bit keys were created under the 32-bit section of Wow6432Node for Software.


## Basic tasks and concepts in Windows

### Write a simple manifest
1. Create a file named 8.Windows-simple-manifest.pp
1. Simulate a Puppet run with --noop
	- puppet apply 8.Windows-simple-manifest.pp --noop
1. Enforce the desired state with puppet apply
	- puppet apply 8.Windows-simple-manifest.pp
1. Understanding idempotency
	- A key feature of Puppet is its idempotency
		- The ability to repeatedly apply a manifest to guarantee a desired resource state on a system, with the same results every time.
		- If a given resource is already in the desired state, Puppet performs no actions
		- If a given resource is not in the desired state, Puppet takes whatever action is necessary to put the resource into the desired state. 
		- Idempotency enables Puppet to simulate resource changes without performing them, and lets you set up configuration management one time, fixing configuration drift without recreating resources from scratch each time Puppet runs.
	- To understand, do some changes in 8.Windows-simple-manifest.pp and apply
	- Again apply without doing any changes

### Additional command line tools
	- puppet resource user
	- puppet module install puppetlabs/registry
	- puppet module list

### Manage Windows services
 - You can use Puppet to manage Windows services, specifically, to start, stop, enable, disable, list, query, and configure services
 - This way, you can ensure that certain services are always running or are disabled as necessary.
 - Example:
	- puppet apply 3.service-defragsvc.pp

### Schedule a recurring operation with Windows Task Scheduler
	- puppet apply 4.delete-files-scheduled.pp
	- After you set up Puppet to manage this task, the Task Scheduler includes the task you specified

### Manage Windows users and groups
 - To manage administrator accounts with Puppet, create a user resource with 'Administrator' as the resource title
	```
	user { 'Administrator':
	   ensure => present,
	   password => 'yabbadabba'
	}```
	
 - puppet apply 6.create-user.pp

### Manage local groups
 - To add domain users or groups not present in the Domain Administrators group to the local Administrators group, use this code:
	 ```
	 group { 'Administrators':
	   ensure  => 'present',
	   members => ['DOMAIN\\User'],
	   auth_membership => false
	}
	```
 - puppet apply 6.domain-user.pp

### Executing PowerShell code
 - puppet apply 5.powershell-disable-drive-indexing.pp

### windows_env
 - This module manages (system and user) Windows environment variables.

#### Installation
 - puppet module install puppet/windows_env
 
 - Refer: 9.windows_env.pp
  
 - puppet apply 9.windows_env.pp

#### Facts
 - A structured fact which lists the following Windows environment variables
   - ALLUSERSPROFILE
   - APPDATA
   - COMMONPROGRAMFILES
   - COMMONPROGRAMFILES(X86)
   - HOME
   - HOMEDRIVE
   - HOMEPATH
   - LOCALAPPDATA
   - PATHEXT
   - PROCESSOR_IDENTIFIER
   - PROCESSOR_LEVEL
   - PROCESSOR_REVISION
   - PROGRAMDATA
   - PROGRAMFILES
   - PROGRAMFILES(X86)
   - PSMODULEPATH
   - PUBLIC
   - SYSTEMDRIVE
   - SYSTEMROOT
   - TEMP
   - TMP
   - USERPROFILE
   - WINDIR

  
 - Example

	- $app_data = $facts['windows_env']['APPDATA']
	- # Output the AppData path in the puppet log
	- notify { $app_data: }

	- puppet apply 10.windows-facts.pp

### windowsfeature
 - Installs windows features (and optionally corresponding tools)

 - To install several windows features as part of a large application such IIS:
	- refer 11.windows-feature-several.pp
	- puppet apply 11.windows-feature-several.pp
 - To install any associated management tools:
		```
		windowsfeature { 'Web-WebServer':
		  ensure                 => present,
		  installmanagementtools => true,
		}
		```

 - To install a feature and reboot if one is pending:
		```
		windowsfeature { 'RDS-RD-Server':
		  ensure  => present,
		}
		reboot {'after_RDS_RD_Server':
		  when  => pending,
		  subscribe => Windowsfeature['RDS-RD-Server'],
		}
		```

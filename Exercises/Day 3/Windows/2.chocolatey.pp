include chocolatey
package {'notepadplusplus.commandline':
  ensure   => installed,
  provider => chocolatey,
}
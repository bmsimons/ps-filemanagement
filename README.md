ps-filemanagement
=================
A PowerShell module that's able to handle specific file-related tasks.

**Currently implemented functions:**
- Get-Duplicates
- Get-FilesBiggerThan
- Get-FilesSmallerThan
- Get-Files
- Get-Directories

**Some usage examples:**
- Get-Duplicates("C:\Users", $true, "\*.docx")
- Get-FilesBiggerThan(200, "MB", "C:\", $true, "\*.mov")
- Get-FilesSmallerThan(50, "Kb", "C:\Windows", $true, "\*.log")
- Get-Files("C:\Users", $true, "\*.\*")
- Get-Directories("C:\Users", $true)

Arguments & other stuff:
----------
**Get-Duplicates** takes 3 arguments:
- Path variable (String)
- Recursive flag (Boolean)
- File type (String)

**Get-FilesBiggerThan** and **Get-FilesSmallerThan** take 5 arguments:
- Size variable (Int)
- Unit variable (String) (Supported are: Kb, KB, Mb, MB, Gb, GB, Tb, TB)
- Path variable (String)
- Recursive flag (Boolean)
- File type (String)

**Get-Files** takes 3 arguments:
- Path variable (String)
- Recursive flag (Boolean)
- File type (String)

**Get-Directories** takes 2 arguments:
- Path variable (String)
- Recursive flag (Boolean)

Changelog:
----------

v0.2 (Current): Added Get-Files and Get-Directories functions
v0.1: Initial release

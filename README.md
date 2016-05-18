ps-filemanagement
=================
A PowerShell module that's able to handle specific file-related tasks.
----------------------------------------------------------------------

**Currently implemented functions:**
- Get-Duplicates
- Get-FilesBiggerThan
- Get-FilesSmallerThan

**Some usage examples:**
- Get-Duplicates("C:\Users", $true, "*.docx")
- Get-FilesBiggerThan(200, "MB", "C:\", $true, "*.mov")
- Get-FilesSmallerThan(50, "Kb", "C:\Windows", $true, "*.log")

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

Changelog:
----------

v0.1 (Current): Initial release
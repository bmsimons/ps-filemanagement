<# FileManagement.psm1 - A PowerShell module to handle file management tasks #>
<# Version 0.1 #>
<# See 'README.md' for usage information #>

function Get-Duplicates {
    $Path = $args[0][0]
    $Recursive = $args[0][1]
    $FileType = $args[0][2]

    $returnObject = @()
    $foundDuplicates = @()

    if ($Recursive -eq $true)
    {
        Get-ChildItem "$Path" -Recurse -Filter "$FileType" -File | % {
            $returnObject += @{Hash = (Get-FileHash -Algorithm MD5 $_.FullName).Hash; FileName = $_.FullName}
        }
    }
    else
    {
        Get-ChildItem "$Path" -Filter "$FileType" -File | % {
            $returnObject += @{Hash = (Get-FileHash -Algorithm MD5 $_.FullName).Hash; FileName = $_.FullName}
        }
    }

    Compare-Object -ReferenceObject $returnObject.Hash -DifferenceObject ($returnObject.Hash | Select -Unique) | % {
        $foundDuplicates += @{Hash = $_.InputObject; FileName = ($returnObject.FileName[$returnObject.Hash.IndexOf($_.InputObject)])}
    }

    return $foundDuplicates
}

function Get-FilesBiggerThan {
    $Size = $args[0][0]
    $Unit = $args[0][1]
    $Path = $args[0][2]
    $Recursive = $args[0][3]
    $FileType = $args[0][4]

    $returnObject = @()

    switch ($Unit) {
        "Kb" { $byteSize = $Size*128 }
        "KB" { $byteSize = $Size*1024 }
        "Mb" { $byteSize = $Size*131072 }
        "MB" { $byteSize = $Size*1048576 }
        "Gb" { $byteSize = $Size*134217728 }
        "GB" { $byteSize = $Size*1073741824 }
        "Tb" { $byteSize = $Size*137438953472 }
        "TB" { $byteSize = $Size*1099511627776 }
    }

    If ($Recursive -eq $true)
    {
        Get-ChildItem "$Path" -Recurse -Filter "$FileType" -File -ErrorAction SilentlyContinue | % {
            If ($_.Length -gt $byteSize) {
                $returnObject += $_.FullName
            }
        }
    }
    Else
    {
        Get-ChildItem "$Path" -Filter "$FileType" -File -ErrorAction SilentlyContinue | % {
            If ($_.Length -gt $byteSize) {
                $returnObject += $_.FullName
            }
        }
    }

    return $returnObject
}

function Get-FilesSmallerThan {
    $Size = $args[0][0]
    $Unit = $args[0][1]
    $Path = $args[0][2]
    $Recursive = $args[0][3]
    $FileType = $args[0][4]

    $returnObject = @()

    switch ($Unit) {
        "Kb" { $byteSize = $Size*128 }
        "KB" { $byteSize = $Size*1024 }
        "Mb" { $byteSize = $Size*131072 }
        "MB" { $byteSize = $Size*1048576 }
        "Gb" { $byteSize = $Size*134217728 }
        "GB" { $byteSize = $Size*1073741824 }
        "Tb" { $byteSize = $Size*137438953472 }
        "TB" { $byteSize = $Size*1099511627776 }
    }

    If ($Recursive -eq $true)
    {
        Get-ChildItem "$Path" -Recurse -Filter "$FileType" -File -ErrorAction SilentlyContinue | % {
            If ($_.Length -lt $byteSize) {
                $returnObject += $_.FullName
            }
        }
    }
    Else
    {
        Get-ChildItem "$Path" -Filter "$FileType" -File -ErrorAction SilentlyContinue | % {
            If ($_.Length -lt $byteSize) {
                $returnObject += $_.FullName
            }
        }
    }

    return $returnObject
}

Export-ModuleMember -Function 'Get-Duplicates'
Export-ModuleMember -Function 'Get-FilesBiggerThan'
Export-ModuleMember -Function 'Get-FilesSmallerThan'
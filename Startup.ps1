<#
    .SYNOPSIS
        Add a file you'd like to start when your computer turned on.
    .DESCRIPTION
        It enables us to add startup apps without using explorer.
    .PARAMETER InstallMenu
        Just add this file to your environment path and it'll work.
    .EXAMPLE
        Startup $Home"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\IPFS Desktop.lnk"
        Startup "C:\Users\<Username>\Appdata\Roaming\Microsoft\Windows\Start Menu\Programs\IPFS Desktop.ink"
#>
$inkfilpat=$args[0]
if ($inkfilpat -ne $null) {
    Write-Host "Writing $inkfilpat to startup folder."
    $leaf=Split-Path $inkfilpat -leaf
    if (Test-Path -Path $inkfilpat -PathType Leaf) {
        Copy-Item $inkfilpat -Destination $Home'\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\'$leaf
        Write-Host "Writing complete"
    }
    else{
        Write-Host "error: file doesn't exist"
    }
}
else{
    Write-Host "error: args not given"
}

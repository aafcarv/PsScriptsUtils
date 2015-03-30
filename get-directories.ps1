function Get-Directories([string[]] $path = ".\") {

    Get-ChildItem -Path $path | Where-Object { $_.PSIsContainer }
}    

function Get-CurrentDirectories {    

    Get-ChildItem -Path ".\" | Where-Object { $_.PSIsContainer }
    
}    
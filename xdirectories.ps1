function Get-Directories([string[]] $path = [string]::Empty) {
    if ([string]::IsNullOrEmpty($path)) {
        $path = $(Get-Location).Path
    }
    Get-ChildItem -Path $path | Where-Object { $_.PSIsContainer }
}    

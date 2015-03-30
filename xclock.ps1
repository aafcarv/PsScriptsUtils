function Get-xClock {    
    Write-Output $([string]::Empty)
    Write-Output "Clock"
    Write-Output "-----"
    Write-Host "$([System.DateTime]::Now.ToLongDateString()) $([System.DateTime]::Now.ToLongTimeString())"
    Write-Output $([string]::Empty)    
}
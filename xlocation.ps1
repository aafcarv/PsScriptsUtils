function Set-xLocation ($path = [string]::Empty) {
    $filepath = $(Join-Path $env:LocalAppData "locations.txt")
    $isFound = $false    
    if (-not $(Test-Path $filepath)) {
        Set-Content [string]::Empty -Path $filepath -Encoding UTF8
    }        
    $locations = Get-Content -Path $filepath -Encoding UTF8        
    if ([string]::IsNullOrEmpty($locations)) {
        $locations = (@())
    } else {
        $locations = $locations -split [Environment]::NewLine
    }    
    if ([string]::IsNullOrEmpty($path)) {
        $path = $(Get-Location).Path
    } 
    if ($(Test-Path $path)) {
        foreach($location in $locations) {
            if ($location -eq $path) {
                $isFound = $true
                break
            }
        }
        if (-not $isFound) {
            $locations += $path
            Set-Content $locations -Path $filepath -Encoding UTF8
            Write-Output $([string]::Empty)
            Write-Output "Caminhos atualizados."
        }
        Get-xLocations
    } else {
        Write-Output "O caminho informado nao e um caminho valido."
    }    
}

function Get-xLocations {
    $filepath = $(Join-Path $env:LocalAppData "locations.txt")
    if (-not $(Test-Path $filepath)) {
        Set-Content [string]::Empty -Path $filepath -Encoding UTF8
    }        
    $locations = Get-Content -Path $filepath -Encoding UTF8        
    if ([string]::IsNullOrEmpty($locations)) {
        $locations = (@())
    } else {
        $locations = $locations -split [Environment]::NewLine
    }
    Write-Output $([string]::Empty)
    Write-Output "Locations"
    Write-Output "---------"
    Write-Output $([string]::Empty)
    for($i = 0; $i -lt $locations.Count; $i++) {
        Write-Output $([string]::Format("{0:n0}: {1}", $i , $($locations[$i])))
    }
    if ($locations.Count -eq 0) {
        Write-Output "Nao existe caminhos armazenados para serem exibidos."
    }
    Write-Output $([string]::Empty)
    Write-Output $([string]::Format("Total: {0:n0}", $locations.Count))
    Write-Output $([string]::Empty)
}

function Go-xLocation($index) {
    $filepath = $(Join-Path $env:LocalAppData "locations.txt")
    if (-not $(Test-Path $filepath)) {
        Set-Content [string]::Empty -Path $filepath -Encoding UTF8
    }        
    $locations = Get-Content -Path $filepath -Encoding UTF8            
    if ([string]::IsNullOrEmpty($locations)) {
        $locations = (@())
    } else {
        $locations = $locations -split [Environment]::NewLine
    }
    if (-not [string]::IsNullOrEmpty($locations[$index])) {
        $location = $locations[$index]
        if (Test-Path $location) {
            Set-Location $location
            Get-Location
        } else {
            Write-Output $([string]::Format("O caminho ""{0}"" nao foi reconhecido com um caminho valido.", $location))
        }        
    }
}

function Clear-xLocations() {
    $filepath = $(Join-Path $env:LocalAppData "locations.txt")
    Set-Content [string]::Empty -Path $filepath -Encoding UTF8
    Get-xLocations
}
    

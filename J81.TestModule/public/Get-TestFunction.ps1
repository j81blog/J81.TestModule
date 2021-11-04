function Get-TestFunction {
    [CmdletBinding()]
    param (
        
    )
    
    begin {
        Write-Verbose "Beginning Get-TestFunction"
    }
    
    process {
        Write-Host "Function"
    }
    
    end {
        Write-Verbose "Ending Get-TestFunction"
    }
}
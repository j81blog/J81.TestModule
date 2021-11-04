[CmdletBinding()]
Param()

# Get public and private function definition files.
$Public = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction Ignore -Recurse)
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction Ignore -Recurse )

# Dot source the files
Foreach ($import in @($Public + $Private)) {
    Try { 
        $import | Unblock-File
        $ExecutionContext.InvokeCommand.InvokeScript(
            $false, 
            (
                [scriptblock]::Create(
                    [io.file]::ReadAllText(
                        $import.fullname,
                        [Text.Encoding]::UTF8
                    )
                    
                )
            ), 
            $null, 
            $null
        )
    } Catch {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}

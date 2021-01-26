$ProfileLocation = "C:\Users\223943\OneDrive for Business\AzureProfile\azureprofile.json"
try {
    Clear-AzContext -Force | Out-Null
    Disable-AzContextAutosave -Scope Process | Out-Null
    Import-AzContext -Path $ProfileLocation -ErrorAction Stop | Out-Null
    Write-Host "Successfully logged in using saved profile file" -ForegroundColor Green
}
catch {
    try {
        Remove-Item -Path $ProfileLocation -Force -ErrorAction Stop
    }
    catch {
    }
    Connect-AzAccount
    Save-AzContext -Path $ProfileLocation
}
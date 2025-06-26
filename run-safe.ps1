param (
    [string]$ScriptName
)

try {
    $FullPath = (Resolve-Path -Path $ScriptName).Path
    $TrustedFolder = $PSScriptRoot  # dynamically gets current script's folder

    Write-Host "`n📂 Script Path: $FullPath"
    Write-Host "🔒 Trusted Folder: $TrustedFolder`n"

    if ($FullPath.ToLower().StartsWith($TrustedFolder.ToLower())) {
        Write-Host "✅ Running trusted script..." -ForegroundColor Green
        Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$FullPath`"" -NoNewWindow -Wait
    } else {
        Write-Warning "🚫 Script is outside the trusted folder and will NOT run:`n$FullPath"
    }
}
catch {
    Write-Host "🔥 Error: $($_.Exception.Message)" -ForegroundColor Red
}

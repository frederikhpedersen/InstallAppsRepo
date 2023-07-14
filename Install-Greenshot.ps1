$logFile = "C:\ProgramData\" + (get-date -format 'yyyyMMdd') + '_softwareinstall.log'
function Write-Log {
    Param($message)
    Write-Output "$(get-date -format 'yyyyMMdd HH:mm:ss') $message" | Out-File -Encoding utf8 $logFile -Append
}

try {
    winget install --id Greenshot.BlueShot --exact --accept-source-agreements --scope machine --disable-interactivity --accept-source-agreements --force
    if (Test-Path "C:\Program Files\Greenshot\Greenshot.exe") {
        Write-Log "Greenshot has been installed"
    }
    else {
        write-log "Error locating the Greenshot executable"
    }
}
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing Greenshot: $ErrorMessage"
}
$logFile = "C:\ProgramData\" + (get-date -format 'yyyyMMdd') + '_softwareinstall.log'
function Write-Log {
    Param($message)
    Write-Output "$(get-date -format 'yyyyMMdd HH:mm:ss') $message" | Out-File -Encoding utf8 $logFile -Append
}

try {
    winget install --id Google.Chrome --exact --accept-source-agreements --scope machine --disable-interactivity --accept-source-agreements --force
    if (Test-Path "C:\Program Files\Google\Chrome\Application\chrome.exe") {
        Write-Log "Google Chrome has been installed"
    }
    else {
        write-log "Error locating the Google Chrome executable"
    }
}
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing Google Chrome: $ErrorMessage"
}
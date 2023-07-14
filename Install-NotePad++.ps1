$logFile = "C:\ProgramData\" + (get-date -format 'yyyyMMdd') + '_softwareinstall.log'
function Write-Log {
    Param($message)
    Write-Output "$(get-date -format 'yyyyMMdd HH:mm:ss') $message" | Out-File -Encoding utf8 $logFile -Append
}

try {
    winget install --id Notepad++.Notepad++ --exact --accept-source-agreements --scope machine --disable-interactivity --accept-source-agreements --force
    if (Test-Path "C:\Program Files\Notepad++\notepad++.exe") {
        Write-Log "NotePad++ has been installed"
    }
    else {
        write-log "Error locating the NotePad++ executable"
    }
}
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing NotePad++: $ErrorMessage"
}
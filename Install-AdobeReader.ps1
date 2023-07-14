$logFile = "C:\ProgramData\" + (get-date -format 'yyyyMMdd') + '_softwareinstall.log'
function Write-Log {
    Param($message)
    Write-Output "$(get-date -format 'yyyyMMdd HH:mm:ss') $message" | Out-File -Encoding utf8 $logFile -Append
}

try {
    winget install --id Adobe.Acrobat.Reader.64-bit --exact --accept-source-agreements --scope machine --disable-interactivity --accept-source-agreements --force
    if (Test-Path "C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe") {
        Write-Log "Adobe Reader has been installed"
    }
    else {
        write-log "Error locating the Adobe Reader executable"
    }
}
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing Adobe Reader: $ErrorMessage"
}
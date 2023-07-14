$logFile = "C:\ProgramData\" + (get-date -format 'yyyyMMdd') + '_softwareinstall.log'
function Write-Log {
    Param($message)
    Write-Output "$(get-date -format 'yyyyMMdd HH:mm:ss') $message" | Out-File -Encoding utf8 $logFile -Append
}

try {
    New-Item -Path C:\Temp -ItemType Directory -ErrorAction Ignore
    Invoke-WebRequest -Uri "https://blog.itprocloud.de/assets/files/OneDriveCleanUp.msi" -Outfile c:\temp\OneDriveCleanUp.msi
    Start-Process -filepath msiexec.exe -Wait -ErrorAction Stop -ArgumentList '/i', 'c:\temp\OneDriveCleanUp.msi', '/quiet'
    if (Test-Path "C:\Program Files\ITProCloud.de\OneDriveCleanUp\OneDriveCleanUp.exe") {
        Write-Log "OneDriveCleanUp has been installed"
    }
    else {
        write-log "Error locating the OneDriveCleanUp executable"
    }
}
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing OneDriveCleanUp: $ErrorMessage"
}
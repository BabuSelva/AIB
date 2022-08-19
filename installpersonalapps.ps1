#Naveen.S
#region Set logging 
$logFile = "c:\apps\" + (get-date -format 'yyyyMMdd') + '_softwareinstall.log'
function Write-Log {
    Param($message)
    Write-Output "$(get-date -format 'yyyyMMdd HH:mm:ss') $message" | Out-File -Encoding utf8 $logFile -Append
}
#endregion

#install AIP
try {
    Start-Process -filepath "C:\apps\AVDapps\AIP\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "AIP installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing AIP: $ErrorMessage"
}
#endregion

#install JRE
try {
    Start-Process -filepath "C:\apps\AVDapps\JRE\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "JRE installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing JRE: $ErrorMessage"
}
#endregion

#install Netclean
try {
    Start-Process -filepath "C:\apps\AVDapps\Netclean\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "Netclean installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing Netclean: $ErrorMessage"
}
#endregion


#install O365
try {
    Start-Process -filepath "C:\apps\AVDapps\O365\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "O365 installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing O365: $ErrorMessage"
}
#endregion

#install Office
try {
    Start-Process -filepath "C:\apps\AVDapps\Office\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "Office installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing Office: $ErrorMessage"
}
#endregion

#install TNS_names
try {
    Start-Process -filepath "C:\apps\AVDapps\TNS_names\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "TNS_names installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing TNS_names: $ErrorMessage"
}
#endregion

#install Umbrella
try {
    Start-Process -filepath "C:\apps\AVDapps\Umbrella\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "Umbrella installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing Umbrella: $ErrorMessage"
}
#endregion

#install VCC_Fonts
try {
    Start-Process -filepath "C:\apps\AVDapps\VCC_Fonts\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "VCC_Fonts installed successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing VCC_Fonts: $ErrorMessage"
}
#endregion

#install VCC_Templates
try {
    Start-Process -filepath "C:\apps\AVDapps\VCC_Templates\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "VCC_Templates installed successfully"
    New-Item -path "HKCU:\Software\Microsoft\Office\16.0\Common\General\" -Force
    set-itemproperty "HKCU:\Software\Microsoft\Office\16.0\Common\General\" -Name sharedtemplates -Value "C:\ProgramData\Microsoft\Windows\Corporate Templates"
    write-log "VCC_Templates added to registry successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing VCC_Templates: $ErrorMessage"
}
#endregion


#install #StartMenu
try {
    Import-StartLayout -LayoutPath "C:\apps\AVDapps\StartMenu\VCC-StartM.bin" -MountPath $env:SystemDrive\
    write-log "Start menu layout successfully"
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error setting up start menu: $ErrorMessage"
}
#end region.

#MSEdge settings.
# #Set-MicrosoftEdgeSetting.ps1 -RunMode Stage
# try {
#     Start-Process powershell.exe  "C:\apps\AVDapps\Set-MicrosoftEdgeSetting.ps1  -RunMode Execute"
#     write-log "msedge settings configured successfully"
#     }
# catch {
#     $ErrorMessage = $_.Exception.message
#     write-log "Error configuring msedge settings: $ErrorMessage"
# }
# #end region.

#Laps
try {
    
    Start-Process -filepath msiexec.exe -Wait -ErrorAction Stop -ArgumentList '/i', "C:\apps\AVDapps\LAPS\Laps.x64.msi", TRANSFORMS="C:\apps\AVDapps\LAPS\LAPS_6.2.0.0.mst" , '/qn','/l*v',  "C:\Windows\Temp\Local_Admin_Password_Solution_6.2.0.0_EN_x64_M1-INSTALL.log"
    Write-Log "successfully installed Laps"

    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installed laps: $ErrorMessage"
}
#end region.
#install Java
try {
    
    Start-Process -filepath msiexec.exe -Wait -ErrorAction Stop -ArgumentList '/i', "C:\apps\AVDapps\Java_8\source\jre1.8.0_72.msi", TRANSFORMS="C:\apps\AVDapps\Java_8\source\Java_8_Update_72_x86_8.0.720.15_W10.mst" , '/qn','/l*v',  "C:\Windows\Temp\Java-INSTALL.log"
    Write-Log "successfully installed Java"

    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installed Java: $ErrorMessage"
}

#endregion Java

#Onboard Windows Defender ATP.
try{
Copy-Item -path "c:\apps\AVDapps\Onboard ATP\Onboard-NonPersistentMachine.ps1" -Destination "C:\WINDOWS\System32\GroupPolicy\Machine\Scripts\Startup"
}
catch{
    $ErrorMessage = $_.Exception.message
    write-log "Error copying Onboard-NonPersistentMachine : $ErrorMessage" 
}
try {
    Copy-Item -path "c:\apps\AVDapps\Onboard ATP\WindowsDefenderATPOnboardingScript.cmd" -Destination "C:\WINDOWS\System32\GroupPolicy\Machine\Scripts\Startup"
}
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error copying WindowsDefenderATPOnboardingScript : $ErrorMessage" 
}
#endregion of defender ATP.

#install optimized teams.

try {
    Start-Process -filepath "C:\apps\AVDapps\AVDTeams\Deploy-Application.exe" -Wait -ErrorAction Stop 
    write-log "AVD Teams installed successfully."
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing AVD Teams: $ErrorMessage"
}
#endregion of teams.


#install VCC wallpaper
try {
    Start-Process -filepath "C:\apps\AVDapps\VCC_Wallpaper\Deploy-Application.exe" -Wait -ErrorAction Stop 
    Start-Sleep -Seconds 5
    #Start-Process powershell.exe "C:\apps\AVDapps\VCC_Wallpaper\vccWALLPAPER.ps1"
    write-log "VCC Wallpaper successfully"
    set-itemproperty "HKCU:\Control Panel\Desktop" -Name WallPaper -Value "C:\windows\Themes\VCCWallpaper\Default.jpg"
    New-Item -path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Force
    set-itemproperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Name LockScreenImage -Value "C:\windows\Themes\VCCWallpaper\Default.jpg"
    write-log "VCC Wallpaper & lockscreen configured successfully."
    }
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error setting wallpaper: $ErrorMessage"
}
#endregion


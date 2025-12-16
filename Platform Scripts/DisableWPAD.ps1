
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\WinHttp"
$regName = "DisableWpad"
$regValue = 1

# Ensure the registry path exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Check and create or update the registry value
$currentValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue

if ($null -eq $currentValue) {
    New-ItemProperty -Path $regPath -Name $regName -Value $regValue -PropertyType DWORD -Force | Out-Null
} elseif ($currentValue.$regName -ne $regValue) {
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
}
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters\Interfaces"
$regName = "NetbiosOptions"
$regValue = 2

# Loop through all interface subkeys under NetBT Parameters
Get-ChildItem -Path $regPath | ForEach-Object {
    $interfaceKey = $_.PSPath
    $currentValue = Get-ItemProperty -Path $interfaceKey -Name $regName -ErrorAction SilentlyContinue

    if ($null -eq $currentValue) {
        New-ItemProperty -Path $interfaceKey -Name $regName -Value $regValue -PropertyType DWORD -Force | Out-Null
    } elseif ($currentValue.$regName -ne $regValue) {
        Set-ItemProperty -Path $interfaceKey -Name $regName -Value $regValue
    }
}
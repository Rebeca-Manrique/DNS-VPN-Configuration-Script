$vpnName = "OpenVPN Data Channel Offload"
$dns1 = "10.10.1.25"
$dns2 = "10.10.1.26"

# Obtener el adaptador de red de la VPN
$adapter = Get-NetAdapter | Where-Object { $_.InterfaceAlias -like "*$vpnName*" }

if ($adapter -and $adapter.Status -eq "Up") {
    Write-Host "VPN detectada. Configurando DNS..."
    
    # Configurar la DNS
    Set-DnsClientServerAddress -InterfaceAlias $adapter.InterfaceAlias -ServerAddresses ($dns1, $dns2)

    Write-Host "DNS configurada correctamente en la VPN."
} else {
    Write-Host "La VPN no está activa, actívala en la barra de navegación."
}

Pause
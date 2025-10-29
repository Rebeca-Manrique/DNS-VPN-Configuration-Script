# DNS-VPN-Configuration-Script
Script de PowerShell para automatización de la configuración DNS post-VPN. Proyecto de eficiencia operativa.

# Automatización de Configuración DNS para Entornos VPN Corporativos

### Propósito del Proyecto

Este proyecto resuelve un problema crítico de eficiencia operativa en entornos de soporte y Call Center: la **desconfiguración manual de los servidores DNS** de la interfaz de red tras la reconexión o interrupción de un túnel VPN.

El objetivo es automatizar la reconfiguración de DNS, *eliminando la intervención manual y reduciendo el tiempo de inactividad de los agentes a segundos.

---

### Solución Técnica Implementada

La solución utiliza una combinación de un script de PowerShell y un archivo Batch para asegurar una ejecución rápida, precisa y con los permisos necesarios.

#### 1. Script Principal: `configurar_dns_vpn.ps1` (PowerShell)

Este script contiene la lógica central de la automatización:

```powershell
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

```
###Instrucciones de Uso (Para Reclutadores y Revisores)


1. La carpeta principal se guarda en archivos de programa
2. Se crea un acceso directo de el archivo .bat que es el ejecutable.
3. Ya con la vpn encendda y conectada solo se da doble clik sobre el acceso directo y este configura a la dns seleccionada.

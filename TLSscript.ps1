$protocols = @(
@{Name = "TLS 1.0"; Server = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server"; Client = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client"},
@{Name = "TLS 1.1"; Server = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server"; Client = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client"}
)

foreach ($prtocol in $protocols){
    $serverPath = $prtocol.Server
    $clientPath = $prtocol.Client

    if(-not(Test-Path $serverPath))  {New-Item -Path $serverPath -Force}
    if(-not(Test-Path $clientPath)) {New-Item -Path $clientPath -Force}

    Set-ItemProperty -Path $serverPath -Name "Enabled" -Value 0 -Type DWord -Force
    Set-ItemProperty -Path $serverPath -Name "DisabledByDefault" -Value 1 -Type DWord -Force

    Set-ItemProperty -path $clientPath -name "Enabled" -Value 0 -Type DWord -Force 
    Set-ItemProperty -path $clientPath -name "DisabledByDefault" -Value 1 -Type Dword -Force
    
}
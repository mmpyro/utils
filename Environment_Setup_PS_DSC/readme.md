winrm quickconfig
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'
winrm set winrm/config/client/auth '@{Basic="true"}'
set-item wsman:\localhost\Client\TrustedHosts -value *

Set-WSManInstance -ValueSet @{MaxEnvelopeSizekb = "1000"} -ResourceURI winrm/config

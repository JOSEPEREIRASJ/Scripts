#Criar arquivo config
@"
<Configuration>
<Add OfficeClientEdition="64" Channel="MonthlyEnterprise">
    <Product ID="O365ProPlusRetail">
     <Language ID="pt-br" />
    </Product>
</Add>
<Display Level="Full" AcceptEULA="TRUE" />
</Configuration>
"@ | Out-File -FilePath C:\Users\$env:USERNAME\Downloads\'config.xml'

#Baixar Setup Office
wget -o C:\Users\$env:USERNAME\Downloads\setup.exe https://officecdn.microsoft.com/pr/wsus/setup.exe

#Instalar Office
"Start-Process -FilePath \"C:\\Users\\TIXIT\\Downloads\\setup.exe\" -ArgumentList \"/configure C:\\Users\\TIXIT\\Downloads\\config.xml\" -Wait"' shell='cmd'


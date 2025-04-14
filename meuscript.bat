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


wget -o C:\Users\$env:USERNAME\Downloads\setup.exe https://officecdn.microsoft.com/pr/wsus/setup.exe

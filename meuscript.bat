@echo off
:: Check if the script is running as admin
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    color 4
    echo This script requires administrator privileges.
    echo Please run WinScript as an administrator.
    pause
    exit
)
:: Admin privileges confirmed, continue execution
setlocal EnableExtensions DisableDelayedExpansion
echo -- Running Disk Clean-up
cleanmgr /verylowdisk /sagerun:5
echo -- Deleting Temp files
del /s /f /q c:\windows\temp\*.*
del /s /f /q C:\WINDOWS\Prefetch
echo -- Emptying Recycle Bin
PowerShell -ExecutionPolicy Unrestricted -Command "$bin = (New-Object -ComObject Shell.Application).NameSpace(10); $bin.items() | ForEach {; Write-Host "^""Deleting $($_.Name) from Recycle Bin"^""; Remove-Item $_.Path -Recurse -Force; }"
echo -- Uninstalling third-party apps
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage \"king.com.CandyCrushSaga\" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage \"king.com.CandyCrushSodaSaga\" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage \"ShazamEntertainmentLtd.Shazam\" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage \"Flipboard.Flipboard\" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage \"9E2F88E3.Twitter\" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage \"ClearChannelRadioDigital.iHeartRadio\" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage \"D5EA27B7.Duolingo-LearnLanguagesforFree\" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage \"AdobeSystemsIncorporated.AdobePhotoshopExpress\" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage \"PandoraMediaInc.29680B314EFC2\" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage \"46928bounde.EclipseManager\" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage \"ActiproSoftwareLLC.562882FEEB491\" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage \"SpotifyAB.SpotifyMusic\" | Remove-AppxPackage"
echo -- Uninstalling Xbox apps
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.XboxApp" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.Xbox.TCUI" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.XboxGamingOverlay" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.XboxGameOverlay" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.XboxIdentityProvider" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.XboxSpeechToTextOverlay" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.GamingApp" | Remove-AppxPackage"
echo -- Uninstalling extensions
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage \"Microsoft.HEIFImageExtension\" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage \"Microsoft.VP9VideoExtensions\" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage \"Microsoft.WebpImageExtension\" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage \"Microsoft.HEVCVideoExtension\" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage \"Microsoft.RawImageExtension\" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage \"Microsoft.WebMediaExtensions\" | Remove-AppxPackage"
echo -- Debloating Edge
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeEnhanceImagesEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "PersonalizationReportingEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ShowRecommendationsEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "HideFirstRunExperience" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "UserFeedbackAllowed" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ConfigureDoNotTrack" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "AlternateErrorPagesEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeCollectionsEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeFollowEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeShoppingAssistantEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "MicrosoftEdgeInsiderPromotionEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ShowMicrosoftRewards" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "WebWidgetAllowed" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "DiagnosticData" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeAssetDeliveryServiceEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "CryptoWalletEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "WalletDonationEnabled" /t REG_DWORD /d 0 /f
echo -- Removing Copilot
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.CoPilot" | Remove-AppxPackage"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t "REG_DWORD" /d "1" /f
reg add "HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t "REG_DWORD" /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "AutoOpenCopilotLargeScreens" /t "REG_DWORD" /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCopilotButton" /t "REG_DWORD" /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\Shell\Copilot\BingChat" /v "IsUserEligible" /t "REG_DWORD" /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "HubsSidebarEnabled" /t "REG_DWORD" /d "0" /f
echo -- Uninstalling Widgets
reg add "HKLM\SOFTWARE\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /t "REG_DWORD" /d "0" /f
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *WebExperience* | Remove-AppxPackage"
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy" /f
echo -- Disabling Taskbar Widgets
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\NewsAndInterests\AllowNewsAndInterests" /v "value" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v "EnableFeeds" /t REG_DWORD /d 0 /f
echo -- Disabling Location access
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /d "Deny" /f
echo -- Disabling Account Information access
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /d "Deny" /f
echo -- Disabling Contacts access
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /d "Deny" /t REG_SZ /f
echo -- Disabling Call History access
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /d "Deny" /t REG_SZ /f
echo -- Disabling Messaging access
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v "Value" /d "Deny" /t REG_SZ /f
echo -- Disabling Notification access
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" /v "Value" /d "Deny" /t REG_SZ /f
echo -- Disabling Email access
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /d "Deny" /t REG_SZ /f
echo -- Disabling Tasks access
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /d "Deny" /t REG_SZ /f
echo -- Disabling Diagnostics access
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /d "Deny" /t REG_SZ /f
echo -- Disabling Voice Activation access
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v "AgentActivationEnabled" /t REG_DWORD /d 0 /f
echo -- Disabling Phone access
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessPhone" /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessPhone_UserInControlOfTheseApps" /t REG_MULTI_SZ /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessPhone_ForceAllowTheseApps" /t REG_MULTI_SZ /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessPhone_ForceDenyTheseApps" /t REG_MULTI_SZ /f
echo -- Disabling Trusted Devices access
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{C1D23ACC-752B-43E5-8448-8D0E519CD6D6}" /t REG_SZ /v "Value" /d "Deny" /f
echo -- Disabling Calendar access
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /d "Deny" /t REG_SZ /f
echo -- Disabling Motion access
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\activity" /v "Value" /d "Deny" /f
echo -- Disabling Radio access
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v "Value" /d "Deny" /t REG_SZ /f
echo -- Disabling Activity Feed
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /d "0" /t REG_DWORD /f
echo -- Disabling Auto Map Downloads
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AllowUntriggeredNetworkTrafficOnSettingsPage" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" /t REG_DWORD /d 0 /f
echo -- Disabling Targeted Ads and Data Collection
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableSoftLanding" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableSoftLanding" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightFeatures" /t "REG_DWORD" /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t "REG_DWORD" /d "1" /f
reg add "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableTailoredExperiencesWithDiagnosticData" /t "REG_DWORD" /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /d "0" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /d "0" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /d "0" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /d "0" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /d "0" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /d "0" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353698Enabled" /d "0" /t REG_DWORD /f
echo -- Opting out of privacy consent
reg add "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d 0 /f
echo -- Disabling Windows Feedback Experience telemetry
reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f
echo -- Disabling Application Experience telemetry
schtasks /change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /DISABLE
schtasks /change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser Exp" /DISABLE
schtasks /change /TN "\Microsoft\Windows\Application Experience\StartupAppTask" /DISABLE
schtasks /change /TN "\Microsoft\Windows\Application Experience\PcaPatchDbTask" /DISABLE
schtasks /change /TN "\Microsoft\Windows\Application Experience\MareBackup" /DISABLE
echo -- Disabling Windows Update Telemetry
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t "REG_DWORD" /d 0 /f
echo -- Disabling Windows Telemetry
schtasks /change /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /DISABLE > NUL 2>&1
schtasks /change /TN "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /DISABLE > NUL 2>&1
schtasks /change /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /DISABLE > NUL 2>&1
schtasks /change /TN "\Microsoft\Windows\Autochk\Proxy" /DISABLE > NUL 2>&1
schtasks /change /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /DISABLE > NUL 2>&1
schtasks /change /TN "\Microsoft\Windows\Feedback\Siuf\DmClient" /DISABLE > NUL 2>&1
schtasks /change /TN "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /DISABLE > NUL 2>&1
schtasks /change /TN "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /DISABLE > NUL 2>&1
schtasks /change /TN "\Microsoft\Windows\Maps\MapsUpdateTask" /DISABLE > NUL 2>&1
sc config diagnosticshub.standardcollector.service start=demand
sc config diagsvc start=demand
sc config WerSvc start=demand
sc config wercplsupport start=demand
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowDesktopAnalyticsProcessing" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowDeviceNameInTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "MicrosoftEdgeDataOptIn" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowWUfBCloudProcessing" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowUpdateComplianceProcessing" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowCommercialDataPipeline" /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "DisableOneSettingsDownloads" /t "REG_DWORD" /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" /v "NoGenTicket" /t "REG_DWORD" /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t "REG_DWORD" /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting\Consent" /v "DefaultConsent" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting\Consent" /v "DefaultOverrideBehavior" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /d "0" /t REG_DWORD /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /d "0" /t REG_DWORD /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /d "0" /t REG_DWORD /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /d "0" /t REG_DWORD /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /d "0" /t REG_DWORD /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /d "0" /t REG_DWORD /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\SystemSettings\AccountNotifications" /v "EnableAccountNotifications" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SystemSettings\AccountNotifications" /v "EnableAccountNotifications" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_TOASTS_ENABLED" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Policies\Microsoft\Windows\EdgeUI" /v "DisableMFUTracking" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\EdgeUI" /v "DisableMFUTracking" /t REG_DWORD /d "1" /f
reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "0" /f
echo -- Disabling Windows Search Telemetry
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchPrivacy" /t REG_DWORD /d "3" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchHistory" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t "REG_DWORD" /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "EnableDynamicContentInWSB" /t "REG_DWORD" /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t "REG_DWORD" /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t "REG_DWORD" /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t "REG_DWORD" /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "PreventUnwantedAddIns" /t "REG_SZ" /d " " /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "PreventRemoteQueries" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AlwaysUseAutoLangDetection" /t "REG_DWORD" /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowIndexingEncryptedStoresOrItems" /t "REG_DWORD" /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "DisableSearchBoxSuggestions" /t "REG_DWORD" /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaInAmbientMode" /t "REG_DWORD" /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t "REG_DWORD" /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t "REG_DWORD" /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CanCortanaBeEnabled" /t "REG_DWORD" /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t "REG_DWORD" /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /t "REG_DWORD" /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDynamicSearchBoxEnabled" /t "REG_DWORD" /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Experience\AllowCortana" /v "value" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "AllowSearchToUseLocation" /t "REG_DWORD" /d "1" /f
reg add "HKCU\Software\Microsoft\Speech_OneCore\Preferences" /v "ModelDownloadAllowed" /t "REG_DWORD" /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Speech_OneCore\Preferences" /v "VoiceActivationOn" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Speech_OneCore\Preferences" /v "VoiceActivationEnableAboveLockscreen" /t "REG_DWORD" /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v "DisableVoice" /t "REG_DWORD" /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t "REG_DWORD" /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "DeviceHistoryEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "HistoryViewEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\Speech_OneCore\Preferences" /v "VoiceActivationDefaultOn" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t "REG_DWORD" /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t "REG_DWORD" /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsMSACloudSearchEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsAADCloudSearchEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t "REG_DWORD" /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "VoiceShortcut" /t "REG_DWORD" /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t "REG_DWORD" /d "0" /f
echo -- Disabling Office telemetry
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Calendar" /v "EnableCalendarLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Calendar" /v "EnableCalendarLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM" /v "EnableLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM" /v "EnableLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM" /v "EnableUpload" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM" /v "EnableUpload" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common" /v "QMEnable" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common" /v "QMEnable" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d 0 /f
schtasks /change /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack" /DISABLE > NUL 2>&1
schtasks /change /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn" /DISABLE > NUL 2>&1
schtasks /change /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" /DISABLE > NUL 2>&1
schtasks /change /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" /DISABLE > NUL 2>&1
schtasks /change /TN "\Microsoft\Office\Office 15 Subscription Heartbeat" /DISABLE > NUL 2>&1
schtasks /change /TN "\Microsoft\Office\Office 16 Subscription Heartbeat" /DISABLE > NUL 2>&1
echo -- Disabling Handwriting telemetry
reg add "HKCU\Software\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "AllowInputPersonalization" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d 0 /f
echo -- Disabling Clipboard history and Cloud Clipboard
reg add "HKCU\Software\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "AllowInputPersonalization" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d 0 /f
echo -- Disabling Adobe Telemetry
set "hostspath=%windir%\System32\drivers\etc\hosts"
set "downloadedlist=%temp%\list.txt"
echo -- Downloading the list of host entries
curl -s -o "%downloadedlist%" "https://a.dove.isdumb.one/list.txt"
if not exist "%downloadedlist%" (
    echo Failed to download the list from the specified URL.
    exit /b 1
)
echo -- Adobe block entries successfully added to hosts file
type "%downloadedlist%" >> "%hostspath%"
del "%downloadedlist%"
echo -- Disabling NVIDIA telemetry
reg add "HKLM\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v "OptInOrOutPreference" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID44231" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID64640" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID66610" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\Startup" /v "SendTelemetryData" /t REG_DWORD /d 0 /f
schtasks /change /TN NvTmMon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8} /DISABLE
schtasks /change /TN NvTmRep_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8} /DISABLE
schtasks /change /TN NvTmRepOnLogon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8} /DISABLE
echo -- Disabling Visual Studio telemetry
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VSCommon\14.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VSCommon\15.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VSCommon\16.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VSCommon\17.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\VisualStudio\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\VisualStudio\Telemetry" /v "TurnOffSwitch" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback" /v "DisableFeedbackDialog" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback" /v "DisableEmailInput" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback" /v "DisableScreenshotCapture" /t REG_DWORD /d 1 /f
reg delete "HKLM\Software\Microsoft\VisualStudio\DiagnosticsHub" /v "LogLevel" /f 2>nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\IntelliCode" /v "DisableRemoteAnalysis" /t "REG_DWORD" /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\VSCommon\16.0\IntelliCode" /v "DisableRemoteAnalysis" /t "REG_DWORD" /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\VSCommon\17.0\IntelliCode" /v "DisableRemoteAnalysis" /t "REG_DWORD" /d "1" /f
echo -- Disabling Media Player telemetry
reg add "HKCU\SOFTWARE\Microsoft\MediaPlayer\Preferences" /v "UsageTracking" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Policies\Microsoft\WindowsMediaPlayer" /v "PreventCDDVDMetadataRetrieval" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\WindowsMediaPlayer" /v "PreventMusicFileMetadataRetrieval" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\WindowsMediaPlayer" /v "PreventRadioPresetsRetrieval" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\WMDRM" /v "DisableOnline" /t REG_DWORD /d 1 /f
echo -- Disabling PowerShell telemetry
setx POWERSHELL_TELEMETRY_OPTOUT 1
echo -- Disabling CCleaner telemetry
reg add "HKCU\Software\Piriform\CCleaner" /v "Monitoring" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Piriform\CCleaner" /v "HelpImproveCCleaner" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Piriform\CCleaner" /v "SystemMonitoring" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Piriform\CCleaner" /v "UpdateAuto" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Piriform\CCleaner" /v "UpdateCheck" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Piriform\CCleaner" /v "CheckTrialOffer" /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Piriform\CCleaner" /v "(Cfg)HealthCheck" /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Piriform\CCleaner" /v "(Cfg)QuickClean" /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Piriform\CCleaner" /v "(Cfg)QuickCleanIpm" /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Piriform\CCleaner" /v "(Cfg)GetIpmForTrial" /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Piriform\CCleaner" /v "(Cfg)SoftwareUpdater" /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Piriform\CCleaner" /v "(Cfg)SoftwareUpdaterIpm" /t REG_DWORD /d 0 /f
echo -- Disabling Google updates
sc config gupdate start=disabled
sc config gupdatem start=disabled
echo -- Disabling Adobe updates
schtasks /change /TN "\Adobe Acrobat Update Task" /DISABLE > NUL 2>&1
sc config AdobeARMservice start=disabled
sc config adobeupdateservice start=disabled
echo -- Disabling Game Bar
reg add "HKLM\SOFTWARE\Polices\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "ShowStartupPanel" /t REG_DWORD /d 0 /f
echo -- Activating Ultimate Performance Mode
powershell -command "$ultimatePerformance = powercfg -list | Select-String -Pattern 'Ultimate Performance'; if ($ultimatePerformance) { echo '-- - Power plan already exists' } else { echo '-- - Enabling Ultimate Performance'; $output = powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 2>&1; if ($output -match 'Unable to create a new power scheme' -or $output -match 'The power scheme, subgroup or setting specified does not exist') { powercfg -RestoreDefaultSchemes } }"
powershell -command "$ultimatePlanGUID = (powercfg -list | Select-String -Pattern 'Ultimate Performance').Line.Split()[3]; echo '-- - Activating Ultimate Performance'; powercfg -setactive $ultimatePlanGUID"
echo -- Disabling Storage Sense
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "01" /t REG_DWORD /d 0 /f
echo -- Clearing Browser History
del /q /s "%LocalAppData%\Google\Chrome\User Data\Default\History"
del /q /s "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*.*"
del /q /s "%LocalAppData%\Google\Chrome\User Data\Default\Cookies"
del /q /s "%LocalAppData%\Microsoft\Edge\User Data\Default\History"
del /q /s "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache\*.*"
del /q /s "%LocalAppData%\Microsoft\Edge\User Data\Default\Cookies"
del /q /s "%APPDATA%\Mozilla\Firefox\Profiles\*.default\places.sqlite"
del /q /s "%APPDATA%\Mozilla\Firefox\Profiles\*.default\cache2\entries\*.*"
del /q /s "%LocalAppData%\BraveSoftware\Brave-Browser\User Data\Default\History"
del /q /s "%LocalAppData%\BraveSoftware\Brave-Browser\User Data\Default\Cache\*.*"
del /q /s "%LocalAppData%\BraveSoftware\Brave-Browser\User Data\Default\Cookies"
echo -- Uninstalling Microsoft apps
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "MicrosoftCorporationII.MicrosoftFamily" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.OutlookForWindows" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Clipchamp.Clipchamp" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.3DBuilder" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.Microsoft3DViewer" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.BingWeather" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.BingSports" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.BingFinance" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.MicrosoftOfficeHub" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.BingNews" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.Office.OneNote" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.Office.Sway" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.WindowsPhone" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.CommsPhone" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.YourPhone" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.Getstarted" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.549981C3F5F10" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.Messaging" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.WindowsSoundRecorder" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.MixedReality.Portal" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.WindowsFeedbackHub" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.WindowsAlarms" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.WindowsCamera" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.MSPaint" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.WindowsMaps" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.MinecraftUWP" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.People" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.Wallet" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.Print3D" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.OneConnect" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.MicrosoftSolitaireCollection" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.MicrosoftStickyNotes" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "microsoft.windowscommunicationsapps" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.SkypeApp" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.GroupMe10" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "MSTeams" | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "Microsoft.Todos" | Remove-AppxPackage"
echo -- Disabling Consumer Features
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t "REG_DWORD" /d "1" /f
echo -- Disabling Fax and Scan
powershell -Command "try { Disable-WindowsOptionalFeature -FeatureName "FaxServicesClientPackage" -Online -NoRestart -ErrorAction Stop; Write-Output "Successfully disabled the feature FaxServicesClientPackage." } catch { Write-Output "Feature not found." }"
echo -- Disabling Game Mode
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AutoGameModeEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d 0 /f
echo -- Disabling Manual Services
sc config AJRouter start=disabled
sc config ALG start=demand
sc config AppIDSvc start=demand
sc config AppMgmt start=demand
sc config AppReadiness start=demand
sc config AppVClient start=disabled
sc config AppXSvc start=demand
sc config Appinfo start=demand
sc config AssignedAccessManagerSvc start=disabled
sc config AxInstSV start=demand
sc config BDESVC start=demand
sc config BTAGService start=demand
sc config BcastDVRUserService start=demand
sc config BluetoothUserService start=demand
sc config Browser start=demand
sc config CDPSvc start=demand
sc config COMSysApp start=demand
sc config CaptureService start=demand
sc config CertPropSvc start=demand
sc config ClipSVC start=demand
sc config ConsentUxUserSvc start=demand
sc config CscService start=demand
sc config DevQueryBroker start=demand
sc config DeviceAssociationService start=demand
sc config DeviceInstall start=demand
sc config DevicePickerUserSvc start=demand
sc config DevicesFlowUserSvc start=demand
sc config DiagTrack start=disabled
sc config DialogBlockingService start=disabled
sc config DisplayEnhancementService start=demand
sc config DmEnrollmentSvc start=demand
sc config DsSvc start=demand
sc config DsmSvc start=demand
sc config EFS start=demand
sc config EapHost start=demand
sc config EntAppSvc start=demand
sc config FDResPub start=demand
sc config Fax start=demand
sc config FrameServer start=demand
sc config FrameServerMonitor start=demand
sc config GraphicsPerfSvc start=demand
sc config HvHost start=demand
sc config IEEtwCollectorService start=demand
sc config InstallService start=demand
sc config InventorySvc start=demand
sc config IpxlatCfgSvc start=demand
sc config KtmRm start=demand
sc config LicenseManager start=demand
sc config LxpSvc start=demand
sc config MSDTC start=demand
sc config MSiSCSI start=demand
sc config McpManagementService start=demand
sc config MessagingService start=demand
sc config MicrosoftEdgeElevationService start=demand
sc config MsKeyboardFilter start=demand
sc config NPSMSvc start=demand
sc config NaturalAuthentication start=demand
sc config NcaSvc start=demand
sc config NcbService start=demand
sc config NcdAutoSetup start=demand
sc config NetSetupSvc start=demand
sc config NetTcpPortSharing start=disabled
sc config Netman start=demand
sc config NgcCtnrSvc start=demand
sc config NgcSvc start=demand
sc config NlaSvc start=demand
sc config P9RdrService start=demand
sc config PNRPAutoReg start=demand
sc config PNRPsvc start=demand
sc config PcaSvc start=demand
sc config PeerDistSvc start=demand
sc config PenService start=demand
sc config PerfHost start=demand
sc config PhoneSvc start=demand
sc config PimIndexMaintenanceSvc start=demand
sc config PlugPlay start=demand
sc config PolicyAgent start=demand
sc config PrintNotify start=demand
sc config PushToInstall start=demand
sc config QWAVE start=demand
sc config RasAuto start=demand
sc config RasMan start=demand
sc config RemoteAccess start=disabled
sc config RemoteRegistry start=disabled
sc config RetailDemo start=demand
sc config RmSvc start=demand
sc config RpcLocator start=demand
sc config SCPolicySvc start=demand
sc config SCardSvr start=demand
sc config SDRSVC start=demand
sc config SEMgrSvc start=demand
sc config SNMPTRAP start=demand
sc config SNMPTrap start=demand
sc config SSDPSRV start=demand
sc config ScDeviceEnum start=demand
sc config SensorDataService start=demand
sc config SensorService start=demand
sc config SensrSvc start=demand
sc config SessionEnv start=demand
sc config SharedAccess start=demand
sc config SmsRouter start=demand
sc config SstpSvc start=demand
sc config StiSvc start=demand
sc config StateRepository start=demand
sc config StorSvc start=demand
sc config TapiSrv start=demand
sc config TextInputManagementService start=demand
sc config TieringEngineService start=demand
sc config TokenBroker start=demand
sc config TroubleshootingSvc start=demand
sc config TrustedInstaller start=demand
sc config UdkUserSvc start=demand
sc config UmRdpService start=demand
sc config UnistoreSvc start=demand
sc config UserDataSvc start=demand
sc config UsoSvc start=demand
sc config VSS start=demand
sc config VacSvc start=demand
sc config WEPHOSTSVC start=demand
sc config WFDSConMgrSvc start=demand
sc config WMPNetworkSvc start=demand
sc config WManSvc start=demand
sc config WPDBusEnum start=demand
sc config WalletService start=demand
sc config WarpJITSvc start=demand
sc config WbioSrvc start=demand
sc config WdNisSvc start=demand
sc config WdiServiceHost start=demand
sc config WdiSystemHost start=demand
sc config WebClient start=demand
sc config Wecsvc start=demand
sc config WerSvc start=demand
sc config WiaRpc start=demand
sc config WinHttpAutoProxySvc start=demand
sc config WinRM start=demand
sc config WpcMonSvc start=demand
sc config WpnService start=demand
sc config WwanSvc start=demand
sc config XblAuthManager start=demand
sc config XblGameSave start=demand
sc config XboxGipSvc start=demand
sc config XboxNetApiSvc start=demand
sc config autotimesvc start=demand
sc config bthserv start=demand
sc config camsvc start=demand
sc config cbdhsvc start=demand
sc config cloudidsvc start=demand
sc config dcsvc start=demand
sc config defragsvc start=demand
sc config diagnosticshub.standardcollector.service start=demand
sc config diagsvc start=demand
sc config dmwappushservice start=demand
sc config dot3svc start=demand
sc config edgeupdate start=demand
sc config edgeupdatem start=demand
sc config embeddedmode start=demand
sc config fdPHost start=demand
sc config fhsvc start=demand
sc config hidserv start=demand
sc config icssvc start=demand
sc config lfsvc start=demand
sc config lltdsvc start=demand
sc config lmhosts start=demand
sc config msiserver start=demand
sc config netprofm start=demand
sc config p2pimsvc start=demand
sc config p2psvc start=demand
sc config perceptionsimulation start=demand
sc config pla start=demand
sc config seclogon start=demand
sc config shpamsvc start=disabled
sc config smphost start=demand
sc config ssh-agent start=disabled
sc config svsvc start=demand
sc config swprv start=demand
sc config tzautoupdate start=disabled
sc config upnphost start=demand
sc config vds start=demand
sc config vmicguestinterface start=demand
sc config vmicheartbeat start=demand
sc config vmickvpexchange start=demand
sc config vmicrdv start=demand
sc config vmicshutdown start=demand
sc config vmictimesync start=demand
sc config vmicvmsession start=demand
sc config vmicvss start=demand
sc config vmvss start=demand
sc config wbengine start=demand
sc config wcncsvc start=demand
sc config webthreatdefsvc start=demand
sc config wercplsupport start=demand
sc config wisvc start=demand
sc config wlidsvc start=demand
sc config wlpasvc start=demand
sc config wmiApSrv start=demand
sc config workfolderssvc start=demand
sc config wuauserv start=demand
sc config wudfsvc start=demand
echo -- Disabling HAGS
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 1 /f
echo -- Disabling Prefetch
sc stop sysmain
sc config sysmain start=disabled
echo -- Disabling System files access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v "Value" /d "Deny" /t REG_SZ /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" /v "Value" /d "Deny" /t REG_SZ /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v "Value" /d "Deny" /t REG_SZ /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v "Value" /d "Deny" /t REG_SZ /f
:: Pause the script
pause
:: Restore previous environment
endlocal
:: Exit the script
taskkill /f /im explorer.exe & start explorer & exit /b 0

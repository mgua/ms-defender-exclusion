# defender-exclude.ps1
#
# this powershell script allows setting temporary MSdefender exclusions
# based on info received from Xavier Pollet, on jan 5 2023
# https://docs.microsoft.com/en-us/microsoft-365/security/defender-endpoint/configure-extension-file-exclusions-microsoft-defender-antivirus?view=o365-worldwide#review-the-list-of-exclusions 
#
# marco.guardigli@external.technipenergies.com mgua@tomware.it 2023 jan 05
#

$WDAVprefs_back = Get-MpPreference
$excluded_extensions_list_bak = $WDAVprefs_back.ExclusionExtension
$excluded_path_list_bak = $WDAVprefs_back.ExclusionPath

################## ADJUST HERE ##############################
$excluded_extensions_list = @('.eicar', '.noscan')
$excluded_path_list = @('c:\data\hacks', 'c:\wsl')
#############################################################

echo "This powershell script allows temporary exclusions from MS defender scan actions"
echo "---"
echo "the following extensions will not be scanned: [$excluded_extensions_list]" 
echo "the following paths will not be scanned: [$excluded_path_list]" 

# Set-MpPreference -ExclusionExtension ".eicar"
Set-MpPreference -ExclusionExtension $excluded_extensions_list

# Set-MpPreference -ExclusionPath "c:\wsl"
Set-MpPreference -ExclusionPath $excluded_path_list

$WDAVprefs_now = Get-MpPreference
$excluded_extensions_list_now = $WDAVprefs_now.ExclusionExtension
$excluded_path_list_now = $WDAVprefs_now.ExclusionPath
echo "  current ExclusionExtension = [$excluded_extensions_list_now]"
echo "  current ExclusionPath = [$excluded_path_list_now]"

echo "Pressing ENTER default behavior will be re-established"
pause
Set-MpPreference -ExclusionExtension $excluded_extensions_list_bak
Set-MpPreference -ExclusionPath $excluded_path_list_bak
echo ""

$WDAVprefs_now = Get-MpPreference
$excluded_extensions_list_now = $WDAVprefs_now.ExclusionExtension
$excluded_path_list_now = $WDAVprefs_now.ExclusionPath
echo "  current ExclusionExtension = [$excluded_extensions_list_now]"
echo "  current ExclusionPath = [$excluded_path_list_now]"

echo "Done."
pause







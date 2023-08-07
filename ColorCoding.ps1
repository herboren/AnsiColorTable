function HueT([string]$hue, $object)
{
    # New Object
    $act = [ANSIColorTable]::new()    
    $ansiReset = [char]27 + '[0m'
    # Check if type == string and hue not empty
    if ($object.GetType().Name -eq 'String')
    {        
        if ($object -and $hue) {
            $hue = $act.GetColorCode($hue)
            Write-Host "$($hue)$($object)$($ansiReset)"
        }
        else {
            Write-Host "$($object)"
        }
    }
}

function HueL ($object, [switch] $SimpleMatch)
{
    if ($object.GetType().Name -eq 'Hashtable')
    {
        if ($object.Count -gt 1) {
            $rows = ($input | Out-String) -replace '`r','' -split '`n'
        }

        # New Object
        $act = [ANSIColorTable]::new()    
        $ansiReset = [char]27 + '[0m'

        foreach($row in $rows)
        {
            foreach ($regexPattern in $object.Keys)
            {
                if (!$SimpleMatch -and $row -match $regexPattern)
                {
                    Write-Host $object[$regexPattern]
                    $hue = $act.GetColorCode($object[$regexPattern])
                }
                elseif ($SimpleMatch -and $row -like $regexPattern)
                {
                    Write-Host $object[$regexPattern]
                    $hue = $act.GetColorCode($object[$regexPattern])
                }
            }

            if ($hue) {
                Write-Host "$($hue)$($row)$($ansiReset)"
            }
            else {
                Write-Host "$($row)"
            }
        }    
    }
}

class ANSIColorTable
{
    [string] GetColorCode([string]$color)
    {
        return $this.ansiColorCode[$color]
    }    

    $ansiColorCode    = @{
        'Aqua'               = "$([char]27)[38;5;14m"
        'Aquamarine'         = "$([char]27)[38;5;86m"
        'Aquamarine3'        = "$([char]27)[38;5;79m"
        'Black'              = "$([char]27)[38;5;0m"
        'Blue'               = "$([char]27)[38;5;12m"
        'Blue3'              = "$([char]27)[38;5;19m"
        'BlueViolet'         = "$([char]27)[38;5;57m"
        'CadetBlue'          = "$([char]27)[38;5;72m"
        'Chartreuse'         = "$([char]27)[38;5;118m"
        'Chartreuse2'        = "$([char]27)[38;5;82m"
        'Chartreuse3'        = "$([char]27)[38;5;70m"
        'Chartreuse4'        = "$([char]27)[38;5;64m"
        'CornflowerBlue'     = "$([char]27)[38;5;69m"
        'Cornsilk'           = "$([char]27)[38;5;230m"
        'Cyan'               = "$([char]27)[38;5;51m"
        'Cyan2'              = "$([char]27)[38;5;50m"
        'Cyan3'              = "$([char]27)[38;5;43m"
        'DarkBlue'           = "$([char]27)[38;5;18m"
        'DarkCyan'           = "$([char]27)[38;5;36m"
        'DarkGoldenrod'      = "$([char]27)[38;5;136m"
        'DarkGreen'          = "$([char]27)[38;5;22m"
        'DarkKhaki'          = "$([char]27)[38;5;143m"
        'DarkMagenta'        = "$([char]27)[38;5;90m"
        'DarkOliveGreen'     = "$([char]27)[38;5;191m"
        'DarkOliveGreen2'    = "$([char]27)[38;5;155m"
        'DarkOliveGreen3'    = "$([char]27)[38;5;107m"
        'DarkOrange'         = "$([char]27)[38;5;208m"
        'DarkOrange3'        = "$([char]27)[38;5;130m"
        'DarkRed'            = "$([char]27)[38;5;52m"
        'DarkSeaGreen'       = "$([char]27)[38;5;108m"
        'DarkSeaGreen2'      = "$([char]27)[38;5;151m"
        'DarkSeaGreen3'      = "$([char]27)[38;5;115m"
        'DarkSeaGreen4'      = "$([char]27)[38;5;65m"
        'DarkSlateGray'      = "$([char]27)[38;5;123m"
        'DarkSlateGray2'     = "$([char]27)[38;5;87m"
        'DarkSlateGray3'     = "$([char]27)[38;5;116m"
        'DarkTurquoise'      = "$([char]27)[38;5;44m"
        'DarkViolet'         = "$([char]27)[38;5;92m"
        'DeepPink'           = "$([char]27)[38;5;198m"
        'DeepPink2'          = "$([char]27)[38;5;197m"
        'DeepPink3'          = "$([char]27)[38;5;161m"
        'DeepPink4'          = "$([char]27)[38;5;53m"
        'DeepSkyBlue'        = "$([char]27)[38;5;39m"
        'DeepSkyBlue2'       = "$([char]27)[38;5;38m"
        'DeepSkyBlue3'       = "$([char]27)[38;5;31m"
        'DeepSkyBlue4'       = "$([char]27)[38;5;23m"
        'DodgerBlue'         = "$([char]27)[38;5;33m"
        'DodgerBlue2'        = "$([char]27)[38;5;27m"
        'DodgerBlue3'        = "$([char]27)[38;5;26m"
        'Fuchsia'            = "$([char]27)[38;5;13m"
        'Gold'               = "$([char]27)[38;5;220m"
        'Gold3'              = "$([char]27)[38;5;142m"
        'Green'              = "$([char]27)[38;5;2m"
        'Green3'             = "$([char]27)[38;5;34m"
        'Green4'             = "$([char]27)[38;5;28m"
        'GreenYellow'        = "$([char]27)[38;5;154m"
        'Grey'               = "$([char]27)[38;5;8m"
        'Grey0'              = "$([char]27)[38;5;16m"
        'Grey1'              = "$([char]27)[38;5;234m"
        'Grey100'            = "$([char]27)[38;5;231m"
        'Grey15'             = "$([char]27)[38;5;235m"
        'Grey19'             = "$([char]27)[38;5;236m"
        'Grey23'             = "$([char]27)[38;5;237m"
        'Grey27'             = "$([char]27)[38;5;238m"
        'Grey3'              = "$([char]27)[38;5;232m"
        'Grey30'             = "$([char]27)[38;5;239m"
        'Grey35'             = "$([char]27)[38;5;240m"
        'Grey37'             = "$([char]27)[38;5;59m"
        'Grey39'             = "$([char]27)[38;5;241m"
        'Grey42'             = "$([char]27)[38;5;242m"
        'Grey46'             = "$([char]27)[38;5;243m"
        'Grey50'             = "$([char]27)[38;5;244m"
        'Grey53'             = "$([char]27)[38;5;102m"
        'Grey54'             = "$([char]27)[38;5;245m"
        'Grey58'             = "$([char]27)[38;5;246m"
        'Grey62'             = "$([char]27)[38;5;247m"
        'Grey63'             = "$([char]27)[38;5;139m"
        'Grey66'             = "$([char]27)[38;5;248m"
        'Grey69'             = "$([char]27)[38;5;145m"
        'Grey7'              = "$([char]27)[38;5;233m"
        'Grey70'             = "$([char]27)[38;5;249m"
        'Grey74'             = "$([char]27)[38;5;250m"
        'Grey78'             = "$([char]27)[38;5;251m"
        'Grey82'             = "$([char]27)[38;5;252m"
        'Grey84'             = "$([char]27)[38;5;188m"
        'Grey85'             = "$([char]27)[38;5;253m"
        'Grey89'             = "$([char]27)[38;5;254m"
        'Grey93'             = "$([char]27)[38;5;255m"
        'Honeydew2'          = "$([char]27)[38;5;194m"
        'HotPink'            = "$([char]27)[38;5;205m"
        'HotPink2'           = "$([char]27)[38;5;169m"
        'HotPink3'           = "$([char]27)[38;5;132m"
        'IndianRed'          = "$([char]27)[38;5;131m"
        'Khaki'              = "$([char]27)[38;5;228m"
        'Khaki3'             = "$([char]27)[38;5;185m"
        'LightCoral'         = "$([char]27)[38;5;210m"
        'LightCyan'          = "$([char]27)[38;5;195m"
        'LightCyan3'         = "$([char]27)[38;5;152m"
        'LightGoldenrod'     = "$([char]27)[38;5;227m"
        'LightGoldenrod2'    = "$([char]27)[38;5;186m"
        'LightGoldenrod3'    = "$([char]27)[38;5;179m"
        'LightGreen'         = "$([char]27)[38;5;119m"
        'LightPink'          = "$([char]27)[38;5;217m"
        'LightPink3'         = "$([char]27)[38;5;174m"
        'LightPink4'         = "$([char]27)[38;5;95m"
        'LightSalmon'        = "$([char]27)[38;5;216m"
        'LightSalmon3'       = "$([char]27)[38;5;137m"
        'LightSeaGreen'      = "$([char]27)[38;5;37m"
        'LightSkyBlue'       = "$([char]27)[38;5;153m"
        'LightSkyBlue3'      = "$([char]27)[38;5;109m"
        'LightSlateBlue'     = "$([char]27)[38;5;105m"
        'LightSlateGrey'     = "$([char]27)[38;5;103m"
        'LightSteelBlue'     = "$([char]27)[38;5;147m"
        'LightSteelBlue3'    = "$([char]27)[38;5;146m"
        'LightYellow3'       = "$([char]27)[38;5;187m"
        'Lime'               = "$([char]27)[38;5;10m"
        'Magenta'            = "$([char]27)[38;5;201m"
        'Magenta2'           = "$([char]27)[38;5;165m"
        'Magenta3'           = "$([char]27)[38;5;127m"
        'Maroon'             = "$([char]27)[38;5;1m"
        'MediumOrchid'       = "$([char]27)[38;5;134m"
        'MediumOrchid3'      = "$([char]27)[38;5;133m"
        'MediumPurple'       = "$([char]27)[38;5;104m"
        'MediumPurple2'      = "$([char]27)[38;5;135m"
        'MediumPurple3'      = "$([char]27)[38;5;97m"
        'MediumPurple4'      = "$([char]27)[38;5;60m"
        'MediumSpringGreen'  = "$([char]27)[38;5;49m"
        'MediumTurquoise'    = "$([char]27)[38;5;80m"
        'MediumVioletRed'    = "$([char]27)[38;5;126m"
        'MistyRose'          = "$([char]27)[38;5;224m"
        'MistyRose3'         = "$([char]27)[38;5;181m"
        'NavajoWhite'        = "$([char]27)[38;5;223m"
        'NavajoWhite3'       = "$([char]27)[38;5;144m"
        'Navy'               = "$([char]27)[38;5;4m"
        'NavyBlue'           = "$([char]27)[38;5;17m"
        'Olive'              = "$([char]27)[38;5;3m"
        'Orange'             = "$([char]27)[38;5;214m"
        'Orange3'            = "$([char]27)[38;5;172m"
        'Orange4'            = "$([char]27)[38;5;58m"
        'OrangeRed'          = "$([char]27)[38;5;202m"
        'Orchid'             = "$([char]27)[38;5;170m"
        'Orchid2'            = "$([char]27)[38;5;212m"
        'PaleGreen'          = "$([char]27)[38;5;121m"
        'PaleGreen3'         = "$([char]27)[38;5;77m"
        'PaleTurquoise'      = "$([char]27)[38;5;159m"
        'PaleTurquoise4'     = "$([char]27)[38;5;66m"
        'PaleVioletRed'      = "$([char]27)[38;5;211m"
        'Pink'               = "$([char]27)[38;5;218m"
        'Pink3'              = "$([char]27)[38;5;175m"
        'Plum'               = "$([char]27)[38;5;219m"
        'Plum2'              = "$([char]27)[38;5;183m"
        'Plum3'              = "$([char]27)[38;5;176m"
        'Plum4'              = "$([char]27)[38;5;96m"
        'Purple'             = "$([char]27)[38;5;5m"
        'Purple3'            = "$([char]27)[38;5;56m"
        'Purple4'            = "$([char]27)[38;5;54m"
        'Red'                = "$([char]27)[38;5;9m"
        'Red3'               = "$([char]27)[38;5;124m"
        'RosyBrown'          = "$([char]27)[38;5;138m"
        'RoyalBlue'          = "$([char]27)[38;5;63m"
        'Salmon'             = "$([char]27)[38;5;209m"
        'SandyBrown'         = "$([char]27)[38;5;215m"
        'SeaGreen'           = "$([char]27)[38;5;84m"
        'SeaGreen2'          = "$([char]27)[38;5;83m"
        'SeaGreen3'          = "$([char]27)[38;5;78m"
        'Silver'             = "$([char]27)[38;5;7m"
        'SkyBlue'            = "$([char]27)[38;5;117m"
        'SkyBlue2'           = "$([char]27)[38;5;111m"
        'SkyBlue3'           = "$([char]27)[38;5;74m"
        'SlateBlue'          = "$([char]27)[38;5;99m"
        'SlateBlue3'         = "$([char]27)[38;5;61m"
        'SpringGreen'        = "$([char]27)[38;5;48m"
        'SpringGreen2'       = "$([char]27)[38;5;42m"
        'SpringGreen3'       = "$([char]27)[38;5;35m"
        'SpringGreen4'       = "$([char]27)[38;5;29m"
        'SteelBlue'          = "$([char]27)[38;5;67m"
        'SteelBlue3'         = "$([char]27)[38;5;68m"
        'Tan'                = "$([char]27)[38;5;180m"
        'Teal'               = "$([char]27)[38;5;6m"
        'Thistle'            = "$([char]27)[38;5;225m"
        'Thistle3'           = "$([char]27)[38;5;182m"
        'Turquoise2'         = "$([char]27)[38;5;45m"
        'Turquoise4'         = "$([char]27)[38;5;30m"
        'Violet'             = "$([char]27)[38;5;177m"
        'Wheat'              = "$([char]27)[38;5;229m"
        'Wheat4'             = "$([char]27)[38;5;101m"
        'White'              = "$([char]27)[38;5;15m"
        'Yellow'             = "$([char]27)[38;5;11m"
        'Yellow2'            = "$([char]27)[38;5;190m"
        'Yellow3'            = "$([char]27)[38;5;148m"
        'Yellow4'            = "$([char]27)[38;5;100m"
     }
}

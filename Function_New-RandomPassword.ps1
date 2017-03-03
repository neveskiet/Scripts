<# This script was made by:
=============================================
    ╔═╗┬ ┬┌─┐┬  ┬ ┬ ┬  ╔═╗┌─┐┬ ┬┌─┐┬─┐┌─┐
    ╚═╗├─┤├┤ │  │ └┬┘  ╠═╝│ ││││├┤ ├┬┘└─┐
    ╚═╝┴ ┴└─┘┴─┘┴─┘┴   ╩  └─┘└┴┘└─┘┴└─└─┘
=============================================
        http://shellypowers.com/
#>

function New-RandomPassword() {
<#
.SYNOPSIS
    Function to generate a random password
.DESCRIPTION
    This function generates a random password with a custom length. The default length is 16 characters
.EXAMPLE
    Generate a random password of 32 characters and store it in the variable
    $password = New-RandomPassword -PasswordLength 32
.EXAMPLE
    Generate a random password of 16 characters including special characters
    $password = New-RandomPassword -PasswordLength 16
.EXAMPLE
    Generate a random password of 8 characters from a custom defined string of characters
    $string = "123abc"
    $password = New-RandomPassword -PasswordLength 8 -customInputString $string
#>
    PARAM(
        [int]$passwordLength = 16,
        [switch]$includeSpecialCharacters = $false,
        [string]$customInputString
    )

    BEGIN
    {
        $chars = "ABCDEFGHIJKLMNOPQRSTUVWabcdefghijklmnopqrstuvwxyz1234567890"
        $specials = "!@#$%^&*(){}[]<>?"

        if($includeSpecialCharacters) {
            $chars = $chars + $specials
        }

        if($customInputString) {
            $chars = $null
            $chars = $chars + $customInputString
        }
    }
    PROCESS
    {
        for ($i=1; $i –le $passwordLength; $i++) {
            $n = Get-Random -Maximum ($chars.length)
            $password += $chars[$n]
        }

    }
    END
    {
        RETURN $password
    }
}

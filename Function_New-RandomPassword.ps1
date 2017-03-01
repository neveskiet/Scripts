Function New-RandomPassword() {
<#
.SYNOPSIS
    Function to generate a random password
.DESCRIPTION
    This function generates a random password with a custom length. The default length is 16 characters
.EXAMPLE
    Generate a random password of 32 characters and store it in the variable
    $password = New-RandomPassword -PasswordLength 32
#>

    Param(
        [int]$passwordLength = 16
    )

    Begin {
        # select ascii characters we want to use in our randomly generated passwords
        $chars=$null
        for ($a=48;$a –le 127;$a++) {
            
            # Numbers 0 to 9
            if ($a -in 48..57) {
                $chars+=,[char][byte]$a
            }

            # Capitals A to Z
            if ($a -in 65..90) {
                $chars+=,[char][byte]$a
            }

            # Lowercase a to z
            if ($a -in 97..122) {
                $chars+=,[char][byte]$a
            }
        }
    }
    Process {
        For ($i=1; $i –le $passwordLength; $i++) {
            $password+=($chars | Get-Random)
        }
    }
    End {
        return $password
    }
} 

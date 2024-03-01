Import-Module ActiveDirectory

function UpdateEmployeeID {
    while ($true) {
        $searchCriteria = Read-Host "Enter the username, email, or first and last name of the account (or type 'exit' to quit)"
        if ($searchCriteria -eq 'exit') {
            Write-Host "Exiting..."
            break
        }

        if ($searchCriteria -contains ' ') {
            $names = $searchCriteria -split ' '
            $firstName = $names[0]
            $lastName = $names[-1]
            $userFilter = "((GivenName -eq '$firstName' -and Surname -eq '$lastName') -or SamAccountName -eq '$searchCriteria' -or Mail -eq '$searchCriteria')"
        } else {
            $userFilter = "(SamAccountName -eq '$searchCriteria' -or Mail -eq '$searchCriteria' -or Name -like '*$searchCriteria*')"
        }

        $user = Get-ADUser -Filter $userFilter -Properties Mail, EmployeeID

        if ($user -eq $null) {
            Write-Host "No user found with the given criteria: $searchCriteria."
            continue
        } else {
            Write-Host "User found: $($user.Name)"
        }

        $newEmployeeID = Read-Host "Enter the new Employee ID for $($user.Name)"
        Set-ADUser -Identity $user.SamAccountName -EmployeeID $newEmployeeID
        $updatedUser = Get-ADUser -Identity $user.SamAccountName -Properties EmployeeID
        Write-Host "The Employee ID for $($updatedUser.Name) has been updated to: $($updatedUser.EmployeeID)"
    }
}

UpdateEmployeeID

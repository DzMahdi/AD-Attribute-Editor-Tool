# Import the Active Directory module
Import-Module ActiveDirectory

# Prompt for search criteria
$searchCriteria = Read-Host "Enter the username, email, or first and last name of the account"

# Attempt to find the user based on the provided criteria
# Checks for SamAccountName, Email, or Name
$user = Get-ADUser -Filter {SamAccountName -eq $searchCriteria -or Mail -eq $searchCriteria -or Name -like "*$searchCriteria*"} -Properties Mail, EmployeeID

if ($user -eq $null) {
    Write-Host "No user found with the given criteria: $searchCriteria."
    exit
} else {
    Write-Host "User found: $($user.Name)"
}

# Prompt for the new employeeID
$newEmployeeID = Read-Host "Enter the new Employee ID for $($user.Name)"

# Update the employeeID attribute
Set-ADUser -Identity $user -EmployeeID $newEmployeeID

# Confirm the change
$updatedUser = Get-ADUser -Identity $user -Properties EmployeeID
Write-Host "The Employee ID for $($user.Name) has been updated to: $($updatedUser.EmployeeID)"

# AD Attribute Editor Tool

The AD Attribute Editor Tool is a PowerShell script designed to update specific attributes for user accounts in Active Directory (AD) based on various search criteria. This tool provides a flexible and efficient way to manage user account details directly from the command line, making it an essential utility for IT administrators tasked with maintaining accurate and up-to-date user information in AD environments.

## Features

- **Flexible Search Options**: Allows searching for user accounts using username, email, or name, making it easier to find the target account even with partial information.
- **Custom Attribute Updates**: Facilitates the modification of specific user attributes, with the example script focusing on updating the `EmployeeID` attribute. The script can be easily modified to update other attributes as needed.
- **User Feedback**: Provides immediate feedback on the search results and confirms the successful update of the user attribute, ensuring transparency and accuracy in the update process.

## How It Works

1. **Search for User Account**: Prompts the user to enter a search criterion (username, email, or name) and attempts to find the matching AD user account.
2. **Attribute Update**: Once the target user account is found, it prompts for the new data for a specific attribute (e.g., `EmployeeID`) and updates the attribute in Active Directory.
3. **Confirmation**: Confirms the successful update of the attribute by retrieving and displaying the updated information.

## Usage

1. Ensure you have the necessary permissions to modify user attributes in Active Directory.
2. Open PowerShell with administrative privileges.
3. Navigate to the directory containing the script.
4. Execute the script by typing `.\AD_Attribute_Editor_Tool.ps1` and press Enter. Follow the on-screen prompts to search for a user and update their attributes.


This script can be adapted to modify other attributes by changing the `-Properties` parameter and the `Set-ADUser` command accordingly. It's a powerful tool for administrators to manage AD user attributes efficiently.

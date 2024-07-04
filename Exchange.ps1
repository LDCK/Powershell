#Get mailbox permissions for user@company.com
Get-MailboxPermission -identity "user@company.com"

#Get current Calendar permissions for user@company.com calendar
Get-MailboxFolderPermission -identity "user@company.com:\Calendar"

#Add calendar permissions for user@company.com calendar
Add-MailboxFolderPermission -identity "user@company.com:\Calendar" -user "John.Legend" -AccessRights Author

#Update the User "John.Legend" to have Publishing Editor rights to user@company.com calendar.
##This is used when the user already has calendar access but the access level needs to be changed.
Set-MailboxFolderPermission -identity "user@company.com:\Calendar" -user "John.Legend" -AccessRights PublishingEditor

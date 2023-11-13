#Get current Calendar permissions for user@company.com calendar
Get-MailboxFolderPermission -identity "user@company.com:\Calendar"

#Set User "John.Legend" with Publishing Editor rights to user@company.com calendar.
Set-MailboxFolderPermission -identity "user@company.com:\Calendar" -user "John.Legend" -AccessRights PublishingEditor


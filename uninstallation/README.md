# Java Compiler Collection uninstallation guidelines

---
#### Contents of the website:

 - [Home page](..)
 - [Release notes](../release-notes)
 - Uninstallation
 
---

Uninstalling it's not so easy like installing it, since you need to do a lot of things during the uninstallation process. Just follow this steps:

1. Delete the whole `%AppData%\JCC` folder.
2. Run `systempropertiesadvanced`
3. Go to edit system variables or something similar.
4. Go to user path variable (not system variable)
5. Delete the line with the PATH to `%AppData%\JCC\bin`
6. Done! Uninstallation complete.

However, I want to create a tool that automates the whole process. Coming soon...

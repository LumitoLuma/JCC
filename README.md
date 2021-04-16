# Java Compiler Collection (JCC)

### WARNING: JCC IS NO LONGER MAINTAINED. SORRY FOR THE INCONVEINENCE.

Java Compiler Collection is a set of three Java compilers: Maven, Gradle and Ant. This tool installs them to `%AppData%\JCC\` and adds its 'Bin' folders to the user PATH variable, so you can use Maven, Gradle and Ant from any place.

**Attention:** JCC is currently **under heavy development** and might have some bugs. I am working currently to make a stable version of JCC

## Why JCC
Before I started with Java Compiler Collection development, I used a lot Gradle and Maven compiler and to a lesser extent, Ant.
The problem I had is that you allways need to download the compilers and copy them to the working directory, a mess.

To solve this problem, there are some tools called 'wrappers' that make this work easy, since they are very portable. However, you'll need to copy them inside every project you want to compile.

So I thought how can I make a tool that makes possible to use those compiler without needing to copy them every time you want to develop a Java application, so I developed JCC.

It installs the three compilers in your computer (at `%AppData%\JCC` folder) and then adds that folders to PATH user environment variable.

To install JCC, continue reading this document.

## Installing Java Compiler Collection
Installation is very easy, but you will need some requirements.

### Requirements
-   Java SE Development kit >=8 (visit [lumi.gq/jdk](https://lumi.gq/jdk) if you don't have it)
-   Microsoft .NET Framework >= 4.0 (To compile and run `addtopath.cs`) and added to PATH. OR Microsoft Visual Studio 2019 and install from developer command prompt.

### How to install
| [![Install](https://github.com/LumitoLuma/JCC/workflows/Install/badge.svg)](https://github.com/LumitoLuma/JCC/actions?query=workflow%3AInstall) | [![Build status](https://ci.appveyor.com/api/projects/status/k2iwyam4nmkoqj82?svg=true)](https://ci.appveyor.com/project/LumitoLuma/JCC) | [![Build Status](https://lumito.visualstudio.com/GitHub/_apis/build/status/LumitoLuma.JCC?branchName=master)](https://lumito.visualstudio.com/GitHub/_build/latest?definitionId=8&branchName=master) |
|:-:|:-:|:-:|

1.  `git clone` or [download this repo](https://codeload.github.com/LumitoLuma/JCC/zip/master).
2.  Open `cmd.exe` or Developer Command Prompt.
3.  Go to the working directory
4.  Run `install.bat`
5.  Wait a few minutes
6.  Done! Now you can run `jcc ant`, `jcc mvn` and `jcc gradle` from any place!

### How to uninstall
Visit: [lumitoluma.github.io/JCC/uninstallation](https://lumitoluma.github.io/JCC/uninstallation)

## Contributing to the project
If you want to contribute to the project, please contact me through [www.lumito.net/contact](https://www.lumito.net/contact) or open a Pull Request.

You can contribute with the following things:

-   Code improvements
-   Ideas for future programs / services.

Reporting bugs there is not allowed, unless you have reported them through [Issues](https://github.com/LumitoLuma/JCC/issues) tab and you have not received any comments for a while (minimum a week).
<br><br>
**© 2020, Lumito - [www.lumito.net](https://www.lumito.net)**

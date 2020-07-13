# Java Compiler Collection (JCC)

Java Compiler Collection is a set of three Java compilers: Maven, Gradle and Ant. This tool installs them to `%AppData%\JCC\` and adds its 'Bin' folders to the user PATH variable, so you can use Maven, Gradle and Ant from any place.

## Why JCC?

Before I started with Java Compiler Collection development, I used a lot Gradle and Maven compiler and to a lesser extent, Ant.
The problem I had is that you allways need to download the compilers and copy them to the working directory, a mess.

But there are some tools called 'wrappers' that make this work easy, since they are very portable. However, you'll need to copy them inside every project you want to compile.

So I thought how can I make a tool that makes possible to use those compiler without needing to copy them every time you want to develop a Java application, so I developed JCC.

It installs the three compilers in your computer (exactly at `%AppData%\JCC` folder) and then adds that folders to PATH user environment variable.

Yo install JCC, continue reading this document.

## Installing Java Compiler Collection

Installation is very easy, but you will need some requirements.

### Requirements:

- Java SE Development kit >=8 ([bit.ly/javadevelopmentkit](https://bit.ly/javadevelopmentkit) if you don't have it)
- Microsoft .NET Framework >= 4.0 (To compile and install `addtopath.cs`) and added to PATH. OR Microsoft Visual Studio 2019 and install from developer command prompt.

### How to install:

| [![Install](https://github.com/LumitoLuma/JCC/workflows/Install/badge.svg)](https://github.com/LumitoLuma/JCC/actions?query=workflow%3AInstall) | [![Build status](https://ci.appveyor.com/api/projects/status/k2iwyam4nmkoqj82?svg=true)](https://ci.appveyor.com/project/LumitoLuma/JCC) | [![Build Status](https://dev.azure.com/LumitoLuma/GitHub/_apis/build/status/LumitoLuma.JCC?branchName=master)](https://dev.azure.com/LumitoLuma/GitHub/_build/latest?definitionId=8&branchName=master) |
|-|-|-|

1. `git clone` or download this repo.
2. Open `cmd.exe` or Developer Command Prompt.
3. Go to the working directory
4. Run install.bat
5. Wait a few minutes
6. Done! Now you can run `jcc ant`, `jcc mvn` and `jcc gradle` from any place!

### How to uninstall:

Visit: [lumitoluma.github.io/JCC/uninstallation](https://lumitoluma.github.io/JCC/uninstallation)

#### To get more information about this project, visit it's website: [lumitoluma.github.io/JCC](https://lumitoluma.github.io/JCC)

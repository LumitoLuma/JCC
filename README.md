# Java Compiler Collection (JCC)

Java Compiler Collection is a set of three Java compilers: Maven, Gradle and Ant. This tool installs them to `%AppData%\JCC\` and later adds them to the user PATH variable, so you can use Maven, Gradle and Ant from any place.

## Installing Java Compiler Collection

Installation is very easy, but you will need some requirements.

### Requirements:

- Java SE Development kit >=8 ([bit.ly/javadevelopmentkit](https://bit.ly/javadevelopmentkit) if you don't have it)
- Microsoft .NET Framework >= 4.0 (To compile and install `addtopath.cs`) and added to PATH. OR Microsoft Visual Studio 2019 and install from developer command prompt.

### How to install:

1. `git clone` or download this repo.
2. Open `cmd.exe` or Developer Command Prompt.
3. Go to the working directory
4. Run install.bat
5. Wait a few minutes
6. Restart command prompt after installation
7. Done! Now you can run `ant`, `mvn` and `gradle` from any place!

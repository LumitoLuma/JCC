using System;

namespace AddToPath
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                var name = "PATH";
                var scope = EnvironmentVariableTarget.User;
                var oldValue = Environment.GetEnvironmentVariable(name, scope);
                var newValue = oldValue + @";" + args[0];
                Environment.SetEnvironmentVariable(name, newValue, scope);
            }
            catch (IndexOutOfRangeException)
            {
                Console.WriteLine("No valid arguments specified. Usage:\n");
                Console.WriteLine("\'addtopath [folder path]\'");
            }
        }
    }
}
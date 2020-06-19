using System;

namespace CheckIdentifier
{
    public class Program
    {
        public static bool IsEngSym(char symbol)
        {
            return ((symbol >= 'A' && symbol <= 'Z') || (symbol >= 'a' && symbol <= 'z'));
        }

        public static bool IsDigit(char symbol)
        {
            return ('0' <= symbol && symbol <= '9');
        }

        public static bool CheckIdent(string identifier)
        {
            if (identifier.Length == 0)
            {
                Console.WriteLine("No");
                Console.WriteLine("An empty string");
                return false;
            }

            if (!IsEngSym(identifier[0]))
            {
                Console.WriteLine("No");
                Console.WriteLine("The identifier should begin with a letter");
                return false;
            }

            for (int i = 1; i < identifier.Length; i++)
            {
                if (!IsEngSym(identifier[i]) && !char.IsDigit(identifier[i]))
                {
                    Console.WriteLine("No");
                    Console.WriteLine("The identifier should be comlicated with only digits or letters.");
                    return false;
                }

            }
            Console.WriteLine("Yes");
            return true;
        }

        public static int Main(string[] args)
        {
            if (args.Length != 1)
            {
                Console.WriteLine("Incorrect number of arguments!");
                Console.WriteLine("Usage: CheckIdentifier.exe <identifier>");
                return 1;
            }

            string identifier = args[0];
            CheckIdent(identifier);
            return 0;
        }
    }
}
using System;
using System.Collections.Generic;
namespace remove_duplicates
{
    class Program
    {
        static int Main(string[] args)
        {
            if (args.Length != 1)
            {
                Console.WriteLine("Incorrect number of argumens!");
                Console.WriteLine("Right form: remove_duplicates <input string>");
                return 1;
            }

            HashSet<char> setOfCharacters = new HashSet<char>();
            string inputLine = args[0];
            char ch;
            for(int a = 0; a < inputLine.Length; a++)
            {
                ch = inputLine[a];
                if (!setOfCharacters.Contains(ch))
                {
                    setOfCharacters.Add(ch);
                }
                else
                {
                    inputLine = inputLine.Remove(a, 1);
                    a--;
                }
            }

            Console.WriteLine(inputLine);

            return 0;
        }
    }
}

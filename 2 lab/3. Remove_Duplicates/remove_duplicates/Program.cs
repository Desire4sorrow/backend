using System;

namespace RemoveDuplicates
{
    class Program
    {
        private static void Main(string[] args)

        {
            if (args.Length != 1)
            {
                Console.WriteLine("Incorrect number of arguments!");

                Console.WriteLine("Usage: remove_duplicates.exe <input string>");
				
                return 1;
            }
	    else
            {
                string st = args[0];

                Console.WriteLine(st.Distinct().ToArray());
            }
        }
    }
}

using System;

using System.Linq;

namespace PrintArgs
{
    internal class Program
    {
        public static void Main(string[] args)
        {
            if (args.Length != 0)
            {
                Console.WriteLine("Number of arguments: " + args.Length);
                Console.WriteLine("Arguments: " + string.Join(" ", args));
            }
            else
            {
                Console.WriteLine("No parameters were specified!");
            }
        }
    }
}
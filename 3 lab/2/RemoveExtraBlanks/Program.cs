using System;
using System.IO;

namespace RemoveExtraBlanks
{
    public class Program
    {
        public static string RemoveExtraBlanks(string line)
        {
            string newLine = "";
            bool blank = false;
            for (int i = 0; i < line.Length; i++)
            {
                if (line[i] != ' ' && line[i] != '\t')
                {
                    newLine += line[i];
                    blank = true;
                }
                else if (blank)
                {
                    newLine += line[i];
                    blank = false;
                }
            }
            if (newLine.EndsWith(' ') || newLine.EndsWith('\t'))
            {
                newLine = newLine.Remove(newLine.Length - 1);
            }

            return newLine;
        }
        public static int Main(string[] args)
        {
            if (args.Length != 2)
            {
                Console.WriteLine("Invalid nummbers of arguments!");
                Console.WriteLine("Usage RemoveExtraBlanks.exe <input file name> <output file name>");
                return 1;

            }

            string inputFileName = args[0];
            string outputFileName = args[1];
            if (File.Exists(inputFileName) == false)
            {
                Console.WriteLine("Input file " + inputFileName + " is not open!");
                return 1;
            }

            if (inputFileName == outputFileName)
            {
                Console.WriteLine("Same input and output file names");
                return 1;
            }

            StreamReader inputFile = new StreamReader(inputFileName);
            StreamWriter outputFile = new StreamWriter(outputFileName);
            string line_file;

            while ((line_file = inputFile.ReadLine()) != null)
            {
                string new_line;
                new_line = RemoveExtraBlanks(line_file);
                outputFile.WriteLine(new_line);
            }
            inputFile.Close();
            outputFile.Close();
            return 0;
        }
    }
}

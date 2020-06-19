using System;
using System.Linq;
using System.Collections.Generic;

namespace PasswordStrength
{
    public class Program
    {
        public static bool UpperSym(char ch)
        {
            return 'A' <= ch && ch <= 'Z';
        }

        public static bool LowerSym(char ch)
        {
            return 'a' <= ch && ch <= 'z';
        }

        public static int StrengthByLength(string password)
        {
            return password.Length * 4;
        }

        public static int StrengthByDigitsCount(string password)
        {
            return password.Count(char.IsDigit) * 4;
        }

        public static int StrengthByUpperCharsCount(string password)
        {
            return (password.Length - password.Count(UpperSym)) * 2;
        }

        public static int StrengthByLowerCharsCount(string password)
        {
            return (password.Length - password.Count(LowerSym)) * 2;
        }

        public static int StrengthIfOnlyChar(string password)
        {
            if (password.Length == password.Count(char.IsLetter))
            {
                return -password.Length;
            }
            return 0;
        }

        public static int StrengthIfOnlyDigits(string password)
        {
            if (password.Length == password.Count(char.IsDigit))
            {
                return -password.Length;
            }
            return 0;
        }

        public static int StrengthByRepeatedChars(string password)
        {
            int strength = 0;
            Dictionary<char, int> dict = new Dictionary<char, int>();

            for (int i = 0; i < password.Length; i++)
            {
                if (dict.ContainsKey(password[i]))
                {
                    dict[password[i]] += 1;
                }
                else
                {
                    dict[password[i]] = 1;
                }
            }
            foreach (var item in dict)
            {
                if (item.Value > 1)
                {
                    strength -= item.Value;
                }
            }

            return strength;
        }

        public static int CalcPasswordStrength(string password)
        {
            int passwordStrength = 0;
            passwordStrength += StrengthByLength(password);
            passwordStrength += StrengthByDigitsCount(password);
            passwordStrength += StrengthByUpperCharsCount(password);
            passwordStrength += StrengthByLowerCharsCount(password);
            passwordStrength += StrengthIfOnlyChar(password);
            passwordStrength += StrengthIfOnlyDigits(password);
            passwordStrength += StrengthByRepeatedChars(password);
            return passwordStrength;
        }

        static int Main(string[] args)
        {
            if (args.Length != 1)
            {
                Console.WriteLine("Incorrect number of arguments!");
                Console.WriteLine("Usage PasswordStrength.exe <password>");
                return 1;
            }

            string password = args[0];
            int passwordStrength = CalcPasswordStrength(password);
            Console.WriteLine(passwordStrength);

            return 0;
        }
    }
}
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace RemoveExtraBlanks.Tests
{
    [TestClass]
    public class RemoveExtraBlanks
    {
        [TestMethod]
        public void Remove_duplicate_spaces_and_tabs_in_empty_string()
        {
            string str = "";
            string expectedStr = "";
            string res = Program.RemoveExtraBlanks(str);
            Assert.AreEqual(expectedStr, res);
        }

        [TestMethod]
        public void Remove_duplicate_spaces_and_tabs()
        {
            string str = "\t string, \t\t space and tab ";
            string expectedStr = "space and tab";
            string res = Program.RemoveExtraBlanks(str);
            Assert.AreEqual(expectedStr, res);
        }
    }

    [TestClass]
    public class CheckNumberOfArguments
    {
        [TestMethod]
        public void incorrect_number_of_many_argsuments_check()
        {
            string[] arguments = new string[] { "input_file.txt", "output_file.txt", "temp_file.txt" };

            int result = Program.Main(arguments);

            Assert.AreEqual(1, result);
        }
    }

    [TestClass]
    public class CheckFiles
    {
        [TestMethod]
        public void check_incorrect_file_same_name()
        {
            int result;
            string[] arguments = new string[] { "tests\\input.txt", "tests\\input.txt" };
            result = Program.Main(arguments);
            Assert.AreEqual(1, result);
        }

        [TestMethod]
        public void check_incorrect_not_open_file()
        {
            int result;
            string[] arguments = new string[] { "tests\\input1.txt", "tests\\output.txt" };
            result = Program.Main(arguments);
            Assert.AreEqual(1, result);
        }
    }
}
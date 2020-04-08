using Microsoft.VisualStudio.TestTools.UnitTesting;
using CheckIdentifier;
namespace CheckIdentifier.Tests
{
    [TestClass]
    public class CheckIdentifier
    {
        [TestMethod]
        public void Empty_arguments_id()
        {
            bool res = Program.CheckIdent();
            Assert.IsFalse(res);
        }

        [TestMethod]
        public void Empty_string_id()
        {
            bool res = Program.CheckIdent("");
            Assert.IsFalse(res);
        }

        [TestMethod]
        public void id_with_more_than_one_arg()
        {
            bool res = Program.CheckIdent("ch1 ch2");
            Assert.IsFalse(res);
        }

        [TestMethod]
        public void Id_begining_with_number()
        {
            bool res = Program.CheckIdent("3bbb");
            Assert.IsFalse(res);
        }

        [TestMethod]
        public void Id_with_incorect_symbols()
        {
            bool res = Program.CheckIdent("digit.a");
            Assert.IsFalse(res);
        }

        [TestMethod]
        public void Correct_id()
        {
            bool res = Program.CheckIdent("number12");
            Assert.IsTrue(res);
        }
        
    }
}
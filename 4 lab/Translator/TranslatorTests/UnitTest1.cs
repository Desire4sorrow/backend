using System;
using Xunit;
using Translator.Models;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace TranslatorTests
{
    public class CheckTranslateFunction
    {
        public Dictionary dictionary = new Dictionary();

        [Fact]
        public void CheckTranslateFromEnglishToRussianInTheDict()
        {
            string word = "one";
            string result = "îäèí";
            word = dictionary.findTranslation(word);
            Microsoft.VisualStudio.TestTools.UnitTesting.Assert.Equals(word, result);
        }
        [Fact]
        public void CheckTranslateFromEnglishToRussianNotInTheDict()
        {
            string word = "nine";
            string result = "";
            word = dictionary.findTranslation(word);
            Assert.Equals(word, result);
        }

        [Fact]
        public void CheckTranslateFromRussianToEnglishInTheDict()
        {
            string word = "ïÿòü";
            string result = "five";
            word = dictionary.findTranslation(word);
            Assert.Equals(word, result);
        }

        [Fact]
        public void CheckTranslateFromRussianToEnglishNotInTheDict()
        {
            string word = "íîëü";
            string result = "";
            word = dictionary.findTranslation(word);
            Assert.Equals(word, result);
        }

        [Fact]
        public void CheckTranslateFromEnglishToRussianInUppercase()
        {
            string word = "FOUR";
            string result = "÷åòûðå";
            word = dictionary.findTranslation(word);
            Assert.Equals(word, result);
        }

        [Fact]
        public void CheckTranslateFromRussianToEnglishInUppercase()
        {
            string word = "ÑÅÌÜ";
            string result = "seven";
            word = dictionary.findTranslation(word);
            Assert.Equals(word, result);
        }
    }
}
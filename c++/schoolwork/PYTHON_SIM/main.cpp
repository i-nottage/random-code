#include <iostream>
#include <string>
//#include <cstdlib>
#include "SpellChecker.h"

using namespace std;

// Global vars



int main()
{
    SpellChecker::Choices * c;
    SpellChecker mine(myWords);
    c = mine.check(dictionary);

      for (int i = 0; i < WORDS_SIZE; i++)
    {
        for (int j = 0; j < DICT_SIZE; j++)
        {
            if (c[i].matches[j].distance <= 2)
            {
                cout << c[i].word << ", ("
                    << c[i].matches[j].distance
                    << ", " << c[i].matches[j].word << ")" << endl;
            }
        }
    }

    return 0;
}








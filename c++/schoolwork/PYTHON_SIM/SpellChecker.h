#include <iostream>
#include <string>
//#include <cstdlib>

using namespace std;

// Global vars
const int WORDS_SIZE = 4;
const int DICT_SIZE = 5;
string myWords[] = {"ths", "is", "a", "tet"};
string dictionary[] = {"a", "is", "test", "the", "this"};



// ------------------ Spell Checker class ----------------------------------
// ----------------------------------------------------------------------------
class SpellChecker
{
    public:

    // Structs
    struct Match {
        int distance;
        string word;
    };

    struct Choices {
        string word;
        Match * matches;
        //Match ** head, next;
    };
    //string * words;
    Choices * c;
    int w_size, d_size;






    SpellChecker(string[]);
    int dist(string, string);
    void sortMatches(int);
    Choices* check(string[]);
    void printChoices();



    //check(string[]);


};

SpellChecker::SpellChecker(string words[])
{
    //SpellChecker::words = new string [WORDS_SIZE];
    SpellChecker::c = new Choices [WORDS_SIZE];
    SpellChecker::w_size = 4;


    for (int i = 0; i < WORDS_SIZE; i++)
    {
        //SpellChecker::words[i] = words[i];
        SpellChecker::c[i].word = words[i];
    }

}

// Returns a distance measurement
// explaining how different two strings are to one another
int SpellChecker::dist(string x, string y)
{
    int m = 0;

    string x_head = x.substr(0,1);
    string y_head = y.substr(0,1);

    //cout << x_head << " " << endl;
    //cout << y_head << " " << endl;
    //cout << x << " " << y << endl;

    if ( (x.length() != 0 ) && (y.length() != 0 ) )
    {
        if (x_head != y_head)
        {
            m = 1;
        }
        //cout << m << endl;
        return m + dist(x.erase(0,1), y.erase(0,1));
    }
    else if ((x.length() == 0 ) && (y.length() == 0 ))
        return 0;
    else if (x.length() != 0)
        return x.length();
    else if (y.length() != 0)
        return y.length();
}

void SpellChecker::sortMatches(int c_index)
{

    int i, j, min;
    Match h;
    // quick and dirty selection sort
    for (i = 0; i < d_size-1; i++)
    {
        min = i;
        for (j = (i+1); j < d_size; j++)
        {
            if (SpellChecker::c[c_index].matches[j].distance <
                SpellChecker::c[c_index].matches[min].distance)
            {
                min = j;
            }
        }

        if (min != i)
        {
            // Swap elements
            h = SpellChecker::c[c_index].matches[i];

            SpellChecker::c[c_index].matches[i] =
                SpellChecker::c[c_index].matches[min];

            SpellChecker::c[c_index].matches[min] = h;
        }
    }


}

// Check takes a string of words as a dictionary, and checks SpellChecks wordlist
// defining a distance for each word in the list and each word in the dictionary
// (wordlist x (dist(wordList, dictWord), dictWord))
SpellChecker::Choices* SpellChecker::check(string dict[])
{
    SpellChecker::d_size = 5;

    for (int i = 0; i < w_size; i++)
    {
        SpellChecker::c[i].matches = new Match [d_size];

        for (int j = 0; j < d_size; j++)
        {
            // Put word in
            SpellChecker::c[i].matches[j].word = dict[j];

            // get the distances for the word and the dictwords
            SpellChecker::c[i].matches[j].distance =
                dist (SpellChecker::c[i].word, dict[j]);
        }
    }

    // Sort matches for all choices
    for (int i = 0; i < w_size; i++)
        sortMatches(i);

    return SpellChecker::c;

}
/*
void SpellChecker::printChoices()
{
    int distance = 2;

    for (int i = 0; i < WORDS_SIZE; i++)
    {
        for (int j = 0; j < DICT_SIZE; j++)
        {
            if (SpellChecker::c[i].matches[j].distance <= distance)
            {
                cout << SpellChecker::c[i].word << ", ("
                    << SpellChecker::c[i].matches[j].distance
                    << ", " << SpellChecker::c[i].matches[j].word << ")" << endl;
            }
        }
    }

}
*/

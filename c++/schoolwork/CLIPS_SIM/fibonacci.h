//#ifndef fibonacci
//#define fibonacci

/* 
I know this looks awful, but the idea is to simulate the way
CLIPS might find fibonacci numbers
*/

#include <set>

using namespace std;

class fibonacci {
    public:
        fibonacci();
        void fib(int n);
    private:

        struct fact
        {
            int n1;
            int n2;
        };

        struct compFact
        {
            inline bool
            operator()(const fact& left, const fact& right) const
                { return left.n1 < right.n1; }
        };

        //bool basisDefined;
        set<fact, compFact> fibFacts;
        set<fact, compFact> needFacts;
        set<fact>::iterator itf;        // for fibs
        set<fact>::iterator itn;        // for needs
        void makeFibonacci();
        void findFibonacci(int nextIndex);
        bool factChecker(int n);
};

fibonacci::fibonacci()
{
    fact f = {0, 0};
    fact g = {1 , 1};
    fibFacts.insert(f);
    fibFacts.insert(g);
    itf = fibFacts.begin();
}

void fibonacci::fib(int n)
{
    bool there = factChecker(n);

    if (there)
    {
        cout << itf->n1 << " " << itf->n2 << endl;
    }
    else
    {
        cout << "Have to make new facts." << endl;


        fact usr;
        usr.n1 = n;
        usr.n2 = n -1 ;
        needFacts.insert(usr);
        findFibonacci( n-1);

        /*
        for(itn = needFacts.begin(); itn!=needFacts.end(); itn++)
        {
            cout << itn->n1 << " " << itn->n2 << endl <<endl<< endl;
        }

        */
        /////////////////////////////////////////////////////////////////////
        makeFibonacci();

        /*
        for(itf = fibFacts.begin(); itf!=fibFacts.end(); itf++)
        {
            cout << itf->n1 << " " << itf->n2 << endl << endl << endl;
        }
        */

        if (factChecker(n) )
            cout << itf->n1 << " " << itf->n2 << endl;
        else
            cout << "There's a big problem and the fact couldn't be found" << endl;

    }


}

/// Handle every need
/// When this is called, every need has been expressed
void fibonacci::makeFibonacci()
{
    set<fact>::iterator make1, make2;
    for  (itn = needFacts.begin(); itn!=needFacts.end();)
    {
        for(make1 = fibFacts.begin(); (make1!=fibFacts.end())&&(make1->n1!=(itn->n1 - 1)); ++make1)
        {}
        for(make2 = fibFacts.begin(); (make2!=fibFacts.end())&&(make2->n1!=(itn->n1 - 2)); ++make2)
        {}

        //cout << itn ->n1 << " " << make1->n2 + make2->n2 << endl << endl;
        fact newbie = {itn->n1, make1->n2 + make2->n2};

       // cout << newbie.n1 << " " << newbie.n2 << endl << endl;

        fibFacts.insert(newbie);

        needFacts.erase(itn);       // Eliminate need
        itn = needFacts.begin();    // reset need iterator
    }

}

void fibonacci::findFibonacci(int nextIndex)
{
    bool there = factChecker(nextIndex);

    if (!there)
    {
        // Add as another need
        fact need;
        need.n1 = nextIndex;
        need.n2 = nextIndex - 1;
        needFacts.insert(need);

        fibonacci::findFibonacci(nextIndex - 1);
    }


}

bool fibonacci::factChecker(int n)
{
    bool found = false;
    itf = fibFacts.begin();     // Reset iterator

    //cout << "Starting loop" << endl;
    // Check
    while ((itf!=fibFacts.end()) && !found)
    {
        //cout << "In the loop" << endl;
        if (itf->n1== n)
        {
            found = true;
        }
        else
        {
            ++itf;
        }
    }

    //cout << "Ending loop" << endl;
    return found;
}

//#endif

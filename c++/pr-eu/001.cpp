#include <iostream>
#include <string>
//#include <cstdlib>

/*
 ORIGINAL PROBLEM::::
 
Find the sum of all multiples of 3 and 5 that are less than 1000

Not the optimal solution...see thread for many far better answers :(
*/

using namespace std;

int main()
{
    int three_max, five_max, sum;
    
    int MAX_NUMBER = 1000;
    
    // division gives us the maximum multiplier
    //   we can use so we don't go over max number
    three_max = MAX_NUMBER / 3;
    five_max = (MAX_NUMBER-1) / 5; // I know it's going to be a multiple of 10 here, sloppy but correct
    
    sum = 0;
    
    // loop through the three max
    //   because three max will always be higher
    for (int i = 1; i <= three_max; i++) {
        
        sum += i * 3;
        
        // Five stuff, here's where we run into trouble
        //  
        // i has to be less than five max
        if (i <= five_max) {
            
            int five_value = i * 5;
            
            // if not divisible by three
            if (five_value % 3 != 0) {
                sum += five_value;
            }
        }
    }
    
    cout << sum;
    
    return 0;
}
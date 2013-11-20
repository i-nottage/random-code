#! usr/bin/env python
#
#
# This program will take a specified range and identify and list all the prime
# numbers within that range.
def prime_search(lim):
    result = []
    for n in range (2, lim):
	    for x in range (2, n):
	    	if n % x == 0:
		    	break
	    else:
		    result.append(n)
    print result

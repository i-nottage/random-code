import pickle

# abababababa
# 5, 2
# ababa
# babab
# ababa

# 5, 0
# ababa
# babab
# a

# 5, 3
# ababa
# ababa
# ababa
# ababa

# 4, 0
# abab
# abab
# aba

# 4, 2
# abab
# abab
# abab
# abab
# aba

def epitopeSections():
    
    while 1:
        sequence= raw_input("Add amino acid sequence here and press enter.")
        sequence = sequence.replace(" ", "")
        
        if not sequence.isalpha():
            print "THERE ARE NUMBERS IN HERE!! WRONG!!"
        else:
            break
        
    mer_length = 0
    overlap = 0
    
    while 1:
        try:
            mer_length = int(raw_input("How many residues long do you want your epitope section?"))
            break
        except ValueError:
            print "You evolutional dumbass, that's not a thing!!!"
            
    while 1:
        try:
            overlap = int(raw_input("How many residues of overlap do you want between sections?"))
            break
        except ValueError:
            print "You evolutional dumbass, that's not a thing!!!"
    
    
    def x(n):
        start=(mer_length-overlap)*(n-1)
        return start
    def y(q):
        end= x(q)+mer_length
        return end

    index = 1
    chunks = []
    
    pos = 0
    while pos < len(sequence):
    	    end = pos + mer_length
    	    if end > len(sequence):
    	    	    chunks.append(sequence[pos:])
    	    	    break
    	    chunks.append(sequence[pos:end])
    	    pos = (end + 1) - overlap 
    	    
    while y(index) < len(sequence):
        chunks.append(sequence[x(index):y(index)])
        index += 1
    
    # append the last couple characters in case of stragglaz
    chunks.append(sequence[x(index):])
    
    f = open("epitope_sections.txt", "w")
    
    for chunk in chunks:
    	    f.write(chunk)
    	    f.write("\n")
    
    f.close()

epitopeSections()

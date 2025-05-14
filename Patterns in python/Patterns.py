#Patterns
#1)
""" *
    * *
    * * *
    * * * * """

"""for i in range(4):
    for j in range(4-i):
        print("*",end =" ")
    print()"""

#2)
""" * * * *
      * * *
        * *
          * """
"""for i in range(4):
    print(" " *i,end="")
    for j in range(4-i):
        print("#",end="")
    print() """

#3)
""" *
   * *
  * * *
 * * * *"""

"""for i in range(1,5):  
    # Print spaces
    for j in range(4- i):  
        print(" ", end="")

    # Print stars
    for j in range(1, i + 1):
        print("* ", end="")

    print()""" 

#4
"""1 2 3 4 5
   1 2 3 4
   1 2 3
   1 2
   1"""

"""for i in range(1,6):
    for j in range(1,5-i+2):
        print(j,end="")
    print()"""

#5

"""1
   1 2
   1 2 3
   1 2 3 4"""

"""for i in range(4):
    for j in range(1,i+2):
        print(j,end="")

    print()"""

#6
"""1
   2 2
   3 3 3
   4 4 4 4"""

"""for i in range(1,5):
    for j in range(1,i+1):
        print(i,end="")
    print()"""

#7
"""*
   # #
   * * *
   # # # #"""
"""for i in range(1, 5):  
    if i % 2 == 1:  # Odd rows
        for j in range(1, i + 1):  # Print '*' for odd rows
            print("*", end=" ")
    else:  # Even rows
        for j in range(1, i + 1):  # Print '#' for even rows
            print("#", end=" ")
    print() """

#8
"""1
   0 1
   1 0 1
   0 1 0 1"""

"""for i in range(1,5):"""

#9
"""1
  1 2
 1 2 3
1 2 3 4"""

"""for i in range(1,5):
    for j in range(4-i):
        print(" ",end="")

    for j in range(1,i+1):
        print(j," " ,end="")
    print()"""

#10
"""1
  2 2
 3 3 3
4 4 4 4"""

"""for i in range(1,5):
    for j in range(4-i):
        print(" ",end="")
    for j in range(1,i+1):
        print(i," ",end="")

    print()"""

#11
"""*
  # #
 * * *
# # # #"""
"""
for i in range(1,5):
    for j in range(4-i):
        print(" ",end="")
    if i%2==1: #row is odd or even
        for j in range(1,i+1):
            print("* ",end="")
    else:
        for j in range(i):
            print("# ",end="")
    print()
    """

#12
"""
1
0 1
1 0 1
0 1 0 1"""

for i in range(1,5):
    for j in range(1,i+1):
        if(i+j)%2==0:
            print("1",end="")
        else:
            print("0",end="")
    print()

#13

"""
      * 
    * * * 
  * * * * * 
* * * * * * * 
  * * * * * 
    * * * 
      * 
"""

for i in range(1,5):
    for j in range(4-i):
        print(" ",end=" ")
    for j in range(1,i+1):
        print("*"," ", end=" ")
    print()
for i in range(3, 0, -1):
    # Print leading spaces
    for j in range(4 - i):
        print(" ", end=" ")
    
    # Print stars for the current row
    for j in range(1, i + 1):
        print("*", end=" ")
        print(" ", end=" ")
    
    # Move to the next line after each row of stars
    print()

    






























    

# AssemblyCalculatorProject

Welcome to the Assembly Calculator project! This calculator was developed as a class project to showcase fundamental assembly language programming concepts. It is designed to perform a variety of simple commands
including AND, OR, SUM, UPPER, and ARRAYSUM.

The program will call `calc`.  The program should be broken down into several assembly language routines.  
Each routine is written in its own assembly (.s) file.  We use
the assembler to translate each assembly file into its own relocatable object
file (.o).  Using the linker (ld), we "link" together the
object files into a single executable file. 

The name of each executable is `calc_<data name>` where `<data name>` is the data the binary will contain and process.

Commands:
	    '&'  :  AND: Takes one argument: update rax with the bitwise and of the
	         :  current value of rax and the argument
	         :  value eg.  rax = rax bitwise and with the 8-byte argument value
	  
	    '|'  :  OR: Takes one argument: same as above but apply bitwise or.
	  
	    'S'  :  SUM: Takes one argument: your sum routine should both 
	         :       update rax by summing the value into rax, and update either
	         :       the global "positive" or "negative" sum as needed.
		  
	    'U'  :  UPPER: The second argument should be treated as a pointer to
    		  : 	    an ascii string (a sequence of non-zero bytes terminated
    		  :	    by a zero valued byte) eg 'a''b''c'0x0.   This command
    		  :         should process the string converting lowercase letters
    		  :	    ('a' - 'z') to their corresponding uppercase letter
    		  :	    'A' - 'Z'.  The routine should also add the length of
    		  :	    the string to rax. Note if the first byte of the string
    		  :	    is zero, then the string length is 0.   The length of 
    		  :	    'a'0x0 would be 1 and so on. 
	    'a'  :  ARRAYSUM: Takes two 8-byte arguments:  First is a length, and
	         :            the second is an 8-byte address to an array of 8-byte values.
	         :            You should apply the sum operator to each value in the array.

pragma circom 2.0.0;

/*
Demo1 circuit for demonstration
Fibonacci
*/  

template Fibonacci () {  

   // Declaration of signals.  
   // INPUT 
   signal input a;  
   signal input b;
   signal intermediate[10];
   signal input expectedOut;
   signal output out;

   intermediate[0] <== a;
   intermediate[1] <== b;

   for(var i = 0; i < 8; i++){
      intermediate[i+2] <== intermediate[i] + intermediate[i+1];   
   }

   expectedOut === intermediate[9] * 1;    
   out <== expectedOut;
}

component main {public [expectedOut]} = Fibonacci();


pragma circom 2.0.0;

/*
Demo1 circuit for demonstration
Cube root
*/  

template Demo1 () {  

   // Declaration of signals.  
   // INPUT 
   signal input a;  
//   signal input b;
   signal input expectedCube;
   // TEMP
   signal calc;
   // OUTPUT
   signal output cube;
   // Constraints.  
   calc <== a * a; 
   cube <== a * calc;
   expectedCube === cube;    
}

component main {public [expectedCube]} = Demo1();


void setup(){
  Complex a = new Complex(1,2,"+");
  Complex b = new Complex(3,4,"+");
  println (a.get());
  println (b.plus(a));
  println (a.minus(b));
}

class Complex {
  int real ;
  int im ;
  String symb = "+" ; 
  
  Complex (int real,int im ,String symb){
    this.real = real;
    this.im = im;
    this.symb = symb;
  }
  String get (){
    return (str(this.real) + symb + str(this.im)+"i");
  }
  String plus (Complex num1){
    int temp_real;
    int temp_im;
    temp_real = this.real + num1.real;
    temp_im = this.im + num1.im;
    if (temp_im < 0 ){ // if temp_im < 0 not print "+"
      return (str(temp_real) + str(temp_im)+"i");
    }
    return (str(temp_real) + symb + str(temp_im)+"i");
  }
  String minus (Complex num1){
    int temp_real;
    int temp_im;
    temp_real = this.real - num1.real;
    temp_im = this.im - num1.im;
    if (temp_im < 0 ){
      return (str(temp_real) + str(temp_im)+"i");
    }
    return (str(temp_real) + symb + str(temp_im)+"i");
  }
  String multi (Complex num1){
    int temp_real;
    int temp_im;
    temp_real = this.real - num1.real;
    temp_im = this.im - num1.im;
    return (str(temp_real) + symb + str(temp_im)+"i");
  }
}

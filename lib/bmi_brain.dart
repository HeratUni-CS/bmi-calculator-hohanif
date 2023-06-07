
import 'dart:math';

class BMIBRAIN {
  int height ;
  int weight;
  double bmi =0;
  BMIBRAIN({required this.height, required this.weight}){

    bmi = weight/pow((height/100),2);

  }
  String getresult(){
    if(bmi < 18){
      return "UNDERWEIGHT";
    }else if(bmi < 25){
      return "NORMAL";
    }else if(bmi<30){
      return "OVERWEIGHT";
    }else{
      return "owse";
    }
  }
  String getBmi(){
    return bmi.toStringAsFixed(2);
  }
  String getinterpretation(){
    if(bmi < 18.5){
      return "you are dying ,eat something";
    }else if(bmi < 25){
      return "you are good to go";
    }else if(bmi<30){
      return "you are to fat , excercise";
    }else{
      return "you are exploding..";
    }
  }
}
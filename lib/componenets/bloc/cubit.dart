import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibm_calculator/componenets/bloc/states.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit() : super(CounterInitialState());

  static CounterCubit get(context) => BlocProvider.of(context);
  int weight = 0;
  int height = 0;
  int age = 0;
  bool isMale = false;

  void click(bool IsMale )
  {
    if(IsMale)
    {
      isMale = true;
    }
    else
    {
        isMale = false;
    }
    emit(ChangeState());
  }

  void weightMinus()
  {
    weight--;
    emit(CounterMinusState());
  }

  void weightPlus()
  {
    weight++;
    emit(CounterPlusState());
  }

  void heightMinus()
  {
    height--;
    emit(CounterMinusState());
  }

  void heightPlus()
  {
    height++;
    emit(CounterPlusState());
  }

  void ageMinus()
  {
    age--;
    emit(CounterMinusState());
  }

  void agePlus()
  {
    age++;
    emit(CounterPlusState());
  }
}
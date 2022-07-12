import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, SignInFormState> {
  FormBloc() : super(FormInitial()) {
    on<TextChangedEent>((event, emit) {
      if (event.emailValue.length < 3) {
        emit(FormError("please enter complete email"));
      } else if (event.passwordValue.length < 5) {
        emit(FormError("Please Enter a Password"));
      } else {
        emit(FormValid());
      }
    });
    on<SubmitEvent>((event, emit) {
      emit(FormLoading());
    });
  }
}

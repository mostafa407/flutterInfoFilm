import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/characer.dart';
import '../../data/models/dimension.dart';
import '../../data/repository/character_repository.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRepository charactersRepository;
  List<Character>characters=[];


  CharacterCubit(this.charactersRepository) : super(CharacterInitial());

  List<Character>getAllFilm(){
    charactersRepository.getAllFilm().then((characters){
      emit(CharacterLoaded(characters));
      this.characters=characters;
    });
    return characters;
  }
  void getName(String charName){
    charactersRepository.getStatus(charName).then((dimension){
      emit(DimensionLoaded(dimension));

    });
  }
}

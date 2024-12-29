import '../models/characer.dart';
import '../models/dimension.dart';
import '../web_service/web_service.dart';

class CharactersRepository{
  final CharacterWebService characterWebService;
  CharactersRepository(this.characterWebService);

  Future<List<Character>>getAllFilm()async{
    final characters=await characterWebService.getAllFilm();
    return characters.map((character)=>Character.fromJson(character)).toList();
  }
  Future<List<Dimension>>getStatus(String  charName) async{
    final dimensions=await characterWebService.getStatus(charName);
    return dimensions.map((charQuery)=>Dimension.fromJson(charQuery)).toList();
  }
}
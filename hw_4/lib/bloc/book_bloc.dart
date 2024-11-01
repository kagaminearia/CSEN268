import 'package:bloc/bloc.dart';
import 'package:hw_4/bloc/book_event.dart';
import 'package:hw_4/bloc/book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_4/model/book.dart';

enum SortType { title, author }

class BookBloc extends Bloc<BookEvent, BookState> {
  List<Book> books = [];
  SortType sortType = SortType.author;

  BookBloc() : super(BookLoading()) {
    on<SortByAuthor>(_onSortbyAuthor);
    on<SortByTitle>(_onSortbyTitle);
    on<LoadBooks>(_onAddBooks);
  }

  void _onSortbyAuthor(SortByAuthor event, Emitter<BookState> emit){
    books.sort((a, b) => a.author.compareTo(b.author));
    sortType = SortType.author;
    emit(BooksSortedByAuthor(List.from(books)));
  }

  void _onSortbyTitle(SortByTitle event, Emitter<BookState> emit){
    books.sort((a, b) => a.title.compareTo(b.title));
    sortType = SortType.title;
    emit(BooksSortedByTitle(List.from(books)));
  }

  void _onAddBooks(LoadBooks event, Emitter<BookState> emit){
    addBooks();
  }
  
  void addBooks() {
    books = [
      Book(
        title: 'Peggy', 
        author: 'Rebecca Godfrey', 
        imageUrl: 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1713386301i/202102027.jpg', 
        description: peggyInfo),
      Book(
        title: 'Drawn Testimony', 
        author: 'Jane Rosenberg', 
        imageUrl: 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1706935035i/130908173.jpg', 
        description: drawnInfo),
      Book(
        title: 'The Swifts: A Gallery of Rogues', 
        author: 'Beth Lincoln', 
        imageUrl: 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1710485149i/190119424.jpg', 
        description: swiftInfo),
      Book(
        title: 'Invisible', 
        author: 'Eloy Moreno', 
        imageUrl: 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1514989256i/37804539.jpg', 
        description: inviInfo),
    ];
    books.sort((a, b) => a.author.compareTo(b.author));
    sortType = SortType.author;
    emit(BooksSortedByAuthor(List.from(books)));
  }
}



String peggyInfo = '''
A dazzling novel about Peggy Guggenheim—a story of art, family, love, and becoming oneself—by the award-winning author of Under the Bridge, now a Hulu limited series starring Riley Keough and Lily Gladstone

“Godfrey brilliantly resurrects the avant-garde adventurer Peggy Guggenheim as a feminist icon for our times.”—Jenny Offill, author of Dept. of Speculation

Venice, 1958. Peggy Guggenheim, heiress and now legendary art collector, sits in the sun at her white marble palazzo on the Grand Canal. She’s in a reflective mood, thinking back on her thrilling, tragic, nearly impossible journey from her sheltered, old-fashioned family in New York to here: iconoclast and independent woman.

Rebecca Godfrey’s Peggy is a blazingly fresh interpretation of a woman who defies every expectation to become an original. The daughter of two Jewish dynasties, Peggy finds her cloistered life turned upside down at fourteen, when her beloved father perishes on the Titanic. His death prompts Peggy to seek a life of passion and personal freedom and, above all, to believe in the transformative power of art. We follow Peggy as she makes her way through the glamorous but sexist and anti-Semitic art worlds of New York and Europe and meet the numerous men who love her (and her money) while underestimating her intellect, talent, and vision. Along the way, Peggy must balance her loyalty to her family with her need to break free from their narrow, snobbish ways and the unexpected restrictions that come with vast fortune.

Rebecca Godfrey’s final book—completed by her friend, the acclaimed writer Leslie Jamison, following Godfrey’s death in 2022—brings to life the woman who helped make the Guggenheim name synonymous with art and genius.
''';

String drawnInfo = '''
A penetrating, compulsively readable memoir about the four-decade career of America's top courtroom sketch artist, for fans of Lab Girl and Working Stiff
Jane Rosenberg is America's pre-eminent courtroom sketch artist. For over forty years, she's been at the heart of the story, covering almost every major trial that has passed through the New York justice system. From mob bosses to fallen titans of finance, terrorists and sex abusers, corrupt cops and warring entertainment icons, she has drawn them all.

In Drawn Testimony , Rosenberg brings us into the high-stakes, dramatic world of her craft, where art, psychology and courtroom drama collide. Over the course of her legendary career, Jane has had a front row seat to some of the most iconic and notorious moments in our nation's recent history, sketching everything from Tom Brady's deflate-gate case, to John Lennon's murder trial to cases against Ghislaine Maxwell, John Gotti, Harvey Weinstein and most recently, the indictment against former President Donald Trump. Readers will learn how she has honed her unique powers of perception, but also what her portraits reveal, not only about her subjects, but about the human condition in general.

Fearless, fascinating and gorgeously written, Drawn Testimony captures the unique career of an artist whose body of work depicts history as it's happening.
''';

String swiftInfo = '''
Shenanigan Swift is headed to Paris, where new mysteries and new relatives await. The hilarious, quick-witted sequel to Beth Lincoln’s instant bestseller.

Now that the murderer has been caught and her family is safe, Shenanigan Swift can return her attention to important projects, like combing the lake bottom for the family treasure. But the routine won’t last for long, because a new adventure is about to begin--in Paris. Shenanigan, Phenomena, and their uncle Maelstrom are off to France to unravel the mystery of a strange series of elaborately staged art museum heists.

The A Gallery of Rogues is the highly anticipated sequel to Beth Lincoln’s celebrated debut, The A Dictionary of Scoundrels . Beloved characters are back, joined by a fresh flock of relatives—the Martinets, the French branch of the Swift family tree. There are new mysteries—and more dead bodies—in this delicious sequel that once again celebrates words, family, and lots of shenanigans.
''';

String inviInfo = '''
Emotiva, conmovedora, diferente... Invisible narra, a través de los ojos de un niño, una historia que podría ser la de cualquiera de nosotros.

¿Quién no ha deseado alguna vez ser invisible?

¿Quién no ha deseado alguna vez dejar de serlo?

El problema es que nunca he llegado a controlar bien ese poder:

A veces, cuando más ganas tenía de ser invisible, era cuando más gente me veía, y en cambio, cuando deseaba que todos me vieran, era cuando a mi cuerpo le daba por desaparecer.
''';



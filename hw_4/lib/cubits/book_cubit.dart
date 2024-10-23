import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_4/cubits/book_state.dart';
import 'package:hw_4/models/book_model.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit()
      : super(const BookState(books: [], sortingMode: SortingMode.byAuthor)) {
    init();
  }

  // Initialize the list of books
  void init() {
    final List<Book> bookList = [
      Book(
          title: 'The Wingsnatchers',
          author: 'Sarah Jean Horwitz',
          description:
              'Lorem ipsum odor amet, consectetuer adipiscing elit. Cubilia mi metus nascetur egestas proin finibus; purus venenatis curae. Nam adipiscing netus, accumsan nulla porttitor dis aliquam. Risus commodo tempus suspendisse a augue justo vehicula. Vestibulum quis ultricies fermentum tempus urna dictum vehicula quam sit. Porta eros dictumst lorem ligula dui ante tempus vivamus. Viverra pharetra cursus nullam convallis tincidunt. Finibus posuere conubia donec accumsan molestie fermentum sit mollis. Lacus nascetur nibh, ligula posuere lacinia rhoncus. Dapibus tempor conubia arcu suscipit ipsum hac blandit eros. Conubia habitasse parturient, nam nisi risus ac mollis maximus vitae. Sit vel per erat suscipit lobortis. Bibendum nibh lobortis primis libero efficitur blandit sollicitudin. Mattis vulputate id quis pulvinar; consequat imperdiet cras morbi. Class gravida sed natoque turpis lacinia duis. Laoreet sit pharetra massa blandit auctor. Phasellus viverra aliquet laoreet ante tristique; malesuada potenti. Litora phasellus amet nascetur sem fermentum purus nibh risus. Enim metus adipiscing semper turpis pharetra quam lacinia ipsum. Urna proin leo venenatis nam duis varius suspendisse. Duis et dignissim vulputate maecenas litora ultrices odio. Mus magnis urna arcu luctus, et conubia.'),
      Book(
          title: 'The Secret History',
          author: 'Donna Tartt',
          description:
              'Lorem ipsum odor amet, consectetuer adipiscing elit. Pharetra turpis nam accumsan inceptos fames vitae commodo at. Commodo ac primis varius; finibus curabitur semper leo. Habitasse sodales lobortis sem nascetur cras. Sodales posuere malesuada cubilia blandit proin lacus sodales. Arcu arcu blandit placerat nec justo lorem magna turpis. Habitant blandit vehicula dignissim aliquet ornare, primis praesent phasellus faucibus. Aliquet faucibus tempus pretium pretium sem dui. Aenean montes eros habitasse ipsum auctor ac finibus varius. Dapibus porttitor diam efficitur sed integer; sem leo. Enim lacinia diam tempus tempor sem volutpat. Tempor metus metus condimentum dapibus vel curabitur. Quisque natoque turpis lectus dapibus adipiscing molestie velit. Hac ultrices phasellus malesuada justo congue volutpat. Pellentesque et hac facilisi eleifend cubilia ex ad rhoncus elementum. Nibh habitant hac vivamus vivamus himenaeos. Gravida quisque sollicitudin nisi senectus fusce malesuada mattis.'),
      Book(
          title: 'A Little Life',
          author: 'Hanya Yanagihara',
          description:
              'Lorem ipsum odor amet, consectetuer adipiscing elit. Magna fusce purus turpis lorem lobortis consequat. Praesent libero inceptos in proin rhoncus. Nascetur erat auctor netus purus nec libero nostra pharetra! Mus enim quisque aenean dis eu maximus. Fames lacinia commodo quam accumsan litora hendrerit. Posuere accumsan sem sollicitudin lacus aliquet cursus parturient. Habitasse nunc congue sagittis sapien cursus magna pulvinar. Dis pulvinar lobortis integer integer ullamcorper natoque himenaeos. Dapibus eu enim quisque consectetur bibendum potenti pretium. Mollis blandit mattis luctus morbi; erat neque. Nibh venenatis tristique viverra cursus vehicula laoreet dolor. Semper pretium penatibus mattis; habitasse tempor class laoreet blandit. Euismod nostra lorem praesent neque inceptos rutrum ante eget donec? Urna fames neque lobortis cras eget aptent nisi. Mi elementum phasellus nibh orci posuere est senectus. Nec inceptos dui eleifend risus nascetur pharetra mattis nunc. Diam diam fermentum finibus litora pharetra ac. Turpis euismod dignissim at ipsum quam felis quisque phasellus vehicula. Volutpat aptent elit primis vivamus est varius habitant. Ex montes erat ornare blandit imperdiet per placerat commodo.'),
      Book(
          title: 'Normal People',
          author: 'Sally Rooney',
          description:
              'Lorem ipsum odor amet, consectetuer adipiscing elit. Faucibus eleifend vel habitant; sociosqu etiam cursus suscipit. Integer cubilia etiam nisl, mus dictum integer netus. Efficitur elementum euismod class varius varius quisque suspendisse. Neque ac metus fusce hendrerit viverra scelerisque nisi. Tellus fames eleifend erat suscipit ligula arcu diam est. Praesent turpis lorem vel suscipit torquent malesuada molestie metus suscipit. Tortor viverra morbi fermentum, lorem morbi odio vulputate condimentum. Hac amet tellus vulputate duis quam. Adipiscing elit sagittis blandit sodales laoreet purus. Sociosqu magna sit sed eu leo luctus quam tempus. Pharetra odio dignissim accumsan a elit; penatibus nulla egestas. Penatibus per lobortis mollis lobortis magna commodo. Mi vel ex suspendisse torquent lacinia. Adipiscing posuere ligula odio a fames, sagittis velit proin. Blandit finibus eleifend ornare cubilia iaculis enim.')
    ];

    // Initially sort list by author's last name
    final sortedBooks = List<Book>.from(bookList)
      ..sort((a, b) {
        final lastNameA = a.author.split(' ').last;
        final lastNameB = b.author.split(' ').last;
        return lastNameA.compareTo(lastNameB);
      });

    // Emit the state with the loaded book list and sorting by author
    emit(state.copyWith(books: sortedBooks, sortingMode: SortingMode.byAuthor));
  }

  // Sort books by title
  void sortByTitle() {
    final sortedBooks = List<Book>.from(state.books)
      ..sort((a, b) => a.title.compareTo(b.title));
    emit(state.copyWith(books: sortedBooks, sortingMode: SortingMode.byTitle));
  }

  // Sort books by the author's last name
  void sortByAuthor() {
    final sortedBooks = List<Book>.from(state.books)
      ..sort((a, b) {
        final lastNameA = a.author.split(' ').last;
        final lastNameB = b.author.split(' ').last;
        return lastNameA.compareTo(lastNameB); // Compare the last names
      });
    emit(state.copyWith(books: sortedBooks, sortingMode: SortingMode.byAuthor));
  }
}
class BookInfo{

  String image = "";
  String title =" ";
  String summary = "";
  String author = "";
  double year = 0;




}
List<BookInfo> book = [];
List<BookInfo> getBook(){


  BookInfo bookInfo =  new BookInfo();

  ///book1
  bookInfo.image = "assets/images/sampleBook1.jpg";
  bookInfo.title = "There's a wocket in my pocket";
  bookInfo.summary = "hdhwedbjwdbwebefbebfbfebfekfkefkefkefnkefkenfeknfkefkefefkefefekfefef";
  bookInfo.author = "heeeeee";
  bookInfo.year = 2004;
  book.add(bookInfo);

  bookInfo =  new BookInfo(); ///clears old info

  bookInfo.image = "assets/images/sampleBook2.jpg";
  bookInfo.title = "";
  bookInfo.summary = "";
 // bookInfo.rating = 3.4;
  book.add(bookInfo);

  bookInfo =  new BookInfo(); ///clears old info
  bookInfo.image = "assets/images/sampleBook3.jpg";
  bookInfo.title = "";
  bookInfo.summary = "";
 // bookInfo.rating = 4.4;
  book.add(bookInfo);

  bookInfo =  new BookInfo(); ///clears old info



  return book;
}
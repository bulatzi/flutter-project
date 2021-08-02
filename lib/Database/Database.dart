import 'package:cloud_firestore/cloud_firestore.dart';

//DO NOT CALL UNLESS YOU KNOW WHAT THIS FUNCTION DOES AND WHY.
//Loads Firestore database with the JSON below.
void loadBooks() async {
  // opens a connection to the database
  final db = FirebaseFirestore.instance;

  // Stores hardcoded book values in the database
  final List<Map<String, dynamic>> books = [
    {'title': 'Do Androids Dream of Electric Sheep?',
      'author': 'Phillip K. Dick',
      'year': '1968',
      'description': 'Do Androids Dream of Electric Sheep? is a dystopian science fiction novel by American writer Philip K. Dick, first published in 1968. The novel is set in a post-apocalyptic San Francisco, where Earth\'s life has been greatly damaged by a nuclear global war, leaving most animal species endangered or extinct.',
      'picture':'https://m.media-amazon.com/images/I/31bNBTT29nL._SY346_.jpg'},
    {'title': 'The Hitchhiker\'s Guide to the Galaxy',
      'author': 'Douglas Adams',
      'year': '1978',
      'description': 'The Hitchhiker\'s Guide to the Galaxy is a comedy science fiction franchise created by Douglas Adams. Originally a 1978 radio comedy broadcast on BBC Radio 4, it was later adapted to other formats, including stage shows, novels, comic books, a 1981 TV series, a 1984 video game, and 2005 feature film',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51MzUz8rQcL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Something Wicked This Way Comes',
      'author': 'Ray Bradbury',
      'year': '1962',
      'description': 'Something Wicked This Way Comes is a 1962 dark fantasy novel by Ray Bradbury. It is about two 13-year-old best friends, Jim Nightshade and William Halloway, and their nightmarish experience with a traveling carnival that comes to their Midwestern home, Green Town, Illinois, on October 24th.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51reJAVMnrL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Pride and Prejudice and Zombies',
      'author': 'Seth Grahame-Smith',
      'year': '2009',
      'description': 'Pride and Prejudice and Zombies is a 2009 parody novel by Seth Grahame-Smith. It is a mashup combining Jane Austen\'s classic 1813 novel Pride and Prejudice with elements of modern zombie fiction, crediting Austen as co-author.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51PfgAIwfZL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Harry Potter and the Sorcerer\'s Stone',
      'author': 'J. K. Rowling',
      'year': '1997',
      'description': 'An orphan gets kidnapped by a large bearded man who tells him he\'s a wizard.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51DF6ZR8G7L._SX329_BO1,204,203,200_.jpg'},
    {'title': 'Sean\'s Autobiography',
    'author': 'Sean Boden',
    'year': '2021',
    'description': 'This is the story all about how my life got flipped, turned upside down.',
    'picture':'https://www.pngitem.com/pimgs/m/288-2883072_roblox-dab-png-roblox-dabing-transparent-png.png'},
    {'title': 'Title McTitleron',
      'author': 'Test Testertron',
      'year': '1999',
      'description': 'This is a test description.',
      'picture':'https://cdn.dribbble.com/users/5275203/screenshots/15329254/macho_pingu.jpg'},
    {'title': 'Harry Potter and the Chamber of Secrets',
      'author': 'J. K. Rowling',
      'year': '1998',
      'description': 'Harry Potter and the Chamber of Secrets is a fantasy novel written by British author J. K. Rowling and the second novel in the Harry Potter series. ',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51jNORv6nQL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Harry Potter and the Prisoner of Azkaban',
      'author': 'J. K. Rowling',
      'year': '1999',
      'description': 'Harry Potter and the Prisoner of Azkaban is a fantasy novel written by British author J. K. Rowling and is the third in the Harry Potter series. The book follows Harry Potter, a young wizard, in his third year at Hogwarts School of Witchcraft and Wizardry.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51iwe6zFDZL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Harry Potter and the Goblet of Fire',
      'author': 'J. K. Rowling',
      'year': '2000',
      'description': 'Harry Potter and the Goblet of Fire is a fantasy novel written by British author J. K. Rowling and the fourth novel in the Harry Potter series',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51gy+g8Z+1L._SY344_BO1,204,203,200_.jpg'},
    {'title': 'Harry Potter and the Order of the Phoenix',
      'author': 'J. K. Rowling',
      'year': '2003',
      'description': 'There is a door at the end of a silent corridor. And it’s haunting Harry Potter’s dreams. Why else would he be waking in the middle of the night, screaming in terror?',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51NqXftM9vL._SX326_BO1,204,203,200_.jpg'},
    {'title': 'Harry Potter and the Half-Blood Prince',
      'author': 'J. K. Rowling',
      'year': '2005',
      'description': 'As Death Eaters wreak havoc in both Muggle and Wizard worlds, Hogwarts is no longer a safe haven for students. Though Harry (Daniel Radcliffe) suspects there are new dangers lurking within the castle walls, Dumbledore is more intent than ever on preparing the young wizard for the final battle with Voldemort. Meanwhile, teenage hormones run rampant through Hogwarts, presenting a different sort of danger. Love may be in the air, but tragedy looms, and Hogwarts may never be the same again',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51uO1pQc5oL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Harry Potter and the Deathly Hallows',
      'author': 'J. K. Rowling',
      'year': '2007',
      'description': 'Without the guidance and protection of their professors, Harry (Daniel Radcliffe), Ron (Rupert Grint) and Hermione (Emma Watson) begin a mission to destroy the Horcruxes, the sources of Voldemort\'s immortality. Though they must rely on one another more than ever, dark forces threaten to tear them apart. Voldemort\'s Death Eaters have seized control of the Ministry of Magic and Hogwarts, and they are searching for Harry -- even as he and his friends prepare for the ultimate showdown.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51jyI6lYi1L._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Wheel of time: The Eye of the World',
      'author': 'Robert Jordan',
      'year': '1990',
      'description': 'The Eye of the World is a fantasy novel by American writer Robert Jordan, the first book of The Wheel of Time series. It was published by Tor Books and released on January 15, 1990. The unabridged audiobook is read by Michael Kramer and Kate Reading.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51tLvp90p4L._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Wheel of time: The Great Hunt',
      'author': 'Robert Jordan',
      'year': '1990',
      'description': 'The Great Hunt is a fantasy novel by American author Robert Jordan, the second book of The Wheel of Time series. It was published by Tor Books and released on November 15, 1990. The Great Hunt consists of a prologue and 50 chapters.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51o6FqtKYzL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Wheel of time: The Dragon Reborn',
      'author': 'Robert Jordan',
      'year': '1991',
      'description': 'The Dragon Reborn is a fantasy novel by American writer Robert Jordan, the third in his series The Wheel of Time. It was published by Tor Books and released on September 15, 1991. The unabridged audio book is read by Michael Kramer and Kate Reading. The Dragon Reborn consists of a prologue and 56 chapters. ',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51bdigAybEL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Wheel of time:The Shadow Rising',
      'author': 'Robert Jordan',
      'year': '1992',
      'description': 'The Shadow Rising is a fantasy novel by American author Robert Jordan, the fourth book in his series The Wheel of Time. It was published by Tor Books and released on September 15, 1992. The unabridged audio book is read by Michael Kramer and Kate Reading.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51WWQrRSUnL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Wheel of time: The Fires of Heaven',
      'author': 'Robert Jordan',
      'year': '1993',
      'description': 'The Fires of Heaven is a fantasy novel by American writer Robert Jordan, the fifth book in his series The Wheel of Time. It was published by Tor Books and released on October 15, 1993.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51j27JG9iJL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Wheel of time: Lord of Chaos',
      'author': 'Robert Jordan',
      'year': '1994',
      'description': 'Lord of Chaos is a fantasy novel by American author Robert Jordan, the sixth book of his series The Wheel of Time. It was published by Tor Books and released on October 15, 1994, and was nominated for the Locus Award for Best Fantasy Novel in 1995. Lord of Chaos consists of a prologue, 55 chapters, and an epilogue.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51BVcrOxeDL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Wheel of time: A Crown of Swords',
      'author': 'Robert Jordan',
      'year': '1994',
      'description': 'A Crown of Swords is a fantasy novel by American author Robert Jordan, the seventh book of The Wheel of Time. It was published by Tor Books and released on May 15, 1996. A Crown of Swords consists of a prologue and 41 chapters.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51Olq4iDOuL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Wheel of time: The Path of Daggers',
      'author': 'Robert Jordan',
      'year': '1998',
      'description': 'The Path of Daggers is a fantasy novel by American author Robert Jordan, the eighth book of his series The Wheel of Time. It was published by Tor Books and released on October 20, 1998',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/517tqIg5K6L._SX304_BO1,204,203,200_.jpg'},
    {'title': 'Wheel of time: Winter\'s Heart',
      'author': 'Robert Jordan',
      'year': '2000',
      'description': 'Winter\'s Heart is a fantasy novel by American author Robert Jordan, the ninth book of his series Wheel of Time. It was published by Tor Books and released on November 7, 2000',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51-XTnw+HOL._SY344_BO1,204,203,200_.jpg'},
    {'title': 'Wheel of time: Crossroads of Twilight',
      'author': 'Robert Jordan',
      'year': '2003',
      'description': 'Crossroads of Twilight is a fantasy novel by American author Robert Jordan, the tenth book of his The Wheel of Time series. It was published by Tor Books and released on January 7, 2003. ',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51RU4meha3L._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Wheel of time: Knife of Dreams',
      'author': 'Robert Jordan',
      'year': '2005',
      'description': 'Knife of Dreams is a fantasy novel by American author Robert Jordan, the eleventh book in his series The Wheel of Time. It was the last book which Jordan wrote completely before his death in 2007, with Brandon Sanderson finishing the series afterwards based on Jordans notes.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51qfJDxudrL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Wheel of time: The Gathering Storm',
      'author': 'Robert Jordan and Brandon Sanderson',
      'year': '2009',
      'description': 'The Gathering Storm is a fantasy novel by American writers Robert Jordan and Brandon Sanderson, the twelfth book in the series The Wheel of Time. It was incomplete when Jordan died on September 16, 2007, from cardiac amyloidosis.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51d5WZi-muL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Wheel of time: Towers of Midnight',
      'author': 'Robert Jordan and Brandon Sanderson',
      'year': '2010',
      'description': 'Towers of Midnight is a fantasy novel by Robert Jordan and Brandon Sanderson. It is the sequel to the novel The Gathering Storm, and the 13th book in the Wheel of Time series. The novel is the second part of A Memory of Light, Robert Jordans projected final book.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51dyeQKmtPL._SX309_BO1,204,203,200_.jpg'},
    {'title': 'Wheel of time: A Memory of Light',
      'author': 'Robert Jordan and Brandon Sanderson',
      'year': '2013',
      'description': 'A Memory of Light is the 14th and final book of the fantasy series The Wheel of Time, written by American authors Robert Jordan and Brandon Sanderson, and published by Tor books',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51zt3fwFG+L._SY344_BO1,204,203,200_.jpg'},
    {'title': 'Eragon',
      'author': 'Christopher Paolini',
      'year': '2001',
      'description': 'Eragon is the first book in The Inheritance Cycle by American fantasy writer Christopher Paolini. Paolini, born in 1983, began writing the novel after graduating from high school at age fifteen. After writing the first draft for a year, Paolini spent a second year rewriting and fleshing out the story and characters',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51uuWGQyLSL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Eragon: Eldest',
      'author': 'Christopher Paolini',
      'year': '2005',
      'description': 'Eldest is the second novel in the Inheritance Cycle by Christopher Paolini and the sequel to Eragon. Eldest was first published in hardcover on August 23, 2005, and was released in paperback in September 2006. Eldest has been released in an audiobook format, and as an ebook. ',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51DemJgZciL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Eragon: Brisingr',
      'author': 'Christopher Paolini',
      'year': '2008',
      'description': 'Brisingr is the third novel in the Inheritance Cycle by Christopher Paolini. It was released on September 20, 2008',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51T4I1pbZkL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Eragon: Inheritance',
      'author': 'Christopher Paolini',
      'year': '2011',
      'description': 'Not so very long ago, Eragon—Shadeslayer, Dragon Rider—was nothing more than a poor farm boy, and his dragon, Saphira, only a blue stone in the forest. Now the fate of an entire civilization rests on their shoulders.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51mC8p8EwbL._SX331_BO1,204,203,200_.jpg'},
    {'title': 'The Fellowship of the Ring',
      'author': 'J. R. R. Tolkien',
      'year': '1954',
      'description': 'The Fellowship of the Ring is a 2001 epic fantasy adventure film directed by Peter Jackson, based on the 1954 novel The Fellowship of the Ring, the first volume of J. R. R. Tolkiens The Lord of the Rings. The film is the first instalment in the Lord of the Rings trilogy.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51tW-UJVfHL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'The Two Towers',
      'author': 'J. R. R. Tolkien',
      'year': '1954',
      'description': 'The sequel to the Golden Globe-nominated and AFI Award-winning "The Lord of the Rings: The Fellowship of the Ring," "The Two Towers" follows the continuing quest of Frodo (Elijah Wood) and the Fellowship to destroy the One Ring. Frodo and Sam (Sean Astin) discover they are being followed by the mysterious Gollum. Aragorn (Viggo Mortensen), the Elf archer Legolas and Gimli the Dwarf encounter the besieged Rohan kingdom, whose once great King Theoden has fallen under Sarumans deadly spell.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51ujGkXWhmL._SX301_BO1,204,203,200_.jpg'},
    {'title': 'The Return of the King',
      'author': 'J. R. R. Tolkien',
      'year': '1955',
      'description': 'The culmination of nearly 10 years work and conclusion to Peter Jacksons epic trilogy based on the timeless J.R.R. Tolkien classic, "The Lord of the Rings: The Return of the King" presents the final confrontation between the forces of good and evil fighting for control of the future of Middle-earth. Hobbits Frodo and Sam reach Mordor in their quest to destroy the one ring, while Aragorn leads the forces of good against Saurons evil army at the stone city of Minas Tirith.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51xszqr6yrL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Ringworld',
      'author': 'Larry Niven',
      'year': '1970',
      'description': 'Ringworld is a 1970 science fiction novel by Larry Niven, set in his Known Space universe and considered a classic of science fiction literature.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51KCGqs3keL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Halo: The Fall of Reach',
      'author': 'Eric Nylund',
      'year': '2001',
      'description': ' The Fall of Reach is a military science fiction novel by Eric Nylund, set in the Halo universe, and acts as a prelude to Halo: Combat Evolved, the first game in the series. The book was released in October 2001 and is the first Halo novel. It takes place in the 26th century across several planets and locations.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51BFv8AfkYL._SX309_BO1,204,203,200_.jpg'},
    {'title': 'Halo: The Flood',
      'author': 'William C. Dietz',
      'year': '2003',
      'description': 'The Flood is a military science fiction novel by William C. Dietz, based on the Halo series of video games and based specifically on the 2001 video game Halo: Combat Evolved, the first game in the series. The book was released in April 2003 and is the second Halo novel. ',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51QKBcLl95L._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Halo: First Strike',
      'author': 'Eric Nylund',
      'year': '2003',
      'description': 'First Strike is a military science fiction novel by Eric Nylund, based on the Halo series of video games. The book was released in December 2003 and is the third Halo novel; Nylunds second contribution to the series',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51ZYHX-iSIL._SX309_BO1,204,203,200_.jpg'},
    {'title': 'Halo: Ghosts of Onyx',
      'author': 'Eric Nylund',
      'year': '2006',
      'description': 'Ghosts of Onyx is a military science fiction novel by Eric Nylund, based on the Halo series of video games. The book was released in October 2006 and is the fourth Halo novel; Nylunds third contribution to the series.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/41Y2oUXAykL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Red Rising',
      'author': 'Pierce Brown',
      'year': '2014',
      'description': 'Red Rising is a 2014 dystopian science fiction novel by American author Pierce Brown, and the first book and eponym of a series. The novel, set on a future planet Mars, follows lowborn miner Darrow as he infiltrates the ranks of the elite Golds. Red Rising has received generally positive reviews.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51vGvrbnPFL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Red Rising: Golden Son',
      'author': 'Pierce Brown',
      'year': '2015',
      'description': 'Golden Son is a 2015 science fiction novel by American author Pierce Brown, the second in his Red Rising trilogy. The sequel to 2014s Red Rising, Golden Son continues to follow lowborn Darrows plan to destroy the Society from within',
      'picture':'https://m.media-amazon.com/images/I/51iGvbVBQfL._SY346_.jpg'},
    {'title': 'Red Rising: Morning Star',
      'author': 'Pierce Brown',
      'year': '2016',
      'description': 'Morning Star is a 2016 science fiction novel by American author Pierce Brown, the third in his Red Rising trilogy. Morning Star picks up as the lowborn Darrow escapes capture and resumes his campaign against the tyrannical Sovereign of the Society.',
      'picture':'https://m.media-amazon.com/images/I/51NNve8He2L._SY346_.jpg'},
    {'title': 'Dune',
      'author': 'Frank Herbert',
      'year': '1965',
      'description': 'Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people. As malevolent forces explode into conflict over the planets exclusive supply of the most precious resource in existence, only those who can conquer their own fear will survive.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/412b7kAJE2L._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Dune Messiah',
      'author': 'Frank Herbert',
      'year': '1969',
      'description': 'Dune Messiah is a science fiction novel by American writer Frank Herbert, the second in his Dune series of six novels. A sequel to Dune, it was originally serialized in Galaxy magazine in 1969, and then published by Putnam the same year.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/41+NIJD3LAL._SY344_BO1,204,203,200_.jpg'},
    {'title': 'Children of Dune',
      'author': 'Frank Herbert',
      'year': '1976',
      'description': 'Children of Dune is a 1976 science fiction novel by Frank Herbert, the third in his Dune series of six novels. It was originally serialized in Analog Science Fiction and Fact in 1976, and was the last Dune novel to be serialized before book publication.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/41BajT0B3UL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'God Emperor of Dune',
      'author': 'Frank Herbert',
      'year': '1981',
      'description': 'God Emperor of Dune is a science fiction novel by Frank Herbert published in 1981, the fourth in his Dune series of six novels. It was ranked as the No. 11 hardcover fiction best seller of 1981 by Publishers Weekly.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/41ZH7i3gJhL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Heretics of Dune',
      'author': 'Frank Herbert',
      'year': '1984',
      'description': 'Heretics of Dune is a 1984 science fiction novel by Frank Herbert, the fifth in his Dune series of six novels. It was ranked as the No. 13 hardcover fiction best seller of 1984 by The New York Times',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/41E+rWyBUCL._SX311_BO1,204,203,200_.jpg'},
    {'title': 'Chapterhouse: Dune',
      'author': 'Frank Herbert',
      'year': '1985',
      'description': 'Chapterhouse: Dune is a 1985 science fiction novel by Frank Herbert, the last in his Dune series of six novels. It rose to No. 2 on The New York Times Best Seller list.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/41ta+4EjU5L._SY344_BO1,204,203,200_.jpg'},
    {'title': 'A Game of Thrones',
      'author': 'George R. R. Martin',
      'year': '1996',
      'description': 'A Game of Thrones is the first novel in A Song of Ice and Fire, a series of fantasy novels by the American author George R. R. Martin. It was first published on August 1, 1996. The novel won the 1997 Locus Award and was nominated for both the 1997 Nebula Award and the 1997 World Fantasy Award.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51tl4a3VY8L._SX328_BO1,204,203,200_.jpg'},
    {'title': 'A Clash of Kings',
      'author': 'George R. R. Martin',
      'year': '1999',
      'description': 'A Clash of Kings is the second novel in A Song of Ice and Fire, an epic fantasy series by American author George R. R. Martin expected to consist of seven volumes.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51nkEprwL5L._SX302_BO1,204,203,200_.jpg'},
    {'title': 'A Storm of Swords',
      'author': 'George R. R. Martin',
      'year': '2000',
      'description': 'A Storm of Swords is the third of seven planned novels in A Song of Ice and Fire, a fantasy series by American author George R. R. Martin. It was first published on August 8, 2000, in the United Kingdom, with a United States edition following in November 2000.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51tAMZkMHtL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'A Feast for Crows',
      'author': 'George R. R. Martin',
      'year': '2005',
      'description': 'A Feast for Crows is the fourth of seven planned novels in the epic fantasy series A Song of Ice and Fire by American author George R. R. Martin. The novel was first published on October 17, 2005, in the United Kingdom, with a United States edition following on November 8, 2005.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51TgwgsDjAL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'A Dance with Dragons',
      'author': 'George R. R. Martin',
      'year': '2011',
      'description': 'A Dance with Dragons is the fifth novel of seven planned in the epic fantasy series A Song of Ice and Fire by American author George R. R. Martin. In some areas, the paperback edition was published in two parts, titled Dreams and Dust and After the Feast.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/511P60EPvaL._SX301_BO1,204,203,200_.jpg'},
    {'title': 'A Wizard of Earthsea',
      'author': 'Ursula K. Le Guin',
      'year': '1968',
      'description': 'A Wizard of Earthsea is a fantasy novel written by American author Ursula K. Le Guin and first published by the small press Parnassus in 1968. It is regarded as a classic of children\'s literature, and of fantasy, within which it was widely influential.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/514h421SWdL._SX302_BO1,204,203,200_.jpg'},
    {'title': 'The Tombs of Atuan',
      'author': 'Ursula K. Le Guin',
      'year': '1970',
      'description': 'The Tombs of Atuan is a fantasy novel by the American author Ursula K. Le Guin, first published in the Winter 1970 issue of Worlds of Fantasy, and published as a book by Atheneum Books in 1971. It is the second book in the Earthsea series after A Wizard of Earthsea. The Tombs of Atuan was a Newbery Honor Book in 1972',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51FiocpY5uL._SX273_BO1,204,203,200_.jpg'},
    {'title': 'The Farthest Shore',
      'author': 'Ursula K. Le Guin',
      'year': '1972',
      'description': 'The Farthest Shore is a fantasy novel by the American author Ursula K. Le Guin, first published by Atheneum in 1972. It is the third book in the series commonly called the Earthsea Cycle.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/41TUQacykuL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Tehanu',
      'author': 'Ursula K. Le Guin',
      'year': '1990',
      'description': 'The Last Book of Earthsea is a fantasy novel by the American author Ursula K. Le Guin, published by Atheneum in 1990. It is the fourth novel set in the fictional archipelago Earthsea, following almost twenty years after the Earthsea trilogy, and not the last, despite its subtitle',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/41MArMDkeHL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'The Other Wind',
      'author': 'Ursula K. Le Guin',
      'year': '2001',
      'description': 'The Other Wind is a fantasy novel by the American author Ursula K. Le Guin, published by Harcourt in 2001. It is the fifth and final novel set in the fictional archipelago Earthsea. It won the annual World Fantasy Award for Best Novel and was runner up for the Locus Award, Best Fantasy Novel, among other nomination',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51W8C+9DHJL._SY344_BO1,204,203,200_.jpg'},
    {'title': 'Neuromancer',
      'author': 'William Gibson',
      'year': '1984',
      'description': 'Neuromancer is a 1984 science fiction novel by American-Canadian writer William Gibson. Considered one of the earliest and best-known works in the cyberpunk genre, it was the only novel to win the Nebula Award, the Philip K. Dick Award, and the Hugo Award',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51OATljr5VL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Mistborn: The Final Empire',
      'author': 'Brandon Sanderson',
      'year': '2006',
      'description': 'The Final Empire, also known simply as Mistborn or The Final Empire, is a fantasy novel written by American author Brandon Sanderson. It was published on July 17, 2006, by Tor Books and is the first novel in the Mistborn trilogy, followed by The Well of Ascension in 2007 and The Hero of Ages in 2008',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51sKzl+R6OL._SY344_BO1,204,203,200_.jpg'},
    {'title': 'Mistborn: The Well of Ascension',
      'author': 'Brandon Sanderson',
      'year': '2007',
      'description': 'The Well of Ascension is a fantasy novel written by American author Brandon Sanderson. It was published on August 21, 2007, by Tor Books and is the second novel in the Mistborn trilogy. It is preceded by The Final Empire in 2006 and followed by The Hero of Ages in 2008',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51ttDoyRTYL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Mistborn: The Hero of Ages',
      'author': 'Brandon Sanderson',
      'year': '2008',
      'description': 'The Hero of Ages is an epic fantasy novel written by American author Brandon Sanderson. It was published on October 14, 2008, by Tor Books and is the third novel in the Mistborn trilogy.',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51WmQOSdQcL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Mistborn: The Alloy of Law',
      'author': 'Brandon Sanderson',
      'year': '2011',
      'description': 'The Alloy of Law is a high fantasy novel written by American author Brandon Sanderson. It was published on November 8, 2011 by Tor Books and is the first book in the Wax and Wayne series and fourth in the Mistborn series',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/512Zy6BhJcL._SX305_BO1,204,203,200_.jpg'},
    {'title': 'Mistborn: Shadows of Self',
      'author': 'Brandon Sanderson',
      'year': '2015',
      'description': 'Shadows of Self is a high fantasy novel written by American author Brandon Sanderson. It was published on October 6, 2015 by Tor Books and is the second book in the Wax and Wayne series and fifth in the Mistborn series. It is preceded by The Alloy of Law in 2011 and followed by The Bands of Mourning in 2016',
      'picture':'https://images-na.ssl-images-amazon.com/images/I/51FBtfgpr9L._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'},
    {'title': 'Mistborn: The Bands of Mourning',
      'author': 'Brandon Sanderson',
      'year': '2016',
      'description': 'The Bands of Mourning is a high fantasy novel written by American author Brandon Sanderson. It was published on January 26, 2016, by Tor Books and is the third book in the Wax and Wayne series and sixth in the Mistborn series.',
      'picture':'https://m.media-amazon.com/images/I/51Pm5GHraRL._SY346_.jpg'},
    {'title': 'Mistborn: Secret History',
      'author': 'Brandon Sanderson',
      'year': '2016',
      'description': 'Mistborn: Secret History is a fantasy novella by American author Brandon Sanderson, written as a companion story to the original trilogy of the Mistborn series.',
      'picture':'https://m.media-amazon.com/images/I/51ECzpKDD5L._SY346_.jpg'},
    //////////////////////////////61 books
  ];

  //Saves all book info in firebase with the title of the book as the path for the information
  books.forEach((element) async{
    await db.collection("Books").doc(element['title']).set(element);
  });
}
/*final databaseReference = FirebaseDatabase.instance.reference();

void GetBook(String title) async{
  //Retrieve book table, add something to it, set the table
  print(title);

  //var bookTable = await databaseReference.child("Books");
  //var result = await bookTable.child("test").once();

  final DatabaseReference db = FirebaseDatabase().reference();

  final FirebaseApp app;
  //db.child('Books').once().then((result) => print('result = $result'));

  Map<String, int> temp = {
    'one': 1,
    'two': 2,
    'three': 3,
  };

  db.set(temp);

  print(title);
  //print(result);
}*/
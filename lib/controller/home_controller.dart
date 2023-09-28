import 'dart:math';

import 'package:bookstore/data.dart';
import 'package:bookstore/model/category.dart';
import 'package:get/get.dart';

import '../model/author.dart';
import '../model/book.dart';

RxList<Category> categoriesUi = <Category>[
  Category(id: "classics", name: "CLASSICS", image: images[0], active: true),
  Category(id: "new", name: "NEW", image: images[1], active: true),
  Category(id: "upcoming", name: "UPCOMING", image: images[2], active: true),
  Category(id: "fiction", name: "FICTION", image: images[3], active: true),
  Category(id: "romance", name: "ROMANCE", image: images[4], active: true),
].obs;
RxList<Author> authorsUi = <Author>[
  Author(
    id: "Stepanie Land",
    fullname: "Stepanie Land",
    books: 134,
    image: "assets/authors/stepanie_land.jpg",
  ),
  Author(
    id: "Sophie Mackintosh",
    fullname: "Sophie Mackintosh",
    books: 123,
    image: "assets/authors/sophie_mackintosh.jpg",
  ),
  Author(
    id: "Tara Conklin",
    fullname: "Tara Conklin",
    books: 112,
    image: "assets/authors/tara_conklin.jpg",
  ),
  Author(
    id: "Pam Jenoff",
    fullname: "Pam Jenoff",
    books: 108,
    image: "assets/authors/pam_jenoff.jpg",
  ),
  Author(
    id: "Karen Thompson",
    fullname: "Karen Thompson",
    books: 99,
    image: "assets/authors/karen_thompson_walker.jpg",
  ),
  Author(
    id: "Greer Hendricks",
    fullname: "Greer Hendricks",
    books: 90,
    image: "assets/authors/greer_hendricks.jpg",
  ),
  Author(
    id: "Fiona Barton",
    fullname: "Fiona Barton",
    books: 87,
    image: "assets/authors/fiona_barton.jpg",
  ),
  /* Author(
      "Whitney Scharer",
      77,
      "assets/authors/whitney_scharer.jpg",
    ),
    Author(
      "Andrea Bartz",
      75,
      "assets/authors/andrea_bartz.jpg",
    ),
    Author(
      "Kristen Roupenian",
      70,
      "assets/authors/kristen_roupenian.jpg",
    ),
    Author(
      "Yangsze Choo",
      65,
      "assets/authors/yangsze_choo.jpg",
    ), */
].obs;

List<Book> booksUi = [
  Book(
    id: "An Anonymous Girl",
    title: "An Anonymous Girl",
    description:
        "The newest suspense novel from the authors behind The Wife Between Us introduces us to Jessica Ferris. Jess just wants to make a little extra cash when she decides to participate in a study on ethics with the mysterious Dr. Lydia Shields. The premise seems simple: Answer a few questions, then collect. But soon the doctor’s questions turn from simple survey queries to something much more sinister—leaving Jess unsure of whom she can trust. An early contender for thriller of the year.",
    price: 1000,
    score: 4.1,
    categoryID: categoriesUi[Random().nextInt(categoriesUi.length)].id,
    authorID: authorsUi[Random().nextInt(authorsUi.length)].id,
    categoryImage: categoriesUi[Random().nextInt(categoriesUi.length)].image,
    authorImage: authorsUi[Random().nextInt(authorsUi.length)].image,
    categoryName: categoriesUi[Random().nextInt(categoriesUi.length)].name,
    authorName: authorsUi[Random().nextInt(authorsUi.length)].fullname,
    image: "assets/books/an_anonymous_girl_by_greer_hendricks.jpg",
  ),
  Book(
    id: "The Water Cure",
    title: "The Water Cure",
    description:
        "The Water Cure has drawn instant comparisons to The Handmaid’s Tale, and not just because author Margaret Atwood called it “a gripping, sinister fable.” The book centers on Grace, Lia, and Sky, three sisters who live on an isolated island with their mother and their father, whom they call King. When their father disappears, their lives—as well as everything they’ve been told about the outside world—are upended.",
    price: 2000,
    score: 4.14,
    categoryID: categoriesUi[Random().nextInt(categoriesUi.length)].id,
    authorID: authorsUi[Random().nextInt(authorsUi.length)].id,
    categoryImage: categoriesUi[Random().nextInt(categoriesUi.length)].image,
    authorImage: authorsUi[Random().nextInt(authorsUi.length)].image,
    categoryName: categoriesUi[Random().nextInt(categoriesUi.length)].name,
    authorName: authorsUi[Random().nextInt(authorsUi.length)].fullname,
    image: "assets/books/the_water_cure_by_sophie_mackintosh.jpg",
  ),
  Book(
    id: "The Dreamers",
    title: "The Dreamers",
    description:
        "Set in a Southern California college town, The Dreamers begins with the odd case of a student who walks into her dorm room, passes out, and doesn’t wake up. Soon a second girl falls asleep, then a third, and on it goes. The victims are locked in a heightened dream state, having wild fantasies and hallucinations—all while a group of students, teachers, and doctors struggle to wake them.",
    price: 3000,
    score: 4.14,
    categoryID: categoriesUi[Random().nextInt(categoriesUi.length)].id,
    authorID: authorsUi[Random().nextInt(authorsUi.length)].id,
    categoryImage: categoriesUi[Random().nextInt(categoriesUi.length)].image,
    authorImage: authorsUi[Random().nextInt(authorsUi.length)].image,
    categoryName: categoriesUi[Random().nextInt(categoriesUi.length)].name,
    authorName: authorsUi[Random().nextInt(authorsUi.length)].fullname,
    image: "assets/books/the_dreamers_by_karen_thompson.jpg",
  ),
  Book(
    id: "Maid",
    title: "Maid",
    description:
        "Growing up, Land had always planned on escaping her hometown and becoming a writer. But after an unexpected pregnancy, her dreams were put on hold. She became a housekeeper, went on food stamps, and at times lived in government housing to make ends meet. All the while she took online college classes and wrote stories about the people around her: working-class Americans. Land's memoir is this year’s Educated; you’ll love her fighting spirit and learn from her look at poverty in the United States..",
    score: 4.14,
    price: 4000,
    categoryID: categoriesUi[Random().nextInt(categoriesUi.length)].id,
    authorID: authorsUi[Random().nextInt(authorsUi.length)].id,
    categoryImage: categoriesUi[Random().nextInt(categoriesUi.length)].image,
    authorImage: authorsUi[Random().nextInt(authorsUi.length)].image,
    categoryName: categoriesUi[Random().nextInt(categoriesUi.length)].name,
    authorName: authorsUi[Random().nextInt(authorsUi.length)].fullname,
    image: "assets/books/maid_by_stepanie_land.jpg",
  ),
  Book(
    id: "The Suspect",
    title: "The Suspect",
    description:
        "If you obsessively followed the stories of Natalee Holloway, Madeleine McCann, and Jayme Closs, read The Suspect. From the author of the New York Times best-seller The Widow, Barton’s latest novel centers on what happens when two girls vanish in Thailand. With the girls’ families thrown into the international spotlight, journalists descend to crack the case. But as this thriller unfolds, it becomes clear the real danger is closer to home. The Suspect is an edge-of-your-seat suspense novel about a parent’s worst nightmare.",
    price: 50000,
    score: 4.14,
    categoryID: categoriesUi[Random().nextInt(categoriesUi.length)].id,
    authorID: authorsUi[Random().nextInt(authorsUi.length)].id,
    categoryImage: categoriesUi[Random().nextInt(categoriesUi.length)].image,
    authorImage: authorsUi[Random().nextInt(authorsUi.length)].image,
    categoryName: categoriesUi[Random().nextInt(categoriesUi.length)].name,
    authorName: authorsUi[Random().nextInt(authorsUi.length)].fullname,
    image: "assets/books/the_suspect_by_fiona_barton.jpg",
  ),
  Book(
    id: "The Lost Girls of Paris",
    title: "The Lost Girls of Paris",
    description:
        "Jenoff, the author of New York Times best-seller The Orphan’s Tale, is back with a novel about a group of female secret agents during World War II. Based on a series of real-life events, the book opens in Manhattan in 1946, when a woman discovers a suitcase that belonged to the leader of a network of spies based in London during the war. What follows is a portrait of sisterhood, courage, and drama. A must-read.",
    price: 60000,
    score: 4.14,
    categoryID: categoriesUi[Random().nextInt(categoriesUi.length)].id,
    authorID: authorsUi[Random().nextInt(authorsUi.length)].id,
    categoryImage: categoriesUi[Random().nextInt(categoriesUi.length)].image,
    authorImage: authorsUi[Random().nextInt(authorsUi.length)].image,
    categoryName: categoriesUi[Random().nextInt(categoriesUi.length)].name,
    authorName: authorsUi[Random().nextInt(authorsUi.length)].fullname,
    image: "assets/books/the_lost_girls_of_paris_by_pam_jenoff.jpg",
  ),
  Book(
    title: "The Age of Light",
    id: "The Age of Light",
    description:
        "Is “woman behaves dangerously, lives wildly” a genre? If so, The Age of Light is its latest poster child. The novel is a work of historical fiction about Lee Miller, a real-life Vogue model who became one of the first female war correspondents. Scharer’s plot takes off when Miller travels to Paris where she meets photographer Man Ray, who becomes her collaborator and lover. While most stories about Miller paint her as Ray’s muse, this one portrays her as the independent and daring artist she truly was.",
    score: 4.14,
    price: 70000,
    categoryID: categoriesUi[Random().nextInt(categoriesUi.length)].id,
    authorID: authorsUi[Random().nextInt(authorsUi.length)].id,
    categoryImage: categoriesUi[Random().nextInt(categoriesUi.length)].image,
    authorImage: authorsUi[Random().nextInt(authorsUi.length)].image,
    categoryName: categoriesUi[Random().nextInt(categoriesUi.length)].name,
    authorName: authorsUi[Random().nextInt(authorsUi.length)].fullname,
    image: "assets/books/the_age_of_light_by_whitney_scharer.jpg",
  ),
  Book(
    id: "The Last Romantics",
    title: "The Last Romantics",
    description:
        "The second novel from the writer behind New York Times best-seller The House Girl is a modern epic. When poet Fiona Skinner is asked about the inspiration behind her most famous work, she begins to trace the arc of her childhood. She recalls her father's unexpected death, her mother's descent into a paralyzing depression, and her siblings' determined survival. Her father's death shaped each of their lives and still haunts Fiona in her work. In the vein of Commonwealth, The Last Romantics is a sweeping look at what binds families together.",
    score: 4.14,
    price: 80000,
    categoryID: categoriesUi[Random().nextInt(categoriesUi.length)].id,
    authorID: authorsUi[Random().nextInt(authorsUi.length)].id,
    categoryImage: categoriesUi[Random().nextInt(categoriesUi.length)].image,
    authorImage: authorsUi[Random().nextInt(authorsUi.length)].image,
    categoryName: categoriesUi[Random().nextInt(categoriesUi.length)].name,
    authorName: authorsUi[Random().nextInt(authorsUi.length)].fullname,
    image: "assets/books/the_last_romantics_by_tara_conklin.jpg",
  ),
  Book(
    id: "The Night Tiger",
    title: "The Night Tiger",
    description:
        "Set in the 1930s in Malaysia, The Night Tiger opens when 11-year-old houseboy Ren discovers his master has just died. The master's final wish was for Ren to find the man’s finger—which he’d lost years before in an accident—so it can be buried with him. If the boy fails to find it, his master will be cursed and his soul will forever wander the earth. Across the district, Ji Lin, an apprentice dressmaker and dance hall girl by night, comes across an item that one of her dance partners has left behind, which sends her on her own adventure. Ren’s and Ji Lin’s paths soon crisscross as they embark on their journeys. It’s a book for fans of Isabel Allende and for those who love a murder mystery with a beautiful backdrop.",
    score: 4.14,
    price: 80000,
    categoryID: categoriesUi[Random().nextInt(categoriesUi.length)].id,
    authorID: authorsUi[Random().nextInt(authorsUi.length)].id,
    categoryImage: categoriesUi[Random().nextInt(categoriesUi.length)].image,
    authorImage: authorsUi[Random().nextInt(authorsUi.length)].image,
    categoryName: categoriesUi[Random().nextInt(categoriesUi.length)].name,
    authorName: authorsUi[Random().nextInt(authorsUi.length)].fullname,
    image: "assets/books/the_night_tiger_by_yangsze_choo.jpg",
  ),
  Book(
    id: "The Lost Night",
    title: "The Lost Night",
    description:
        "If you couldn't get enough of TBS's Search Party, or more recently Netflix's Russian Doll, pick up a copy of The Lost Night. Much like these two shows, this book also centers on a young woman posing as an amateur detective to solve a murder. Back in 2009 the novel's protagonist, Lindsay, partied with her friends and the queen bee of their group, Edie. After a long night of binge drinking, Lindsay woke up to find Edie dead of an apparent suicide. Now, a decade later, Lindsay discovers new evidence that could prove that Edie was murdered—and that Lindsay might have been involved. The rest of this haunting debut follows Lindsay as she tries to piece together what really happened on that awful, forgotten night.",
    score: 3.12,
    price: 80000,
    categoryID: categoriesUi[Random().nextInt(categoriesUi.length)].id,
    authorID: authorsUi[Random().nextInt(authorsUi.length)].id,
    categoryImage: categoriesUi[Random().nextInt(categoriesUi.length)].image,
    authorImage: authorsUi[Random().nextInt(authorsUi.length)].image,
    categoryName: categoriesUi[Random().nextInt(categoriesUi.length)].name,
    authorName: authorsUi[Random().nextInt(authorsUi.length)].fullname,
    image: "assets/books/the_lost_night_by_andrea_bartz.jpg",
  ),
  Book(
    id: "You Know You Want This",
    title: "You Know You Want This",
    description:
        "Roupenian broke the Internet when The New Yorker published her viral short story “Cat Person” in 2017. Quick refresher: It was about a college-age girl who sleeps with an older man because she feels like she “owes” it to him, not quite because she wants to. In her debut collection, Roupenian continues to explore the inner workings of sex, trauma, kinks, and manipulation.",
    score: 3.12,
    price: 30000,
    categoryID: categoriesUi[Random().nextInt(categoriesUi.length)].id,
    authorID: authorsUi[Random().nextInt(authorsUi.length)].id,
    categoryImage: categoriesUi[Random().nextInt(categoriesUi.length)].image,
    authorImage: authorsUi[Random().nextInt(authorsUi.length)].image,
    categoryName: categoriesUi[Random().nextInt(categoriesUi.length)].name,
    authorName: authorsUi[Random().nextInt(authorsUi.length)].fullname,
    image: "assets/books/you_know_you_want_this_by_kristen_roupenian.jpg",
  ),
];

class HomeController extends GetxController {
  RxList<Category> categories = <Category>[].obs;
  RxList<Author> authors = <Author>[
    Author(
      id: "Stepanie Land",
      fullname: "Stepanie Land",
      books: 134,
      image: "assets/authors/stepanie_land.jpg",
    ),
    Author(
      id: "Sophie Mackintosh",
      fullname: "Sophie Mackintosh",
      books: 123,
      image: "assets/authors/sophie_mackintosh.jpg",
    ),
    Author(
      id: "Tara Conklin",
      fullname: "Tara Conklin",
      books: 112,
      image: "assets/authors/tara_conklin.jpg",
    ),
    Author(
      id: "Pam Jenoff",
      fullname: "Pam Jenoff",
      books: 108,
      image: "assets/authors/pam_jenoff.jpg",
    ),
    Author(
      id: "Karen Thompson",
      fullname: "Karen Thompson",
      books: 99,
      image: "assets/authors/karen_thompson_walker.jpg",
    ),
    Author(
      id: "Greer Hendricks",
      fullname: "Greer Hendricks",
      books: 90,
      image: "assets/authors/greer_hendricks.jpg",
    ),
    Author(
      id: "Fiona Barton",
      fullname: "Fiona Barton",
      books: 87,
      image: "assets/authors/fiona_barton.jpg",
    ),
    /* Author(
      "Whitney Scharer",
      77,
      "assets/authors/whitney_scharer.jpg",
    ),
    Author(
      "Andrea Bartz",
      75,
      "assets/authors/andrea_bartz.jpg",
    ),
    Author(
      "Kristen Roupenian",
      70,
      "assets/authors/kristen_roupenian.jpg",
    ),
    Author(
      "Yangsze Choo",
      65,
      "assets/authors/yangsze_choo.jpg",
    ), */
  ].obs;
  RxList<Book> books = [
    Book(
      id: "An Anonymous Girl",
      title: "An Anonymous Girl",
      description:
          "The newest suspense novel from the authors behind The Wife Between Us introduces us to Jessica Ferris. Jess just wants to make a little extra cash when she decides to participate in a study on ethics with the mysterious Dr. Lydia Shields. The premise seems simple: Answer a few questions, then collect. But soon the doctor’s questions turn from simple survey queries to something much more sinister—leaving Jess unsure of whom she can trust. An early contender for thriller of the year.",
      price: 1000,
      score: 4.1,
      categoryID: categoriesUi[Random().nextInt(categoriesUi.length)].id,
      authorID: authorsUi[Random().nextInt(authorsUi.length)].id,
      categoryImage: categoriesUi[Random().nextInt(categoriesUi.length)].image,
      authorImage: authorsUi[Random().nextInt(authorsUi.length)].image,
      categoryName: categoriesUi[Random().nextInt(categoriesUi.length)].name,
      authorName: authorsUi[Random().nextInt(authorsUi.length)].fullname,
      image: "assets/books/an_anonymous_girl_by_greer_hendricks.jpg",
    ),
    Book(
      id: "The Water Cure",
      title: "The Water Cure",
      description:
          "The Water Cure has drawn instant comparisons to The Handmaid’s Tale, and not just because author Margaret Atwood called it “a gripping, sinister fable.” The book centers on Grace, Lia, and Sky, three sisters who live on an isolated island with their mother and their father, whom they call King. When their father disappears, their lives—as well as everything they’ve been told about the outside world—are upended.",
      price: 2000,
      score: 4.14,
      categoryID: categoriesUi[Random().nextInt(categoriesUi.length)].id,
      authorID: authorsUi[Random().nextInt(authorsUi.length)].id,
      categoryImage: categoriesUi[Random().nextInt(categoriesUi.length)].image,
      authorImage: authorsUi[Random().nextInt(authorsUi.length)].image,
      categoryName: categoriesUi[Random().nextInt(categoriesUi.length)].name,
      authorName: authorsUi[Random().nextInt(authorsUi.length)].fullname,
      image: "assets/books/the_water_cure_by_sophie_mackintosh.jpg",
    ),
    Book(
      id: "The Dreamers",
      title: "The Dreamers",
      description:
          "Set in a Southern California college town, The Dreamers begins with the odd case of a student who walks into her dorm room, passes out, and doesn’t wake up. Soon a second girl falls asleep, then a third, and on it goes. The victims are locked in a heightened dream state, having wild fantasies and hallucinations—all while a group of students, teachers, and doctors struggle to wake them.",
      price: 3000,
      score: 4.14,
      categoryID: categoriesUi[Random().nextInt(categoriesUi.length)].id,
      authorID: authorsUi[Random().nextInt(authorsUi.length)].id,
      categoryImage: categoriesUi[Random().nextInt(categoriesUi.length)].image,
      authorImage: authorsUi[Random().nextInt(authorsUi.length)].image,
      categoryName: categoriesUi[Random().nextInt(categoriesUi.length)].name,
      authorName: authorsUi[Random().nextInt(authorsUi.length)].fullname,
      image: "assets/books/the_dreamers_by_karen_thompson.jpg",
    ),
    Book(
      id: "Maid",
      title: "Maid",
      description:
          "Growing up, Land had always planned on escaping her hometown and becoming a writer. But after an unexpected pregnancy, her dreams were put on hold. She became a housekeeper, went on food stamps, and at times lived in government housing to make ends meet. All the while she took online college classes and wrote stories about the people around her: working-class Americans. Land's memoir is this year’s Educated; you’ll love her fighting spirit and learn from her look at poverty in the United States..",
      score: 4.14,
      price: 4000,
      categoryID: categoriesUi[Random().nextInt(categoriesUi.length)].id,
      authorID: authorsUi[Random().nextInt(authorsUi.length)].id,
      categoryImage: categoriesUi[Random().nextInt(categoriesUi.length)].image,
      authorImage: authorsUi[Random().nextInt(authorsUi.length)].image,
      categoryName: categoriesUi[Random().nextInt(categoriesUi.length)].name,
      authorName: authorsUi[Random().nextInt(authorsUi.length)].fullname,
      image: "assets/books/maid_by_stepanie_land.jpg",
    ),
    Book(
      id: "The Suspect",
      title: "The Suspect",
      description:
          "If you obsessively followed the stories of Natalee Holloway, Madeleine McCann, and Jayme Closs, read The Suspect. From the author of the New York Times best-seller The Widow, Barton’s latest novel centers on what happens when two girls vanish in Thailand. With the girls’ families thrown into the international spotlight, journalists descend to crack the case. But as this thriller unfolds, it becomes clear the real danger is closer to home. The Suspect is an edge-of-your-seat suspense novel about a parent’s worst nightmare.",
      price: 50000,
      score: 4.14,
      categoryID: categoriesUi[Random().nextInt(categoriesUi.length)].id,
      authorID: authorsUi[Random().nextInt(authorsUi.length)].id,
      categoryImage: categoriesUi[Random().nextInt(categoriesUi.length)].image,
      authorImage: authorsUi[Random().nextInt(authorsUi.length)].image,
      categoryName: categoriesUi[Random().nextInt(categoriesUi.length)].name,
      authorName: authorsUi[Random().nextInt(authorsUi.length)].fullname,
      image: "assets/books/the_suspect_by_fiona_barton.jpg",
    ),
    Book(
      id: "The Lost Girls of Paris",
      title: "The Lost Girls of Paris",
      description:
          "Jenoff, the author of New York Times best-seller The Orphan’s Tale, is back with a novel about a group of female secret agents during World War II. Based on a series of real-life events, the book opens in Manhattan in 1946, when a woman discovers a suitcase that belonged to the leader of a network of spies based in London during the war. What follows is a portrait of sisterhood, courage, and drama. A must-read.",
      price: 60000,
      score: 4.14,
      categoryID: categoriesUi[Random().nextInt(categoriesUi.length)].id,
      authorID: authorsUi[Random().nextInt(authorsUi.length)].id,
      categoryImage: categoriesUi[Random().nextInt(categoriesUi.length)].image,
      authorImage: authorsUi[Random().nextInt(authorsUi.length)].image,
      categoryName: categoriesUi[Random().nextInt(categoriesUi.length)].name,
      authorName: authorsUi[Random().nextInt(authorsUi.length)].fullname,
      image: "assets/books/the_lost_girls_of_paris_by_pam_jenoff.jpg",
    ),
    Book(
      title: "The Age of Light",
      id: "The Age of Light",
      description:
          "Is “woman behaves dangerously, lives wildly” a genre? If so, The Age of Light is its latest poster child. The novel is a work of historical fiction about Lee Miller, a real-life Vogue model who became one of the first female war correspondents. Scharer’s plot takes off when Miller travels to Paris where she meets photographer Man Ray, who becomes her collaborator and lover. While most stories about Miller paint her as Ray’s muse, this one portrays her as the independent and daring artist she truly was.",
      score: 4.14,
      price: 70000,
      categoryID: categoriesUi[Random().nextInt(categoriesUi.length)].id,
      authorID: authorsUi[Random().nextInt(authorsUi.length)].id,
      categoryImage: categoriesUi[Random().nextInt(categoriesUi.length)].image,
      authorImage: authorsUi[Random().nextInt(authorsUi.length)].image,
      categoryName: categoriesUi[Random().nextInt(categoriesUi.length)].name,
      authorName: authorsUi[Random().nextInt(authorsUi.length)].fullname,
      image: "assets/books/the_age_of_light_by_whitney_scharer.jpg",
    ),
    Book(
      id: "The Last Romantics",
      title: "The Last Romantics",
      description:
          "The second novel from the writer behind New York Times best-seller The House Girl is a modern epic. When poet Fiona Skinner is asked about the inspiration behind her most famous work, she begins to trace the arc of her childhood. She recalls her father's unexpected death, her mother's descent into a paralyzing depression, and her siblings' determined survival. Her father's death shaped each of their lives and still haunts Fiona in her work. In the vein of Commonwealth, The Last Romantics is a sweeping look at what binds families together.",
      score: 4.14,
      price: 80000,
      categoryID: categoriesUi[Random().nextInt(categoriesUi.length)].id,
      authorID: authorsUi[Random().nextInt(authorsUi.length)].id,
      categoryImage: categoriesUi[Random().nextInt(categoriesUi.length)].image,
      authorImage: authorsUi[Random().nextInt(authorsUi.length)].image,
      categoryName: categoriesUi[Random().nextInt(categoriesUi.length)].name,
      authorName: authorsUi[Random().nextInt(authorsUi.length)].fullname,
      image: "assets/books/the_last_romantics_by_tara_conklin.jpg",
    ),
    Book(
      id: "The Night Tiger",
      title: "The Night Tiger",
      description:
          "Set in the 1930s in Malaysia, The Night Tiger opens when 11-year-old houseboy Ren discovers his master has just died. The master's final wish was for Ren to find the man’s finger—which he’d lost years before in an accident—so it can be buried with him. If the boy fails to find it, his master will be cursed and his soul will forever wander the earth. Across the district, Ji Lin, an apprentice dressmaker and dance hall girl by night, comes across an item that one of her dance partners has left behind, which sends her on her own adventure. Ren’s and Ji Lin’s paths soon crisscross as they embark on their journeys. It’s a book for fans of Isabel Allende and for those who love a murder mystery with a beautiful backdrop.",
      score: 4.14,
      price: 80000,
      categoryID: categoriesUi[Random().nextInt(categoriesUi.length)].id,
      authorID: authorsUi[Random().nextInt(authorsUi.length)].id,
      categoryImage: categoriesUi[Random().nextInt(categoriesUi.length)].image,
      authorImage: authorsUi[Random().nextInt(authorsUi.length)].image,
      categoryName: categoriesUi[Random().nextInt(categoriesUi.length)].name,
      authorName: authorsUi[Random().nextInt(authorsUi.length)].fullname,
      image: "assets/books/the_night_tiger_by_yangsze_choo.jpg",
    ),
    Book(
      id: "The Lost Night",
      title: "The Lost Night",
      description:
          "If you couldn't get enough of TBS's Search Party, or more recently Netflix's Russian Doll, pick up a copy of The Lost Night. Much like these two shows, this book also centers on a young woman posing as an amateur detective to solve a murder. Back in 2009 the novel's protagonist, Lindsay, partied with her friends and the queen bee of their group, Edie. After a long night of binge drinking, Lindsay woke up to find Edie dead of an apparent suicide. Now, a decade later, Lindsay discovers new evidence that could prove that Edie was murdered—and that Lindsay might have been involved. The rest of this haunting debut follows Lindsay as she tries to piece together what really happened on that awful, forgotten night.",
      score: 3.12,
      price: 80000,
      categoryID: categoriesUi[Random().nextInt(categoriesUi.length)].id,
      authorID: authorsUi[Random().nextInt(authorsUi.length)].id,
      categoryImage: categoriesUi[Random().nextInt(categoriesUi.length)].image,
      authorImage: authorsUi[Random().nextInt(authorsUi.length)].image,
      categoryName: categoriesUi[Random().nextInt(categoriesUi.length)].name,
      authorName: authorsUi[Random().nextInt(authorsUi.length)].fullname,
      image: "assets/books/the_lost_night_by_andrea_bartz.jpg",
    ),
    Book(
      id: "You Know You Want This",
      title: "You Know You Want This",
      description:
          "Roupenian broke the Internet when The New Yorker published her viral short story “Cat Person” in 2017. Quick refresher: It was about a college-age girl who sleeps with an older man because she feels like she “owes” it to him, not quite because she wants to. In her debut collection, Roupenian continues to explore the inner workings of sex, trauma, kinks, and manipulation.",
      score: 3.12,
      price: 30000,
      categoryID: categoriesUi[Random().nextInt(categoriesUi.length)].id,
      authorID: authorsUi[Random().nextInt(authorsUi.length)].id,
      categoryImage: categoriesUi[Random().nextInt(categoriesUi.length)].image,
      authorImage: authorsUi[Random().nextInt(authorsUi.length)].image,
      categoryName: categoriesUi[Random().nextInt(categoriesUi.length)].name,
      authorName: authorsUi[Random().nextInt(authorsUi.length)].fullname,
      image: "assets/books/you_know_you_want_this_by_kristen_roupenian.jpg",
    ),
  ].obs;

  var selectedCategoryID = "".obs;
  void changeSelectedCategoryID(String id) {
    selectedCategoryID.value = id;
    books.value = booksUi.where((e) => e.categoryID == id).toList();
  }

  @override
  void onInit() {
    categories.value = [
      Category(
          id: "classics", name: "CLASSICS", image: images[0], active: true),
      Category(id: "new", name: "NEW", image: images[1], active: true),
      Category(
          id: "upcoming", name: "UPCOMING", image: images[2], active: true),
      Category(id: "fiction", name: "FICTION", image: images[3], active: true),
      Category(id: "romance", name: "ROMANCE", image: images[4], active: true),
    ];
    //FIXME:Request Categories List From Firebase and assign first category's id.
    selectedCategoryID.value = categories.first.id;
    //FIXME:Request from Firebase
    books.value =
        booksUi.where((e) => e.categoryID == categoriesUi.first.id).toList();
    super.onInit();
  }
}

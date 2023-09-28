import 'package:bookstore/model/search_type.dart';
import 'package:flutter/material.dart';

import 'model/division.dart';

Map<int, Color> colorMap = {
  50: Color.fromRGBO(236, 49, 51, .1),
  100: Color.fromRGBO(236, 49, 51, .2),
  200: Color.fromRGBO(236, 49, 51, .3),
  300: Color.fromRGBO(236, 49, 51, .4),
  400: Color.fromRGBO(236, 49, 51, .5),
  500: Color.fromRGBO(236, 49, 51, .6),
  600: Color.fromRGBO(236, 49, 51, .7),
  700: Color.fromRGBO(236, 49, 51, .8),
  800: Color.fromRGBO(236, 49, 51, .9),
  900: Color.fromRGBO(236, 49, 51, 1),
};

MaterialColor kPrimaryMaterialColor = MaterialColor(0xFFEC3133, colorMap);

Color kPrimaryColor = Color(0xFFEC3133);
Color kStarsColor = Color(0xFFFA6400);

class AppIcon {
  static const home = "assets/icon/home.svg";
  static const category = "assets/icon/category.svg";
  static const user = "assets/icon/user.svg";
  static const writer = "assets/icon/writer.svg";
  static const cart = "assets/icon/add-to-cart.svg";
  static const orderHistory = "assets/icon/order-history.svg";
}

const logo = "https://www.topvalu.net/img/logo_topvalu.png";

const Color scaffoldBackground = Colors.white;
const Color appBarColor = Colors.white;
const Color appBarTitleColor = Color(0xFFEC3133);
const Color homeIndicatorColor = Color(0xFFEC3133);
const Color detailBackgroundColor = Colors.white;
const Color detailTextBackgroundColor = Colors.white;
ButtonStyle buttonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Color(0xFFEC3133)),
);

const boxName = "productBox";
const purchaseBox = "purchaseBox";

const List<String> statusList = [
  "NEW",
  "RECOMMEND",
];

enum PaymentOptions {
  CashOnDelivery,
  PrePay,
  None,
}

enum PaymentMethod {
  bankSlip,
  cashOnDelivery,
}

const String bankSlip = "BANK-SLIP";
const String cashOnDelivery = "CashOnDelivery";

final List<Division> divisionList = [
  //Yangon Division
  Division(
    name: "ရန်ကုန်တိုင်း",
    townShipMap: {
      '1400': [
        "ကျောက်တံတား",
        "လမ်းမတော်",
        "လသာ"
            "ပန်းဘဲတန်း",
        "ဗိုလ်တထောင်",
        "မင်္ဂလာတောင်ညွန့်",
        "ပုဇွန်တောင်",
      ],
      '1900': [
        "အလုံ",
        "ဗဟန်း",
        "ဒဂုံ",
        "လှိုင်",
        "ကမာရွတ်",
        "ကြည့်မြင်တိုင်",
        "မရမ်းကုန်း",
        "စမ်းချောင်း",
      ],
      '2500': [
        "လှည်းကူး",
        "မှော်ဘီ/တိုက်ကြီး",
        "ထန်းတပင်",
        "ဒလ/ကော့မူး",
        "ကွမ်းခြံကုန်း",
      ]
    },
  ),
  //Mandalay Division
  Division(
    name: "မန္တလေးတိုင်း",
    townShipMap: {
      "3500": [
        "တောင်သာ",
      ],
      "2500": [
        "အမရပူရ",
        "အောင်မြေသာဇံ",
        "ချမ်းအေးသာဇံ",
        "မဟာအောင်မြေ",
        "ပုသိမ်ကြီး",
        "ပြည်ကြီးတံခွန်",
      ]
    },
  ),
  //Ayarwadi Division
  Division(
    name: "ဧရာဝတီတိုင်း",
    townShipMap: {
      "2900": [
        "မြောင်းမြ/ပုသိမ်",
        "ကန်ကြီးထောင့်",
      ]
    },
  ),
  //ပဲခူးတိုင်း
  Division(
    name: "ပဲခူးတိုင်း",
    townShipMap: {
      "2900": [
        "ပဲခူး/တောင်ငူ",
        "ပေါင်းတည်",
        "ပြည်/ရွှေတောင်",
        "ကြို့ပင်ကောက်",
      ]
    },
  ),
  //နေပြည်တော်
  Division(
    name: "နေပြည်တော်",
    townShipMap: {
      "2500": [
        "ဥတ္တရသီရိ",
        "ဒက္ခိဏသီရိ",
        "ပုပ္ပသီရိ",
        "ဇေယာသီရိ",
        "ပျဉ်းမနား",
      ],
      "2900": [
        "လယ်ဝေး",
        "တပ်ကုန်း",
      ]
    },
  ),
];

List<SearchType> searchTypes = [
  SearchType(name: "Book Title", type: SearchingType.bookTitle),
  SearchType(name: "Category Name", type: SearchingType.categoryName),
  SearchType(name: "Author Name", type: SearchingType.authorName),
];

enum SearchingType {
  bookTitle,
  categoryName,
  authorName,
}

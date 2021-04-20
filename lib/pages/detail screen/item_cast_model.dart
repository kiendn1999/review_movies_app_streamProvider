class ItemCast {
  String name;
  String character;
  String profile_path;

  ItemCast({this.name, this.character, this.profile_path});

  toJson() {
    return {
      "name": this.name,
      "character": this.character,
      "profile_path": this.profile_path
    };
  }

  factory ItemCast.fromJson(json) {
    return ItemCast(
        name: json['name'],
        character: json['character'],
        profile_path: json['profile_path']);
  }
}

final List<ItemCast> listItemCast = [
  ItemCast(
      name: "Hideo Ishikawa",
      character: "Itachi (voice)",
      profile_path: "assets/images/hideo_ishikawa-itachi.jpg"),
  ItemCast(
      name: "Hidekatsu Shibata",
      character: "Sarutobi (voice)",
      profile_path: "assets/images/hidekatsu_shibata-Sarutobi.jpg"),
  ItemCast(
      name: "Junko Takeuchi",
      character: "Naruto (voice)",
      profile_path: "assets/images/junko_takeuchi-Naruto.jpg"),
  ItemCast(
      name: "Kazuhiko Inoue",
      character: "Kakashi (voice)",
      profile_path: "assets/images/Kazuhiko_Inoue_Kakashi.jpg"),
  ItemCast(
      name: "Mizuki Nana",
      character: "Hinata (voice)",
      profile_path: "assets/images/Mizuki_Nana-Hinata.jpg"),
  ItemCast(
      name: "Noriaki Sugiyama",
      character: "Sasuke (voice)",
      profile_path: "assets/images/Noriaki_Sugiyama_Sasuke.jpg"),
  ItemCast(
      name: "Tamura Yukari",
      character: "Tenten (voice)",
      profile_path: "assets/images/Tamura_Yukari-Tenten.jpg"),
  ItemCast(
      name: "Toshiyuki Morikawa",
      character: "Minato (voice)",
      profile_path: "assets/images/toshiyuki_morikawa-Minato.jpg"),
];

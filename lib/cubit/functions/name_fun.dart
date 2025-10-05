String formatActorName(String fullName) {
  List<String> parts = fullName.split(" ");

  if (parts.length >= 2) {
    return "${parts[0]} ${parts[1]}";
  } else {
    return fullName;
  }
}

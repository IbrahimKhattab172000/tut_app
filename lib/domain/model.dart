class SliderObject {
  String title;
  String subtitle;
  String image;
  SliderObject(
    this.title,
    this.subtitle,
    this.image,
  );
}

class Customer {
  String id;

  String name;
  int numbOfNotifications;
  Customer(
    this.id,
    this.name,
    this.numbOfNotifications,
  );
}

class Contacts {
  String phone;
  String link;
  int email;
  Contacts(
    this.phone,
    this.link,
    this.email,
  );
}

class Authentication {
  Customer customer;
  Contacts contacts;
  Authentication(
    this.customer,
    this.contacts,
  );
}

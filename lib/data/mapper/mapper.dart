import 'package:tut_app/app/extensions.dart';
import 'package:tut_app/data/responses/response.dart';
import 'package:tut_app/domain/model.dart';

const empty = "";
const zero = 0;

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      this?.id.orEmpty() ?? empty,
      this?.name.orEmpty() ?? empty,
      this?.numbOfNotifications.orZero() ?? zero,
    );
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
      this?.phone.orEmpty() ?? empty,
      this?.link.orEmpty() ?? empty,
      this?.email.orEmpty() ?? empty,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.customer?.toDomain(),
      this?.contacts?.toDomain(),
    );
  }
}

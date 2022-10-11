
List<Events> list = [];


class Events {
  int? id;
  String? title;
  String? description;
  int? spots;
  int? price;
  double? lat;
  double? lon;
  String? placeName;
  String? featuredImage;
  String? deeplink;
  String? date;
  int? tagId;
  int? createdBy;
  int? communityId;
  String? whatsappLink;
  List<Images>? images;
  String? finishDate;
  int? locationId;
  bool? isPrivate;
  bool? receiveUpdates;
  String? state;
  bool? isCheckedIn;
  bool? isFeatured;
  int? viewersCount;
  List<Users>? users;
  Community? community;
  Tag? tag;
  bool? isWaiting;
  bool? isJoined;
  int? joinedUsersCount;
  int? checkedInCount;
  int? paidAmount;
  int? ownerEarnings;

  Events(
      {this.id,
      this.title,
      this.description,
      this.spots,
      this.price,
      this.lat,
      this.lon,
      this.placeName,
      this.featuredImage,
      this.deeplink,
      this.date,
      this.tagId,
      this.createdBy,
      this.communityId,
      this.whatsappLink,
      this.images,
      this.finishDate,
      this.locationId,
      this.isPrivate,
      this.receiveUpdates,
      this.state,
      this.isCheckedIn,
      this.isFeatured,
      this.viewersCount,
      this.users,
      this.community,
      this.tag,
      this.isWaiting,
      this.isJoined,
      this.joinedUsersCount,
      this.checkedInCount,
      this.paidAmount,
      this.ownerEarnings});

  Events.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.title = json["title"];
    this.description = json["description"];
    this.spots = json["spots"];
    this.price = json["price"];
    this.lat = json["lat"];
    this.lon = json["lon"];
    this.placeName = json["placeName"];
    this.featuredImage = json["featuredImage"];
    this.deeplink = json["deeplink"];
    this.date = json["date"];
    this.tagId = json["tagId"];
    this.createdBy = json["createdBy"];
    this.communityId = json["communityId"];
    this.whatsappLink = json["whatsapp_link"];
    this.images = json["images"] == null
        ? null
        : (json["images"] as List).map((e) => Images.fromJson(e)).toList();
    this.finishDate = json["finish_date"];
    this.locationId = json["location_id"];
    this.isPrivate = json["is_private"];
    this.receiveUpdates = json["receiveUpdates"];
    this.state = json["state"];
    this.isCheckedIn = json["isCheckedIn"];
    this.isFeatured = json["isFeatured"];
    this.viewersCount = json["viewersCount"];
    this.users = json["users"] == null
        ? null
        : (json["users"] as List).map((e) => Users.fromJson(e)).toList();
    this.community = json["community"] == null
        ? null
        : Community.fromJson(json["community"]);
    this.tag = json["tag"] == null ? null : Tag.fromJson(json["tag"]);
    this.isWaiting = json["isWaiting"];
    this.isJoined = json["isJoined"];
    this.joinedUsersCount = json["joinedUsersCount"];
    this.checkedInCount = json["checkedInCount"];
    this.paidAmount = json["paidAmount"];
    this.ownerEarnings = json["ownerEarnings"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = this.id;
    data["title"] = this.title;
    data["description"] = this.description;
    data["spots"] = this.spots;
    data["price"] = this.price;
    data["lat"] = this.lat;
    data["lon"] = this.lon;
    data["placeName"] = this.placeName;
    data["featuredImage"] = this.featuredImage;
    data["deeplink"] = this.deeplink;
    data["date"] = this.date;
    data["tagId"] = this.tagId;
    data["createdBy"] = this.createdBy;
    data["communityId"] = this.communityId;
    data["whatsapp_link"] = this.whatsappLink;
    if (this.images != null) {
      data["images"] = this.images?.map((e) => e.toJson()).toList();
    }
    data["finish_date"] = this.finishDate;
    data["location_id"] = this.locationId;
    data["is_private"] = this.isPrivate;
    data["receiveUpdates"] = this.receiveUpdates;
    data["state"] = this.state;
    data["isCheckedIn"] = this.isCheckedIn;
    data["isFeatured"] = this.isFeatured;
    data["viewersCount"] = this.viewersCount;
    if (this.users != null) {
      data["users"] = this.users?.map((e) => e.toJson()).toList();
    }
    if (this.community != null) {
      data["community"] = this.community?.toJson();
    }
    if (this.tag != null) {
      data["tag"] = this.tag?.toJson();
    }
    data["isWaiting"] = this.isWaiting;
    data["isJoined"] = this.isJoined;
    data["joinedUsersCount"] = this.joinedUsersCount;
    data["checkedInCount"] = this.checkedInCount;
    data["paidAmount"] = this.paidAmount;
    data["ownerEarnings"] = this.ownerEarnings;
    return data;
  }
}

class Tag {
  int? id;
  String? title;
  String? icon;

  Tag({this.id, this.title, this.icon});

  Tag.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.title = json["title"];
    this.icon = json["icon"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = this.id;
    data["title"] = this.title;
    data["icon"] = this.icon;
    return data;
  }
}

class Community {
  int? id;
  String? title;
  String? image;
  String? bio;
  int? points;
  int? ratingCount;
  int? connectionCount;
  int? eventCount;
  String? profilePicture;
  String? deeplink;
  String? linkExpiry;
  String? state;

  Community(
      {this.id,
      this.title,
      this.image,
      this.bio,
      this.points,
      this.ratingCount,
      this.connectionCount,
      this.eventCount,
      this.profilePicture,
      this.deeplink,
      this.linkExpiry,
      this.state});

  Community.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.title = json["title"];
    this.image = json["image"];
    this.bio = json["bio"];
    this.points = json["points"];
    this.ratingCount = json["rating_count"];
    this.connectionCount = json["connection_count"];
    this.eventCount = json["event_count"];
    this.profilePicture = json["profile_picture"];
    this.deeplink = json["deeplink"];
    this.linkExpiry = json["link_expiry"];
    this.state = json["state"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = this.id;
    data["title"] = this.title;
    data["image"] = this.image;
    data["bio"] = this.bio;
    data["points"] = this.points;
    data["rating_count"] = this.ratingCount;
    data["connection_count"] = this.connectionCount;
    data["event_count"] = this.eventCount;
    data["profile_picture"] = this.profilePicture;
    data["deeplink"] = this.deeplink;
    data["link_expiry"] = this.linkExpiry;
    data["state"] = this.state;
    return data;
  }
}

class Users {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? bio;
  String? profilePicture;
  int? points;
  String? mobile;
  String? countryCode;
  bool? isVerified;
  bool? isTrusted;

  Users(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.bio,
      this.profilePicture,
      this.points,
      this.mobile,
      this.countryCode,
      this.isVerified,
      this.isTrusted});

  Users.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.firstName = json["first_name"];
    this.lastName = json["last_name"];
    this.email = json["email"];
    this.bio = json["bio"];
    this.profilePicture = json["profile_picture"];
    this.points = json["points"];
    this.mobile = json["mobile"];
    this.countryCode = json["country_code"];
    this.isVerified = json["is_verified"];
    this.isTrusted = json["isTrusted"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = this.id;
    data["first_name"] = this.firstName;
    data["last_name"] = this.lastName;
    data["email"] = this.email;
    data["bio"] = this.bio;
    data["profile_picture"] = this.profilePicture;
    data["points"] = this.points;
    data["mobile"] = this.mobile;
    data["country_code"] = this.countryCode;
    data["is_verified"] = this.isVerified;
    data["isTrusted"] = this.isTrusted;
    return data;
  }
}

class Images {
  String? url;

  Images({this.url});

  Images.fromJson(Map<String, dynamic> json) {
    this.url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["url"] = this.url;
    return data;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
    };
  }

  factory Images.fromMap(Map<String, dynamic> map) {
    return Images(
      url: map['url'] != null ? map['url'] as String : null,
    );
  }
}

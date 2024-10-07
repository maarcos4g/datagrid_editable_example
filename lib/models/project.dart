class Project {
  String? projectId;
  String? name;
  String? shortDescription;
  String? startDate;
  String? status;
  String? updatedAt;
  String? logoImageUrl;
  String? endDate;
  String? hashtag;
  String? type;
  Address? address;
  String? targetBudget;
  Organization? organization;
  Wallet? wallet;

  Project(
      {this.projectId,
      this.name,
      this.shortDescription,
      this.startDate,
      this.status,
      this.updatedAt,
      this.logoImageUrl,
      this.endDate,
      this.hashtag,
      this.type,
      this.address,
      this.targetBudget,
      this.organization,
      this.wallet});

  Project.fromJson(Map<String, dynamic> json) {
    projectId = json['projectId'];
    name = json['name'];
    shortDescription = json['shortDescription'];
    startDate = json['startDate'];
    status = json['status'];
    updatedAt = json['updatedAt'];
    logoImageUrl = json['logoImageUrl'];
    endDate = json['endDate'];
    hashtag = json['hashtag'];
    type = json['type'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    targetBudget = json['targetBudget'];
    organization = json['Organization'] != null
        ? new Organization.fromJson(json['Organization'])
        : null;
    wallet =
        json['Wallet'] != null ? new Wallet.fromJson(json['Wallet']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectId'] = this.projectId;
    data['name'] = this.name;
    data['shortDescription'] = this.shortDescription;
    data['startDate'] = this.startDate;
    data['status'] = this.status;
    data['updatedAt'] = this.updatedAt;
    data['logoImageUrl'] = this.logoImageUrl;
    data['endDate'] = this.endDate;
    data['hashtag'] = this.hashtag;
    data['type'] = this.type;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['targetBudget'] = this.targetBudget;
    if (this.organization != null) {
      data['Organization'] = this.organization!.toJson();
    }
    if (this.wallet != null) {
      data['Wallet'] = this.wallet!.toJson();
    }
    return data;
  }
}

class Organization {
  String? tradeName;
  String? organizationId;
  String? type;
  String? logoImageUrl;
  Address? address;

  Organization(
      {this.tradeName,
      this.organizationId,
      this.type,
      this.logoImageUrl,
      this.address});

  Organization.fromJson(Map<String, dynamic> json) {
    tradeName = json['tradeName'];
    organizationId = json['organizationId'];
    type = json['type'];
    logoImageUrl = json['logoImageUrl'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tradeName'] = this.tradeName;
    data['organizationId'] = this.organizationId;
    data['type'] = this.type;
    data['logoImageUrl'] = this.logoImageUrl;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

class Address {
  String? city;
  String? state;
  String? number;
  String? street;
  String? country;
  String? complement;
  String? postalCode;
  String? neighborhood;

  Address(
      {this.city,
      this.state,
      this.number,
      this.street,
      this.country,
      this.complement,
      this.postalCode,
      this.neighborhood});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    state = json['state'];
    number = json['number'];
    street = json['street'];
    country = json['country'];
    complement = json['complement'];
    postalCode = json['postalCode'];
    neighborhood = json['neighborhood'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['state'] = this.state;
    data['number'] = this.number;
    data['street'] = this.street;
    data['country'] = this.country;
    data['complement'] = this.complement;
    data['postalCode'] = this.postalCode;
    data['neighborhood'] = this.neighborhood;
    return data;
  }
}

class Wallet {
  String? walletId;
  String? status;

  Wallet({this.walletId, this.status});

  Wallet.fromJson(Map<String, dynamic> json) {
    walletId = json['walletId'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['walletId'] = this.walletId;
    data['status'] = this.status;
    return data;
  }
}

class SourcesResponce {
  String? _status;
  List<Sources>? _sources;

  SourcesResponce({String? status, List<Sources>? sources}) {
    if (status != null) {
      this._status = status;
    }
    if (sources != null) {
      this._sources = sources;
    }
  }

  String? get status => _status;

  set status(String? status) => _status = status;

  List<Sources>? get sources => _sources;

  set sources(List<Sources>? sources) => _sources = sources;

  SourcesResponce.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    if (json['sources'] != null) {
      _sources = <Sources>[];
      json['sources'].forEach((v) {
        _sources!.add(new Sources.fromJson(v));
      });
    }
  }
}

class Sources {
  String? _id;
  String? _name;
  String? _description;
  String? _url;
  String? _category;
  String? _language;
  String? _country;

  Sources(
      {String? id,
      String? name,
      String? description,
      String? url,
      String? category,
      String? language,
      String? country}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (description != null) {
      this._description = description;
    }
    if (url != null) {
      this._url = url;
    }
    if (category != null) {
      this._category = category;
    }
    if (language != null) {
      this._language = language;
    }
    if (country != null) {
      this._country = country;
    }
  }

  String? get id => _id;

  set id(String? id) => _id = id;

  String? get name => _name;

  set name(String? name) => _name = name;

  String? get description => _description;

  set description(String? description) => _description = description;

  String? get url => _url;

  set url(String? url) => _url = url;

  String? get category => _category;

  set category(String? category) => _category = category;

  String? get language => _language;

  set language(String? language) => _language = language;

  String? get country => _country;

  set country(String? country) => _country = country;

  Sources.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _url = json['url'];
    _category = json['category'];
    _language = json['language'];
    _country = json['country'];
  }
}

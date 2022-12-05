///Model related to Category List

class CategoriesModel {
  List<TaxonomyData>? taxonomyData;

  CategoriesModel({this.taxonomyData});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['taxonomy_data'] != null) {
      taxonomyData = <TaxonomyData>[];
      json['taxonomy_data'].forEach((v) {
        taxonomyData!.add(TaxonomyData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (taxonomyData != null) {
      data['taxonomy_data'] = taxonomyData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TaxonomyData {
  int? id;
  int? taxonomyId;
  dynamic parentId;
  int? iLft;
  int? iRgt;
  dynamic priority;
  String? name;
  String? slug;
  String? metaTitle;
  dynamic metaKeywords;
  String? metaDescription;
  String? createdAt;
  String? updatedAt;
  Taxonomy? taxonomy;
  List<dynamic>? children;

  TaxonomyData(
      {this.id,
      this.taxonomyId,
      this.parentId,
      this.iLft,
      this.iRgt,
      this.priority,
      this.name,
      this.slug,
      this.metaTitle,
      this.metaKeywords,
      this.metaDescription,
      this.createdAt,
      this.updatedAt,
      this.taxonomy,
      this.children});

  TaxonomyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taxonomyId = json['taxonomy_id'];
    parentId = json['parent_id'];
    iLft = json['_lft'];
    iRgt = json['_rgt'];
    priority = json['priority'];
    name = json['name'];
    slug = json['slug'];
    metaTitle = json['meta_title'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    taxonomy =
        json['taxonomy'] != null ? Taxonomy.fromJson(json['taxonomy']) : null;
    if (json['children'] != null) {
      children = <dynamic>[];
      json['children'].forEach((v) {
        // children!.add(new dynamic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['taxonomy_id'] = taxonomyId;
    data['parent_id'] = parentId;
    data['_lft'] = iLft;
    data['_rgt'] = iRgt;
    data['priority'] = priority;
    data['name'] = name;
    data['slug'] = slug;
    data['meta_title'] = metaTitle;
    data['meta_keywords'] = metaKeywords;
    data['meta_description'] = metaDescription;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (taxonomy != null) {
      data['taxonomy'] = taxonomy!.toJson();
    }
    if (children != null) {
      // data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Taxonomy {
  int? id;
  String? name;
  String? slug;
  String? createdAt;
  String? updatedAt;

  Taxonomy({this.id, this.name, this.slug, this.createdAt, this.updatedAt});

  Taxonomy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

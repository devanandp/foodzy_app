///Model related to individual items in each Category

class CategoryDetailsModel {
  List<Data>? data;
  Links? links;
  Meta? meta;

  CategoryDetailsModel({this.data, this.links, this.meta});

  CategoryDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? slug;
  dynamic sku;
  String? description;
  List<dynamic>? customFields;
  dynamic expiry;
  ProductClass? productClass;
  String? productType;
  dynamic metaTitle;
  dynamic metaKeywords;
  dynamic metaDescription;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  bool? featured;
  Brand? brand;
  List<Media>? media;
  Taxonomies? taxonomies;
  List<Variants>? variants;
  List<dynamic>? groupables;
  List<MetaFields>? metaFields;
  List<dynamic>? metaMedia;

  Data(
      {this.id,
      this.title,
      this.slug,
      this.sku,
      this.description,
      this.customFields,
      this.expiry,
      this.productClass,
      this.productType,
      this.metaTitle,
      this.metaKeywords,
      this.metaDescription,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.featured,
      this.brand,
      this.media,
      this.taxonomies,
      this.variants,
      this.groupables,
      this.metaFields,
      this.metaMedia});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    sku = json['sku'];
    description = json['description'];
    if (json['custom_fields'] != null) {
      customFields = <dynamic>[];
      // json['custom_fields'].forEach((v) {
      //   customFields!.add(new dynamic.fromJson(v));
      // });
    }
    expiry = json['expiry'];
    productClass = json['product_class'] != null
        ? ProductClass.fromJson(json['product_class'])
        : null;
    productType = json['product_type'];
    metaTitle = json['meta_title'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    featured = json['featured'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
    taxonomies = json['taxonomies'] != null
        ? Taxonomies.fromJson(json['taxonomies'])
        : null;
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(Variants.fromJson(v));
      });
    }
    if (json['groupables'] != null) {
      groupables = <dynamic>[];
      json['groupables'].forEach((v) {
        // groupables!.add(new dynamic.fromJson(v));
      });
    }
    if (json['meta_fields'] != null) {
      metaFields = <MetaFields>[];
      json['meta_fields'].forEach((v) {
        metaFields!.add(MetaFields.fromJson(v));
      });
    }
    if (json['meta_media'] != null) {
      metaMedia = <dynamic>[];
      // json['meta_media'].forEach((v) {
      //   metaMedia!.add(new dynamic.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['sku'] = sku;
    data['description'] = description;
    // if (this.customFields != null) {
    //   data['custom_fields'] =
    //       this.customFields!.map((v) => v.toJson()).toList();
    // }
    data['expiry'] = expiry;
    if (productClass != null) {
      data['product_class'] = productClass!.toJson();
    }
    data['product_type'] = productType;
    data['meta_title'] = metaTitle;
    data['meta_keywords'] = metaKeywords;
    data['meta_description'] = metaDescription;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['featured'] = featured;
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    if (taxonomies != null) {
      data['taxonomies'] = taxonomies!.toJson();
    }
    if (variants != null) {
      data['variants'] = variants!.map((v) => v.toJson()).toList();
    }
    if (groupables != null) {
      // data['groupables'] = this.groupables!.map((v) => v.toJson()).toList();
    }
    if (metaFields != null) {
      data['meta_fields'] = metaFields!.map((v) => v.toJson()).toList();
    }
    if (metaMedia != null) {
      // data['meta_media'] = this.metaMedia!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductClass {
  int? id;
  String? slug;
  String? name;

  ProductClass({this.id, this.slug, this.name});

  ProductClass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['name'] = name;
    return data;
  }
}

class Brand {
  int? id;
  String? name;
  String? slug;
  String? website;

  Brand({this.id, this.name, this.slug, this.website});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['website'] = website;
    return data;
  }
}

class Conversions {
  String? thumb;
  String? mediumSquare;
  String? medium;
  String? large;

  Conversions({this.thumb, this.mediumSquare, this.medium, this.large});

  Conversions.fromJson(Map<String, dynamic> json) {
    thumb = json['thumb'];
    mediumSquare = json['medium-square'];
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['thumb'] = thumb;
    data['medium-square'] = mediumSquare;
    data['medium'] = medium;
    data['large'] = large;
    return data;
  }
}

class Taxonomies {
  List<FoodType>? foodType;

  Taxonomies({this.foodType});

  Taxonomies.fromJson(Map<String, dynamic> json) {
    if (json['food-type'] != null) {
      foodType = <FoodType>[];
      json['food-type'].forEach((v) {
        foodType!.add(FoodType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (foodType != null) {
      data['food-type'] = foodType!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FoodType {
  String? slug;
  String? name;
  dynamic children;

  FoodType({this.slug, this.name, this.children});

  FoodType.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
    children = json['children'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slug'] = slug;
    data['name'] = name;
    data['children'] = children;
    return data;
  }
}

class Variants {
  int? id;
  dynamic sku;
  String? createdAt;
  String? updatedAt;
  dynamic barcode;
  String? type;
  dynamic grams;
  String? title;
  String? pricingType;
  Price? price;
  dynamic priceUnitExcVat;
  dynamic inventoryPolicy;
  List<dynamic>? inventoryItems;
  int? vatId;
  Product? product;
  List<dynamic>? subscriptionPlans;
  List<dynamic>? variantTypeOptions;
  List<Media>? media;

  Variants(
      {this.id,
      this.sku,
      this.createdAt,
      this.updatedAt,
      this.barcode,
      this.type,
      this.grams,
      this.title,
      this.pricingType,
      this.price,
      this.priceUnitExcVat,
      this.inventoryPolicy,
      this.inventoryItems,
      this.vatId,
      this.product,
      this.subscriptionPlans,
      this.variantTypeOptions,
      this.media});

  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    barcode = json['barcode'];
    type = json['type'];
    grams = json['grams'];
    title = json['title'];
    pricingType = json['pricing_type'];
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    priceUnitExcVat = json['price_unit_exc_vat'];
    inventoryPolicy = json['inventory_policy'];
    if (json['inventory_items'] != null) {
      inventoryItems = <dynamic>[];
      json['inventory_items'].forEach((v) {
        // inventoryItems!.add(new dynamic.fromJson(v));
      });
    }
    vatId = json['vat_id'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    if (json['subscription_plans'] != null) {
      subscriptionPlans = <dynamic>[];
      json['subscription_plans'].forEach((v) {
        // subscriptionPlans!.add(new dynamic.fromJson(v));
      });
    }
    if (json['variant_type_options'] != null) {
      variantTypeOptions = <dynamic>[];
      json['variant_type_options'].forEach((v) {
        // variantTypeOptions!.add(new dynamic.fromJson(v));
      });
    }
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sku'] = sku;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['barcode'] = barcode;
    data['type'] = type;
    data['grams'] = grams;
    data['title'] = title;
    data['pricing_type'] = pricingType;
    if (price != null) {
      data['price'] = price!.toJson();
    }
    data['price_unit_exc_vat'] = priceUnitExcVat;
    data['inventory_policy'] = inventoryPolicy;
    if (inventoryItems != null) {
      // data['inventory_items'] =
      // this.inventoryItems!.map((v) => v.toJson()).toList();
    }
    data['vat_id'] = vatId;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    if (subscriptionPlans != null) {
      // data['subscription_plans'] =
      //     this.subscriptionPlans!.map((v) => v.toJson()).toList();
    }
    if (variantTypeOptions != null) {
      // data['variant_type_options'] =
      //     this.variantTypeOptions!.map((v) => v.toJson()).toList();
    }
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Price {
  String? currency;
  int? amount;
  String? formatted;

  Price({this.currency, this.amount, this.formatted});

  Price.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    amount = json['amount'];
    formatted = json['formatted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currency'] = currency;
    data['amount'] = amount;
    data['formatted'] = formatted;
    return data;
  }
}

class Product {
  int? id;
  String? title;
  String? slug;
  dynamic sku;
  String? description;
  List<dynamic>? customFields;
  dynamic expiry;
  String? productType;
  dynamic metaTitle;
  dynamic metaKeywords;
  dynamic metaDescription;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  bool? featured;
  List<Media>? media;
  Taxonomies? taxonomies;
  List<MetaFields>? metaFields;
  List<dynamic>? metaMedia;

  Product(
      {this.id,
      this.title,
      this.slug,
      this.sku,
      this.description,
      this.customFields,
      this.expiry,
      this.productType,
      this.metaTitle,
      this.metaKeywords,
      this.metaDescription,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.featured,
      this.media,
      this.taxonomies,
      this.metaFields,
      this.metaMedia});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    sku = json['sku'];
    description = json['description'];
    if (json['custom_fields'] != null) {
      customFields = <dynamic>[];
      json['custom_fields'].forEach((v) {
        // customFields!.add(new dynamic.fromJson(v));
      });
    }
    expiry = json['expiry'];
    productType = json['product_type'];
    metaTitle = json['meta_title'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    featured = json['featured'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
    taxonomies = json['taxonomies'] != null
        ? Taxonomies.fromJson(json['taxonomies'])
        : null;
    if (json['meta_fields'] != null) {
      metaFields = <MetaFields>[];
      json['meta_fields'].forEach((v) {
        metaFields!.add(MetaFields.fromJson(v));
      });
    }
    if (json['meta_media'] != null) {
      metaMedia = <dynamic>[];
      json['meta_media'].forEach((v) {
        // metaMedia!.add(new dynamic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['sku'] = sku;
    data['description'] = description;
    if (customFields != null) {
      data['custom_fields'] = customFields!.map((v) => v.toJson()).toList();
    }
    data['expiry'] = expiry;
    data['product_type'] = productType;
    data['meta_title'] = metaTitle;
    data['meta_keywords'] = metaKeywords;
    data['meta_description'] = metaDescription;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['featured'] = featured;
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    if (taxonomies != null) {
      data['taxonomies'] = taxonomies!.toJson();
    }
    if (metaFields != null) {
      data['meta_fields'] = metaFields!.map((v) => v.toJson()).toList();
    }
    if (metaMedia != null) {
      data['meta_media'] = metaMedia!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MetaFields {
  String? key;
  dynamic value;

  MetaFields({this.key, this.value});

  MetaFields.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}

class Media {
  String? uuid;
  String? name;
  String? fileName;
  String? url;
  int? order;
  List<dynamic>? customProperties;
  String? type;
  String? extension;
  int? size;
  String? mimeType;
  ResponsiveImages? responsiveImages;
  Conversions? conversions;

  Media(
      {this.uuid,
      this.name,
      this.fileName,
      this.url,
      this.order,
      this.customProperties,
      this.type,
      this.extension,
      this.size,
      this.mimeType,
      this.responsiveImages,
      this.conversions});

  Media.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    fileName = json['file_name'];
    url = json['url'];
    order = json['order'];
    if (json['custom_properties'] != null) {
      customProperties = <dynamic>[];
      json['custom_properties'].forEach((v) {
        // customProperties!.add(new dynamic.fromJson(v));
      });
    }
    type = json['type'];
    extension = json['extension'];
    size = json['size'];
    mimeType = json['mime_type'];
    responsiveImages = json['responsive_images'] != null
        ? ResponsiveImages.fromJson(json['responsive_images'])
        : null;
    conversions = json['conversions'] != null
        ? Conversions.fromJson(json['conversions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['name'] = name;
    data['file_name'] = fileName;
    data['url'] = url;
    data['order'] = order;
    if (customProperties != null) {
      // data['custom_properties'] =
      //     this.customProperties!.map((v) => v.toJson()).toList();
    }
    data['type'] = type;
    data['extension'] = extension;
    data['size'] = size;
    data['mime_type'] = mimeType;
    // if (this.responsiveImages != null) {
    //   data['responsive_images'] = this.responsiveImages!.toJson();
    // }
    if (conversions != null) {
      data['conversions'] = conversions!.toJson();
    }
    return data;
  }
}

class ResponsiveImages {
  String? srcSet;
  String? src;
  int? width;
  int? height;

  ResponsiveImages({this.srcSet, this.src, this.width, this.height});

  ResponsiveImages.fromJson(Map<String, dynamic> json) {
    srcSet = json['src_set'];
    src = json['src'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['src_set'] = srcSet;
    data['src'] = src;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['first'] = this.first;
    // data['last'] = this.last;
    // data['prev'] = this.prev;
    // data['next'] = this.next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.links,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

// class Links {
//   String? url;
//   String? label;
//   bool? active;
//
//   Links({this.url, this.label, this.active});
//
//   Links.fromJson(Map<String, dynamic> json) {
//     url = json['url'];
//     label = json['label'];
//     active = json['active'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['url'] = this.url;
//     data['label'] = this.label;
//     data['active'] = this.active;
//     return data;
//   }
// }

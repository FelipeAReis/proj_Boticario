class PostsClass {
  List<Posts> posts;

  PostsClass({this.posts});

  PostsClass.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = new List<Posts>();
      json['posts'].forEach((v) {
        posts.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['posts'] = this.posts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  User user;
  Message message;

  Posts({this.user, this.message});

  Posts.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    message =
        json['message'] != null ? new Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.message != null) {
      data['message'] = this.message.toJson();
    }
    return data;
  }
}

class User {
  String name;
  String profilePicture;

  User({this.name, this.profilePicture});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profilePicture = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['profile_picture'] = this.profilePicture;
    return data;
  }
}

class Message {
  String content;
  String createdAt;

  Message({this.content, this.createdAt});

  Message.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    return data;
  }
}

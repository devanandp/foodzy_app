///Enums for API Response statuses

class ApiResponse<T> {
  ApiResponse.initial(this.message) : status = Status.initial;

  ApiResponse.loading(this.message) : status = Status.loading;

  ApiResponse.completed(this.data) : status = Status.completed;

  ApiResponse.error(this.message) : status = Status.error;

  Status status;
  T? data;
  String? message;

  @override
  String toString() => 'Status : $status \n Message : $message \n Data : $data';
}

enum Status { initial, loading, completed, error }

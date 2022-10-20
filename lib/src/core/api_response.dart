class ApiResponse<T> {
  Status status;
  T? data;
  String? message;

  ApiResponse.initial(this.message) : status = Status.INITIAL;

  ApiResponse.loading(this.message) : status = Status.LOADING;

  ApiResponse.error(this.message) : status = Status.ERROR;

  ApiResponse.success(this.data) : status = Status.SUCCESS;
}

enum Status {
  // ignore: constant_identifier_names
  INITIAL,
  LOADING,
  ERROR,
  SUCCESS
}

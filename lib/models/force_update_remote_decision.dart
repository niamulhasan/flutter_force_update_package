class ForceUpdateRemoteDecision {
  bool? success;
  String? message;
  String? priority;
  bool? isMajor;

  ForceUpdateRemoteDecision({
    this.success,
    this.message,
    this.priority,
    this.isMajor,
  });

  ForceUpdateRemoteDecision.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    priority = json['priority'];
    isMajor = json['is_major'];
  }

  @override
  String toString() {
    return 'ForceUpdateRemoteDecision{success: $success, message: $message, priority: $priority, isMajor: $isMajor}';
  }
}

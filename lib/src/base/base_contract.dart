
/// functions for handling global exceptions in base class
/// exceptions like: no internet, socket timeout, etc.
abstract class BaseContract {
  void onError(Object obj);
  void onShowProgress();
  void onHideProgress();
}

import 'package:git_hooks/git_hooks.dart';

void main() async {
  GitHooks.init(targetPath: 'bin/hook.dart');
  // print(await GitHooks.getTargetFilePath());
  // GitHooks.unInstall();
}

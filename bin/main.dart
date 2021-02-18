import 'package:git_hooks/git_hooks.dart';

void main() async{
  GitHooks.init(targetPath: "bin/git_hooks.dart");
  // print(await GitHooks.getTargetFilePath());
  // GitHooks.unInstall();
}

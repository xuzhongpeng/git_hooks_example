import 'package:git_hooks/git_hooks.dart';
import 'dart:io';

void main(List arguments) {
  var params = {Git.commitMsg: commitMsg, Git.preCommit: preCommit};
  GitHooks.call(arguments as List<String>, params);
}

Future<bool> commitMsg() async {
  var commitMsg = Utils.getCommitEditMsg();
  if (commitMsg.startsWith('fix:') || commitMsg.startsWith('feat:')) {
    return true; // you can return true let commit go
  } else {
    return false;
  }
}

Future<bool> preCommit() async {
  try {
    var result = await Process.run('dart', ['analyze']);
    print(result.stdout);
    print(result.stderr);
    if (result.exitCode != 0) return false;
    return true;
  } catch (e) {
    return false;
  }
}

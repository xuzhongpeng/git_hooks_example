import 'package:git_hooks/git_hooks.dart';
import 'dart:io';

void main(List arguments) {
  var params = {Git.commitMsg: commitMsg, Git.preCommit: preCommit};
  GitHooks.call(arguments, params);
}

Future<bool> commitMsg() async {
  var commitMsg = Utils.getCommitEditMsg();
  if (commitMsg.startsWith('fix:')) {
    return true; // you can return true let commit go
  } else {
    return false;
  }
}

Future<bool> preCommit() async {
  try {
    var result = await Process.run('dartanalyzer', ['bin']);
    print(result.stdout);
    print(result.stderr);
    if (result.exitCode != 0) return false;
    return true;
  } catch (e) {
    return false;
  }
}

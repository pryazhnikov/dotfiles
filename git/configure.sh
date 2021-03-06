#!/bin/sh

GIT_SET="git config --global"

$GIT_SET user.name "Victor Pryazhnikov"
$GIT_SET user.email "victor@pryazhnikov.com"

$GIT_SET core.editor vi
$GIT_SET apply.whitespaces nowarn
$GIT_SET color.ui true
$GIT_SET grep.lineNumber false

$GIT_SET alias.amend "commit --amend"
$GIT_SET alias.co checkout
$GIT_SET alias.ci commit
$GIT_SET alias.df "diff HEAD"
$GIT_SET alias.st status
$GIT_SET alias.br branch
$GIT_SET alias.lb latest-build
$GIT_SET alias.head "checkout HEAD"
$GIT_SET alias.unstash "stash pop"
$GIT_SET alias.pub "push origin HEAD"
$GIT_SET alias.patch "diff --patch HEAD"
$GIT_SET alias.recent "for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short) %(committer)' --count 10"
$GIT_SET alias.uncommit "reset --soft HEAD^"
$GIT_SET alias.v "version"


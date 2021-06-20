function forceBranchMerge
	git checkout $argv[1];
git pull;
git checkout $argv[2];
git rebase $argv[1];
git push --force;
end

function sync-repo --argument repo
    set branch (git -C "$repo" current) || return 1

    git -C "$repo" status -sb
    git -C "$repo" pull origin $branch

    set commits_behind (git -C "$repo" rev-list --count origin/$repo_branch..HEAD)

    and if test $commits_behind -gt 0
        git -C "$repo" push
    end
end

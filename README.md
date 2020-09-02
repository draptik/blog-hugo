# Usage

- create new post: `hugo new posts/new-post.md`
- preview: `hugo server -D` (includes drafts)
- build: `hugo` (don't forget to set `draft: false`)
- deploy: `./deploy.sh` (automatically commits `public` folder to `master`)

# Howto update hugo theme git submodule

See https://chrisjean.com/git-submodules-adding-using-removing-and-updating/ for details.

TLDR

- git submodules are always commited as detached HEAD
- navigate into submodule folder `cd themes/hyde-hyde`
- switch to master branch: `git checkout master`
- update submodule: `git pull`
- switch back to this folder and commit: `cd ../.. && git add . && git commit -m '...'`

# TODOs

- add rss icon to sidebar
- create docker container for hugo
- improve code blocks
    - auto-expand similar to hugo doc-pages
    - syntax highlighting for fsharp code


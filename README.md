# Usage

- create new post: `hugo new posts/new-post.md`
- preview: `hugo server -D` (includes drafts)
- build: `hugo` (don't forget to set `draft: false`)
- deploy: `./deploy.sh` (automatically commits `public` folder to `master`)
- git commit after deployment. This prevents stupid 'up' commits because 'public' folder changes
  after executing `deploy` script.

# Howto update hugo theme git submodule

See https://chrisjean.com/git-submodules-adding-using-removing-and-updating/ for details.

TLDR

- git submodules are always commited as detached HEAD
- navigate into submodule folder `cd themes/hyde-hyde`
- switch to master branch: `git checkout master`
- update submodule: `git pull`
- switch back to this folder and commit: `cd ../.. && git add . && git commit -m '...'`

# Initial setup on new machine

Clone repository including submodules:

```sh
git clone --recurse-submodules git://github.com/draptik/blog-hugo.git
```

# Docker

Setup requires 

- `docker`
- `docker-compose`
- `tmux` and `tmuxinator`

Main script: `start-blog.sh`

Helper scripts:

- `.tmuxinator.yml` Creates a new tmux session with split panes containing content folder, active hugo server session in docker, and a shell within the hugo docker container.
- `run-docker-compose-server-start.sh` Starts the hugo docker container
- `run-docker-compose-server-stop.sh` Stops the hugo docker container
- `run-attach-to-running-container.sh` Attaches to running hugo docker container
- `run-hugo-shell.sh` Starts a new hugo docker container and runs interactive shell
- `docker-compose.yaml` Config for docker-compose
- `deploy.sh` Deployment script. Should be executed within docker container

# TODOs

- add rss icon to sidebar
- improve code blocks
    - auto-expand similar to hugo doc-pages
    - syntax highlighting for fsharp code


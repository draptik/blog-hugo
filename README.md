# Usage

## TL/DR

- START CONTAINER: `./start-blog.sh` Starts tmux
  - top pane: content folder for editing
  - bottom left pane: this folder (for deployment)
  - bottom center pane: `hugo` server session
  - bottom right pane: shell within `hugo` docker container
- EDIT in top pane
- COMPILE: all `hugo` commands must be executed in bottom right pane (attached live session in docker container)
  - create new post: `hugo new posts/new-post.md`
  - in top pane: `chmod 744 posts/new-post.md` (otherwise the post is not editable on host system)
  - build: `hugo`
- DEPLOY:
  - bottom right pane:
    - run `hugo` command (if not done previously). I normally forget this step when just updating the 'talks' section..
  - bottom left pane:
    - `./deploy.sh` (auto-commit in `public` folder -> this is the folder that gets published)
    - git commit (this folder)

## Updating talks page

- `./start-blog.sh` Starts `tmux`
- on host system, edit `content/talks`
- in docker window (bottom-right in `tmux`): `hugo` to build
- on host system (bottom-left in `tmux`): `./deploy.sh`
- git commit and push when happy.

## Initial setup on new machine

Clone repository including `submodules`:

```sh
git clone --recurse-submodules git://github.com/draptik/blog-hugo.git
cd blog-hugo/public # <-- !!
git pull
```

Pulling the `public` submodule seems to be needed, otherwise the `public` submodule is in detached
head state. The `public` folder must point to `master`. I'm sure there is a better solution for this,
but since we only have to do this once, it's ok.

### Docker

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

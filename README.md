# warpd-docker

Dockerised version of the warpd server.


## How did this start?
Basically, [issue #33](https://github.com/spolu/warp/issues/33) on the upstream repository. The hosted server for the warp
software was taken down and users now need to host their own.


## How do I use this?
1. Install Docker. See the [documentation](https://docs.docker.com/install) for more information.
2. Run `docker pull registry.gitlab.com/luketainton/warpd-docker:latest` to pull the latest image.
3. Run `docker run -d -p 4242:4242 registry.gitlab.com/luketainton/warpd-docker:latest` to run a container.


## How do I connect my client?
Referring to [issue #33](https://github.com/spolu/warp/issues/33), you need to run
`WARPD_NO_TLS=true WARPD_ADDRESS=<IP_ADDRESS_OF_SERVER>:4242 warp <CMD>`, where `<IP_ADDRESS_OF_SERVER>` is the
IPv4 address of the server you're running the container on. By default, the container will use port `4242`. `<CMD>` will be replaced by the sub-command you wish to execute.

If you don't want to type `WARPD_NO_TLS=true WARPD_ADDRESS=<IP_ADDRESS_OF_SERVER>:4242` every time, you can export them as environment variables in your shell start script (`.zshrc`, `.bashrc` etc.):
- `export WARPD_NO_TLS=true`
- `export WARPD_ADDRESS=<IP_ADDRESS_OF_SERVER>:4242`

You can then run `warp` as normal and it will use the values set in that file instead.

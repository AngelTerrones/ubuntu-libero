# Docker container for Microsemi's Libero tool.

*Note*: this was tested using archlinux, sharing X11.

## Requirements
- Install Libero in `/opt` (host). Use the default option for folders: `/opt/microsemi/xyz`
- Copy the license manager folder to `/opt/microsemi/Linux_Licensing_Daemon`
- Copy the `License.dat` to `/opt/microsemi/License.dat`
- Build image with `docker build -t ubuntu-libero .`

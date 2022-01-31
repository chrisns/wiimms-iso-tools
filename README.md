# Multi-arch docker build of <https://github.com/Wiimm/wiimms-iso-tools>

## Example usage

```bash
docker run -v "$(pwd)":/mount -u ${UID} ghcr.io/chrisns/wiimms-iso-tools wit convert --scan-progress -pBzr /mount
```

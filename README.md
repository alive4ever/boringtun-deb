# Debian package for boringtun

## What is this?

This is another wireguard tunnel implementation, written in Rust by Cloudflare.

# How to use?

Get the debian packages for your architecture in the releases page.

`boringtun-cli` can be used as drop in replacement for `wg`.

Just add the environment variable `WG_QUICK_USERSPACE_IMPLEMENTATION=boringtun-cli` so `wg-quick` will use `boringtun-cli` as wireguard backend.

A sample `boringtun@.service` to be placed inside `/etc/systemd/system`

```ini
[Unit]
Description=BoringTun via wg-quick(8) for %I
After=network-online.target nss-lookup.target
Wants=network-online.target nss-lookup.target

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/bin/wg-quick up %i
ExecStop=/usr/bin/wg-quick down %i
Environment=WG_ENDPOINT_RESOLUTION_RETRIES=infinity
Environment=WG_QUICK_USERSPACE_IMPLEMENTATION=boringtun-cli
Environment=WG_SUDO=1

[Install]
WantedBy=multi-user.target
```

## Why bother?

I just curious how this Rust based wg client performs compared to the kernel space version and reference Go implementation.

## Acknowledgements

Cloudflare for the boringtun and Github for the Actions.


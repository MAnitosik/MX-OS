# Mr? Ms? Wrong! MX is the right choice!

**MX-OS is an opinionated OCI image created for personal use.**

**This image is not recommended for production systems or newbies.**

**All credits go to [BlueBuild](https://blue-build.org/) and [Universal Blue](https://universal-blue.org/) for making this project possible.**

## Key features

- COSMIC desktop

- Aggressive optimizations from CachyOS

- Terra repositories

- Basic coding utilities

- Anti-DPI utilities

- A selection of opinionated preinstalled applications

- The `brave-origin` package is used instead of the `firefox` package

- Network optimizations

- Hardened DNS

- The `hosts` file is optimized for Russia

## Caveats

This image is primarily optimized for AMD CPUs and GPUs, but it should also work on Intel systems.

Nvidia support is planned.

The `hosts` file is optimized for **Russia**.

`mitigations` and `selinux` are disabled by default.

Be careful when overclocking a GPU with LACT.

Layering is disabled by default.

Only x86-64 is supported

## Installation

1. If you already have an OCI image installed, switch to MX-OS with:

```bash
sudo bootc switch ghcr.io/manitosik/mx-os:latest
```

```bash
sudo systemctl reboot
```

```bash
sudo bootc switch --enforce-container-sigpolicy ghcr.io/manitosik/mx-os:latest
```

```bash
sudo systemctl reboot
```

Alternatively, download and install an ISO from GitHub Actions.

2. After installing MX-OS, it is recommended to run:

```bash
sudo /usr/bin/post-install
```

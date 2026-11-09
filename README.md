# gloam (working name)

A custom Arch-based ISO. End goal: the CachyOS kernel, the install ease of
EndeavourOS, and a game mode like Bazzite's.

Right now this is only the base: archiso's stock `releng` profile (the same one
the official Arch ISO uses), with just the name changed.

## Usage

Requires `archiso`, plus `qemu-desktop` and `edk2-ovmf` for testing.

```bash
./build.sh            # builds out/gloam-<date>-x86_64.iso (asks for sudo)
./build.sh --clean    # wipes work/ first; needed after changes
./run-vm.sh           # boots the newest ISO in QEMU (UEFI)
./run-vm.sh --bios    # same, legacy BIOS
```

## Layout

| Path | What |
|---|---|
| `profile/profiledef.sh` | Name, label, boot modes, compression, file permissions |
| `profile/packages.x86_64` | Packages in the live environment |
| `profile/pacman.conf` | Repos the ISO is built from |
| `profile/airootfs/` | Files overlaid onto the live root filesystem |
| `profile/efiboot/`, `grub/`, `syslinux/` | Boot menus (UEFI / BIOS) |
| `work/`, `out/` | Build cache and result (not in git) |

Change the name in `profile/profiledef.sh` (`iso_name`, `iso_label`,
`iso_publisher`, `iso_application`).

## Roadmap

1. **Base** — releng profile builds and boots. ← we are here
2. **CachyOS kernel** — add the `[cachyos]` repo and keyring to
   `profile/pacman.conf`, replace `linux` with `linux-cachyos` in
   `packages.x86_64`, and update the kernel names in the boot menus and the
   mkinitcpio preset.
3. **Live desktop** — desktop, display manager and autologin for a live user.
4. **Installer** — Calamares with its own configuration and branding (the
   EndeavourOS approach), including an online/offline choice.
5. **Game mode** — `gamescope-session` and Steam (needs `[multilib]`), with a
   session that boots straight into Steam Big Picture and can switch back to
   the desktop.
6. **Branding** — boot splash, os-release, wallpapers, own package repo.

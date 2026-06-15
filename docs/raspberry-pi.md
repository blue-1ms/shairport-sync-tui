# Raspberry Pi Notes

Shairport Sync is commonly used on Raspberry Pi devices. These notes cover the
usual setup points for `shairport-tui`.

## Packages

```bash
sudo apt update
sudo apt install shairport-sync python3-dbus pulseaudio-utils alsa-utils
```

`systemctl`, `journalctl`, and `avahi-daemon` are normally available on
Raspberry Pi OS.

## Shairport Sync Build Features

Check the Shairport Sync build:

```bash
shairport-sync -V
```

For the best TUI experience, the output should include:

- `metadata`
- `dbus`
- `mpris`

## Audio Output

If audio plays from the wrong output, check `/etc/shairport-sync.conf`.
For the analog headphone output, a common ALSA setting is:

```conf
alsa =
{
    output_device = "hw:Headphones";
    mixer_control_name = "PCM";
};
```

Then restart Shairport Sync:

```bash
sudo systemctl restart shairport-sync
```

## Diagnostics

Run:

```bash
shairport-tui --doctor
```

This checks D-Bus, Shairport Sync, Avahi, journal access, and ALSA/Pulse state.

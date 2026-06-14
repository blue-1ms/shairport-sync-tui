# shairport-sync-tui

Terminal dashboard and control surface for
[Shairport Sync](https://github.com/mikebrady/shairport-sync).

`shairport-sync-tui` shows the active AirPlay client, playback metadata,
estimated song progress, service health, audio output state, recent logs, and
connection history. It can also send basic playback controls over Shairport
Sync's D-Bus remote-control interface.

## Features

- Live Shairport Sync status from the system D-Bus.
- Now-playing metadata: title, artist, album, genre, volume, and progress.
- Local progress estimation for Shairport Sync builds where `ProgressString`
  does not update continuously.
- Playback controls: play/pause, next, previous, stop, mute, and volume.
- Service health for `shairport-sync.service` and `avahi-daemon.service`.
- Audio output panel for configured backend, ALSA device, mixer, Pulse sink,
  ALSA volume, and detected playback devices.
- Recent `journalctl` log panel.
- Persistent connection history in `~/.cache/shairport-tui/history.json`.
- Compact one-line mode for small terminals.
- `--doctor` diagnostics for dependencies, services, D-Bus, logs, and audio.

## Requirements

- Linux with `systemd`.
- Python 3.
- `python3-dbus`.
- Shairport Sync built with D-Bus and metadata support.
- Useful optional commands for richer panels:
  - `systemctl`
  - `journalctl`
  - `pactl`
  - `amixer`
  - `aplay`

On Debian or Ubuntu-style systems:

```bash
sudo apt install python3-dbus
```

Shairport Sync should report build features similar to:

```bash
shairport-sync -V
```

Look for `metadata`, `dbus`, and ideally `mpris` in the output.

## Install

Clone the repo and install the executable somewhere on your `PATH`:

```bash
git clone https://github.com/blue-1ms/shairport-sync-tui.git
cd shairport-sync-tui
install -Dm755 shairport-tui ~/.local/bin/shairport-tui
```

You can also run it directly from the checkout:

```bash
./shairport-tui
```

## Usage

Start the full dashboard:

```bash
shairport-tui
```

Start in compact mode:

```bash
shairport-tui --compact
```

Change the auto-refresh interval:

```bash
shairport-tui --interval 0.5
```

Run diagnostics:

```bash
shairport-tui --doctor
```

## Controls

| Key | Action |
| --- | --- |
| `Space` | Play or pause |
| `n` | Next track |
| `p` | Previous track |
| `s` | Stop |
| `+` or `=` | Volume up |
| `-` or `_` | Volume down |
| `m` | Toggle mute |
| `r` | Refresh now |
| `c` | Toggle compact/full view |
| `q` or `Esc` | Quit |

## Notes

Shairport Sync can leave the last client IP and last track metadata visible
after playback stops. The TUI labels this as `Last client` when the session is
idle.

Some Shairport Sync builds expose a `ProgressString` value that does not
advance while polling. When playback is `Playing`, this TUI advances progress
locally and marks it as estimated. It resyncs when Shairport Sync reports a new
track or changed progress.

## License

MIT

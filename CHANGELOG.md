# Changelog

All notable changes to Pigeon No Combat Roll are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project uses [Semantic Versioning](https://semver.org/spec/v2.0.0.html):

- **Major** versions can need changes to your configuration or other resources. Read the **Upgrade notes**.
- **Minor** versions add features without breaking existing setups.
- **Patch** versions fix bugs only.

## [Unreleased]

First release.

### Highlights

- No rolling while aiming a gun
- Or one roll every few seconds
- Jumping without aiming works as normal
- An optional message, through ox_lib if you have it

### Added

- The jump control blocked while a player is on foot, holding a gun and aiming, checked every frame while they hold a gun.
- `Config.Mode = 'cooldown'` to allow one roll every `Config.CooldownSeconds` instead.
- An optional message, at most once every `Config.MessageCooldown` seconds, through ox_lib if it's running or GTA's notification feed.
- English text in `locales/`.
- Update checker from the Pigeon Studios version registry.

[Unreleased]: https://github.com/pigeon-studios-uk/pigeon-no-combat-roll/commits/main

# Game Builder Template

A starter template for building side-scrolling (or vertical) shooter games with Godot and Claude Code.

## Quick Start

1. **Install Godot 4.3+** from [godotengine.org](https://godotengine.org)

2. **Clone this repo**
   ```bash
   git clone https://github.com/mattzollinhofer/game-builder-template.git my-awesome-game
   cd my-awesome-game
   ```

3. **Open in Claude Code**
   ```bash
   claude
   ```

4. **Start building!**
   ```
   Let's make a game! I want to build a space shooter where I'm a dragon fighting pizza aliens.
   ```

Claude will read the playbook in `CLAUDE.md` and guide you through creating your game.

## What's Included

```
├── CLAUDE.md           # The playbook - Claude reads this automatically
├── project.godot       # Pre-configured Godot project
├── scripts/
│   └── autoloads/      # Starter game systems (GameState, Audio, Score)
├── scenes/             # Your game scenes go here
├── assets/
│   ├── sprites/        # Your images go here
│   └── audio/          # Your music and sound effects
├── levels/             # Level configuration files (JSON)
└── tests/              # Test scenes
```

## Creating Assets

You'll create custom assets using AI tools:

| What | Tool |
|------|------|
| Sprites | ChatGPT/DALL-E, Midjourney |
| Music | Suno, Udio |
| Sound Effects | sfxr.me, Bfxr |

The playbook has prompts and examples for each.

## Requirements

- Godot 4.3 or newer
- Claude Code CLI

## License

MIT - Make whatever you want!

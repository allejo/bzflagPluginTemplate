# BZFlag Plugin Template

A self destructing BZFlag plug-in folder structure that's ready for distribution for git.

All of my plug-ins follow the same file structure for easy distribution and that structure is based on this repository. When used in union with my [BZFlag Plugin Starter](https://bzflag-plugin-starter.allejo.org/), you're pretty much set.

What do you mean self-destructing? Well... Once you clone this repository and then execute the `genplug.sh` script, it will create and rename the necessary files and then it'll remove it's own git history, create a new git history for the plugin and finally removes the script itself. Self-destruction!

## How to Use

```
./genplug.sh <plugin name>
git remote add origin <your repo>
git push --force -u origin master
```

## License

MIT

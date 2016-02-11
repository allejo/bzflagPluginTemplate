# BZFlag Plugin Template

A self destructing BZFlag plug-in folder structure that's ready for distribution for git.

I have started following the same pattern for all of my plug-ins and have created my own [submodule](https://github.com/allejo/bztoolkit) with common functionality and functions that don't exist in the API. When used in union with my [BZFlag Plugin Starter](http://allejo.me/tools/bzflag-plugin-starter/), you're pretty much set.

What do you mean self-destructing? Well... Once you clone this repository and then execute the `genplug.sh` script, it will create and rename the necessary files and then it'll remove it's own git history, create a new git history for the plugin and finally removes the script itself. Self-destruction!

## How to Use

```
./genplug.sh <plugin name> <enable bztoolkit (true|false)>
```

## License

MIT
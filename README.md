# Blaupause 
Is the missing template generator for creating VIPER, MVC, MVVM, etc. templates for your Projects.

## Installation

### Using pre build package
You find the latest build in `bin/Blaupause`. Please consider that you are downlaoding this from the master branch to get the newest stable binary file from Blaupause.

### Compiling from source
Blaupause is build via spm (swift package manager) if you checkout the sources just run
```shell
swift build -c release
```
And you can find it in `.build/release/Blaupause` to run it from there.

## Using
The usage is pretty simple just start
### Usage to create a new VIPER Module
```shell
Blaupause viper FooBar
```

### Usage to create a new MVC Module
```shell
Blaupause mvc FooBar
```

### Usage to create a new MVVM Module
```shell
Blaupause mvvm FooBar
```

### Usage to create a new structure from your template
```shell
Blaupause template FooBar
```
Searchs for a .blaupause.json file in the current path of Blaupause execution.

## JSON Templates
Blaupause has the ability to create your own custom templates. If you want to create your own implementation Blaupause always checks the current execution path for a `.blaupause.json` file with the current implementation for a Template. Two different types are supported `Folder` and `Files`.

The JSON must always start with an array.

### Folder
The Folder Type creates a Folder for you. Folder can hold children of different Folder and of Files.

#### JSON Notation
*Creating a Folder without Children*
```json
{
  "type": "folder",
  "name": "FolderName",
  "children": null
}
```
*Creating a Folder with Children*
```json
{
  "type": "folder",
  "name": "FolderName",
  "children": [
    {
    "type": "folder",
    "name": "FolderName",
    "children": null
    }
  ]
}
```

### Files
The Files Type creates a File for you. A File can't hold chilrens.

#### JSON Notation
*Creating a File*
```json
{
    "type": "file",
    "name": "FileName.fileEnding"
}
```

## Contributing
If you want to contribute you need to check out the sources and run `swift package generate-xcodeproj` to get this up and running. If you can fix the issue yourself please do so and start a pull request with your fix. If you're not confident to fix the bug don't be afraid to generate a issue.


## ToDo
- [x] Creating MVC Command
- [x] Creating MVVM Command
- [x] Error Handling if the Folder is already there
- [x] JSON Parsing for template files
- [x] Add ability to parse .blaupause.json files to create custom template that can be provided
- [ ] Support for Template Files in your own .blaupause folder
- [ ] Unit Testing
- [ ] Create a wizard when starting without options
- [ ] Publish it to Homebrew

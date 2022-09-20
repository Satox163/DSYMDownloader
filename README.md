# DsymDownloader
DsymDownloader is a simple tool for downloading Dsym archives directly from the App Store via the Connect Api written in Swift.

- [Installation](#installation)
    - [Clone](#clone)
    - [Create a configuration file](#create-a-configuration-file) 
    - [Getting access keys](#getting-access-keys)
* [Usage](#usage)
* Licenses

## Installation

### Clone

```
$ git clone https://github.com/Satox163/DSYMDownloader
```

### Create a configuration file
Сreate a `.toml` configuration file:
```
issuer_id = "YOUR_issuer_id"
private_key_id = "YOUR_private_key_id"
private_key = "YOUR_private_key"
app_id = "YOUR_app_id"
```
It will require data from the *App Store Connect*, which we will receive in the next step.

### Getting access keys
To use the tool, you need to get the keys from the *App Store Connect Api*.

To get the keys, open the App Store Connect and select the [Users and Access](https://appstoreconnect.apple.com/access/api) tab and select the **Keys** section.

Create Api key with **developer** access level.
After downloading the p8 certificate, the `issuer_id` and the `private_key_id` will be displayed on the App Store Connect page. Add them to the appropriate sections of the *configuration file*.
Next to this open p8 certificate as text document and copy `private_key` to *configuration file*.
The `app_id` of the app is available in the App Store Connect URL when you select a specific app.

## Usage
Run the tool using the command specifying valid paths to the configuration file and the folder where dsym will be saved.
```
swift run DsymDownloader --configFilePath ../config.toml --outputPath ../dsyms
```

# 🎬 FFmpeg Video Compressor

A lightweight and easy-to-use Bash script for compressing videos using **FFmpeg** while maintaining good visual quality and significantly reducing file size.

The script supports both **single video files** and **entire directories**, making it ideal for content creators, developers, and anyone looking to save storage space.

---

## ✨ Features

* Compress a single video file or an entire directory.
* Batch processing of multiple videos.
* Supports multiple video formats:

  * MP4
  * MOV
  * AVI
  * MKV
  * WEBM
  * FLV
* Uses **H.264 (libx264)** for excellent compatibility.
* Optimized for streaming with `+faststart`.
* Preserves audio using **AAC** encoding.
* Automatically skips already compressed files.
* Displays original and compressed file sizes.
* Saves all compressed videos into a dedicated `compressed/` folder.

---

## 📂 Project Structure

```text
.
├── compress.sh
└── compressed/
```

---

## 📋 Requirements

* Linux or macOS
* Bash
* FFmpeg

---

## 🔧 Installation

### Clone the Repository

```bash
git clone https://github.com/yourusername/Video-size-compress-script.git
cd ffmpeg-video-compressor
```

### Install FFmpeg

#### Ubuntu/Debian

```bash
sudo apt update
sudo apt install ffmpeg
```

#### Fedora

```bash
sudo dnf install ffmpeg
```

#### Arch Linux

```bash
sudo pacman -S ffmpeg
```

#### macOS (Homebrew)

```bash
brew install ffmpeg
```

---

## 🚀 Usage

### Make the Script Executable

```bash
chmod +x video_compressor.sh
```

### Compress a Single Video

```bash
./compress.sh video.mp4
```

### Compress an Entire Directory

```bash
./video_compressor.sh /path/to/videos
```

---

## 📥 Output

All compressed videos are stored inside:

```text
compressed/
```

The output filename format is:

```text
originalname_compressed.mp4
```

Example:

```text
movie.mp4
↓
compressed/movie_compressed.mp4
```

---

## ⚙️ Default Compression Settings

| Setting       | Value           |
| ------------- | --------------- |
| Video Codec   | H.264 (libx264) |
| CRF           | 28              |
| Preset        | medium          |
| Audio Codec   | AAC             |
| Audio Bitrate | 128k            |
| Pixel Format  | yuv420p         |

---

## 🎯 Understanding CRF Values

The Constant Rate Factor (CRF) controls the quality and compression ratio.

| CRF Value | Quality             |
| --------- | ------------------- |
| 18        | Visually Lossless   |
| 20-23     | High Quality        |
| 24-27     | Balanced            |
| 28        | Good Compression    |
| 30+       | Maximum Compression |

To modify compression quality, edit:

```bash
CRF=28
```

---

## ⚡ Change Encoding Speed

Modify the preset according to your needs:

```bash
PRESET="medium"
```

Available presets:

```text
ultrafast
superfast
veryfast
faster
fast
medium
slow
slower
veryslow
```

* Faster presets → Faster compression, larger files.
* Slower presets → Better compression, smaller files.

---

## 📊 Example Output

```text
--------------------------------------------
Compressing:
sample.mp4
--------------------------------------------

Done -> compressed/sample_compressed.mp4

Original:
1.2G sample.mp4

Compressed:
320M compressed/sample_compressed.mp4
```

---

## 🛠 Supported Formats

| Extension | Supported |
| --------- | --------- |
| .mp4      | ✅         |
| .mov      | ✅         |
| .avi      | ✅         |
| .mkv      | ✅         |
| .webm     | ✅         |
| .flv      | ✅         |

---

## 💡 Use Cases

* Reduce storage usage.
* Compress videos before uploading.
* Prepare videos for websites and social media.
* Batch compress large media collections.
* Archive videos efficiently.

---

## 🤝 Contributing

Contributions, feature requests, and bug reports are welcome.

1. Fork the repository.
2. Create a new branch.
3. Commit your changes.
4. Open a Pull Request.

---

## 📜 License

This project is licensed under the MIT License.

---

## 👨‍💻 Author

**Rishi Prakash**

Cyber Security Researcher | Developer | Open Source Enthusiast

GitHub: https://github.com/yourusername

---

⭐ If this project helped you, consider giving it a star on GitHub.

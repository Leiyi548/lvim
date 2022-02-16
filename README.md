# lvim

我现在用的[lunarvim](https://github.com/LunarVim/LunarVim)这是别人 github 项目地址\
我参考的 lvim 配置是另一个大佬他的[配置](https://github.com/abzcoding/lvim)

## 屏幕截图

![photo1](https://gitee.com/gu-shenwei666/blogimg/raw/master/image/20211020192507.png)
![photo2](https://gitee.com/gu-shenwei666/blogimg/raw/master/image/20211020192604.png)
![photo3](https://gitee.com/gu-shenwei666/blogimg/raw/master/image/20211020192658.png)
![photo4](https://gitee.com/gu-shenwei666/blogimg/raw/master/image/20211124202856.png)
![photo5](https://gitee.com/gu-shenwei666/blogimg/raw/master/image/20211124203004.png)
![photo6](https://gitee.com/gu-shenwei666/blogimg/raw/master/image/20211124203056.png)
![photo7](https://gitee.com/gu-shenwei666/blogimg/raw/master/image/20211124203159.png)

## Install

```shell
# install Lunarvim
mv ~/.config/lvim ~/.config/lvim_backup
git clone https://github.com/abzcoding/lvim.git ~/.config/lvim
lvim +LvimUpdate +LvimCacheReset +q
lvim # run :PackerSync
```

### Recommended Fonts

- Any of the [Nerd Font](https://www.nerdfonts.com/)

On macos with Homebrew, choose one of the Nerd Fonts,for example,
here are some popular fonts:

```shell
brew tap homebrew/cask-fonts
brew search nerd-font
```

### Prerequisites

- [Neovim](https://github.com/neovim/neovim) >= v0.6.0

```shell

  brew unlink neovim
  brew install --HEAD neovim # install neovim nightly
  brew link neovim --HEAD
  brew reinstall neovim # upgrade neovim

  # The im-select program will be downloaded to your /usr/local/bin/ path.
  curl -Ls https://raw.githubusercontent.com/daipeihust/im-select/master/install_mac.sh | sh  # install im-select
```

- 去 github 安装[Neovim](https://github.com/neovim/neovim)

```shell
例子:
 手动安装neovim 0.51
 （官方）github下载地址：

  https://github.com/neovim/neovim/releases
  #解压到~/.soft/nvim-osx64/
  mkdir ~/.soft
  mv ~/Downloads/nvim-osx64 ~/.soft/
  # 创建软链接
  ln -s ~/.soft/nvim-osx64/bin/nvim /usr/local/bin/nvim

```

### Recommended Linters

```shell
HTML
brew install tidy-html5
Python3
brew install flake8
Markdown
brew install vale markdwonlint-cli
brew upgrade vale markdwonlint-cli
Go
brew install golangci-lint
brew upgrade golangci-lint
npm install gofmt
npm install eslint
Lua
brew install luarocks
luarocks install luacheck # lint
brew install stylua #formatter
Typescript
brew install eslint
```

### Recommended Format

```shell
HTML JSON
brew install prettier
Python3
brew install black
C CPP
brew install clang-format
brew upgrade clang-format
Typescript
brew install eslint
```

## Custom Key-mappings

<center>Modes: 𝐍=normal 𝐕=visual 𝐒=select 𝐈=insert 𝐂=command</center>
Note that,

- **Leader** key set as <kbd>Space</kbd>

<details open>
  <summary>
    <strong>Key-mappings</strong>
    <small><i>(🔎 Click to expand/collapse)</i></small>
  </summary>

<center>Modes: 𝐍=normal 𝐕=visual 𝐒=select 𝐈=insert 𝐂=command</center>

### 窗口操作

| Key                                        | Mode | Action       |
| ------------------------------------------ | :--: | ------------ |
| <kbd>Space</kbd>+<kbd>w</kbd>+<kbd>h</kbd> |  𝐍   | 向左移动窗口 |
| <kbd>Space</kbd>+<kbd>w</kbd>+<kbd>j</kbd> |  𝐍   | 向下移动窗口 |
| <kbd>Space</kbd>+<kbd>w</kbd>+<kbd>k</kbd> |  𝐍   | 向上移动窗口 |
| <kbd>Space</kbd>+<kbd>w</kbd>+<kbd>l</kbd> |  𝐍   | 向右移动窗口 |
| <kbd>Space</kbd>+<kbd>w</kbd>+<kbd>v</kbd> |  𝐍   | 垂直分屏     |
| <kbd>Space</kbd>+<kbd>w</kbd>+<kbd>s</kbd> |  𝐍   | 水平分屏     |

### File explorer(NvimTree)

| Key                           | Mode | Action                                                            |
| ----------------------------- | :--: | ----------------------------------------------------------------- |
| <kbd>Space</kbd>+<kbd>e</kbd> |  𝐍   | Open file tree                                                    |
| <kbd>o</kbd>                  |  𝐍   | Open flie or directory                                            |
| <kbd>C</kbd>+<kbd>]</kbd>     |  𝐍   | Cd in the directory under the cursor                              |
| <kbd>BS</kbd>                 |  𝐍   | Close current opened directory or parent                          |
| <kbd>a</kbd>                  |  𝐍   | Add a file.Adding a directory                                     |
| <kbd>r</kbd>                  |  𝐍   | Rename a file                                                     |
| <kbd>x</kbd>                  |  𝐍   | Add/Remove file/directory to cut clipboard                        |
| <kbd>c</kbd>                  |  𝐍   | Add/Remove file/directory to copy clipboard                       |
| <kbd>y</kbd>                  |  𝐍   | Copy name to system clipboard                                     |
| <kbd>Y</kbd>                  |  𝐍   | Copy relative path to system clipboard                            |
| <kbd>g</kbd>+<kbd>y</kbd>     |  𝐍   | Copy absolute path to system clipboard                            |
| <kbd>]</kbd>+<kbd>c</kbd>     |  𝐍   | Go to next git item                                               |
| <kbd>[</kbd>+<kbd>c</kbd>     |  𝐍   | Go to prev git item                                               |
| <kbd>-</kbd>                  |  𝐍   | Navigate up to the parent directory of the current file/directory |
| <kbd>s</kbd>                  |  𝐍   | Navigate up to the parent directory of the current file/directory |
| <kbd>C</kbd>+<kbd>v</kbd>     |  𝐍   | Open the file in a vertical split                                 |
| <kbd>C</kbd>+<kbd>x</kbd>     |  𝐍   | Open the file in a horizontal split                               |
| <kbd>C</kbd>+<kbd>t</kbd>     |  𝐍   | Open the file in a new tab                                        |
| <kbd>Tab</kbd>                |  𝐍   | Open the file as a preview(keeps the cursor in the tree)          |
| <kbd>I</kbd>                  |  𝐍   | Toggle visibility of hidden folders/files                         |
| <kbd>H</kbd>                  |  𝐍   | Toggle visibility of hidden folders / files                       |
| <kbd>R</kbd>                  |  𝐍   | Refresh the tree                                                  |

### UndoTree

| Key                           | Mode | Action   |
| ----------------------------- | :--: | -------- |
| <kbd>Space</kbd>+<kbd>u</kbd> |  𝐍   | Undotree |

### Dashboard

| Key                           | Mode | Action    |
| ----------------------------- | :--: | --------- |
| <kbd>Space</kbd>+<kbd>;</kbd> |  𝐍   | Dashboard |

### Comment.nvim

| Key  | Mode | Action                                                                |
| ---- | :--: | --------------------------------------------------------------------- |
| gc   |  𝐕   | Toggles the region using linewise comment                             |
| gb   |  𝐕   | Toggles the region using blockwise comment                            |
| gcc  |  𝐍   | Toggles the current line using linewise comment                       |
| gcb  |  𝐍   | Toggles the current line using blockwise comment                      |
| gco  |  𝐍   | Insert comment to the next line and enters INSERT mode                |
| gcO  |  𝐍   | Insert comment to the previous line and enters INSERT mode            |
| gcA  |  𝐍   | Insert comment to the end of the current line and enters INSERT mode  |
| gcw  |  𝐍   | Toggle from the current cursor position to the next word (Linewise)   |
| gc$  |  𝐍   | Toggle from the current cursor position to the end of word (Linewise) |
| gcip |  𝐍   | Toggle inside of paragraph (Linewise)                                 |
| gcia |  𝐍   | Toggle around curly brackets (Linewise)                               |
| gbaf |  𝐍   | Toggle comment around a function (Blockwise)                          |
| gbac |  𝐍   | Toggle comment around a class (Blockwise)                             |

### markdown

| Key                       | Mode | Action       |
| ------------------------- | :--: | ------------ |
| <kbd>,</kbd>+<kbd>a</kbd> |  𝐍   | 打出链接     |
| <kbd>,</kbd>+<kbd>b</kbd> |  𝐍   | 加粗字体     |
| <kbd>,</kbd>+<kbd>c</kbd> |  𝐍   | 添加代码块   |
| <kbd>,</kbd>+<kbd>d</kbd> |  𝐍   | 字体带有方格 |
| <kbd>,</kbd>+<kbd>i</kbd> |  𝐍   | 斜体字体     |
| <kbd>,</kbd>+<kbd>l</kbd> |  𝐍   | 添加下划线   |
| <kbd>,</kbd>+<kbd>k</kbd> |  𝐍   | 添加键       |
| <kbd>,</kbd>+<kbd>p</kbd> |  𝐍   | 打出图片链接 |
| <kbd>,</kbd>+<kbd>a</kbd> |  𝐍   | 删除线字体   |
| <kbd>,</kbd>+<kbd>1</kbd> |  𝐍   | 1 号标题     |
| <kbd>,</kbd>+<kbd>2</kbd> |  𝐍   | 2 号标题     |
| <kbd>,</kbd>+<kbd>3</kbd> |  𝐍   | 3 号标题     |
| <kbd>,</kbd>+<kbd>4</kbd> |  𝐍   | 4 号标题     |

### vim-markdown-table

| Key                                                     | Mode | Action                         |
| ------------------------------------------------------- | :--: | ------------------------------ |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>m</kbd>              |  𝐍   | Toggle tableMode               |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>t</kbd>              |  𝐍   | converts CSV data into a table |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>d</kbd>+<kbd>d</kbd> |  𝐍   | Delete Row                     |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>d</kbd>+<kbd>c</kbd> |  𝐍   | Delete Column                  |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>i</kbd>+<kbd>c</kbd> |  𝐍   | Insert Column                  |
| <kbd>[</kbd>+<kbd>\|</kbd>                              |  𝐍   | Move to left(TableMode)        |
| <kbd>]</kbd>+<kbd>\|</kbd>                              |  𝐍   | Move to right(TableMode)       |
| <kbd>{</kbd>+<kbd>\|</kbd>                              |  𝐍   | Move to up(TableMode)          |
| <kbd>}</kbd>+<kbd>\|</kbd>                              |  𝐍   | Move to down(TableMode)        |

### Telescope

| Key                                        | Mode | Action             |
| ------------------------------------------ | :--: | ------------------ |
| <kbd>Space</kbd>+<kbd>f</kbd>+<kbd>b</kbd> |  𝐍   | Find buffer        |
| <kbd>Space</kbd>+<kbd>f</kbd>+<kbd>c</kbd> |  𝐍   | Change colorscheme |
| <kbd>Space</kbd>+<kbd>f</kbd>+<kbd>C</kbd> |  𝐍   | Find Commands      |
| <kbd>Space</kbd>+<kbd>f</kbd>+<kbd>f</kbd> |  𝐍   | Find File          |
| <kbd>Space</kbd>+<kbd>f</kbd>+<kbd>H</kbd> |  𝐍   | Find Help          |
| <kbd>Space</kbd>+<kbd>f</kbd>+<kbd>k</kbd> |  𝐍   | Find Keymaps       |
| <kbd>Space</kbd>+<kbd>f</kbd>+<kbd>m</kbd> |  𝐍   | Find Marks         |
| <kbd>Space</kbd>+<kbd>f</kbd>+<kbd>n</kbd> |  𝐍   | New File           |
| <kbd>Space</kbd>+<kbd>f</kbd>+<kbd>R</kbd> |  𝐍   | Find Registers     |
| <kbd>Space</kbd>+<kbd>f</kbd>+<kbd>r</kbd> |  𝐍   | Ricent File        |
| <kbd>Space</kbd>+<kbd>f</kbd>+<kbd>t</kbd> |  𝐍   | Find text          |

### treesitter-textobjects

| Key                       | Mode | Action             |
| ------------------------- | :--: | ------------------ |
| <kbd>a</kbd>+<kbd>f</kbd> |  𝐕   | 将整个函数选中     |
| <kbd>i</kbd>+<kbd>f</kbd> |  𝐕   | 除去函数头选中     |
| <kbd>a</kbd>+<kbd>c</kbd> |  𝐕   | 将整个类选中       |
| <kbd>i</kbd>+<kbd>c</kbd> |  𝐕   | 除去类头选中       |
| <kbd>]</kbd>+<kbd>w</kbd> |  𝐍   | 与后面变量进行交换 |
| <kbd>[</kbd>+<kbd>w</kbd> |  𝐍   | 与前面变量进行交换 |
| <kbd>[</kbd>+<kbd>m</kbd> |  𝐍   | 跳到函数头         |
| <kbd>[</kbd>+<kbd>[</kbd> |  𝐍   | 跳到类头           |

### hop

| key                                        | Mode | Action       |
| ------------------------------------------ | :--: | ------------ |
| <kbd>s</kbd>+<kbd>s</kbd>                  |  𝐕   | 查找两个字符 |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>w</kbd> |  𝐕   | 查找单词     |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>p</kbd> |  𝐕   | 类似与\      |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>l</kbd> |  𝐕   | 查找行       |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>s</kbd> |  𝐕   | 查找一个字符 |
| <kbd>s</kbd>+<kbd>s</kbd>                  |  𝐍   | 查找两个字符 |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>w</kbd> |  𝐍   | 查找单词     |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>p</kbd> |  𝐍   | 类似与\      |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>l</kbd> |  𝐍   | 查找行       |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>s</kbd> |  𝐍   | 查找一个字符 |

### git

| Key                                        | Mode | Action                            |
| ------------------------------------------ | :--: | --------------------------------- |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>b</kbd> |  𝐍   | Checkout branch                   |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>c</kbd> |  𝐍   | Checkout commit                   |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>C</kbd> |  𝐍   | Checkout commit(for current file) |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>d</kbd> |  𝐍   | Git Diff                          |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>g</kbd> |  𝐍   | Lazygit                           |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>j</kbd> |  𝐍   | Next Hunk                         |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>k</kbd> |  𝐍   | Prev Hunk                         |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>l</kbd> |  𝐍   | Git Blame                         |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>o</kbd> |  𝐍   | Open changd file                  |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>p</kbd> |  𝐍   | Preview Hunk                      |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>r</kbd> |  𝐍   | Reset Hunk                        |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>R</kbd> |  𝐍   | Reset Buffer                      |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>s</kbd> |  𝐍   | Stage Hunk                        |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>u</kbd> |  𝐍   | Undo Stage Hunk                   |

### visual-multi-mode

| Key                                    | Mode | Action                                                                                            |
| -------------------------------------- | :--: | ------------------------------------------------------------------------------------------------- |
| <kbd>TAB</kbd>                         |  𝐍   | 光标和扩展模式直接切换                                                                            |
| <kbd>Shift</kbd>+<kbd>left/right</kbd> |  𝐍   | 选中区域并进入 visual-multi-mode                                                                  |
| <kbd>Ctrl</kbd>+<kbd>c</kbd>           |  𝐍   | 在当前位置插入一个光标（然后使用上下左右键移动到指定未知添加下一个光标，hjkl 键会移动添加的光标） |
| <kbd>Ctrl</kbd>+<kbd>down/up</kbd>     |  𝐍   | 垂直方向插入多光标                                                                                |

</details>

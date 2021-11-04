# lvim-config
我现在用的[lunarvim](https://github.com/LunarVim/LunarVim)这是别人github项目地址<br>
我参考的lvim配置是另一个大佬他的[配置](https://github.com/abzcoding/lvim) 

## 屏幕截图
![photo1](https://gitee.com/gu-shenwei666/blogimg/raw/master/image/20211020192507.png) 
![photo2](https://gitee.com/gu-shenwei666/blogimg/raw/master/image/20211020192604.png)
![photo3](https://gitee.com/gu-shenwei666/blogimg/raw/master/image/20211020192658.png)

## 代码结构图
```
.
├── README.md
├── config.lua
├── ftplugin
│   └── python.lua
├── ignore
├── lsp-settings
│   └── gopls.json
├── lua
│   └── user
│       ├── actions.lua
│       ├── autocommands.lua
│       ├── banners.lua
│       ├── builtin.lua
│       ├── cmp-comparator.lua
│       ├── colorizer.lua
│       ├── dashboard.lua
│       ├── indent_blankline.lua
│       ├── keybindings.lua
│       ├── lsp_kind.lua
│       ├── lsp_signature.lua
│       ├── lua_snip.lua
│       ├── mark.lua
│       ├── orgmode_config.lua
│       ├── plugins.lua
│       ├── telescope.lua
│       ├── theme.lua
│       └── treesitter-textobjects.lua
├── openfly.txt
├── plugin
│   └── packer_compiled.lua
└── vscodesnips
    ├── bootstrap4.json
    ├── cpp.json
    ├── html.json
    ├── lua.json
    └── package.json
```

## 快捷键
<center>Modes: 𝐍=normal 𝐕=visual 𝐒=select 𝐈=insert 𝐂=command</center>

### 窗口操作
| Key                                        | Mode | Action       |
|--------------------------------------------|:----:|--------------|
| <kbd>Space</kbd>+<kbd>w</kbd>+<kbd>h</kbd> |   𝐍  | 向左移动窗口 |
| <kbd>Space</kbd>+<kbd>w</kbd>+<kbd>j</kbd> |   𝐍  | 向下移动窗口 |
| <kbd>Space</kbd>+<kbd>w</kbd>+<kbd>k</kbd> |   𝐍  | 向上移动窗口 |
| <kbd>Space</kbd>+<kbd>w</kbd>+<kbd>l</kbd> |   𝐍  | 向右移动窗口 |
| <kbd>Space</kbd>+<kbd>w</kbd>+<kbd>v</kbd> |   𝐍  | 垂直分屏     |
| <kbd>Space</kbd>+<kbd>w</kbd>+<kbd>s</kbd> |   𝐍  | 水平分屏     |

### File explorer(NvimTree)
| Key                           | Mode | Action         |
|-------------------------------|:----:|----------------|
| <kbd>Space</kbd>+<kbd>e</kbd> |   𝐍  | Open file tree |

### UndoTree
| Key                           | Mode | Action   |
|-------------------------------|:----:|----------|
| <kbd>Space</kbd>+<kbd>u</kbd> |   𝐍  | Undotree |

### Dashboard
| Key                           | Mode | Action    |
|-------------------------------|:----:|-----------|
| <kbd>Space</kbd>+<kbd>;</kbd> |   𝐍  | Dashboard |

### Comment.nvim
| Key  | Mode | Action                                                                |
|------|:----:|-----------------------------------------------------------------------|
| gc   |   𝐕  | Toggles the region using linewise comment                             |
| gb   |   𝐕  | Toggles the region using blockwise comment                            |
| gcc  |   𝐍  | Toggles the current line using linewise comment                       |
| gcb  |   𝐍  | Toggles the current line using blockwise comment                      |
| gco  |   𝐍  | Insert comment to the next line and enters INSERT mode                |
| gcO  |   𝐍  | Insert comment to the previous line and enters INSERT mode            |
| gcA  |   𝐍  | Insert comment to the end of the current line and enters INSERT mode  |
| gcw  |   𝐍  | Toggle from the current cursor position to the next word (Linewise)   |
| gc$  |   𝐍  | Toggle from the current cursor position to the end of word (Linewise) |
| gcip |   𝐍  | Toggle inside of paragraph (Linewise)                                 |
| gcia |   𝐍  | Toggle around curly brackets (Linewise)                               |
| gbaf |   𝐍  | Toggle comment around a function (Blockwise)                          |
| gbac |   𝐍  | Toggle comment around a class  (Blockwise)                            |

### markdown
| Key                       | Mode | Action       |
|---------------------------|:----:|--------------|
| <kbd>,</kbd>+<kbd>a</kbd> |   𝐍  | 打出链接     |
| <kbd>,</kbd>+<kbd>b</kbd> |   𝐍  | 加粗字体     |
| <kbd>,</kbd>+<kbd>c</kbd> |   𝐍  | 添加代码块   |
| <kbd>,</kbd>+<kbd>d</kbd> |   𝐍  | 字体带有方格 |
| <kbd>,</kbd>+<kbd>i</kbd> |   𝐍  | 斜体字体     |
| <kbd>,</kbd>+<kbd>l</kbd> |   𝐍  | 添加下划线   |
| <kbd>,</kbd>+<kbd>k</kbd> |   𝐍  | 添加键       |
| <kbd>,</kbd>+<kbd>p</kbd> |   𝐍  | 打出图片链接 |
| <kbd>,</kbd>+<kbd>a</kbd> |   𝐍  | 删除线字体   |
| <kbd>,</kbd>+<kbd>1</kbd> |   𝐍  | 1号标题      |
| <kbd>,</kbd>+<kbd>2</kbd> |   𝐍  | 2号标题      |
| <kbd>,</kbd>+<kbd>3</kbd> |   𝐍  | 3号标题      |
| <kbd>,</kbd>+<kbd>4</kbd> |   𝐍  | 4号标题      |

### vim-markdown-table
| Key                                                     | Mode | Action                          |
|---------------------------------------------------------|:----:|---------------------------------|
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>m</kbd>              |   𝐍  | Toggle tableMode                |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>t</kbd>              |   𝐍  | converts CSV  data into a table |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>d</kbd>+<kbd>d</kbd> |   𝐍  | Delete Row                      |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>d</kbd>+<kbd>c</kbd> |   𝐍  | Delete Column                   |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>i</kbd>+<kbd>c</kbd> |   𝐍  | Insert Column                   |
| <kbd>[</kbd>+<kbd>\|</kbd>                              |   𝐍  | Move to left(TableMode)         |
| <kbd>]</kbd>+<kbd>\|</kbd>                              |   𝐍  | Move to right(TableMode)        |
| <kbd>{</kbd>+<kbd>\|</kbd>                              |   𝐍  | Move to up(TableMode)           |
| <kbd>}</kbd>+<kbd>\|</kbd>                              |   𝐍  | Move to down(TableMode)         |


### Telescope
| Key                                        | Mode | Action             |
|--------------------------------------------|:----:|--------------------|
| <kbd>Space</kbd>+<kbd>f</kbd>+<kbd>b</kbd> |   𝐍  | Find buffer        |
| <kbd>Space</kbd>+<kbd>f</kbd>+<kbd>c</kbd> |   𝐍  | Change colorscheme |
| <kbd>Space</kbd>+<kbd>f</kbd>+<kbd>C</kbd> |   𝐍  | Find Commands      |
| <kbd>Space</kbd>+<kbd>f</kbd>+<kbd>f</kbd> |   𝐍  | Find File          |
| <kbd>Space</kbd>+<kbd>f</kbd>+<kbd>H</kbd> |   𝐍  | Find Help          |
| <kbd>Space</kbd>+<kbd>f</kbd>+<kbd>k</kbd> |   𝐍  | Find Keymaps       |
| <kbd>Space</kbd>+<kbd>f</kbd>+<kbd>m</kbd> |   𝐍  | Find Marks         |
| <kbd>Space</kbd>+<kbd>f</kbd>+<kbd>n</kbd> |   𝐍  | New File           |
| <kbd>Space</kbd>+<kbd>f</kbd>+<kbd>R</kbd> |   𝐍  | Find Registers     |
| <kbd>Space</kbd>+<kbd>f</kbd>+<kbd>r</kbd> |   𝐍  | Ricent File        |
| <kbd>Space</kbd>+<kbd>f</kbd>+<kbd>t</kbd> |   𝐍  | Find text          |
### treesitter-textobjects
| Key                       | Mode | Action             |
|---------------------------|:----:|--------------------|
| <kbd>a</kbd>+<kbd>f</kbd> |   𝐕  | 将整个函数选中     |
| <kbd>i</kbd>+<kbd>f</kbd> |   𝐕  | 除去函数头选中     |
| <kbd>a</kbd>+<kbd>c</kbd> |   𝐕  | 将整个类选中       |
| <kbd>i</kbd>+<kbd>c</kbd> |   𝐕  | 除去类头选中       |
| <kbd>]</kbd>+<kbd>w</kbd> |   𝐍  | 与后面变量进行交换 |
| <kbd>[</kbd>+<kbd>w</kbd> |   𝐍  | 与前面变量进行交换 |
| <kbd>[</kbd>+<kbd>m</kbd> |   𝐍  | 跳到函数头         |
| <kbd>[</kbd>+<kbd>[</kbd> |   𝐍  | 跳到类头           |


### hop
| key                                        | Mode | Action       |
|--------------------------------------------|:----:|--------------|
| <kbd>s</kbd>+<kbd>s</kbd>                  |   𝐕  | 查找两个字符 |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>w</kbd> |   𝐕  | 查找单词     |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>p</kbd> |   𝐕  | 类似与\      |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>l</kbd> |   𝐕  | 查找行       |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>s</kbd> |   𝐕  | 查找一个字符 |
| <kbd>s</kbd>+<kbd>s</kbd>                  |   𝐍  | 查找两个字符 |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>w</kbd> |   𝐍  | 查找单词     |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>p</kbd> |   𝐍  | 类似与\      |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>l</kbd> |   𝐍  | 查找行       |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>s</kbd> |   𝐍  | 查找一个字符 |

### git
| Key                                        | Mode | Action                             |
|--------------------------------------------|:----:|-----------------------------------|
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>b</kbd> |   𝐍  | Checkout branch                   |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>c</kbd> |   𝐍  | Checkout commit                   |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>C</kbd> |   𝐍  | Checkout commit(for current file) |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>d</kbd> |   𝐍  | Git Diff                          |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>g</kbd> |   𝐍  | Lazygit                           |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>j</kbd> |   𝐍  | Next Hunk                         |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>k</kbd> |   𝐍  | Prev Hunk                         |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>l</kbd> |   𝐍  | Git Blame                         |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>o</kbd> |   𝐍  | Open changd file                  |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>p</kbd> |   𝐍  | Preview Hunk                      |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>r</kbd> |   𝐍  | Reset Hunk                        |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>R</kbd> |   𝐍  | Reset Buffer                      |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>s</kbd> |   𝐍  | Stage Hunk                        |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>u</kbd> |   𝐍  | Undo Stage Hunk                   |

### [easy-align](https://github.com/junegunn/vim-easy-align) 
easy-align是一个可以让你代码快速对齐的插件<br>
ga进入easyalign模式<br>
默认向左对其，比如按照空格对其  *<space><br>
向右对其 <enter>*<space><br>
居中对其 <enter><enter>*<space><br>
如果遇到其他字符比如 | , = 啥的，都把空格替换为对应的即可<br>
*可以换成数字，对应后面的第几个字符，*就是全部都指定<br>

#### markdown表格进行对齐
左对齐 vipga*|
右对齐 vip<Enter>*|
居中对齐 vip<Enter><Enter>*|

**动手试验:** 
```
| Option| Type | Default | Description |
|--|--|--|--|
| threads | Fixnum | 1 | number of threads in the thread pool |
|queues |Fixnum | 1 | number of concurrent queues |
|queue_size | Fixnum | 1000 | size of each queue |
|   interval | Numeric | 0 | dispatcher interval for batch processing |
|batch | Boolean | false | enables batch processing mode |
 |batch_size | Fixnum | nil | number of maximum items to be assigned at once |
 |logger | Logger | nil | logger instance for debug logs |
```
左对齐`vipga*| ` 
```
| Option     | Type    | Default | Description                                    |
| --         | --      | --      | --                                             |
| threads    | Fixnum  | 1       | number of threads in the thread pool           |
| queues     | Fixnum  | 1       | number of concurrent queues                    |
| queue_size | Fixnum  | 1000    | size of each queue                             |
| interval   | Numeric | 0       | dispatcher interval for batch processing       |
| batch      | Boolean | false   | enables batch processing mode                  |
| batch_size | Fixnum  | nil     | number of maximum items to be assigned at once |
| logger     | Logger  | nil     | logger instance for debug logs                 |
```
右对齐: `vipga<Enter>*|` 
```
|     Option |    Type | Default |                                    Description |
|         -- |      -- |      -- |                                             -- |
|    threads |  Fixnum |       1 |           number of threads in the thread pool |
|     queues |  Fixnum |       1 |                    number of concurrent queues |
| queue_size |  Fixnum |    1000 |                             size of each queue |
|   interval | Numeric |       0 |       dispatcher interval for batch processing |
|      batch | Boolean |   false |                  enables batch processing mode |
| batch_size |  Fixnum |     nil | number of maximum items to be assigned at once |
|     logger |  Logger |     nil |                 logger instance for debug logs |
```
居中对齐: `vipga<Enter><Enter>*|` 
```
|   Option   |  Type   | Default |                  Description                   |
|     --     |   --    |   --    |                       --                       |
|  threads   | Fixnum  |    1    |      number of threads in the thread pool      |
|   queues   | Fixnum  |    1    |          number of concurrent queues           |
| queue_size | Fixnum  |  1000   |               size of each queue               |
|  interval  | Numeric |    0    |    dispatcher interval for batch processing    |
|   batch    | Boolean |  false  |         enables batch processing mode          |
| batch_size | Fixnum  |   nil   | number of maximum items to be assigned at once |
|   logger   | Logger  |   nil   |         logger instance for debug logs         |
```





#### 高级用法

### visual-multi-mode

| 按键           | 模式                    | 描述                                                                                                                                            | 提供者                 |
| -------------- | ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------- |
| tab            | vsiual-multi-mode       | 光标和扩展模式直接切换                                                                                                                          | vim-visual-multi       |
| shift-左右键   | normal                  | 选中区域并进入vim-visual-multi-mode                                                                                                             | vim-visual-multi       |
| ctrl-c         | noraml                  | 在当前位置插入一个光标(然后使用上下左右键移动到指定位置添加下一个光标,hjkl键会移动添加的光标)                                                  | vim-visual-multi       |
| ctrl-down/up   | noraml                  | 垂直方向插入光标                                                                                                                                | vim-visual-multi       |
| ctrl-s         | normal/visual           | 1.选中当前光标下的所有单词 2.visual模式下选中所有的当前选中的内容                                                                               | vim-visual-multi      |
| ctrl-n/N       | normal                  | 在visul模式选中内容之后, 按下ctrl-n会在下一处与当前行选中内一样的地方插入光标.非visual模式下,与ctrl-s表现差不多,不过是依次选择当前光标下的单词 | vim-vim-visual-multi   |
| q              | vim-visual-multi-mode   | 取消当前光标或者选中的区域                                                                                                                      | vim-visual-multi       |
| ]/[            | vim-visual-multi-mode   | 跳到下一个/上一个匹配的模式,可以代替]/[进行使用                                                                                                 | vim-visual-multi      |
| S              | vim-visual-multi        | 在多光标模式下,将多个选中的内容以某种符号进行包围                                                                                               | vim-vim-visual-multi  |


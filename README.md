# lvim-config
我现在用的[lunarvim](https://github.com/LunarVim/LunarVim)这是别人github项目地址
我参考的lvim配置是另一个大佬他的[配置](https://github.com/abzcoding/lvim) 

## 屏幕截图
![photo1](https://gitee.com/gu-shenwei666/blogimg/raw/master/image/20211020192507.png) 
![photo2](https://gitee.com/gu-shenwei666/blogimg/raw/master/image/20211020192604.png)
![photo3](https://gitee.com/gu-shenwei666/blogimg/raw/master/image/20211020192658.png)

## 代码结构图
![代码结构图](https://gitee.com/gu-shenwei666/blogimg/raw/master/image/20211020201649.png) 

## 快捷键
### 窗口操作
| 按键       | 模式         |
|------------|--------------|
| \<leader>wh | 向左移动窗口 |
| \<leader>wj | 向下移动窗口 |
| \<leader>wk | 向上移动窗口 |
| \<leader>wl | 向右移动窗口 |
| \<leader>wv  | 垂直分屏     |
| \<leader>ws  | 水平分屏     |
### markdown
| 按键 | 模式         |
|------|--------------|
| ,a   | 打出链接     |
| ,b   | 加粗字体     |
| ,c   | 添加代码块   |
| ,d   | 字体带有方格 |
| ,i   | 斜体字体     |
| ,l   | 添加下划线   |
| ,p   | 打出图片链接 |
| ,s   | 删除线字体   |
| ,1   | 1号标题      |
| ,2   | 2号标题      |
| ,3   | 3号标题      |
| ,4   | 4号标题      |



### visual-multi-mode

| 按键         | 模式                  | 描述                                                                                                                                          | 提供者               |
|--------------|-----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|----------------------|
| tab          | vsiual-multi-mode     | 光标和扩展模式直接切换                                                                                                                        | vim-visual-multi     |
| shift-左右键 | normal                | 选中区域并进入vim-visual-multi-mode                                                                                                           | vim-visual-multi     |
| ctrl-c       | noraml                | 在当前位置插入一个光标(然后使用上下左右键移动到指定位置添加下一个光标,hjkl键会移动添加的光标)                                                 | vim-visual-multi     |
| ctrl-down/up | noraml                | 垂直方向插入光标                                                                                                                              | vim-visual-multi     |
| ctrl-s       | normal/visual         | 1.选中当前光标下的所有单词 2.visual模式下选中所有的当前选中的内容                                                                             | vim-visual-multi     |
| ctrl-n/N     | normal                | 在visul模式选中内容之后, 按下ctrl-n会在下一处与当前行选中内一样的地方插入光标.非visual模式下,与ctrl-s表现差不多,不过是依次选择当前光标下的单词 | vim-vim-visual-multi |
| q            | vim-visual-multi-mode | 取消当前光标或者选中的区域                                                                                                                    | vim-visual-multi     |
| ]/[          | vim-visual-multi-mode | 跳到下一个/上一个匹配的模式,可以代替]/[进行使用                                                                                               | vim-visual-multi     |
| S            | vim-visual-multi      | 在多光标模式下,将多个选中的内容以某种符号进行包围                                                                                             | vim-vim-visual-multi |


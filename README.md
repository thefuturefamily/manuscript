#  **manuscript**
`manuscript` 是为撰写数学笔记而设计的$\LaTeX$模版类. 它支持英文、中文，并且同时支持 `pdfLaTeX` 与 `XeLaTeX`引擎.

## **主要功能**
- 它继承自`extarticle`模版类，因而可以使用`extarticle`支持的参数，包括字号、打印方式等.
    - 支持的字号包括`8pt`、`9pt`、`10pt`、`11pt`、`12pt`、`14pt`、`17pt`、`20pt`，其中`9pt`~`12pt`是建议的大小.
    - 使用`oneside`、`twoside`来调整是单面文档或双面文档.
    - 使用`gray`来生成灰度文档.

- 你可以生成漂亮的定理样式
![theorem](https://github.com/thefuturefamily/manuscript/raw/master/images/theorems.png)

- 页边注
![marginpar](https://github.com/thefuturefamily/manuscript/raw/master/images/marginpar.png)

- 模块
![module](https://github.com/thefuturefamily/manuscript/raw/master/images/module.png)

$\blacktriangleright$ **更具体的说明可以参见示例与说明文档.**

## **$\TeX$ 文档样例**

### 中文文档示例
```
%! TEX program = xelatex
\documentclass[9pt,twoside,mpar]{manuscript}

\begin{document}

    \title{\textbf{手稿}}
    \author{\handwriting 作者}
    \date{\today}

    \maketitle

    \begin{abstract}
        摘要
    \end{abstract}

    \section{标题}\subtitle{副标题}

        \subsection{小标题}
            ……    
    
    \bigskip
    \begin{thebibliography}{}
        \bibitem{SomeBook} 文献名称
        
    \end{thebibliography}

\end{document}
```

### 英文文档示例
```
%! TEX program = xelatex
\documentclass[9pt,twoside,mpar]{manuscript}

\begin{document}

    \title{\textbf{Manuscript}}
    \author{\handwriting Author}
    \date{\today}

    \maketitle

    \begin{abstract}
        Abstract
    \end{abstract}

    \section{Section Title}\subtitle{Subtitle}

        \subsection{Subsection Title}
            ……    
    
    \bigskip
    \begin{thebibliography}{}
        \bibitem{SomeBook} Your Book.
        
    \end{thebibliography}

\end{document}
```

## 目前已知的问题
1. 模版类中涉及的很多长度还没有针对不同的字号进行调整，在字号过小或过大时会出现一些异常. 这一问题计划在5月19日更新时解决.
2. 目前在 Windows 和 macOS 上没有统一的手写字体. 出于版权的原因无法进行字体安装文件的共享，因此可能需要自行进行调整. Windows 上默认的手写字体是`方正舒体`，macOS 是`翩翩体`.
3. 在`pdfLaTeX`下的编译效果较差，对它的支持主要是为了适配 TeXPad 的 iPad 版本.
4. 中文环境下`\author`与`\email`目前是没有效果的，主要原因是由于无法让它们出现在最后的`\clearpage`之前.

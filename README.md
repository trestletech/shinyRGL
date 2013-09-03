shiny-rgl
=========

[Shiny](http://rstudio.com/shiny/) wrapper for the [RGL package](https://r-forge.r-project.org/projects/rgl/). This package enables users to create Shiny apps that use
interactive 3D graphics in WebGL using the RGL package. The implementation can
be as simple as adding lines like the following:

### ui.R

```bash
...
  # Create an output element (works just like 'plotOutput()')
  webGLOutput("myWebGL")
...
```

### server.R

```bash
...
  output$myWebGLr <- renderWebGL({
    points3d(1:10, 1:10, 1:10)
    axes3d()
  })
...
```

And you should see something like the following added to your Shiny app, though it will be interactive as seen [here](http://trestletech.github.io/shinyRGL/).

![3dplot](http://trestletech.github.io/shinyRGL/images/3dplot.png)

Installation
------------

You can install the latest version of the code using the `devtools` R package.

```
# Install devtools, if you haven't already.
install.packages("devtools")

library(devtools)
install_github("shinyRGL", "trestletech")
```

The package requires RGL version 0.93.949 or later (which is available on CRAN
via `install.packages("rgl")`). However, some additional functionality has been
developed for RGL and submitted [as a patch](https://r-forge.r-project.org/tracker/index.php?func=detail&aid=4877&group_id=234&atid=948). When this functionality is
incorporated, you'll find that the user's adjusted viewpoint of a WebGL scene
is persisted between server-side scene generations. For instance, if a user were
to zoom in and pan a WebGL scene, then alter the scene by changing some setting,
their zoom and pan settings would be unaltered when the scene was regenerated on 
the server. Hopefully this code wil be integrated into RGL shortly; in the
meantime, if this feature is important to you, you can build RGL on your own 
system after applying the patch available at the link above.


License
-------

The development of this project was generously sponsored by the [Institut de 
Radioprotection et de Sûreté Nucléaire](http://www.irsn.fr/EN/Pages/home.aspx) 
and performed by [Jeff Allen](http://trestletech.com). The code is
licensed under The MIT License (MIT).

Copyright (c) 2013 Institut de Radioprotection et de Sûreté Nucléaire

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

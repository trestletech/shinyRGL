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
  output$myWebGL <- renderWebGL({
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

# OPTIONAL (see below)
install_github("rgl", "trestletech", "js-class")
```

The package requires RGL version 0.93.949 or later (which is available on CRAN
via `install.packages("rgl")`). However, some additional functionality has been
developed for RGL and submitted [as a patch](https://r-forge.r-project.org/tracker/index.php?func=detail&aid=4877&group_id=234&atid=948). When this functionality is
incorporated, you'll find that the user's adjusted viewpoint of a WebGL scene
is persisted between server-side scene generations. For instance, if a user were
to zoom in and pan a WebGL scene, then alter the scene by changing some setting,
their zoom and pan settings would be unaltered when the scene was regenerated on 
the server. Hopefully this code wil be integrated into RGL shortly; in the
meantime, you can install my patched version of RGL using the following command:

```
install_github("rgl", "trestletech", "js-class")
```

That will give you the persistent viewpoint seen 
[here](http://spark.rstudio.com/trestletech/3dscatter/) (Try panning and zooming a 
bit then adjusting the sliders. You'll note that your viewpoint isn't reset.)

Though you don't need much X11 code or even XVFB, you will likely need to install
some OpenGL packages in order to compile the rgl package. On Ubuntu, this package
is `libglu1-mesa-dev`.

Running on a Headless Server like EC2
--------------------------------------

The ability to use a "null device" was recently added to RGL, allowing you to
use RGL (thus shinyRGL) on a headless server without having to emulate a
framebuffer using XVFB. This is still new code to RGL, however, so there are a
few quirks to get it working. Primarily: you'll need to set an option in R using
`options(rgl.useNULL=TRUE)` or set an environment variable named `RGL_USE_NULL`
*before* loading RGL. If you don't do this, you'll see a lot of this error in R:

```
Warning in rgl.init(initValue, onlyNULL) :
  RGL: unable to open X11 display
Warning in fun(libname, pkgname) : error in rgl_init
```

or `Error: rgl.open failed` in your shiny app. 

You can either do this explicitly by running the necessary command before 
loading rgl (as is done in the examples) in your application code,
or you can place the command in your `.Rprofile` file so that it's executed
each time you start R, before RGL has a chance to load.

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

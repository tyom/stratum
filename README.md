Bedrock
=======

Framework which helps to start any project quick. Comes with [Middleman](http://middlemanapp.com/) static site generator.

It's intended to quickly get you started on prototyping websites with basic toolkit such as highly configurable grids with visual feedback,
[support](https://github.com/rtomayko/tilt) for most popular templating engines and processors (Haml, Sass, ERB, Markdown, Coffeescript etc.)
and quick deploy to remote servers through `middleman deploy` extension. And of course many other great features that come with above mentioned
tools.

The Grid System means to provide easy-to-use scuffolding during irratic prototyping, taking away the worry to think about implementation of
layout and concentrate on UI. LiveReload that comes preinstalled keeps you focused and reduces context switching. Every time you save file you're
working on the appropriate files get automatically compiled and browser refreshes only the required parts, giving you instant feetback while your
hands are on the keyboard.

See some [**examples of the grid**](http://tyom.github.com/bedrock/).

Usage
-----

### Get started

First you need to install Middleman: `gem install middleman`.

Then get the latest Bedrock toolkit.

    git clone https://github.com/tyom/bedrock.git ~/.middleman/bedrock

This will clone the latest version to your Middleman's templates directory. To initialize a new project:

    middleman init project_name -T bedrock


### Server

`bundle install` to install all required gems.

`middleman` to run dev server on http://localhost:4567.

### Sass

Bedrock currently requires Bourbon for grid guides (`grid-debug.scss`). You don't need to install it as it comes preinstalled with this toolkit.
However consider installing it locally if you want to update it separately. You also don't need Bourbon if you don't intend to use grid guides
(although I find them incredibely useful).

`@import "bedrock"` into your Sass stylesheet to get started.

#### Grids

Bedrock uses responsive layouts and will calculate optimal grids for you based on your settings:

    $grid-medium:         980px
    $grid-large:          1200px

    $grid-total-columns:  12
    $grid-baseline:       20px
    $grid-desired-gutter: 20px

The grid is calculated based on total width (set individually for each screen size variation) and desired gutter width.
The closest gutter value will be picked from the nearest round number that fits the grid. Columns width are automatically generated.
See [Gridulator](http://gridulator.com/) to understand how it works.

`$baseline` is used to set vertical rhythm.

'Inner' grid with margins needs to be contained within `@grid-row` container. If columns are placed directly in `@grid-container`
the flexible grid is automatically used which allows for easy subdivision into equal parts.

**Flexible grid**

Flexible column width is calculated from pixel column width like so:

    grid-calculate-percentage(grid-column-span-width($span, $column-size, $gutter-size)

Provide `$span` - number of columns and `$column-size` and `$gutter-size` in pixels. These values can be calculated from:

    grid-single-column-width($grid-size, $total-columns, $gutter-size)

`grid-size` - container size in pixels, `$total-columns` - number of total columns and `$gutter-size` – values in pixels of margins between columns.

Gutter can also be calculated from:

    grid-column-gutter($grid-size, $desired-gutter)

Provide `$grid-size` - value in pixels of the size of the grid (default 980). `$desired-gutter` is value in pixels (approximate) which value
you would like the column gutters to be. The actual value is the closest round number that fits into grid with column sizes provided.

This way you ever need to specify total grid width, column sizes and approximate gutter size. The rest is taken care of.

Flexible grid works just like pixel grid, only in percentages. It can be mixed and matched together with pixel grid by including in your `@grid-row` 
container or `@grid-container` directly:

    @include grid-column-width($i, flexible);



**Guides**

There are also the following settings available to control grid guide (useful to visualize the grid you're working with):

    $grid-guides:            false  !default
    $grid-guides-color:      red    !default
    $grid-guides-opacity:    .8     !default
    $grid-guides-position:   back   !default

You can enable the grid guides from settings or by setting the `.show-grid` class on the container you wish to attach the guides to. Custom colour and opacity can be alse specified in settings.


### Scaffolding

To quickly build a multicolumn layout use `.container` to identify columns containers. The first instance of `row` will set grid-width and center it on the page. The descendant `.row`s will expand to full width and contain `.column` elements.

`.row.column-borders` to render gutter borders dividing columns.

`.col` is used to identify columns. Use span modifier for appropriate sizes:

`.one.col`, `.two.col`, `.three.col`, ... `.twenty-four.col` will set spanned widht to the corresponding column.

Last column is automatically floated to the right (helps with browser rounding problems).
`.two.col.last` is used to force column to be the last one (useful when used together with `.column.centered`.
`.three.col.end` is used to do the opposite to `.last`, that is to tell column to float in the same direction as preceding columns.
`.one.col.centered` is used to center the column within the container

Add `.show-grid` on a container to display grid guides (using the settings above).

Use `.show-column-sizes` on container to display width on each column

Use `.flexi` to convert grid container into flexible grid.

---

You can find more information about how to use each mixin, function in Bedrock Sass files.

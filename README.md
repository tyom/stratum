Bedrock
=======

Framework which helps to start any project quick. Comes with Middleman static site generator.

See [**Examples**](http://tyom.github.com/bedrock/).

Usage
-----

### Server

`bundle install` to install all required gems
`middleman` to run dev server on `localhost:4567`

### Sass

Bedrock currently requires Bourbon, so make sure it's installed.

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

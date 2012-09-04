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

Bedrock uses responsive layouts ad will calculate optimal grids for you based on your settings:

    $grid-medium:         980px
    $grid-large:          1200px

    $grid-total-columns:  12
    $grid-baseline:       20px
    $grid-desired-gutter: 20px

The grid is calculated based on total width (set individually for each screen size variation) and desired gutter width.
The closest gutter value will be picked from the nearest round number that fits the grid. Columns width are automatically generated.
See [Gridulator](http://gridulator.com/) to understand how it works.

`$baseline` is used to set vertical rhythm.

**Guides**
There are also the following settings available to control grid guide (useful to visualize the grid you're working with):

    $grid-guides:            false  !default
    $grid-guides-color:      red    !default
    $grid-guides-opacity:    .8     !default
    $grid-guides-position:   back   !default

You can enable the grid guides from settings or by setting the `.show-grid` class on the container you wish to attach the guides to.
Custom colour and opacity can be alse specified in settings. It is also possible to move grid in front of the container (to see throught it). Also done by using the `.show-grid.front` class.

    $grid-display-column-sizes: true

This will display column sizes on each coloumn.

### Scaffolding

To quickly build a multicolumn layout use `.container` to identify columns containers. The first instance of `row` will set grid-width and center it on the page. The descendant `.row`s will expand to full width and contain `.column` elements.

`.row.column-borders` to render gutter borders dividing columns.

`.column` or `.columns` is used to identify columns. Use span modifier for appropriate sizes:

`.one.column`, `.two.column`, `.three.columns`, ... `.twenty-four.columns` will set spanned widht to the corresponding column.

Last column is automatically floated to the right (helps with browser rounding problems).
`.two.columns.last` is used to force column to be the last one (useful when used together with `.column.centered`.
`.three.columns.end` is used to do the opposite to `.last`, that is to tell column to float in the same direction as preceding columns.
`.one.column.centered` is used to center the column within the container

`.flush-right` and `.flush-left` are used to flush elements to corresponding side.

Add `.show-grid` on a container to display grid guides (using the settings above).

Use `.show-column-sizes` on container to display width on each column

---

You can find more information about how to use each mixin, function in Bedrock Sass files.

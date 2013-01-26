Stratum
=======

Stratum is a Sass toolkit for Web Developers. Its goal is to get you started on a project in seconds and do all the heavy lifting, while you concentrate on the fun stuff.

Stratum is installed from command line:

`gem install stratum`

Once you install gem you can install/update Stratum in directly in your project. Remember, Stratum is just a collection of Sass mixins and utilities. No external dependencies. Just drop it in your project and start using.

---

Command line
------------

The following commands are available:

```
stratum help        Show help on specific commands (e.g. stratum help install)

stratum install     Install Stratum in `./stratum`
	-p [--path=./]	   Installation path (current directory if omitted)
	-f [--force]	   Force installation into existing directory

stratum update      Update `./stratum` in the current directory

stratum remove      Removed `./stratum` in the current directory

stratum version     Show gem version
    -v [--version]
```

Sass components
---------------

Stratum is written in SCSS version of Sass syntax. It consists of several main components and a number of utilities and helpers.

* **Layout** – grids, scaffolding responsiveness
* **Forms** - form elements
* **CSS3** - mixins for cross-browser support of CSS3 properties
* **Utils** - various utilities and helpers

### Layout

Stratum features a powerful grid system which comes with semantic definitions and scaffolding. Grid is available in fluid and pixel variants and can be mixed on the same page.

Grids can also be nested. Nested grids are always fluid even if they are nested within pixel grids. This way columns and gutters (column margins) are always fitted within containing columns.

#### The Grid

The grid is system is quite unique in that it doesn't expect you to calculate and define all its variables (grid size, number of columns, column width and gutter width) but only needs two critical values: *grid size* and *column count*. The third value, *gutter width* is a soft value, meaning that it will be calculated within a range to find the nearest round value that fits into grid parameters.

For example, if you want a grid base on the following parameters:

**Requirements**: grid width: **980**, column count: **12**, desired gutter: **20**

**Output**: grid width: **980**, columns: **12**, column width: **67**, actual gutter: **16**

The formula *(col-number * col-width) + ((col-number - 1) * gutter-width)* produces *(12 * 67) + (11 * 16) = 980*

These result is the width of columns and gutters that fit into the grid perfectly.

Let's try another one:

**Requirements**: grid width: **934**, grid columns: **11**, desired gutter: **13px**

**Output**: grid width: **934**, columns: **11**, column width: **74**, actual gutter: **12**

The fluid grid converts pixel values in percentage ratios, so the latter grid becomes: grid width: **934**, columns: **11**, column width: **7.82241%** and actual gutter: **1.2685%** (column to gutter ratio is 7.16667/10).

This makes it easy to experiment with different layouts easily, trying out various grids on the fly.
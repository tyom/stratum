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

#### The Grid

Stratum's grid system is quite unique in that it doesn't expect you to calculate and define all its parameters (grid size, number of columns, column width and gutter width). Instead, it asks for only two concrete values *grid size* and *column count*. The third value, *gutter width* is a desired number, meaning that the exact round value will be calculated to fit the columns and gutters right within the specified width.

For example, if you want to produce a standard **980px** grid with **12** columns:

| Parameters      | Requirements   | Pixel         | Fluid
|-----------------|----------------|---------------|-------------
| gutter          | 20px (desired) | 16px (actual) | 6.72691%
| column width    | --             | 67px          | 1.60642%

Formula: *(col-number * col-width) + ((col-number - 1) * gutter-width)*  
Result: *(12 * 67) + (11 * 16) = 980*

Column and gutter widths are variable where grid width and column count are constant. Stratum adjusts the variables until they fit the requirement.

Let's try another one, **11** columns in **934px** container.

| Parameters      | Requirements   | Pixel         | Fluid
|-----------------|----------------|---------------|-------------
| gutter          | 13px (desired) | 12px (actual) | 7.82241%
| column width    | --             | 74px          | 1.2685%
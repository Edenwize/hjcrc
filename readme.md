The Judeo-Catholic system has been around for a long time. It's details need better explanation.

I wrote this document in markdown to allow easy editing. The raw document is titled [hjcrc.md](https://github.com/EdenWise/hjcrc/blob/main/HJCSIC_part1.md)

I list the steps below that I take to convert it to a Microsoft Word document. It will look like one I have [here](http://tinyurl.com/hjcr1).

## Template Build

Pandoc can import what is basically a style sheet to design the document. The allowable styles are limited but it still gets a fair amount of formatting. I may be able to do more with [Pandoc's Input Method](https://pandoc.org/MANUAL.html#input), I have yet to try.

I first generated a template and then I imported the matching styles from my original Microsoft-Word document. To generate a template with default settings:

    pandoc.exe --output template.docx --print-default-data-file reference.docx

### Styles Import from Existing Document

I then imported matching styles from an existing document to `template.docx`:

* Microsoft Word open `hjcrc.docx` > File > Options > Ribbon > +Developer 
  * Dev Tab > Document Template > Organizer > Copy all styles to right and Close.
* Microsoft Word open `template.docx`  > Word-and-tmple.docx: Organizer > copy styles to left.

## Things to do before conversion:

First, Pandoc needs help to convert SVGs to PNG and uses the program [librsvg](https://wiki.gnome.org/action/show/Projects/LibRsvg). I found an old one for Windows online that still seems to work good: [rsvg-convert.exe](https://opensourcepack.blogspot.com/2012/06/rsvg-convert-svg-image-conversion-tool.html) (I have a copy if needed). Here is the line that `pandoc.exe` probably uses to convert them: `rsvg-convert.exe --format=png --dpi-x=220 --dpi-y=220 --output <name>.png <name>.svg`

Second, any SVGs will need the fonts to be converted to paths (Object to Path). The above program renders them poorly otherwise.

## Word-Document styling that has to be done:

Images Align:

* Image click > Text Wrapping: Tight; See more...
  * Tab_Position:      Alignment > Right (relative to Column)
  * Tab_Text-Wrapping: Wrap text: Left only
    
* Bullet Lists Spacing reduce:
  * Item right-click > Paragraph:
    * Spacing (Before and After): 0 pt.
  * Home > Select *Compact* > right-click and select Modify> Format> Paragraph:
    * Spacing (Before and After) to 0 pt

* Bullet Lists text indentation reintroduce:
  * Bullet right-click > Adjust List Indents > More >>
    * Text indent at:     0"
    * Follow number with: Space

* Spacing and Indentation for First Paragraph and Body Text (in template!):
  * Body Text and First Paragraph put I-Bar on, right-Click each one select Paragraph
    * Indentation:          Special: First Line; By: 0.2"
    * ~~Spacing:              Before and After: 0pt; Line spacing: Single~~

* Heading Spacing reintroduce (in template!):
  * Headings put I-Bar on, right-Click each one select Paragraph
    * ~~Spacing             Before:          0 pt; Line spacing: Single~~

## To Do and Extraneous

* Pandoc/Markdown image attributes still fail (width, align, others)?
* Paragraph spacing (template.docx only allows basic format options.) may be helped with.
  * [General writer options](https://pandoc.org/MANUAL.html#general-writer-options-1)
* **Side note**: I converted my original document (written in MS word) to markdown with this command* (`--wrap=none` because text editors have the ability to do word wrapping [pandoc by default will insert newlines at 72 characters]): `pandoc.exe --from docx --to markdown --wrap=none .\hjcrc.docx --output .\hjcrc.md`)

---

I tried to define paragraph indents via the `pandoc.exe` `--variable` option, but it failed (FYI: variables only work on templates):

    -V KEY[=VAL],           --variable=KEY[:VAL]
    -V KEY[:SUBKEY][=VAL],  --variable=KEY[:SUBKEY][:=VAL] (e.g. -V geometry:margin=1in)
    pandoc.exe --output template.docx -V indent=2m           --print-default-data-file reference.docx   
    pandoc.exe --output template.docx --variable=indent:2in  --print-default-data-file reference.docx~~
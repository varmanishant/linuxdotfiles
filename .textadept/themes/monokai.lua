-- Monokai Theme

local buffer = buffer
local property = buffer.property
local property_int = buffer.property_int

property['color.base00'] = 0x222827
property['color.base01'] = 0x303838
property['color.base02'] = 0x3e4849
property['color.base03'] = 0x5e7175
property['color.base04'] = 0x859fa5
property['color.base05'] = 0xf2f8f8
property['color.base06'] = 0xf1f4f5
property['color.base07'] = 0xf5f8f9
property['color.base08'] = 0x7226f9
property['color.base09'] = 0x1f97fd
property['color.base0A'] = 0x75bff4
property['color.base0B'] = 0x2ee2a6
property['color.base0C'] = 0xe4efa1
property['color.base0D'] = 0xefd966
property['color.base0E'] = 0xff81ae
property['color.base0F'] = 0x3366cc

-- Predefined Styles

property['style.default'] = 'font:%(font),size:%(fontsize),'..
                            'fore:%(color.base05),back:%(color.base00)'
property['style.linenumber'] = 'fore:%(color.base02),back:%(color.base00)'
property['style.bracelight'] = 'fore:%(color.base0C),underlined'
property['style.bracebad'] = 'fore:%(color.base08)'
property['style.controlchar'] = '%(style.nothing)'
property['style.indentguide'] = 'fore:%(color.base03)'
property['style.calltip'] = 'fore:%(color.base02),back:%(color.base07)'

-- Token Styles

property['style.class'] = 'fore:%(color.base0A)'
property['style.comment'] = 'fore:%(color.base03)'
property['style.constant'] = 'fore:%(color.base09)'
property['style.embedded'] = 'fore:%(color.base0F),back:%(color.base01)'
property['style.error'] = 'fore:%(color.base08),italics'
property['style.function'] = 'fore:%(color.base09)'
property['style.identifier'] = ''
property['style.keyword'] = 'fore:%(color.base0D)'
property['style.label'] = 'fore:%(color.base09)'
property['style.number'] = 'fore:%(color.base0C)'
property['style.operator'] = 'fore:%(color.base0E)'
property['style.preprocessor'] = 'fore:%(color.base0A)'
property['style.regex'] = 'fore:%(color.base0C)'
property['style.string'] = 'fore:%(color.base0B)'
property['style.type'] = 'fore:%(color.base0E)'
property['style.variable'] = 'fore:%(color.base0D)'
property['style.whitespace'] = ''

-- Caret and Selection Styles

buffer:set_sel_fore(true, property_int['color.base00'])
buffer:set_sel_back(true, property_int['color.base05'])
buffer.caret_fore = property_int['color.base07']
buffer.caret_line_back = property_int['color.base01']

-- Fold Margin

buffer:set_fold_margin_colour(true, property_int['color.base00'])
buffer:set_fold_margin_hi_colour(true, property_int['color.base00'])

-- Markers

local MARK_BOOKMARK = textadept.bookmarks.MARK_BOOKMARK
local run = textadept.run
buffer.marker_back[MARK_BOOKMARK] = property_int['color.base0D']
buffer.marker_back[run.MARK_WARNING] = property_int['color.base0A']
buffer.marker_back[run.MARK_ERROR] = property_int['color.base08']
-- Fold Margin Markers
for i = 25, 31 do
  buffer.marker_fore[i] = property_int['color.base00']
  buffer.marker_back[i] = property_int['color.base03']
  buffer.marker_back_selected[i] = property_int['color.base02']
end

-- Indicators

local INDIC_BRACEMATCH = textadept.editing.INDIC_BRACEMATCH
local INDIC_HIGHLIGHT = textadept.editing.INDIC_HIGHLIGHT
buffer.indic_fore[INDIC_BRACEMATCH] = property_int['color.base06']
buffer.indic_fore[INDIC_HIGHLIGHT] = property_int['color.base0F']
buffer.indic_alpha[INDIC_HIGHLIGHT] = 255

-- Long Lines

buffer.edge_colour = property_int['color.base01']

-- Diff Lexer

property['color.red'] = property['color.base08']
property['color.green'] = property['color.base0B']
property['color.yellow'] = property['color.base0A']

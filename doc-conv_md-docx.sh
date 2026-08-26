# Document converter for Markdown to MS-Word
#

FILE_MD="index.md"
FILE_DC="HJCSIC.docx"
EDITION="00"
DATE=$(date +%Y-%m-%d)

# Date prepend to document.
#
# ( Get-Content -Path "$FILE_MD" ) -replace "${EDITION}_[2][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]", "${EDITION}_$DATE" | Set-Content -Path "$FILE_MD"

# Git: Tag add to commit (as date).
#
# if ( -not $(git.exe tag --list "${EDITION}_$DATE") ) {
#  git.exe tag --annotate "${EDITION}_$DATE" --message="${EDITION}_$DATE"
#  if ( $? ) { echo "Git: Tagged revision as: ${EDITION}_$DATE" }
#}

# Convert
#
pandoc $FILE_MD \
  --from markdown \
  --to docx \
  --dpi=300 \
  --wrap=none \
  --output $FILE_DC \
  --reference-doc=template.docx

# Help for Git
#
# git.exe help tag
# https://git-scm.com/book/en/v2/Git-Basics-Tagging
# https://stackoverflow.com/a/46434732

# Font tests
#
# Lora            9.3   too high!? 414
# Merriweather    9.3
# Georgia         8.5   in word, good normal font, a bit tight though
# Roboto Slab     8.5   good font but a bit blocky
# Constantia      8.0   odd size... a bit small!?
# Crimson Text    8.0?  9.0 nice font but small?! Printing was scaled :(.
# Noto Serif      7.0   blocky
# EB Garramond    6.0
# Others (screen tested): Domine A, Noto Serif B, Source_Serif_4 B


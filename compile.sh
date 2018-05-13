FILES=texts/*.md
for f in $FILES
do
  # extension="${f##*.}"
  filename="${f%.*}"
  echo "Converting $f to $filename.html"
  pandoc $f -t html -o $filename.html
  # uncomment this line to delete the source file.
  # rm $f
done

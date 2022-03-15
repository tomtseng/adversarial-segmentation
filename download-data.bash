ZIP_FILENAME="data/coco-val2017.zip"
UNZIP_DIR="data/val2017"

# Download the COCO validation set. We're repurposing the validation set for
# train/test because it's smaller than the real train/test set.
if ! [ -f ${ZIP_FILENAME} ]; then
  mkdir -p data
  curl -o ${ZIP_FILENAME} "http://images.cocodataset.org/zips/val2017.zip"
fi
if ! [ -d ${UNZIP_DIR} ]; then
  unzip ${ZIP_FILENAME}
  mv val2017 ${UNZIP_DIR}
fi

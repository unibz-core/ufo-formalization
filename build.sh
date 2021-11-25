# VARIABLES
SRC_DIR="./src"
AXIOMS_SRC_DIR="$SRC_DIR/axioms"
CONJECTURES_SRC_DIR="$SRC_DIR/conjectures"
INSTANCES_SRC_DIR="$SRC_DIR/instances"

BUILD_DIR="./build"
AXIOMS_BUILD_DIR="$BUILD_DIR/axioms"
CONJECTURES_BUILD_DIR="$BUILD_DIR/conjectures"
INSTANCES_BUILD_DIR="$BUILD_DIR/instances"

# Clean up build folder

if [ -d "$BUILD_DIR" ]
then
  rm -drf $BUILD_DIR
fi
mkdir $BUILD_DIR

BUILD_DIR_NAMES="$AXIOMS_BUILD_DIR $CONJECTURES_BUILD_DIR $INSTANCES_BUILD_DIR"
for DIR_NAME in $BUILD_DIR_NAMES
do
  mkdir $DIR_NAME
done

# Build axioms file

AXIOMS_FILES=$(ls $AXIOMS_SRC_DIR)
AXIOMS_BUILD_FILE="$AXIOMS_BUILD_DIR/axioms.p"
for AXIOMS_FILE in $AXIOMS_FILES
  do
    cat "$AXIOMS_SRC_DIR/$AXIOMS_FILE" >> $AXIOMS_BUILD_FILE
    echo "\n" >> $AXIOMS_BUILD_FILE
done

# Build conjectures files

CONJECTURES_FILES=$(ls $CONJECTURES_SRC_DIR)
for CONJECTURES_FILE in $CONJECTURES_FILES
  do
    cat "$AXIOMS_BUILD_FILE" >> "$CONJECTURES_BUILD_DIR/$CONJECTURES_FILE"
    cat "$CONJECTURES_SRC_DIR/$CONJECTURES_FILE" >> "$CONJECTURES_BUILD_DIR/$CONJECTURES_FILE"
done

# Build instances files

INSTANCES_FILES=$(ls $INSTANCES_SRC_DIR)
for INSTANCES_FILE in $INSTANCES_FILES
  do
    cat "$AXIOMS_BUILD_FILE" >> "$INSTANCES_BUILD_DIR/$INSTANCES_FILE"
    cat "$INSTANCES_SRC_DIR/$INSTANCES_FILE" >> "$INSTANCES_BUILD_DIR/$INSTANCES_FILE"
done

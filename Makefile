SHELL = /bin/sh
CC = crystal build
# ALLEGRO_FLAGS = $$(pkg-config allegro-5 allegro_main-5 allegro_font-5 allegro_ttf-5 allegro_image-5 allegro_primitives-5 --libs --cflags)
BUILD_DIR = build
OUT_FILE = ${BUILD_DIR}/allegro_hello.o
SOURCE_FILES = src/allegro_hello.cr

build_and_run: clean run

clean:
	if [ ! -d "./${BUILD_DIR}" ]; then mkdir "${BUILD_DIR}"; else env echo "cleaning..." && rm -r ${BUILD_DIR}; mkdir "${BUILD_DIR}"; fi

${OUT_FILE}:
	${CC} ${SOURCE_FILES} -o ${OUT_FILE} --error-trace

run: ${OUT_FILE}
	./${OUT_FILE}

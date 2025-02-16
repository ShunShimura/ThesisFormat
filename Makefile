.PHONY: create, clean

MODE := slide
TARGET := $(MODE).pdf
OBJECT := .obj
SOURCE := ./src
TARGET_TEX := $(patsubst %.pdf,$(SOURCE)/$(MODE)/%.tex,$(TARGET))
TARGET_DVI := $(patsubst %.pdf,$(OBJECT)/$(MODE)/%.dvi,$(TARGET))
TARGET_BIB := $(patsubst $(SOURCE)/%.tex,$(OBJECT)/%,$(TARGET_TEX))
FIG := $(shell find ./fig -type f -not -name "*.gitkeep")
STY := $(shell find ./sty -type f -name *.sty)
TEX := $(shell find $(SOURCE)/$(MODE) -type f -name *.tex)
BIB := .bib

FLAGS := -halt-on-error\
	-interaction=nonstopmode\
	-shell-escape\
	-file-line-error\
	-synctex=1\
	-kanji=utf8\
	-output-directory=$(OBJECT)/$(MODE) # texの出力ファイルの位置を指定

create: $(OBJECT)/$(MODE) $(TARGET)

$(OBJECT)/$(MODE):
	mkdir -p $(OBJECT)/$(MODE)

$(TARGET): $(TARGET_DVI) $(FIG) # 実行順序は依存関係によって決まる！
	@ dvipdfmx $< -o $(TARGET)

$(TARGET_DVI): $(TARGET_TEX) $(TEX) $(STY) $(BIB) 
	@ platex $(FLAGS) $<
	@ if [ -s $(BIB) ]; then pbibtex $(TARGET_BIB); platex $(FLAGS) $<; fi
	@ platex $(FLAGS) $<

clean: 
	rm -rf *.pdf $(OBJDIR)

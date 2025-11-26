TEMP ?= $(HOME)/.cache
DIR := c_src
PRIV_DIR := $(MIX_APP_PATH)/priv

HAILO_SO = $(PRIV_DIR)/libhailo.so
HAILO_SOURCES = $(DIR)/hailo.cpp

CFLAGS += -fPIC -I$(FINE_INCLUDE_DIR) -fvisibility=hidden -I$(ERTS_INCLUDE_DIR) -Wall -std=c++17
LDFLAGS := -shared -lhailort

all: $(HAILO_SO)

$(HAILO_SO): $(HAILO_SOURCES)
	mkdir -p $(PRIV_DIR)
	$(CXX) $(CFLAGS) $(HAILO_SOURCES) -o $(HAILO_SO) $(LDFLAGS)

format:
	clang-format -i $(DIR)/*

clean:
	@rm -rf $(HAILO_SO)

.PHONY: format

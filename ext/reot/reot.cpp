// ttf2eot for ruby
// just using ruby Module with singleton method instead of cli
// Orignial code:
// http://code.google.com/p/ttf2eot/

// Include the Ruby headers and goodies
#include "ruby.h"
#include "OpenTypeUtilities.h"

VALUE Reot = Qnil;

extern "C" void Init_reot();

extern "C" VALUE method_convert(VALUE self, VALUE filepath);

extern "C" void Init_reot() {
  Reot = rb_define_module("Reot");
  rb_define_singleton_method(Reot, "convert!", (VALUE(*)(...))&method_convert, 1);
}

extern "C" VALUE method_convert(VALUE self, VALUE filepath) {
  const size_t kFontInitSize = 8192;
  vector<uint8_t> eotHeader(512);
  size_t overlayDst = 0;
  size_t overlaySrc = 0;
  size_t overlayLength = 0;
  size_t fontSize = kFontInitSize;
  size_t fontOff = 0;
  FILE *input, *output;
  unsigned char *fontData;

  char *input_file;
  input_file = StringValuePtr(filepath);

  char output_file[strlen(input_file) + 4];
  strcpy(output_file, input_file);
  strcat(output_file, ".eot");

  input = fopen(input_file, "rb");
  output = fopen(output_file, "wb");

  if ((fontData = (unsigned char *) malloc(fontSize)) == NULL) {
    return Qfalse;
  }

  if(!input && !output) {
    return Qfalse;
  }

  do {
    size_t ret = fread(fontData + fontOff, 1, fontSize - fontOff, input);
    if (ret && fontSize <= SIZE_MAX / 2) {
      fontOff += ret;
      if ((fontData = (unsigned char *) realloc(fontData, fontSize *= 2)) == NULL) {
        return Qfalse;
      }
    } else if (ret) {
      return Qfalse;
    } else {
      fontData = (unsigned char *) realloc(fontData, fontSize = fontOff);
      break;
    }
  } while (true);

  if (getEOTHeader(fontData, fontSize, eotHeader, overlayDst, overlaySrc, overlayLength)) {
    fwrite(&eotHeader[0], eotHeader.size(), 1, output);
    fwrite(fontData, fontSize, 1, output);
    return Qtrue;
  } else {
    return Qfalse;
  }
}

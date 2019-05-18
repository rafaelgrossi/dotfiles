#ifndef VIOLETEG
#define VIOLETEG

static const char *colorname[] = {
	/* 8 normal colors */
	"#20262C",
	"#db86ba",
	"#74dd91",
	"#e49186",
	"#75dbe1",
	"#b4a1db",
	"#9ee9ea",
	"#f1fcf9",

	/* 8 bright colors */
	"#465463",
	"#d04e9d",
	"#4bc66d",
	"#db695b",
	"#3dbac2",
	"#825ece",
	"#62cdcd",
	"#e0e5e5",

	[255] = 0,

	/* more colors can be added after 255 to use with DefaultXX */
	"#c574dd",
	"#333333",
	"#353535", // background
	"#e2a76d", // foreground
};

#endif

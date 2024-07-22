// Modify this file to change what commands output to your statusbar, and
// recompile using the make command.
static const Block blocks[] = {
    /*Icon*/ /*Command*/ /*Update Interval*/ /*Update Signal*/
    {"<\x02 ", "/home/jos/.config/dwmblocks/scripts/network.sh", 1, 0},

    {"\x03  ", "/home/jos/.config/dwmblocks/scripts/cpu.sh", 1, 0},

    {"\x04  ", "/home/jos/.config/dwmblocks/scripts/cputem.sh", 1, 0},

    {"\x05  ", "/home/jos/.config/dwmblocks/scripts/memory.sh", 5, 0},

    {"\x06", "/home/jos/.config/dwmblocks/scripts/disk.sh", 100, 0},

    {"\x07🔋  ", "/home/jos/.config/dwmblocks/scripts/battery.sh", 5, 0},

    {"\x08  ", "pamixer --get-volume-human", 1, 0},

    {"\x09  ", "/home/jos/.config/dwmblocks/scripts/time.sh", 5, 0},
};

// sets delimeter between status commands. NULL character ('\0') means no
// delimeter.
static char delim[] = "<";
static unsigned int delimLen = 5;

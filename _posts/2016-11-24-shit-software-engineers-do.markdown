---
layout: post
title: Shit software engineers do.
image: http://img.wonderhowto.com/img/86/37/63568648324037/0/c-c-programming-for-hackers-part-2-history-c-and-coding-our-first-program.1280x600.jpg
date: '2016-11-24 15:12:07'
---

A lot of macOS is opensource, Apple periodically releases part of its killer OS so that the general public (or a subset of it who happen to understand code) can go through it.

Now, a [guy](https://github.com/turbo) ran a grep (a program to search across a [text] file for specific things) to filter the comments in the macOS WinNT Kernel.

He has shared it [here](https://gist.github.com/turbo/75f0905275c29a3049f983cfe273eae2).

Following are a few hilarious bits I found in it:

`../tdi/tcpip/tcp/tcpsend.c:// STUPID FUCKING COMPILER generates incorrect code for this.
`

`../fastfat/allocsup.c://  God knows what state we left the disk allocation in.
`

`../dd/histgram/cmd/perfhist/perfhist.c:// the heck? we are gods anyways!
`

`../nthals/halntp/mips/xxinitnt.c:// to the HAL by the NT god. Hail Caesar!
`

`../w32/ntgdi/client/dcquery.c:// if cjotma == 0, this is HONEST to God unicode font, can not convert
`

`../w32/ntgdi/fondrv/tt/ttfd/fontfile.h:// honest to God msft unicode font
`

`../w32/ntgdi/fondrv/tt/ttfd/tt.h://     uint16 reservedPad;         // only God knows why
`

`../se/ctlpcqos.c:// Appease the compiler Gods.
`

`../cntfs/create.c://  Here is the  "M A R K   [REDACTED]"  hack from hell.
`

`../afd/disconn.c:// Hack-O-Rama. TDI has a fundamental flaw in that it is often impossible
`

`../afd/disconn.c:// Yet another hack to keep it from crashing
`

`../fastfat/read.c://  Deal with stupid people who open the volume DASD with
`

`../afd/recvdg.c:// Bomb off if the user is trying to do something stupid, like
`

> If that is what they do at Apple, how could we blame the mere mortals?


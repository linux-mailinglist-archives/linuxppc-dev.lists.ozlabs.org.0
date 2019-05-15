Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6141F1E74A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 06:06:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453gwZ5xXRzDqQf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 14:06:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.82; helo=conssluserg-03.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="CDu+5Mm7"; 
 dkim-atps=neutral
Received: from conssluserg-03.nifty.com (conssluserg-03.nifty.com
 [210.131.2.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453gvC3WTMzDqNs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 14:05:25 +1000 (AEST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id x4F454Hv031858
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 13:05:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x4F454Hv031858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1557893105;
 bh=QXsCEwCOT8dSlZT3vBX54289D2U7bwg2IlfNnETiDDQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CDu+5Mm7AxKWm14tUoEu7Wd+zPGqd01/i1iOvp0sWOGNg7Y+gCYSOPWx3mhSHkwU2
 0x18nGBuKpF0odOH/Xxp9dLDBS/mCmdZEsXxLQOvuGO8FkgK1ZAI/PmhSy62xqge0G
 chCK4vl9UEGPC3wVicnmdXqL4RZ38nEZ97byAPmF3lHbLtNvVYpy+uLSrtD0ht98s4
 3vcM5PMc9YYau92//IF0j81rqSno8yxO4J8ds3n9oV6mNyAxwjUzDhvFlsMG36fm7K
 8+OL9pCumw8mFHn3WvZnmUrPynN0RNx8kjB+IgnHr7XjTiBprfO/TLdQVkMs3qXcxC
 Kv9OFyDeaLEdg==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id j184so751326vsd.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 21:05:04 -0700 (PDT)
X-Gm-Message-State: APjAAAWjAosw5EOzgnbKkPYP3qtfZhhhf6iSc6Wsz/y7ENKpeT3Ttd4N
 V2kZJeb7vYo94udSGaNvVb7qLYOcBdgl8jju6NM=
X-Google-Smtp-Source: APXvYqwsU+rSHu8NSKuZNBBErQInp9T2BBh9v46SzTAusxEAN6a0CyYBMRzJNxcEh9PuxZPZ0PdNUIvxzkLzR43ZZbg=
X-Received: by 2002:a67:d382:: with SMTP id b2mr2582839vsj.155.1557893103697; 
 Tue, 14 May 2019 21:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190513112254.22534-1-yamada.masahiro@socionext.com>
 <CAOSf1CFqiKK-=aRU0kYPajY8rmjrFVdMi+AA692rXwLrC7S2Lg@mail.gmail.com>
In-Reply-To: <CAOSf1CFqiKK-=aRU0kYPajY8rmjrFVdMi+AA692rXwLrC7S2Lg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 15 May 2019 13:04:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT-ZcihM+XB39oxaagckvKXTwgvar-7m0AoTSPi-ezvJg@mail.gmail.com>
Message-ID: <CAK7LNAT-ZcihM+XB39oxaagckvKXTwgvar-7m0AoTSPi-ezvJg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/boot: fix broken way to pass CONFIG options
To: Oliver <oohall@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>,
 "Rodrigo R. Galvao" <rosattig@linux.vnet.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 13, 2019 at 11:24 PM Oliver <oohall@gmail.com> wrote:
>
> On Mon, May 13, 2019 at 9:23 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > Commit 5e9dcb6188a4 ("powerpc/boot: Expose Kconfig symbols to wrapper")
> > was wrong, but commit e41b93a6be57 ("powerpc/boot: Fix build failures
> > with -j 1") was also wrong.
> >
> > Check-in source files never ever depend on build artifacts.
> >
> > The correct dependency is:
> >
> >   $(obj)/serial.o: $(obj)/autoconf.h
> >
> > However, copying autoconf.h to arch/power/boot/ is questionable
> > in the first place.
> >
> > arch/powerpc/Makefile adopted multiple ways to pass CONFIG options.
> >
> > arch/powerpc/boot/decompress.c references CONFIG_KERNEL_GZIP and
> > CONFIG_KERNEL_XZ, which are passed via the command line.
> >
> > arch/powerpc/boot/serial.c includes the copied autoconf.h to
> > reference a couple of CONFIG options.
> >
> > Do not do this.
> >
> > We should have already learned that including autoconf.h from each
> > source file is really fragile.
> >
> > In fact, it is already broken.
> >
> > arch/powerpc/boot/ppc_asm.h references CONFIG_PPC_8xx, but
> > arch/powerpc/boot/utils.S is not given any way to access CONFIG
> > options. So, CONFIG_PPC_8xx is never defined here.
> >
> > Just pass $(LINUXINCLUDE) and remove all broken code.
>
> I'm not sure how safe this is.


I chose to use $(LINUXINCLUDE) since this is
what other boot decompressors do.
(e.g. arch/arm/boot/compressed)

With this, two headers are included:
include/linux/kconfig.h
include/generated/autoconf.h

The first one enables to use IS_ENABLE(), etc.
The second one is the list of CONFIG options.

If you want to minimize the number of included headers,
 you can add
-include include/generated/autoconf.h instead.


> The original reason for the
> CONFIG_KERNEL_XZ hack in the makefile was because the kernel headers
> couldn't be included directly. The bootwrapper is compiled with a
> 32bit toolchain when the kernel is compiled for 64bit big endian
> because of older systems with broken firmware that can't load 64bit
> ELFs directly.

I do not see CONFIG_32BIT or CONFIG_64BIT  in arch/power/boot.

If you are saying "including autoconf.h itself is bad",
we should revert 5e9dcb6188a40e604e66dc30fab30c2be89aa1cc
But, I doubt it.


> When I added XZ support to the wrapper I did experiment
> with including the kernel headers directly and couldn't make it work
> reliably.

Right. I am pretty sure it won't work.
But, it is unrelated to including CONFIG options.


I am not a PPC developer, so I am not excited about
looking into boot wrapper.

When I was seeing Makefiles for my Kbuild refactoring,
I found
$(srctree)/$(src)/serial.c: $(obj)/autoconf.h
then I shuddered.


If PPC folks want to keep the breakage as is,
I can send the following.

It it Michael's call.

--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -202,7 +202,7 @@ $(obj)/empty.c:
 $(obj)/zImage.coff.lds $(obj)/zImage.ps3.lds : $(obj)/%: $(srctree)/$(src)/%.S
        $(Q)cp $< $@

-$(srctree)/$(src)/serial.c: $(obj)/autoconf.h
+$(obj)/serial.o: $(obj)/autoconf.h

 $(obj)/autoconf.h: $(obj)/%: $(objtree)/include/generated/%
        $(Q)cp $< $@




> I don't remember what the exact reason was, but I think it
> was something to do with the generated headers not always matching
> what you would expect when compiling for 32bit. It's also possible I
> was just being paranoid. Either way it's about time we found a real
> fix...
>
> The stuff in serial.c and ppc_asm.h was added later to work around
> other issues without anyone thinking too hard about it. Oh well.
>
> > I also removed the -traditional flag to make include/linux/kconfig.h
> > work. I do not understand why it needs to imitate the behavior of
> > pre-standard C preprocessors.
>
> I'm not sure why it's there either. The boot wrapper was re-written at
> some point so it might just be a hold over from the dawn of time.
>
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> >  arch/powerpc/boot/.gitignore |  2 --
> >  arch/powerpc/boot/Makefile   | 14 +++-----------
> >  arch/powerpc/boot/serial.c   |  1 -
> >  3 files changed, 3 insertions(+), 14 deletions(-)
> >
> > diff --git a/arch/powerpc/boot/.gitignore b/arch/powerpc/boot/.gitignore
> > index 32034a0cc554..6610665fcf5e 100644
> > --- a/arch/powerpc/boot/.gitignore
> > +++ b/arch/powerpc/boot/.gitignore
> > @@ -44,5 +44,3 @@ fdt_sw.c
> >  fdt_wip.c
> >  libfdt.h
> >  libfdt_internal.h
> > -autoconf.h
> > -
> > diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> > index 73d1f3562978..b8a82be2af2a 100644
> > --- a/arch/powerpc/boot/Makefile
> > +++ b/arch/powerpc/boot/Makefile
> > @@ -20,9 +20,6 @@
> >
> >  all: $(obj)/zImage
> >
> > -compress-$(CONFIG_KERNEL_GZIP) := CONFIG_KERNEL_GZIP
> > -compress-$(CONFIG_KERNEL_XZ)   := CONFIG_KERNEL_XZ
> > -
> >  ifdef CROSS32_COMPILE
> >      BOOTCC := $(CROSS32_COMPILE)gcc
> >      BOOTAR := $(CROSS32_COMPILE)ar
> > @@ -34,7 +31,7 @@ endif
> >  BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
> >                  -fno-strict-aliasing -O2 -msoft-float -mno-altivec -mno-vsx \
> >                  -pipe -fomit-frame-pointer -fno-builtin -fPIC -nostdinc \
> > -                -D$(compress-y)
> > +                $(LINUXINCLUDE)
> >
> >  ifdef CONFIG_PPC64_BOOT_WRAPPER
> >  BOOTCFLAGS     += -m64
> > @@ -51,7 +48,7 @@ BOOTCFLAGS    += -mlittle-endian
> >  BOOTCFLAGS     += $(call cc-option,-mabi=elfv2)
> >  endif
> >
> > -BOOTAFLAGS     := -D__ASSEMBLY__ $(BOOTCFLAGS) -traditional -nostdinc
> > +BOOTAFLAGS     := -D__ASSEMBLY__ $(BOOTCFLAGS) -nostdinc
> >
> >  BOOTARFLAGS    := -cr$(KBUILD_ARFLAGS)
> >
> > @@ -202,14 +199,9 @@ $(obj)/empty.c:
> >  $(obj)/zImage.coff.lds $(obj)/zImage.ps3.lds : $(obj)/%: $(srctree)/$(src)/%.S
> >         $(Q)cp $< $@
> >
> > -$(srctree)/$(src)/serial.c: $(obj)/autoconf.h
> > -
> > -$(obj)/autoconf.h: $(obj)/%: $(objtree)/include/generated/%
> > -       $(Q)cp $< $@
> > -
> >  clean-files := $(zlib-) $(zlibheader-) $(zliblinuxheader-) \
> >                 $(zlib-decomp-) $(libfdt) $(libfdtheader) \
> > -               autoconf.h empty.c zImage.coff.lds zImage.ps3.lds zImage.lds
> > +               empty.c zImage.coff.lds zImage.ps3.lds zImage.lds
> >
> >  quiet_cmd_bootcc = BOOTCC  $@
> >        cmd_bootcc = $(BOOTCC) -Wp,-MD,$(depfile) $(BOOTCFLAGS) -c -o $@ $<
> > diff --git a/arch/powerpc/boot/serial.c b/arch/powerpc/boot/serial.c
> > index b0491b8c0199..9457863147f9 100644
> > --- a/arch/powerpc/boot/serial.c
> > +++ b/arch/powerpc/boot/serial.c
> > @@ -18,7 +18,6 @@
> >  #include "stdio.h"
> >  #include "io.h"
> >  #include "ops.h"
> > -#include "autoconf.h"
> >
> >  static int serial_open(void)
> >  {
> > --
> > 2.17.1
> >



--
Best Regards
Masahiro Yamada

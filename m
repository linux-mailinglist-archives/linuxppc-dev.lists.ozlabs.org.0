Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B29C21B7B6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 16:04:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452jHf5MLYzDq75
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 00:04:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z82dLbY2"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452jFQ2tnyzDq5y
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 00:02:48 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id s20so10079265ioj.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 07:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ovg954GffPAR7AevZQCuZIs5rIdETHY6khs2qmdJws=;
 b=Z82dLbY2oMqKccM8VxLLjFQWefFZRUYoG3r0b4fvIp7LTFzuYQvcH6PSpEWJh7dddu
 3WYBZZDTrdmcwCjeoUmefQv9xYzmoMHMliWP/pT7SQ4KCeGTu7i5yLw6MGXecZ26xB7p
 D3RJWPf7W87xJTAvT5Ny4vWw2JZ+gsTev9SVtec8UyB1fOdZRgGbimLpQTshTUmDJQY7
 inrrRfcJe53BJW+mX7+o610LQM/3C8tLjsDDKa4Xr1yPWRxfohlj7Ukyp4xhmthHCE4S
 sUyUq6XgJUtJIEgVJz50gsAGq6ww2Uk+8SfUggZFrykLYtM59gOKvFCt8Ki+rRn4G02x
 4Axg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ovg954GffPAR7AevZQCuZIs5rIdETHY6khs2qmdJws=;
 b=tUf4jCLmzAPXJtUo1x2FSUhE1ilGmewCBMF5jReXc0+BupPm3fZ4wREA0QrPoZHPLd
 l/NM9yGVKr+lHMS7+h9+WTYCi8L9bXWsiwaA2rbKcYftFOD+p1/jZaqa8hSuHEDbbM60
 XGSrq9tcdNFH4AMR/cVtsXm/PqKuoxMOwwCkI11vKY55knJ6ZCc/xTRbM29B7giBEvOs
 r+orgOSNwlBCvR8Q+vbVrNQ3Se17ryVCvOioPkgmMOynT8luLv9wzy8uHti0XH3M3E8U
 qDpiqFiDE4cxwEK4H1M9yMyEMy3+QdXIEquGXs7QVrj3zLdaYQGOrdwxcQv8R55YiA7w
 3ABg==
X-Gm-Message-State: APjAAAV1tLI/cT4IkOElxt+GLbXLeBidyX81CQnpoRZ9scQ0Nh4se/JP
 fymqmku21Zg6lz3mVWn0PZqiSOAiq/e0HJJU1+k=
X-Google-Smtp-Source: APXvYqyy6+utGEslOpzbdOEZZWo54czwOEFZnWtiqBBYY1yFGuNo1Lecw7hR2zwYnBYktpFxWDR0147370ewWOixJZg=
X-Received: by 2002:a6b:ce0e:: with SMTP id p14mr1251571iob.279.1557756165089; 
 Mon, 13 May 2019 07:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190513112254.22534-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190513112254.22534-1-yamada.masahiro@socionext.com>
From: Oliver <oohall@gmail.com>
Date: Tue, 14 May 2019 00:02:34 +1000
Message-ID: <CAOSf1CFqiKK-=aRU0kYPajY8rmjrFVdMi+AA692rXwLrC7S2Lg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/boot: fix broken way to pass CONFIG options
To: Masahiro Yamada <yamada.masahiro@socionext.com>
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

On Mon, May 13, 2019 at 9:23 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Commit 5e9dcb6188a4 ("powerpc/boot: Expose Kconfig symbols to wrapper")
> was wrong, but commit e41b93a6be57 ("powerpc/boot: Fix build failures
> with -j 1") was also wrong.
>
> Check-in source files never ever depend on build artifacts.
>
> The correct dependency is:
>
>   $(obj)/serial.o: $(obj)/autoconf.h
>
> However, copying autoconf.h to arch/power/boot/ is questionable
> in the first place.
>
> arch/powerpc/Makefile adopted multiple ways to pass CONFIG options.
>
> arch/powerpc/boot/decompress.c references CONFIG_KERNEL_GZIP and
> CONFIG_KERNEL_XZ, which are passed via the command line.
>
> arch/powerpc/boot/serial.c includes the copied autoconf.h to
> reference a couple of CONFIG options.
>
> Do not do this.
>
> We should have already learned that including autoconf.h from each
> source file is really fragile.
>
> In fact, it is already broken.
>
> arch/powerpc/boot/ppc_asm.h references CONFIG_PPC_8xx, but
> arch/powerpc/boot/utils.S is not given any way to access CONFIG
> options. So, CONFIG_PPC_8xx is never defined here.
>
> Just pass $(LINUXINCLUDE) and remove all broken code.

I'm not sure how safe this is. The original reason for the
CONFIG_KERNEL_XZ hack in the makefile was because the kernel headers
couldn't be included directly. The bootwrapper is compiled with a
32bit toolchain when the kernel is compiled for 64bit big endian
because of older systems with broken firmware that can't load 64bit
ELFs directly. When I added XZ support to the wrapper I did experiment
with including the kernel headers directly and couldn't make it work
reliably. I don't remember what the exact reason was, but I think it
was something to do with the generated headers not always matching
what you would expect when compiling for 32bit. It's also possible I
was just being paranoid. Either way it's about time we found a real
fix...

The stuff in serial.c and ppc_asm.h was added later to work around
other issues without anyone thinking too hard about it. Oh well.

> I also removed the -traditional flag to make include/linux/kconfig.h
> work. I do not understand why it needs to imitate the behavior of
> pre-standard C preprocessors.

I'm not sure why it's there either. The boot wrapper was re-written at
some point so it might just be a hold over from the dawn of time.

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  arch/powerpc/boot/.gitignore |  2 --
>  arch/powerpc/boot/Makefile   | 14 +++-----------
>  arch/powerpc/boot/serial.c   |  1 -
>  3 files changed, 3 insertions(+), 14 deletions(-)
>
> diff --git a/arch/powerpc/boot/.gitignore b/arch/powerpc/boot/.gitignore
> index 32034a0cc554..6610665fcf5e 100644
> --- a/arch/powerpc/boot/.gitignore
> +++ b/arch/powerpc/boot/.gitignore
> @@ -44,5 +44,3 @@ fdt_sw.c
>  fdt_wip.c
>  libfdt.h
>  libfdt_internal.h
> -autoconf.h
> -
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 73d1f3562978..b8a82be2af2a 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -20,9 +20,6 @@
>
>  all: $(obj)/zImage
>
> -compress-$(CONFIG_KERNEL_GZIP) := CONFIG_KERNEL_GZIP
> -compress-$(CONFIG_KERNEL_XZ)   := CONFIG_KERNEL_XZ
> -
>  ifdef CROSS32_COMPILE
>      BOOTCC := $(CROSS32_COMPILE)gcc
>      BOOTAR := $(CROSS32_COMPILE)ar
> @@ -34,7 +31,7 @@ endif
>  BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
>                  -fno-strict-aliasing -O2 -msoft-float -mno-altivec -mno-vsx \
>                  -pipe -fomit-frame-pointer -fno-builtin -fPIC -nostdinc \
> -                -D$(compress-y)
> +                $(LINUXINCLUDE)
>
>  ifdef CONFIG_PPC64_BOOT_WRAPPER
>  BOOTCFLAGS     += -m64
> @@ -51,7 +48,7 @@ BOOTCFLAGS    += -mlittle-endian
>  BOOTCFLAGS     += $(call cc-option,-mabi=elfv2)
>  endif
>
> -BOOTAFLAGS     := -D__ASSEMBLY__ $(BOOTCFLAGS) -traditional -nostdinc
> +BOOTAFLAGS     := -D__ASSEMBLY__ $(BOOTCFLAGS) -nostdinc
>
>  BOOTARFLAGS    := -cr$(KBUILD_ARFLAGS)
>
> @@ -202,14 +199,9 @@ $(obj)/empty.c:
>  $(obj)/zImage.coff.lds $(obj)/zImage.ps3.lds : $(obj)/%: $(srctree)/$(src)/%.S
>         $(Q)cp $< $@
>
> -$(srctree)/$(src)/serial.c: $(obj)/autoconf.h
> -
> -$(obj)/autoconf.h: $(obj)/%: $(objtree)/include/generated/%
> -       $(Q)cp $< $@
> -
>  clean-files := $(zlib-) $(zlibheader-) $(zliblinuxheader-) \
>                 $(zlib-decomp-) $(libfdt) $(libfdtheader) \
> -               autoconf.h empty.c zImage.coff.lds zImage.ps3.lds zImage.lds
> +               empty.c zImage.coff.lds zImage.ps3.lds zImage.lds
>
>  quiet_cmd_bootcc = BOOTCC  $@
>        cmd_bootcc = $(BOOTCC) -Wp,-MD,$(depfile) $(BOOTCFLAGS) -c -o $@ $<
> diff --git a/arch/powerpc/boot/serial.c b/arch/powerpc/boot/serial.c
> index b0491b8c0199..9457863147f9 100644
> --- a/arch/powerpc/boot/serial.c
> +++ b/arch/powerpc/boot/serial.c
> @@ -18,7 +18,6 @@
>  #include "stdio.h"
>  #include "io.h"
>  #include "ops.h"
> -#include "autoconf.h"
>
>  static int serial_open(void)
>  {
> --
> 2.17.1
>

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DFF4FC07
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 16:16:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Wvbn4BvNzDqRg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 00:16:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.80; helo=conssluserg-01.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="2PB1Mez5"; 
 dkim-atps=neutral
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com
 [210.131.2.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45WvW11n6yzDqX3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 00:11:56 +1000 (AEST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id x5NEBV6r026996
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2019 23:11:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x5NEBV6r026996
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1561299092;
 bh=IAWEC1k7JmeweyFBrRKSY79vqZflSYuq0o8X6SeOK3A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2PB1Mez515B6HihQQBQb8WCi8icDjimVH5dCRzYmYc/TOnguMs3KnV4K+DOss/ZEp
 PoxzI8Wb8AT6+T2+yfcew3XlJj7tCAByH9z+yd3x3kaJ6YyW6W8aOjgiasd8HGVshu
 xghLRo2vb6QdQ0ZwnaEUdoKZpBs5pFPezgo7h/AFZcwa5eNF1a6C2+n6M0S3iY3DjT
 xzf37AJjG+JNHOWB2Y2Wra2cebb4s4XnTS72pTi+nmJBjM8q/qLq59OiFFLqN4iX7q
 Byuk4YBpq50FFxjU41X/Qs7C3FghYyPCOHG/q09Dj+MOm8kdmqEzPfZzb7Wks2rX5R
 eYIyTUDhAOq3Q==
X-Nifty-SrcIP: [209.85.222.42]
Received: by mail-ua1-f42.google.com with SMTP id o2so4685854uae.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2019 07:11:32 -0700 (PDT)
X-Gm-Message-State: APjAAAUbLL+8/m9RdcTH/FIDEMwY8QgE6IbsxjJAkqpwk8ylCeVf4dWB
 imypbOoI2UHo/4QPA6HamlPbqphYb1DEKQZAkyA=
X-Google-Smtp-Source: APXvYqxxL9Fe1f4D+36OPQQYmIHaTRLbAeCCkDst90U/jbNKx6rUFrwQUHLg1/HA63wqrhcO/G2ISUlEKZcqaBy0/t0=
X-Received: by 2002:ab0:234e:: with SMTP id h14mr28875617uao.25.1561299091313; 
 Sun, 23 Jun 2019 07:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <1557756964-13087-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1557756964-13087-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 23 Jun 2019 23:10:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNARFYJo2mKAMsxrbLdyOrjFp5gJhq2ySUsDA-8jic3XpZQ@mail.gmail.com>
Message-ID: <CAK7LNARFYJo2mKAMsxrbLdyOrjFp5gJhq2ySUsDA-8jic3XpZQ@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/boot: pass CONFIG options in a simpler and
 more robust way
To: Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 13, 2019 at 11:24 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Commit 5e9dcb6188a4 ("powerpc/boot: Expose Kconfig symbols to wrapper")
> was wrong, but commit e41b93a6be57 ("powerpc/boot: Fix build failures
> with -j 1") was also wrong.
>
> The correct dependency is:
>
>   $(obj)/serial.o: $(obj)/autoconf.h
>
> However, I do not see the reason why we need to copy autoconf.h to
> arch/power/boot/. Nor do I see consistency in the way of passing
> CONFIG options.
>
> decompress.c references CONFIG_KERNEL_GZIP and CONFIG_KERNEL_XZ, which
> are passed via the command line.
>
> serial.c includes autoconf.h to reference a couple of CONFIG options,
> but this is fragile because we often forget to include "autoconf.h"
> from source files.
>
> In fact, it is already broken.
>
> ppc_asm.h references CONFIG_PPC_8xx, but utils.S is not given any way
> to access CONFIG options. So, CONFIG_PPC_8xx is never defined here.
>
> Pass $(LINUXINCLUDE) to make sure CONFIG options are accessible from
> all .c and .S files in arch/powerpc/boot/.
>
> I also removed the -traditional flag to make include/linux/kconfig.h
> work. This flag makes the preprocessor imitate the behavior of the
> pre-standard C compiler, but I do not understand why it is necessary.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

Ping.



> Changes in v2:
>  - reword commit log
>
>  arch/powerpc/boot/.gitignore |  2 --
>  arch/powerpc/boot/Makefile   | 14 +++-----------
>  arch/powerpc/boot/serial.c   |  1 -
>  3 files changed, 3 insertions(+), 14 deletions(-)
>
> diff --git a/arch/powerpc/boot/.gitignore b/arch/powerpc/boot/.gitignore
> index 32034a0c..6610665 100644
> --- a/arch/powerpc/boot/.gitignore
> +++ b/arch/powerpc/boot/.gitignore
> @@ -44,5 +44,3 @@ fdt_sw.c
>  fdt_wip.c
>  libfdt.h
>  libfdt_internal.h
> -autoconf.h
> -
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 73d1f35..b8a82be 100644
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
> index b0491b8..9457863 100644
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
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada

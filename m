Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8A1392282
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 00:06:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fr4m03rx7z308l
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 08:06:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=tedR2/J3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.90;
 helo=conssluserg-05.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=tedR2/J3; 
 dkim-atps=neutral
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com
 [210.131.2.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqtjY1VGpz2xv8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 May 2021 00:33:36 +1000 (AEST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id 14QEXB3o014766
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 23:33:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 14QEXB3o014766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1622039592;
 bh=K2JBpUyGmknhlRJpT71wl4Baxz8GsbPi2HBWhe0fUJY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tedR2/J3MXbq2+UFof6TW/eBglmgneC4XsqWdbxckP9MaPf/QDGw4OLzyvpynUT0/
 O8CvFbSHJ+UUGqhPeedd32O61oMqpnLkC5U/SskyY3TsXKd4ERnDVmK5g5kjc9XRmm
 4byyjamSqkclCGIvRcpKR2eBLwK8n9xqdwGULgUp90Y0dWdrxfnSmHzemUvksGYSj7
 OoqcFpFbqf77bj8PaZ1sPW+cf0f/9Ckh1G0tEc6eCazslp7BaJF9SgKo1vUgOCT2nP
 kIkPsdoIW+o5jKcWMBJBDCbaLIAWZY72aDRKYVtATELxQSvaZS3LmL489rdeXs+31a
 6bYw+6HJHe/ww==
X-Nifty-SrcIP: [209.85.222.47]
Received: by mail-ua1-f47.google.com with SMTP id z14so884461uan.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 07:33:11 -0700 (PDT)
X-Gm-Message-State: AOAM533pOU375QL2K4Ad3TZUfPDHESA88z82gViVhTT76xrlO73EcVE6
 CtfDvlUk6wSU36rZGW50NXL4U1yPl2AdSHk5IZY=
X-Google-Smtp-Source: ABdhPJw/7i4Yr5Lur94Y0RHgLFU9NY7pValTqlXUvZTdqsgLwd6wmbbeeFmUfP1tSYkLq/bZEryNx1br7CSMU1EHLow=
X-Received: by 2002:a17:902:541:b029:f0:3187:409b with SMTP id
 59-20020a1709020541b02900f03187409bmr36247746plf.47.1622039579510; Wed, 26
 May 2021 07:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210512075729.60291-1-masahiroy@kernel.org>
In-Reply-To: <20210512075729.60291-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 26 May 2021 23:32:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS7cEj9h=Hi0O-AoFjJPg2mxp0zbi8boXj4O9aYt_yg6Q@mail.gmail.com>
Message-ID: <CAK7LNAS7cEj9h=Hi0O-AoFjJPg2mxp0zbi8boXj4O9aYt_yg6Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] kbuild: require all architectures to have
 arch/$(SRCARCH)/Kbuild
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 27 May 2021 08:06:00 +1000
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Linux-sh list <linux-sh@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux <sparclinux@vger.kernel.org>, linux-hexagon@vger.kernel.org,
 "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Paul Mackerras <paulus@samba.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390 <linux-s390@vger.kernel.org>,
 Brian Cain <bcain@codeaurora.org>, Helge Deller <deller@gmx.de>,
 X86 ML <x86@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Matt Turner <mattst88@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>, Jeff Dike <jdike@addtoit.com>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>, Michal Marek <michal.lkml@markovi.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Weinberger <richard@nod.at>, Borislav Petkov <bp@alien8.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 12, 2021 at 5:00 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> arch/$(SRCARCH)/Kbuild is useful for Makefile cleanups because you can
> use the obj-y syntax.
>
> Add an empty file if it is missing in arch/$(SRCARCH)/.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


Applied to linux-kbuild.

>
>  Makefile               | 2 +-
>  arch/alpha/Kbuild      | 1 +
>  arch/arc/Makefile      | 3 ---
>  arch/arm/Makefile      | 1 -
>  arch/arm64/Makefile    | 1 -
>  arch/csky/Kbuild       | 1 +
>  arch/h8300/Kbuild      | 1 +
>  arch/hexagon/Kbuild    | 1 +
>  arch/ia64/Kbuild       | 1 +
>  arch/microblaze/Kbuild | 1 +
>  arch/mips/Makefile     | 3 ---
>  arch/nds32/Kbuild      | 1 +
>  arch/nios2/Kbuild      | 1 +
>  arch/openrisc/Makefile | 1 -
>  arch/parisc/Kbuild     | 1 +
>  arch/powerpc/Makefile  | 3 ---
>  arch/riscv/Makefile    | 1 -
>  arch/s390/Makefile     | 3 ---
>  arch/sh/Kbuild         | 1 +
>  arch/sparc/Makefile    | 3 ---
>  arch/um/Kbuild         | 1 +
>  arch/x86/Makefile      | 3 ---
>  arch/xtensa/Kbuild     | 1 +
>  23 files changed, 13 insertions(+), 23 deletions(-)
>  create mode 100644 arch/alpha/Kbuild
>  create mode 100644 arch/csky/Kbuild
>  create mode 100644 arch/h8300/Kbuild
>  create mode 100644 arch/hexagon/Kbuild
>  create mode 100644 arch/ia64/Kbuild
>  create mode 100644 arch/microblaze/Kbuild
>  create mode 100644 arch/nds32/Kbuild
>  create mode 100644 arch/nios2/Kbuild
>  create mode 100644 arch/parisc/Kbuild
>  create mode 100644 arch/sh/Kbuild
>  create mode 100644 arch/um/Kbuild
>  create mode 100644 arch/xtensa/Kbuild
>
> diff --git a/Makefile b/Makefile
> index 15b6476d0f89..7df040b1b023 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -658,7 +658,7 @@ endif
>
>  ifeq ($(KBUILD_EXTMOD),)
>  # Objects we will link into vmlinux / subdirs we need to visit
> -core-y         := init/ usr/
> +core-y         := init/ usr/ arch/$(SRCARCH)/
>  drivers-y      := drivers/ sound/
>  drivers-$(CONFIG_SAMPLES) += samples/
>  drivers-$(CONFIG_NET) += net/
> diff --git a/arch/alpha/Kbuild b/arch/alpha/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/alpha/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/arch/arc/Makefile b/arch/arc/Makefile
> index 4392c9c189c4..3e6d4b84797f 100644
> --- a/arch/arc/Makefile
> +++ b/arch/arc/Makefile
> @@ -85,9 +85,6 @@ KBUILD_LDFLAGS        += $(ldflags-y)
>
>  head-y         := arch/arc/kernel/head.o
>
> -# See arch/arc/Kbuild for content of core part of the kernel
> -core-y         += arch/arc/
> -
>  # w/o this dtb won't embed into kernel binary
>  core-y         += arch/arc/boot/dts/
>
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index 415c3514573a..173da685a52e 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -252,7 +252,6 @@ endif
>
>  export TEXT_OFFSET GZFLAGS MMUEXT
>
> -core-y                         += arch/arm/
>  # If we have a machine-specific directory, then include it in the build.
>  core-y                         += $(machdirs) $(platdirs)
>
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 7ef44478560d..b73c151f3a53 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -149,7 +149,6 @@ KBUILD_CFLAGS += -DKASAN_SHADOW_SCALE_SHIFT=$(KASAN_SHADOW_SCALE_SHIFT)
>  KBUILD_CPPFLAGS += -DKASAN_SHADOW_SCALE_SHIFT=$(KASAN_SHADOW_SCALE_SHIFT)
>  KBUILD_AFLAGS += -DKASAN_SHADOW_SCALE_SHIFT=$(KASAN_SHADOW_SCALE_SHIFT)
>
> -core-y         += arch/arm64/
>  libs-y         := arch/arm64/lib/ $(libs-y)
>  libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
>
> diff --git a/arch/csky/Kbuild b/arch/csky/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/csky/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/arch/h8300/Kbuild b/arch/h8300/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/h8300/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/arch/hexagon/Kbuild b/arch/hexagon/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/hexagon/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/arch/ia64/Kbuild b/arch/ia64/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/ia64/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/arch/microblaze/Kbuild b/arch/microblaze/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/microblaze/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index 258234c35a09..4e942b7ef022 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -332,9 +332,6 @@ head-y := arch/mips/kernel/head.o
>  libs-y                 += arch/mips/lib/
>  libs-$(CONFIG_MIPS_FP_SUPPORT) += arch/mips/math-emu/
>
> -# See arch/mips/Kbuild for content of core part of the kernel
> -core-y += arch/mips/
> -
>  drivers-y                      += arch/mips/crypto/
>
>  # suspend and hibernation support
> diff --git a/arch/nds32/Kbuild b/arch/nds32/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/nds32/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/arch/nios2/Kbuild b/arch/nios2/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/nios2/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/arch/openrisc/Makefile b/arch/openrisc/Makefile
> index 410e7abfac69..c52de526e518 100644
> --- a/arch/openrisc/Makefile
> +++ b/arch/openrisc/Makefile
> @@ -42,7 +42,6 @@ endif
>
>  head-y                 := arch/openrisc/kernel/head.o
>
> -core-y         += arch/openrisc/
>  libs-y         += $(LIBGCC)
>
>  PHONY += vmlinux.bin
> diff --git a/arch/parisc/Kbuild b/arch/parisc/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/parisc/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 3212d076ac6a..af669aa75b73 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -267,9 +267,6 @@ head-$(CONFIG_PPC_FPU)              += arch/powerpc/kernel/fpu.o
>  head-$(CONFIG_ALTIVEC)         += arch/powerpc/kernel/vector.o
>  head-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE)  += arch/powerpc/kernel/prom_init.o
>
> -# See arch/powerpc/Kbuild for content of core part of the kernel
> -core-y += arch/powerpc/
> -
>  # Default to zImage, override when needed
>  all: zImage
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 3eb9590a0775..c5f359540862 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -90,7 +90,6 @@ endif
>
>  head-y := arch/riscv/kernel/head.o
>
> -core-y += arch/riscv/
>  core-$(CONFIG_RISCV_ERRATA_ALTERNATIVE) += arch/riscv/errata/
>
>  libs-y += arch/riscv/lib/
> diff --git a/arch/s390/Makefile b/arch/s390/Makefile
> index e443ed9947bd..37b61645694c 100644
> --- a/arch/s390/Makefile
> +++ b/arch/s390/Makefile
> @@ -128,9 +128,6 @@ OBJCOPYFLAGS        := -O binary
>
>  head-y         := arch/s390/kernel/head64.o
>
> -# See arch/s390/Kbuild for content of core part of the kernel
> -core-y         += arch/s390/
> -
>  libs-y         += arch/s390/lib/
>  drivers-y      += drivers/s390/
>
> diff --git a/arch/sh/Kbuild b/arch/sh/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/sh/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/arch/sparc/Makefile b/arch/sparc/Makefile
> index bee99e65fe23..4e65245bc755 100644
> --- a/arch/sparc/Makefile
> +++ b/arch/sparc/Makefile
> @@ -58,9 +58,6 @@ endif
>
>  head-y                 := arch/sparc/kernel/head_$(BITS).o
>
> -# See arch/sparc/Kbuild for the core part of the kernel
> -core-y                 += arch/sparc/
> -
>  libs-y                 += arch/sparc/prom/
>  libs-y                 += arch/sparc/lib/
>
> diff --git a/arch/um/Kbuild b/arch/um/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/um/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index c77c5d8a7b3e..4307bf48ec53 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -239,9 +239,6 @@ head-y += arch/x86/kernel/platform-quirks.o
>
>  libs-y  += arch/x86/lib/
>
> -# See arch/x86/Kbuild for content of core part of the kernel
> -core-y += arch/x86/
> -
>  # drivers-y are linked after core-y
>  drivers-$(CONFIG_MATH_EMULATION) += arch/x86/math-emu/
>  drivers-$(CONFIG_PCI)            += arch/x86/pci/
> diff --git a/arch/xtensa/Kbuild b/arch/xtensa/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/xtensa/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada

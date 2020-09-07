Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6821B25FAC1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 14:53:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlSrw61DFzDqNs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 22:53:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=202.248.20.68;
 helo=condef-03.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=KVLYrEKb; 
 dkim-atps=neutral
Received: from condef-03.nifty.com (condef-03.nifty.com [202.248.20.68])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BlSpM4p35zDqN5
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Sep 2020 22:51:38 +1000 (AEST)
Received: from conssluserg-03.nifty.com ([10.126.8.82])by condef-03.nifty.com
 with ESMTP id 087CjgPX017656
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Sep 2020 21:45:42 +0900
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id 087Cj0XM018152
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Sep 2020 21:45:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 087Cj0XM018152
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1599482701;
 bh=RgU8Sugxv4ASLW8GV3q9CaX17ZgN4c86hz8zqyhRkp4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KVLYrEKbu/VsRaCsN/TUIiCzxx76mAPNv3QUQxZReLYX0HRiqwHlLbpz0U9iuXkEJ
 fdtVDe5npq/lH8vsOIWBs8cxOAB6A3j6s+8o2bjKoHXejS0thSUaCwcUJWRJkDIWXJ
 1HrAk/bV61kGxnfNgs0tH51KMDCIU4oAvEvL4T45VEZl83E3G36oR9Q4evY43FRl7+
 gi8lPgxloRX47Nsu+MheWnDMICBemBYBdR1Hgv0gyT/4N/4rcoFQkIut4ynccP4avk
 //yvarxiA1PyAS9sR+j3Ro4Qc+0uh3V0EGBrgBXYf0tE4LO4pjV5noyi8ugrio4nXC
 rFdv9oV6ZtPlg==
X-Nifty-SrcIP: [209.85.216.48]
Received: by mail-pj1-f48.google.com with SMTP id b17so4324275pji.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Sep 2020 05:45:01 -0700 (PDT)
X-Gm-Message-State: AOAM531eHJ0w7+6TCg38ZzWhbuuwC6OTBdnmRl6h7wSuTU0qWAJRm/O/
 +VkmfueOlsa1oZDUAoFZqc1qqhlLCE3C0Gpk4Bg=
X-Google-Smtp-Source: ABdhPJw4UtF57UzI82pGuTgn7u0AI78jQLYV5p6rNVTR2t5OI2bMang+cdl+Y4cuAkIyNjGnFlsZKuD7wiB/ej4TtDg=
X-Received: by 2002:a17:902:e901:: with SMTP id
 k1mr19763109pld.189.1599482700443; 
 Mon, 07 Sep 2020 05:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200831182239.480317-1-masahiroy@kernel.org>
In-Reply-To: <20200831182239.480317-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 7 Sep 2020 21:44:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQx=8v=udVa2pC_GL-iV0Z=VCjszB4rQ+YwTP8fR00jeg@mail.gmail.com>
Message-ID: <CAK7LNAQx=8v=udVa2pC_GL-iV0Z=VCjszB4rQ+YwTP8fR00jeg@mail.gmail.com>
Subject: Re: [PATCH] arch: vdso: add vdso linker script to 'targets' instead
 of extra-y
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Nick Hu <nickhu@andestech.com>, Heiko Carstens <hca@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 1, 2020 at 3:23 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The vdso linker script is preprocessed on demand.
> Adding it to 'targets' is enough to include the .cmd file.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


Applied to linux-kbuild.


>  arch/arm64/kernel/vdso/Makefile     | 2 +-
>  arch/arm64/kernel/vdso32/Makefile   | 2 +-
>  arch/nds32/kernel/vdso/Makefile     | 2 +-
>  arch/powerpc/kernel/vdso32/Makefile | 2 +-
>  arch/powerpc/kernel/vdso64/Makefile | 2 +-
>  arch/s390/kernel/vdso64/Makefile    | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> index 45d5cfe46429..7cd8aafbe96e 100644
> --- a/arch/arm64/kernel/vdso/Makefile
> +++ b/arch/arm64/kernel/vdso/Makefile
> @@ -54,7 +54,7 @@ endif
>  GCOV_PROFILE := n
>
>  obj-y += vdso.o
> -extra-y += vdso.lds
> +targets += vdso.lds
>  CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
>
>  # Force dependency (incbin is bad)
> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
> index d6adb4677c25..572475b7b7ed 100644
> --- a/arch/arm64/kernel/vdso32/Makefile
> +++ b/arch/arm64/kernel/vdso32/Makefile
> @@ -155,7 +155,7 @@ asm-obj-vdso := $(addprefix $(obj)/, $(asm-obj-vdso))
>  obj-vdso := $(c-obj-vdso) $(c-obj-vdso-gettimeofday) $(asm-obj-vdso)
>
>  obj-y += vdso.o
> -extra-y += vdso.lds
> +targets += vdso.lds
>  CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
>
>  # Force dependency (vdso.s includes vdso.so through incbin)
> diff --git a/arch/nds32/kernel/vdso/Makefile b/arch/nds32/kernel/vdso/Makefile
> index 7c3c1ccb196e..55df25ef0057 100644
> --- a/arch/nds32/kernel/vdso/Makefile
> +++ b/arch/nds32/kernel/vdso/Makefile
> @@ -20,7 +20,7 @@ GCOV_PROFILE := n
>
>
>  obj-y += vdso.o
> -extra-y += vdso.lds
> +targets += vdso.lds
>  CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
>
>  # Force dependency
> diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
> index 87ab1152d5ce..fd5072a4c73c 100644
> --- a/arch/powerpc/kernel/vdso32/Makefile
> +++ b/arch/powerpc/kernel/vdso32/Makefile
> @@ -29,7 +29,7 @@ ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
>  asflags-y := -D__VDSO32__ -s
>
>  obj-y += vdso32_wrapper.o
> -extra-y += vdso32.lds
> +targets += vdso32.lds
>  CPPFLAGS_vdso32.lds += -P -C -Upowerpc
>
>  # Force dependency (incbin is bad)
> diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
> index 38c317f25141..c737b3ea3207 100644
> --- a/arch/powerpc/kernel/vdso64/Makefile
> +++ b/arch/powerpc/kernel/vdso64/Makefile
> @@ -17,7 +17,7 @@ ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
>  asflags-y := -D__VDSO64__ -s
>
>  obj-y += vdso64_wrapper.o
> -extra-y += vdso64.lds
> +targets += vdso64.lds
>  CPPFLAGS_vdso64.lds += -P -C -U$(ARCH)
>
>  # Force dependency (incbin is bad)
> diff --git a/arch/s390/kernel/vdso64/Makefile b/arch/s390/kernel/vdso64/Makefile
> index 4a66a1cb919b..d0d406cfffa9 100644
> --- a/arch/s390/kernel/vdso64/Makefile
> +++ b/arch/s390/kernel/vdso64/Makefile
> @@ -25,7 +25,7 @@ $(targets:%=$(obj)/%.dbg): KBUILD_CFLAGS = $(KBUILD_CFLAGS_64)
>  $(targets:%=$(obj)/%.dbg): KBUILD_AFLAGS = $(KBUILD_AFLAGS_64)
>
>  obj-y += vdso64_wrapper.o
> -extra-y += vdso64.lds
> +targets += vdso64.lds
>  CPPFLAGS_vdso64.lds += -P -C -U$(ARCH)
>
>  # Disable gcov profiling, ubsan and kasan for VDSO code
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E376E2DCE34
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 10:25:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxRS4180vzDqVK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 20:25:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.81;
 helo=conssluserg-02.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=XmDJJxJq; 
 dkim-atps=neutral
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com
 [210.131.2.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxRQd02sPzDqQ5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Dec 2020 20:24:23 +1100 (AEDT)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 0BH9NqEt031525
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Dec 2020 18:23:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0BH9NqEt031525
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1608197032;
 bh=lyxy4N+QmOZIbc6zKUBg3yTh+qgTGZx7JrxlFrkCOdo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XmDJJxJqFOfe/ZyX/MKTNAjDY8YCW4nuPfsPrbOjqkojFtXAjn4mAHQDXuVIBkEtd
 hnrbar2ehWcfG0EYEeKu+fkN3R2KtsS9OGFu4nmTuyPZteOt5a+lw39N63VgSF6vKN
 p926NalzFoZeyXCZVinNz5NwC7mFDu3aPEuGNJPLPhN+lonSIBkvyFwhYyESleeJX1
 UlcBKWb3Gg4mJ5piLkakEV4YxbkoL1h2uU+vOjbMZncqb+D/HMW/8Avqdq5iKelhdM
 sCeOC5cA8Yli8Ga2+Ix95t9fqjnQewE9Kv+PEo+aSvTDsCskNTlpWaBYq/SX2ZQg4G
 WItP37MZlHr8w==
X-Nifty-SrcIP: [209.85.210.172]
Received: by mail-pf1-f172.google.com with SMTP id v2so1130106pfm.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Dec 2020 01:23:52 -0800 (PST)
X-Gm-Message-State: AOAM5323Wz/r9/xZvDkpzqU44ACJQSaYxsfL/FPe5CHpNla1zA1iVRqc
 PEcCQJ0r2LDaVN+uRru8J8ZWda52u6k4E9FcUzA=
X-Google-Smtp-Source: ABdhPJwc9MNYAmTGPUg7dh12WG/08zOBKgv8lIvTBlaBqx9kjxJRueD6dgY/prkqvXrzn6IGsyI2O05m9D2gEikLus8=
X-Received: by 2002:a65:6a16:: with SMTP id m22mr37274788pgu.175.1608197031781; 
 Thu, 17 Dec 2020 01:23:51 -0800 (PST)
MIME-Version: 1.0
References: <87tuslxhry.fsf@mpe.ellerman.id.au>
In-Reply-To: <87tuslxhry.fsf@mpe.ellerman.id.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 17 Dec 2020 18:23:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNASTXyxhLzH7kRyAKCixe6ksJaKPiuPxWnsYZ6NJVCWDhQ@mail.gmail.com>
Message-ID: <CAK7LNASTXyxhLzH7kRyAKCixe6ksJaKPiuPxWnsYZ6NJVCWDhQ@mail.gmail.com>
Subject: Re: powerpc VDSO files being unnecessarily rebuilt
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 17, 2020 at 11:56 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Hi all,
>
> Since the merge of the C VDSO I see we are repeatedly rebuilding some
> files in the VDSO, eg:
>
>   $ make V=2
>   make[1]: Entering directory '/home/michael/linux/build~'
>     GEN     Makefile
>     CALL    /home/michael/linux/scripts/checksyscalls.sh - due to target missing
>     CALL    /home/michael/linux/scripts/atomic/check-atomics.sh - due to target missing
>     CHK     include/generated/compile.h
>     CC      arch/powerpc/kernel/vdso64/vgettimeofday.o - due to vgettimeofday.o not in $(targets)
>
> This then causes multiple other files to be rebuilt.
>
> So the obvious fix is to add it to targets:
>
> diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
> index d365810a689a..5386532866ce 100644
> --- a/arch/powerpc/kernel/vdso64/Makefile
> +++ b/arch/powerpc/kernel/vdso64/Makefile
> @@ -5,6 +5,7 @@ ARCH_REL_TYPE_ABS := R_PPC_JUMP_SLOT|R_PPC_GLOB_DAT|R_PPC_ADDR32|R_PPC_ADDR24|R_
>  include $(srctree)/lib/vdso/Makefile
>
>  obj-vdso64 = sigtramp.o gettimeofday.o datapage.o cacheflush.o note.o getcpu.o
> +targets := $(obj-vdso64) vdso64.so.dbg
>
>  ifneq ($(c-gettimeofday-y),)
>    CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
> @@ -13,11 +14,11 @@ ifneq ($(c-gettimeofday-y),)
>    CFLAGS_vgettimeofday.o += -DDISABLE_BRANCH_PROFILING
>    CFLAGS_vgettimeofday.o += -ffreestanding -fasynchronous-unwind-tables
>    CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE)
> +  targets += vgettimeofday.o
>  endif
>
>  # Build rules
>
> -targets := $(obj-vdso64) vdso64.so.dbg
>  obj-vdso64 := $(addprefix $(obj)/, $(obj-vdso64))
>
>  GCOV_PROFILE := n
>
>
> But then I see it still rebuilt:
>
>   CC      arch/powerpc/kernel/vdso64/vgettimeofday.o - due to command line change
>
>
> I'm not changing the command line, and AFAICS the .cmd file is not
> changing either:
>
>   $ make V=2
>   ...
>     CC      arch/powerpc/kernel/vdso64/vgettimeofday.o - due to command line change
>
>   $ sha256sum build\~/arch/powerpc/kernel/vdso64/vgettimeofday.o
>   7f635546bc2768c7b929d3de1724d83285f3cd54394fcd7104f8b1301d689d65  build~/arch/powerpc/kernel/vdso64/vgettimeofday.o
>
>   $ make V=2
>   ...
>     CC      arch/powerpc/kernel/vdso64/vgettimeofday.o - due to command line change
>
>   $ sha256sum build\~/arch/powerpc/kernel/vdso64/vgettimeofday.o
>   7f635546bc2768c7b929d3de1724d83285f3cd54394fcd7104f8b1301d689d65  build~/arch/powerpc/kernel/vdso64/vgettimeofday.o
>
>
> So any hints on what I'm missing here?
>
> cheers


This is because PPC builds the vdso twice
with different command arguments.


First time:

vdso_prepare: prepare0
         $(if $(CONFIG_VDSO32),$(Q)$(MAKE) \
                 $(build)=arch/powerpc/kernel/vdso32
include/generated/vdso32-offsets.h)
         $(if $(CONFIG_PPC64),$(Q)$(MAKE) \
                 $(build)=arch/powerpc/kernel/vdso64
include/generated/vdso64-offsets.h)


Second time:
   from  arch/powerpc/kernel/Makefile





For the first build, -Werror is missing because
Kbuild directly descends into arch/powerpc/kernel/vdso[32,64]/.


For the second build,

arch/powerpc/Kbuild appends the following:

subdir-ccflags-$(CONFIG_PPC_WERROR) := -Werror





-- 
Best Regards
Masahiro Yamada

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E53D257F5AD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jul 2022 17:14:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LrRXs1lGVz3c5x
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 01:14:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=YIkntAEx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=210.131.2.82; helo=conssluserg-03.nifty.com; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=YIkntAEx;
	dkim-atps=neutral
Received: from conssluserg-03.nifty.com (conssluserg-03.nifty.com [210.131.2.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LrRX95qJ7z3bVt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 01:13:45 +1000 (AEST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51]) (authenticated)
	by conssluserg-03.nifty.com with ESMTP id 26OFD4Cm003341
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 00:13:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 26OFD4Cm003341
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1658675585;
	bh=gCeL/uC8vrvOiVMkkC5A2/Ic1HwmATb3tbQQCUc2eSg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YIkntAExRNM6S82g83iRwfAyhj2L3qH9hse0Yub/NgsYc7OQqWVfaBiYsBlhudPEz
	 NJ2xKn+mEBnqRUPrYd/YZguAWc41aVVG8Jkz5+L1LNdNcGg/RVjlSqQRldEeljNcNP
	 9XjxXbIpPakAoDj18/pbjleZjNHjVZtLs3/64MXz0xyigSdG53celW1CdwyT9kQntj
	 6sQE8pA8SdcMcpeUAnjd7sa+xS2e180Ce/m3OgmQKKLlltkdHj7tS1FTDuhkV+EoxM
	 2JGN2yVikDY2HZIniiNIzabuaEcJmPRoXbSDMkXzYAqUdzatiYYgketwna12/b+bC1
	 a5L9WO7kFhvZg==
X-Nifty-SrcIP: [209.85.221.51]
Received: by mail-wr1-f51.google.com with SMTP id h9so12704710wrm.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jul 2022 08:13:05 -0700 (PDT)
X-Gm-Message-State: AJIora/O7R6CgOO4swHkHTn2iOyW/+k0GRR6U2NloQKfW85js+CLv1Xe
	esb8XXhR5oP5xB2ZCF7xQdjyE6Iwj7aTowiNkWU=
X-Google-Smtp-Source: AGRyM1s+1JhXE5SR/EfF1htAo7ZviLuhLExVfpb+C1O+hsP1zTq9QSDpHWT8egWeeEGndtvuQaIJMyA9LLF78rUonj4=
X-Received: by 2002:a5d:50c4:0:b0:21e:8776:bb95 with SMTP id
 f4-20020a5d50c4000000b0021e8776bb95mr1396769wrt.461.1658675583903; Sun, 24
 Jul 2022 08:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220625224037.836581-1-masahiroy@kernel.org>
In-Reply-To: <20220625224037.836581-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 25 Jul 2022 00:12:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQChsc0uC_ZkxPz5qQ1bZOiK5g_uPhE8K859Ki9LAB=iw@mail.gmail.com>
Message-ID: <CAK7LNAQChsc0uC_ZkxPz5qQ1bZOiK5g_uPhE8K859Ki9LAB=iw@mail.gmail.com>
Subject: Re: [PATCH] powerpc/purgatory: Omit use of bin2c
To: Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jun 26, 2022 at 7:42 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The .incbin assembler directive is much faster than bin2c + $(CC).
>
> Do similar refactoring as in commit 4c0f032d4963 ("s390/purgatory:
> Omit use of bin2c").
>
> Please note the .quad directive matches to size_t in C (both 8 byte)
> because the purgatory is compiled only for the 64-bit kernel.
> (KEXEC_FILE depends on PPC64).
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


Ping?


>  arch/powerpc/Kconfig                     |  1 -
>  arch/powerpc/purgatory/.gitignore        |  1 -
>  arch/powerpc/purgatory/Makefile          |  8 ++------
>  arch/powerpc/purgatory/kexec-purgatory.S | 14 ++++++++++++++
>  scripts/remove-stale-files               |  2 ++
>  5 files changed, 18 insertions(+), 8 deletions(-)
>  create mode 100644 arch/powerpc/purgatory/kexec-purgatory.S
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index c2ce2e60c8f0..1cb684ee3519 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -547,7 +547,6 @@ config KEXEC_FILE
>         bool "kexec file based system call"
>         select KEXEC_CORE
>         select HAVE_IMA_KEXEC if IMA
> -       select BUILD_BIN2C
>         select KEXEC_ELF
>         depends on PPC64
>         depends on CRYPTO=y
> diff --git a/arch/powerpc/purgatory/.gitignore b/arch/powerpc/purgatory/.gitignore
> index b8dc6ff34254..5e40575c1f2b 100644
> --- a/arch/powerpc/purgatory/.gitignore
> +++ b/arch/powerpc/purgatory/.gitignore
> @@ -1,3 +1,2 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -kexec-purgatory.c
>  purgatory.ro
> diff --git a/arch/powerpc/purgatory/Makefile b/arch/powerpc/purgatory/Makefile
> index 348f59581052..a81d155b89ae 100644
> --- a/arch/powerpc/purgatory/Makefile
> +++ b/arch/powerpc/purgatory/Makefile
> @@ -2,17 +2,13 @@
>
>  KASAN_SANITIZE := n
>
> -targets += trampoline_$(BITS).o purgatory.ro kexec-purgatory.c
> +targets += trampoline_$(BITS).o purgatory.ro
>
>  LDFLAGS_purgatory.ro := -e purgatory_start -r --no-undefined
>
>  $(obj)/purgatory.ro: $(obj)/trampoline_$(BITS).o FORCE
>                 $(call if_changed,ld)
>
> -quiet_cmd_bin2c = BIN2C   $@
> -      cmd_bin2c = $(objtree)/scripts/bin2c kexec_purgatory < $< > $@
> -
> -$(obj)/kexec-purgatory.c: $(obj)/purgatory.ro FORCE
> -       $(call if_changed,bin2c)
> +$(obj)/kexec-purgatory.o: $(obj)/purgatory.ro
>
>  obj-y  += kexec-purgatory.o
> diff --git a/arch/powerpc/purgatory/kexec-purgatory.S b/arch/powerpc/purgatory/kexec-purgatory.S
> new file mode 100644
> index 000000000000..4e5f64a0bf4a
> --- /dev/null
> +++ b/arch/powerpc/purgatory/kexec-purgatory.S
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +       .section .rodata, "a"
> +
> +       .align  8
> +kexec_purgatory:
> +       .globl  kexec_purgatory
> +       .incbin "arch/powerpc/purgatory/purgatory.ro"
> +.Lkexec_purgatroy_end:
> +
> +       .align  8
> +kexec_purgatory_size:
> +       .globl  kexec_purgatory_size
> +       .quad   .Lkexec_purgatroy_end - kexec_purgatory
> diff --git a/scripts/remove-stale-files b/scripts/remove-stale-files
> index 7adab4618035..5a7543469698 100755
> --- a/scripts/remove-stale-files
> +++ b/scripts/remove-stale-files
> @@ -20,6 +20,8 @@ set -e
>  # yard. Stale files stay in this file for a while (for some release cycles?),
>  # then will be really dead and removed from the code base entirely.
>
> +rm -f arch/powerpc/purgatory/kexec-purgatory.c
> +
>  # These were previously generated source files. When you are building the kernel
>  # with O=, make sure to remove the stale files in the output tree. Otherwise,
>  # the build system wrongly compiles the stale ones.
> --
> 2.32.0
>


-- 
Best Regards
Masahiro Yamada

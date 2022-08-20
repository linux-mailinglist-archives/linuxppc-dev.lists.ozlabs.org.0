Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B2E59ADCB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 14:06:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8y694vdlz3c79
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 22:06:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Fc4EDdry;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com; envelope-from=sedat.dilek@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Fc4EDdry;
	dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8y5Y1mByz3bk0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 22:06:24 +1000 (AEST)
Received: by mail-oi1-x22a.google.com with SMTP id r10so1630290oie.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 05:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc;
        bh=mf+BGQNsYSJCzj9Yop/1xy8Ja+yt+HEFVNOqFU3s8gU=;
        b=Fc4EDdryo+o0cR1BeQStJozKBQW0cXZFzwVuqhNlJYmPKLCZLgDisnyqEolLlHKNli
         Fhv32Hu7yJ1dmgY1tQ/GdABO3amcpBJONu62Uloo6dE/viLLufmpp9/NMHIXMcUnAWHe
         /K3Hz4BshhbgPj8zyQdbcMlTBDYtXRfjR4SHifJ4gLld83wGhbDjn+1P1E3/8m3i1Ou6
         eYNPxkAYb30gK6REN/i2sK7MRDvNjAN6IcKWAN1ef6OkPH7kp0Ilpmq4J4AoJC2ZQ/q/
         VJ/Kl0V3DSiAxkwpBzRFVwsnyS7ucXH9i2rNP2Bu+8zD7WQjH4e7GREVMTvYksGWN5+g
         aBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc;
        bh=mf+BGQNsYSJCzj9Yop/1xy8Ja+yt+HEFVNOqFU3s8gU=;
        b=DA9SgeXKIUgPvRiW5T+EmonEplulyZx7A8YqtnvssZf3fp4Z7Wc5lc086hyQHaaGVn
         XzSILUyyY20Zk9Pva+Vb2mISW8JjOn3DlmoY689YtMw0yNntW+7bNAHlp8iSZh11LnL4
         RUrhq75P5nG0uN7OdvCU/O6oanFQfdoK17SkAFfXUV5u5APNY3QKNlyBPcBDGKcangEF
         KOviyzKvfoJgfzlmRuXG4kE+O0FvF8G30GIq/3AAiaja9AXpXhW3kjsSB2gl6RSFJkq4
         MJc7Xx8jIMGMmtqMj9qvMy4tje46Wur+apuXVVkH46iart8zJ4jmRpvyPcD5z0LKCQ8A
         rwqw==
X-Gm-Message-State: ACgBeo2gN2n0GXq3wvgN9efzSDAek8zi9TNjAB5YLmKohoGvzoFVs1ac
	cJnM0OmZ6gwl6rzU7U80Aa3bvhxxJmHrAmpC4g0=
X-Google-Smtp-Source: AA6agR4ICOE2LfN4NlOKxCVBEOSWiAdjwW3NLUyzRQQVu8BSlwK3wMMkJ2R7r8I2EvUUPL0aCCbzwBn0W30Y3jQluK8=
X-Received: by 2002:aca:aac2:0:b0:343:3435:a270 with SMTP id
 t185-20020acaaac2000000b003433435a270mr5314540oie.252.1660997179188; Sat, 20
 Aug 2022 05:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220513113930.10488-1-masahiroy@kernel.org> <20220513113930.10488-3-masahiroy@kernel.org>
 <38605f6a-a568-f884-f06f-ea4da5b214f0@csgroup.eu>
In-Reply-To: <38605f6a-a568-f884-f06f-ea4da5b214f0@csgroup.eu>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sat, 20 Aug 2022 14:05:43 +0200
Message-ID: <CA+icZUU1R6vmmKussGBXGBzR8We2b5mAnfWT5BCcfvYY3vk+Zw@mail.gmail.com>
Subject: Re: Build/boot problem with 7b4537199a4a (Re: [PATCH v6 02/10]
 kbuild: link symbol CRCs at final link, removing CONFIG_MODULE_REL_CRCS)
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: sedat.dilek@gmail.com
Cc: Nicolas Schier <nicolas@fjasle.eu>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Masahiro Yamada <masahiroy@kernel.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Sami Tolvanen <samitolvanen@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 20, 2022 at 12:04 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Hi,
>
> Le 13/05/2022 =C3=A0 13:39, Masahiro Yamada a =C3=A9crit :
> > include/{linux,asm-generic}/export.h defines a weak symbol, __crc_*
> > as a placeholder.
> >
> > Genksyms writes the version CRCs into the linker script, which will be
> > used for filling the __crc_* symbols. The linker script format depends
> > on CONFIG_MODULE_REL_CRCS. If it is enabled, __crc_* holds the offset
> > to the reference of CRC.
> >
> > It is time to get rid of this complexity.
> >
> > Now that modpost parses text files (.*.cmd) to collect all the CRCs,
> > it can generate C code that will be linked to the vmlinux or modules.
> >
> > Generate a new C file, .vmlinux.export.c, which contains the CRCs of
> > symbols exported by vmlinux. It is compiled and linked to vmlinux in
> > scripts/link-vmlinux.sh.
> >
> > Put the CRCs of symbols exported by modules into the existing *.mod.c
> > files. No additional build step is needed for modules. As before,
> > *.mod.c are compiled and linked to *.ko in scripts/Makefile.modfinal.
> >
> > No linker magic is used here. The new C implementation works in the
> > same way, whether CONFIG_RELOCATABLE is enabled or not.
> > CONFIG_MODULE_REL_CRCS is no longer needed.
> >
> > Previously, Kbuild invoked additional $(LD) to update the CRCs in
> > objects, but this step is unneeded too.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > Tested-by: Nathan Chancellor <nathan@kernel.org>
> > Tested-by: Nicolas Schier <nicolas@fjasle.eu>
> > Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
>
> Problem with v6.0-rc1
> Problem with v5.19
> No problem with v5.18
>
> Bisected to 7b4537199a4a ("kbuild: link symbol CRCs at final link,
> removing CONFIG_MODULE_REL_CRCS")
>

What you are looking for is...

commit 7d13fd96df875a9d786ee6dcc8fec460d35d4b12
("modpost: fix module versioning when a symbol lacks valid CRC")

It's pending in kbuild.git#fixes.

-Sedat-

[1] https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.=
git/commit/?h=3Dfixes&id=3D7d13fd96df875a9d786ee6dcc8fec460d35d4b12
[2] https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.=
git/log/?h=3Dfixes

> The above patch leads to the following problem building
> mpc85xx_defconfig + CONFIG_RELOCATABLE
>
>    LD      vmlinux
>    SYSMAP  System.map
>    SORTTAB vmlinux
>    CHKREL  vmlinux
> WARNING: 451 bad relocations
> c0b0f26d R_PPC_UADDR32     .head.text-0x3ff9f2bc
> c0b0f271 R_PPC_UADDR32     .head.text-0x3ffac300
> c0b0f275 R_PPC_UADDR32     .head.text-0x3ffb0bdc
> c0b0f279 R_PPC_UADDR32     .head.text-0x3fe1e080
> c0b0f27d R_PPC_UADDR32     .head.text-0x3fe1df4c
> c0b0f281 R_PPC_UADDR32     .head.text-0x3fe21514
> c0b0f285 R_PPC_UADDR32     .head.text-0x3fe211c0
> c0b0f289 R_PPC_UADDR32     .head.text-0x3ffabda0
> c0b0f28d R_PPC_UADDR32     .head.text-0x3fe21258
> c0b0f291 R_PPC_UADDR32     .head.text-0x3fe074d0
> c0b0f295 R_PPC_UADDR32     .head.text-0x3fe07ad4
> c0b0f299 R_PPC_UADDR32     .head.text-0x3fe13470
> c0b0f29d R_PPC_UADDR32     .head.text-0x3fe22700
> c0b0f2a1 R_PPC_UADDR32     .head.text-0x3ff4b8e0
> c0b0f2a5 R_PPC_UADDR32     .head.text-0x3fe08320
> c0b0f2a9 R_PPC_UADDR32     .head.text-0x3fe220dc
> c0b0f2ad R_PPC_UADDR32     .head.text-0x3fe21da0
> c0b0f2b1 R_PPC_UADDR32     .head.text-0x3ff89dc0
> c0b0f2b5 R_PPC_UADDR32     .head.text-0x3fe16524
> c0b0f2b9 R_PPC_UADDR32     .head.text-0x3fe1ef74
> c0b0f2bd R_PPC_UADDR32     .head.text-0x3ff98b84
> c0b0f2c1 R_PPC_UADDR32     .head.text-0x3fdef9a0
> c0b0f2c5 R_PPC_UADDR32     .head.text-0x3fdf21ac
> c0b0f2c9 R_PPC_UADDR32     .head.text-0x3ff993c4
> ...
> c0b0f969 R_PPC_UADDR32     .head.text-0x3ff89dc0
> c0b0f96d R_PPC_UADDR32     .head.text-0x3fe9ad40
> c0b0f971 R_PPC_UADDR32     .head.text-0x3ff2eb00
> c0b0f975 R_PPC_UADDR32     .head.text-0x3ff89dc0
>
> And boot fails:
>
> Run /init as init process
> kernel tried to execute user page (0) - exploit attempt? (uid: 0)
> BUG: Unable to handle kernel instruction fetch (NULL pointer?)
> Faulting instruction address: 0x00000000
> Oops: Kernel access of bad area, sig: 11 [#1]
> BE PAGE_SIZE=3D4K MPC8544 DS
> Modules linked in:
> CPU: 0 PID: 1 Comm: init Not tainted 5.18.0-rc1-00054-g7b4537199a4a #1523
> NIP:  00000000 LR: c00150e4 CTR: 00000000
> REGS: c3091e10 TRAP: 0400   Not tainted  (5.18.0-rc1-00054-g7b4537199a4a)
> MSR:  00009000 <EE,ME>  CR: 88000422  XER: 20000000
>
> GPR00: 00004000 c3091f00 c30c8000 00000000 00000013 b7bb9f4c b7bd8f60
> bfee6650
> GPR08: 00000054 00000000 c0b0f26d 00000000 c13b0000 00000000 bfee6668
> 00000000
> GPR16: 84e08000 00000000 08000000 00000064 00000000 00102000 00000001
> 00000001
> GPR24: 00000001 00000001 b7b9c7d0 10000034 00000009 b7bd8f38 b7bd9854
> b7bd8688
> NIP [00000000] 0x0
> LR [c00150e4] ret_from_syscall+0x0/0x28
> Call Trace:
> [c3091f00] [c0000af0] InstructionStorage+0x150/0x160 (unreliable)
> --- interrupt: c00 at 0xb7bb28e8
> NIP:  b7bb28e8 LR: b7bb1384 CTR: b7bb1218
> REGS: c3091f10 TRAP: 0c00   Not tainted  (5.18.0-rc1-00054-g7b4537199a4a)
> MSR:  0002d000 <CE,EE,PR,ME>  CR: 28000422  XER: 20000000
>
> GPR00: 0000002d bfee61f0 00000000 00000000 00000013 b7bb9f4c b7bd8f60
> bfee6650
> GPR08: 00000054 00000020 bfee6648 00000000 00000001 00000000 bfee6668
> 00000000
> GPR16: 84e08000 00000000 08000000 00000064 00000000 00102000 00000001
> 00000001
> GPR24: 00000001 00000001 b7b9c7d0 10000034 00000009 b7bd8f38 b7bd9854
> b7bd8688
> NIP [b7bb28e8] 0xb7bb28e8
> LR [b7bb1384] 0xb7bb1384
> --- interrupt: c00
> Instruction dump:
> XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
> XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
> ---[ end trace 0000000000000000 ]---
>
> Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x0000000b
>
>
>
> Christophe

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6938518FE5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 23:22:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtCbD5CzWz3bY8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 07:22:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=iQ5+SVQd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::132;
 helo=mail-lf1-x132.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=iQ5+SVQd; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtCZZ3vDHz2xsN
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 07:21:41 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id bq30so32437266lfb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 May 2022 14:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kx7+Mo6KfcU2gojNKWu3an2tWbyvTvTXb4jiuFElasY=;
 b=iQ5+SVQdMlk38OR/3OKX2hm7Innt92hQUBwfl456D9md5FFqk3+e2fjdm7njfWMztd
 DaU/edgEVtJ17NwEq4NNGogUq+vP45iuuTu24LIiTM4Xgg78E7XdNCYY/6lEscfC5sMp
 8IV1IKNVOyzMCPOtI1LPAJiI8TrHRrFsAEBPJpHJAnGF1fJtY7Q1V/0ghPpqVUc+Uuw2
 zdkgyOfqILUpbn2WttY7ZwAObk7UdC5IAuvDtEG3mZ3cXEqctVDV2ow9KpS7oIpTt0Ho
 LgHqIVu2E8Ibr0i+/eKigebw7X6lYvXiNjew76S3Yj52QWf5KfqMPE3Lv/G9ir0R6NnK
 EYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kx7+Mo6KfcU2gojNKWu3an2tWbyvTvTXb4jiuFElasY=;
 b=A0H1WnuD0egDM2qao6OwAiMVJKsDq0BQrPR3iGHD7K2zQHK3vneXZyvDYZLdo4EFfq
 /Ce9gearfBe2rWkTPvKJ6lRww2rxe9mJg5kNaqoIzI+9JoAbGDiO1b0k8MrvKbhE8u4S
 YpxBk5Sdxf+9Gvq0DOnrAg6NRo735XS261ooJYCu6TgjQC+d2X/4d8d3y8xlfAlyERku
 F5jJvWmc198Zu10YzRhNXQb8A0Ctb0OxkT7aGegqcTKGPkZ/lLC42dUWfd0zlC5e27hM
 ouqdNzhfl78R1VmVipxFXBHaFu0VDtvTLPd57cdX/wMN1+92D6cd20rawWVILqZoISbb
 hs4g==
X-Gm-Message-State: AOAM533fGmZyqapKDv5WHn3oT1ND8Fi37l6i5fuHu1Zj2hMW7Cf5qrHv
 Ruhi6PbUedQ7cdIGE2w6m0psoNxP2jYNoWE5wLPyAg==
X-Google-Smtp-Source: ABdhPJz8tpJ9FdXAjH2ECRPBJrLQm/gDsGEdwgRwYZeAraKKARD0ms6vfvoClYb63ar+jbR11FkkVQey4y7+WK/n0qQ=
X-Received: by 2002:ac2:4188:0:b0:471:96f4:c1d4 with SMTP id
 z8-20020ac24188000000b0047196f4c1d4mr12370983lfh.626.1651612892674; Tue, 03
 May 2022 14:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220429064547.2334280-1-aik@ozlabs.ru>
In-Reply-To: <20220429064547.2334280-1-aik@ozlabs.ru>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 3 May 2022 14:21:21 -0700
Message-ID: <CAKwvOdmUMhqhQhDCpWjMNiQQPvwOJB9MbUkF3RR0BL+H+DagmA@mail.gmail.com>
Subject: Re: [PATCH kernel] powerpc/llvm/lto: Allow LLVM LTO builds
To: Alexey Kardashevskiy <aik@ozlabs.ru>
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
Cc: llvm@lists.linux.dev, Nicholas Piggin <npiggin@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Sathvika Vasireddy <sv@linux.ibm.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 28, 2022 at 11:46 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> This enables LTO_CLANG builds on POWER with the upstream version of
> LLVM.
>
> LTO optimizes the output vmlinux binary and this may affect the FTP
> alternative section if alt branches use "bc" (Branch Conditional) which
> is limited by 16 bit offsets. This shows up in errors like:
>
> ld.lld: error: InputSection too large for range extension thunk vmlinux.o:(__ftr_alt_97+0xF0)
>
> This works around the issue by replacing "bc" in FTR_SECTION_ELSE with
> "b" which allows 26 bit offsets.
>
> This catches the problem instructions in vmlinux.o before it LTO'ed:
>
> $ objdump -d -M raw -j __ftr_alt_97 vmlinux.o | egrep '\S+\s*\<bc\>'
>   30:   00 00 82 40     bc      4,eq,30 <__ftr_alt_97+0x30>
>   f0:   00 00 82 40     bc      4,eq,f0 <__ftr_alt_97+0xf0>
>
> This allows LTO builds for ppc64le_defconfig plus LTO options.
> Note that DYNAMIC_FTRACE/FUNCTION_TRACER is not supported by LTO builds
> but this is not POWERPC-specific.

$ ARCH=powerpc make LLVM=1 -j72 ppc64le_defconfig
$ ARCH=powerpc make LLVM=1 -j72 menuconfig
<disable FTRACE, enable LTO_CLANG_THIN>
$ ARCH=powerpc make LLVM=1 -j72
...
  VDSO64L arch/powerpc/kernel/vdso/vdso64.so.dbg
/usr/bin/powerpc64le-linux-gnu-ld:
/android0/llvm-project/llvm/build/bin/../lib/LLVMgold.so: error
loading plugin:
/android0/llvm-project/llvm/build/bin/../lib/LLVMgold.so: cannot open
shared object file: No such file or directory
clang-15: error: linker command failed with exit code 1 (use -v to see
invocation)
make[1]: *** [arch/powerpc/kernel/vdso/Makefile:67:
arch/powerpc/kernel/vdso/vdso64.so.dbg] Error 1

Looks like LLD isn't being invoked correctly to link the vdso.
Probably need to revisit
https://lore.kernel.org/lkml/20200901222523.1941988-1-ndesaulniers@google.com/

How were you working around this issue? Perhaps you built clang to
default to LLD? (there's a cmake option for that)

Perhaps for now I should just send:
```
diff --git a/arch/powerpc/kernel/vdso/Makefile
b/arch/powerpc/kernel/vdso/Makefile
index 954974287ee7..8762e6513683 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -55,6 +55,11 @@ AS32FLAGS := -D__VDSO32__ -s
 CC64FLAGS := -Wl,-soname=linux-vdso64.so.1
 AS64FLAGS := -D__VDSO64__ -s

+ifneq ($(LLVM),)
+CC32FLAGS += -fuse-ld=lld
+CC64FLAGS += -fuse-ld=lld
+endif
+
 targets += vdso32.lds
 CPPFLAGS_vdso32.lds += -P -C -Upowerpc
 targets += vdso64.lds
```


>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>
> Note 1:
> This is further development of
> https://lore.kernel.org/all/20220211023125.1790960-1-aik@ozlabs.ru/T/
>
> Note 2:
> CONFIG_ZSTD_COMPRESS and CONFIG_ZSTD_DECOMPRESS must be both "m" or "y"
> or it won't link. For details:
> https://lore.kernel.org/lkml/20220428043850.1706973-1-aik@ozlabs.ru/T/

Yeah, I just hit this:
```
  LTO     vmlinux.o
LLVM ERROR: Function Import: link error: linking module flags 'Code
Model': IDs have conflicting values in
'lib/built-in.a(entropy_common.o at 5782)' and
'lib/built-in.a(zstd_decompress_block.o at 6202)'
PLEASE submit a bug report to
https://github.com/llvm/llvm-project/issues/ and include the crash
backtrace.
LLVM ERROR: Failed to rename temporary file
.thinlto-cache/Thin-96f93f.tmp.o to
.thinlto-cache/llvmcache-A5B351EA452D46A86980E29C78B7260673348AAF: No
such file or directory
scripts/link-vmlinux.sh: line 76: 1240312 Aborted
${LD} ${KBUILD_LDFLAGS} -r -o ${1} ${lds} ${objects}
make: *** [Makefile:1158: vmlinux] Error 134
```
These two configs aren't easily modified in menuconfig. Perhaps you
could find the concise set of configs that need to be disabled for
this to be buildable? At least so others can test more easily, or even
so we can update Kconfig checks.

> ---
>  arch/powerpc/Kconfig                   | 2 ++
>  arch/powerpc/kernel/exceptions-64s.S   | 4 +++-
>  arch/powerpc/lib/copyuser_64.S         | 3 ++-
>  arch/powerpc/lib/feature-fixups-test.S | 3 +--
>  arch/powerpc/lib/memcpy_64.S           | 3 ++-
>  5 files changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 174edabb74fa..e2c7b5c1d0a6 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -158,6 +158,8 @@ config PPC
>         select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
>         select ARCH_WANT_LD_ORPHAN_WARN
>         select ARCH_WEAK_RELEASE_ACQUIRE
> +       select ARCH_SUPPORTS_LTO_CLANG
> +       select ARCH_SUPPORTS_LTO_CLANG_THIN
>         select BINFMT_ELF
>         select BUILDTIME_TABLE_SORT
>         select CLONE_BACKWARDS
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index b66dd6f775a4..5b783bd51260 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -476,9 +476,11 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
>                 .if IHSRR_IF_HVMODE
>                 BEGIN_FTR_SECTION
>                 bne     masked_Hinterrupt
> +               b       4f
>                 FTR_SECTION_ELSE
> -               bne     masked_interrupt
>                 ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
> +               bne     masked_interrupt
> +4:
>                 .elseif IHSRR
>                 bne     masked_Hinterrupt
>                 .else
> diff --git a/arch/powerpc/lib/copyuser_64.S b/arch/powerpc/lib/copyuser_64.S
> index db8719a14846..d07f95eebc65 100644
> --- a/arch/powerpc/lib/copyuser_64.S
> +++ b/arch/powerpc/lib/copyuser_64.S
> @@ -75,10 +75,11 @@ _GLOBAL(__copy_tofrom_user_base)
>   * set is Power6.
>   */
>  test_feature = (SELFTEST_CASE == 1)
> +       beq     .Ldst_aligned
>  BEGIN_FTR_SECTION
>         nop
>  FTR_SECTION_ELSE
> -       bne     .Ldst_unaligned
> +       b       .Ldst_unaligned
>  ALT_FTR_SECTION_END(CPU_FTR_UNALIGNED_LD_STD | CPU_FTR_CP_USE_DCBTZ, \
>                     CPU_FTR_UNALIGNED_LD_STD)
>  .Ldst_aligned:
> diff --git a/arch/powerpc/lib/feature-fixups-test.S b/arch/powerpc/lib/feature-fixups-test.S
> index 480172fbd024..2751e42a9fd7 100644
> --- a/arch/powerpc/lib/feature-fixups-test.S
> +++ b/arch/powerpc/lib/feature-fixups-test.S
> @@ -145,7 +145,6 @@ BEGIN_FTR_SECTION
>  FTR_SECTION_ELSE
>  2:     or      2,2,2
>         PPC_LCMPI       r3,1
> -       beq     3f
>         blt     2b
>         b       3f
>         b       1b
> @@ -160,10 +159,10 @@ globl(ftr_fixup_test6_expected)
>  1:     or      1,1,1
>  2:     or      2,2,2
>         PPC_LCMPI       r3,1
> -       beq     3f
>         blt     2b
>         b       3f
>         b       1b
> +       nop
>  3:     or      1,1,1
>         or      2,2,2
>         or      3,3,3
> diff --git a/arch/powerpc/lib/memcpy_64.S b/arch/powerpc/lib/memcpy_64.S
> index 016c91e958d8..286c7e2d0883 100644
> --- a/arch/powerpc/lib/memcpy_64.S
> +++ b/arch/powerpc/lib/memcpy_64.S
> @@ -50,10 +50,11 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_VMX_COPY)
>     At the time of writing the only CPU that has this combination of bits
>     set is Power6. */
>  test_feature = (SELFTEST_CASE == 1)
> +       beq      .ldst_aligned
>  BEGIN_FTR_SECTION
>         nop
>  FTR_SECTION_ELSE
> -       bne     .Ldst_unaligned
> +       b       .Ldst_unaligned
>  ALT_FTR_SECTION_END(CPU_FTR_UNALIGNED_LD_STD | CPU_FTR_CP_USE_DCBTZ, \
>                      CPU_FTR_UNALIGNED_LD_STD)
>  .Ldst_aligned:
> --
> 2.30.2
>


-- 
Thanks,
~Nick Desaulniers

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED8E6527AE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Dec 2022 21:16:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nc7BF3nQJz3fC9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Dec 2022 07:16:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jvQtM0Bs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jvQtM0Bs;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nc78Y1m8xz3c9g
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Dec 2022 07:14:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C9E51B818AD;
	Tue, 20 Dec 2022 20:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3168DC433EF;
	Tue, 20 Dec 2022 20:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671567273;
	bh=g4z01Qkq/i8TPjXgNA6oMbzywGrH9WcNfZMzaDUNKl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jvQtM0Bs6zKmE4yGkY/9LVBdLl7Ozoj2M25NmMtsVqd9062l5eceZWw4P9CCeznCh
	 A+I/BV1ev1LjBtf7Xp27QTUL5+iK7WK3IHRP9fvJG1GebxpHmDlsudqUV2ct/YFB3t
	 aucS0rOIvg/+Y8Hqsu5gYTS4m392lKpU0JkEGKZGhuDrQkMPLsVw3+M8gyLcoxFsEQ
	 C1ifXDpZ7s4TczCUE4O7D7a1XPgncAWf+fyS+pBjgxHr4Fm1VSCc1IotfNNQMnKvDb
	 wrx0n19UmoVwyzrMV7jUQQOxBNo/svKh7XHyIAJLj9JS2xCS3ctmr09d4+rVcLDsHq
	 MmFxb4d5D5Ufg==
Received: by pali.im (Postfix)
	id 82E4C963; Tue, 20 Dec 2022 21:14:30 +0100 (CET)
Date: Tue, 20 Dec 2022 21:14:30 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 2/5] powerpc: Pass correct CPU reference to assembler
Message-ID: <20221220201430.xopin6ezcdk5f66k@pali>
References: <38a8d765ed9149bc6b5484a7142e3bc59ffa3b1a.1671475543.git.christophe.leroy@csgroup.eu>
 <758ad54128fa9dd2fdedc4c511592111cbded900.1671475543.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <758ad54128fa9dd2fdedc4c511592111cbded900.1671475543.git.christophe.leroy@csgroup.eu>
User-Agent: NeoMutt/20180716
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
Cc: linuxppc-dev@lists.ozlabs.org, jbglaw@lug-owl.de, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 19 December 2022 19:45:57 Christophe Leroy wrote:
> Jan-Benedict reported issue with building ppc64e_defconfig
> with mainline GCC work:
> 
>   powerpc64-linux-gcc -Wp,-MMD,arch/powerpc/kernel/vdso/.gettimeofday-64.o.d -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/generated  -I./include -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/compiler-version.h -include ./include/linux/kconfig.h -D__KERNEL__ -I ./arch/powerpc -DHAVE_AS_ATHIGH=1 -fmacro-prefix-map=./= -D__ASSEMBLY__ -fno-PIE -m64 -Wl,-a64 -mabi=elfv1 -Wa,-me500 -Wa,-me500mc -mabi=elfv1 -mbig-endian    -Wl,-soname=linux-vdso64.so.1 -D__VDSO64__ -s -c -o arch/powerpc/kernel/vdso/gettimeofday-64.o arch/powerpc/kernel/vdso/gettimeofday.S
> 	arch/powerpc/kernel/vdso/gettimeofday.S: Assembler messages:
> 	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: `stdu'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: `stdu'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: `std'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: `std'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: `ld'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: `ld'
> 	...
> 	make[1]: *** [arch/powerpc/kernel/vdso/Makefile:76: arch/powerpc/kernel/vdso/gettimeofday-64.o] Error 1
> 	make: *** [arch/powerpc/Makefile:387: vdso_prepare] Error 2
> 
> This is due to assembler being called with -me500mc which is
> a 32 bits target.
> 
> The problem comes from the fact that CONFIG_PPC_E500MC is selected for
> both the e500mc (32 bits) and the e5500 (64 bits), and therefore the
> following makefile rule is wrong:
> 
>   cpu-as-$(CONFIG_PPC_E500MC)    += $(call as-option,-Wa$(comma)-me500mc)
> 
> Today we have CONFIG_TARGET_CPU which provides the identification of the
> expected CPU, it is used for GCC. Once GCC knows the target CPU, it adds
> the correct CPU option to assembler, no need to add it explicitely.
> 
> With that change (And also commit 825eada7717c ("powerpc/64: Set
> default CPU in Kconfig")), it now is:
> 
>   powerpc64-linux-gcc -Wp,-MMD,arch/powerpc/kernel/vdso/.gettimeofday-64.o.d -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/generated  -I./include -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/compiler-version.h -include ./include/linux/kconfig.h -D__KERNEL__ -I ./arch/powerpc -DHAVE_AS_ATHIGH=1 -fmacro-prefix-map=./= -D__ASSEMBLY__ -fno-PIE -m64 -Wl,-a64 -mabi=elfv1 -mcpu=e500mc64 -mabi=elfv1 -mbig-endian    -Wl,-soname=linux-vdso64.so.1 -D__VDSO64__ -s -c -o arch/powerpc/kernel/vdso/gettimeofday-64.o arch/powerpc/kernel/vdso/gettimeofday.S
> 
> Reported-by: Jan-Benedict Glaw <jbglaw@lug-owl.de>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Pali Rohár <pali@kernel.org>

> ---
> v3: Remove -Wa,-mXXX completery as there are additional mismatches between -mcpu and -Wa-m (eg: 8540 vs e500). When given the proper -mcpu=, GCC gives the correct option to assembler.
> 
> v2: When target cpu is powerpc, the option to be used is -mppc
> 
> Commit 825eada7717c is in powerpc/next-test branch. Make sure the SHA doesn't change when it goes into powerpc/next
> ---
>  arch/powerpc/Makefile | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index bf5f0a998273..0f9f291895cb 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -201,18 +201,14 @@ KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
>  # often slow when they are implemented at all
>  KBUILD_CFLAGS		+= $(call cc-option,-mno-string)
>  
> -cpu-as-$(CONFIG_40x)		+= -Wa,-m405
> -cpu-as-$(CONFIG_44x)		+= -Wa,-m440
>  cpu-as-$(CONFIG_ALTIVEC)	+= $(call as-option,-Wa$(comma)-maltivec)
> -cpu-as-$(CONFIG_PPC_E500)		+= -Wa,-me500
>  
>  # When using '-many -mpower4' gas will first try and find a matching power4
>  # mnemonic and failing that it will allow any valid mnemonic that GAS knows
>  # about. GCC will pass -many to GAS when assembling, clang does not.
>  # LLVM IAS doesn't understand either flag: https://github.com/ClangBuiltLinux/linux/issues/675
>  # but LLVM IAS only supports ISA >= 2.06 for Book3S 64 anyway...
> -cpu-as-$(CONFIG_PPC_BOOK3S_64)	+= $(call as-option,-Wa$(comma)-mpower4) $(call as-option,-Wa$(comma)-many)
> -cpu-as-$(CONFIG_PPC_E500MC)	+= $(call as-option,-Wa$(comma)-me500mc)
> +cpu-as-$(CONFIG_PPC_BOOK3S_64)	+= $(call as-option,-Wa$(comma)-many)
>  
>  KBUILD_AFLAGS += $(cpu-as-y)
>  KBUILD_CFLAGS += $(cpu-as-y)
> -- 
> 2.38.1
> 

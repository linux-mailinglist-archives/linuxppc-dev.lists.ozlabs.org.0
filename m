Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEC2649563
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Dec 2022 18:33:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NVX0m2rp9z3cDM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 04:33:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XuECyXjL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XuECyXjL;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NVWzr33dmz3bbD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 04:32:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6200460DD6;
	Sun, 11 Dec 2022 17:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA8BC433D2;
	Sun, 11 Dec 2022 17:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670779955;
	bh=GnbGX190nbIDyCV6ahpz9IvylT61XXWwj1Tl9mATvhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XuECyXjLx7Kf3xopKJxhflv4u5vHeeC/5ZppSVAuUeWqNWUTnQ7EYQuWPAI05WHCh
	 YbqmP2/01hV32axzaNdAG+7WErfMB3VYX0AdsVJ/qoPKiZX1CyEXYI/bT2WJuJX/5i
	 4wqv3U/z1MdfKhUgtDWK7AnerdmWXoBdL9YbW7zbsh9pNin4yu7moBjToALfpk4xA/
	 W4gbU4oZL2VqRSlz0e3dhpaJjzTByx+4EoVhdtLi+I21PMLUi39BBbbblMkFB0cMT1
	 kq3D/qvwQwO/+f3L2tpAJEX2yu/rUICjRNmLommTJ9iceSmczjtt8/CXM+b05PwkXI
	 +JomN1cjQhLSg==
Received: by pali.im (Postfix)
	id 73B5C872; Sun, 11 Dec 2022 18:32:32 +0100 (CET)
Date: Sun, 11 Dec 2022 18:32:32 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 5/5] powerpc/64e: Fix build failure with GCC 12
 (unrecognized opcode: `wrteei')
Message-ID: <20221211173232.7hvgnadyr7wrdm2f@pali>
References: <8abab4888da69ff78b73a56f64d9678a7bf684e9.1657549153.git.christophe.leroy@csgroup.eu>
 <77255a5a957967723b84d0356d9e5fb21569f4e8.1657549153.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77255a5a957967723b84d0356d9e5fb21569f4e8.1657549153.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 11 July 2022 16:19:33 Christophe Leroy wrote:
> With GCC 12, corenet64_smp_defconfig leads to the following build errors:
> 
>   CC      arch/powerpc/kernel/irq.o
> {standard input}: Assembler messages:
> {standard input}:3616: Error: unrecognized opcode: `wrteei'
> {standard input}:5689: Error: unrecognized opcode: `wrteei'
>   CC      arch/powerpc/kernel/pmc.o
> {standard input}: Assembler messages:
> {standard input}:42: Error: unrecognized opcode: `mfpmr'
> {standard input}:53: Error: unrecognized opcode: `mtpmr'
>   CC      arch/powerpc/kernel/io.o
> {standard input}: Assembler messages:
> {standard input}:376: Error: unrecognized opcode: `mbar'
> ...
>   CC      arch/powerpc/mm/nohash/book3e_hugetlbpage.o
> {standard input}: Assembler messages:
> {standard input}:291: Error: unrecognized opcode: `tlbsx'
> {standard input}:482: Error: unrecognized opcode: `tlbwe'
> {standard input}:608: Error: unrecognized opcode: `lbarx'
> {standard input}:608: Error: unrecognized opcode: `stbcx.'
> 
> -mpcu=powerpc64 cannot be used anymore for book3e, it must be a booke CPU.
> 
> But then we get:
> 
>   CC      arch/powerpc/lib/xor_vmx.o
> cc1: error: AltiVec not supported in this target
> 
> Altivec is not supported with -mcpu=e5500 so don't allow selection
> of altivec when e5500 is selected.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/Makefile                  | 8 +-------
>  arch/powerpc/platforms/Kconfig.cputype | 8 ++++----
>  2 files changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index d54e1fe03551..02742facf895 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -168,13 +168,7 @@ endif
>  CFLAGS-$(CONFIG_TARGET_CPU_BOOL) += $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))
>  AFLAGS-$(CONFIG_TARGET_CPU_BOOL) += $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))
>  
> -# Altivec option not allowed with e500mc64 in GCC.
> -ifdef CONFIG_ALTIVEC
> -E5500_CPU := -mcpu=powerpc64
> -else
> -E5500_CPU := $(call cc-option,-mcpu=e500mc64,-mcpu=powerpc64)
> -endif
> -CFLAGS-$(CONFIG_E5500_CPU) += $(E5500_CPU)
> +CFLAGS-$(CONFIG_E5500_CPU) += $(call cc-option,-mcpu=e500mc64,-mcpu=powerpc64)
>  CFLAGS-$(CONFIG_E6500_CPU) += $(call cc-option,-mcpu=e6500,$(E5500_CPU))

Hello! I think that there is an issue. After removal of E5500_CPU
variable few line above, it cannot be used in CFLAGS-$(CONFIG_E6500_CPU)
assignment, because it is empty.

>  
>  asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 3cc8452b8660..5185d942b455 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -126,12 +126,12 @@ choice
>  
>  config GENERIC_CPU
>  	bool "Generic (POWER4 and above)"
> -	depends on PPC64 && !CPU_LITTLE_ENDIAN
> -	select PPC_64S_HASH_MMU if PPC_BOOK3S_64
> +	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
> +	select PPC_64S_HASH_MMU
>  
>  config GENERIC_CPU
>  	bool "Generic (POWER8 and above)"
> -	depends on PPC64 && CPU_LITTLE_ENDIAN
> +	depends on PPC_BOOK3S_64 && CPU_LITTLE_ENDIAN
>  	select ARCH_HAS_FAST_MULTIPLIER
>  	select PPC_64S_HASH_MMU
>  
> @@ -358,7 +358,7 @@ config PHYS_64BIT
>  
>  config ALTIVEC
>  	bool "AltiVec Support"
> -	depends on PPC_BOOK3S_32 || PPC_BOOK3S_64 || (PPC_E500MC && PPC64)
> +	depends on PPC_BOOK3S || (PPC_E500MC && PPC64 && !E5500_CPU)
>  	select PPC_FPU
>  	help
>  	  This option enables kernel support for the Altivec extensions to the
> -- 
> 2.36.1
> 

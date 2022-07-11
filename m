Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 658FD56D0AC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Jul 2022 20:12:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lgw8V1lRfz3c3X
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 04:12:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lmszXVeT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lmszXVeT;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lgw7t6qG4z30LS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 04:11:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C73C2B80B79;
	Sun, 10 Jul 2022 18:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23376C3411E;
	Sun, 10 Jul 2022 18:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657476694;
	bh=2rUroKv3Ty3cfwJx41D/ngUb3zqOyDNmBVI9meqIhfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lmszXVeTvpw0cB3sWABvUNFfqRUEjsAlTvjtVdojovZ7tppiDKouiLttjFH9SZCgo
	 rKzPeMYfQ+Zkwk3/02ykZEX+KSiUW9/2cxFyhHWnVlBOOGBKCLLio71lQlxUnytohy
	 ykCxA94UZ5KPzwz44wWdDCHe/i5/eZ8XL8VPVrrwAWYeBINVJNmRirY0TkO43HqpU6
	 B0S+Z+wdZQacnKaWrmK6AhPA74CkHDnEYJpG0PIyB7CVC6G4ZEV9TEdss6FGI6eCDF
	 7ZQBiY+b+o0x9LfP3yNLWbUzvnYxVG7EuOF3U57w+rmRcYRT+pw3uZTAi/WVKIpKQX
	 npwJSj1ktrt6g==
Received: by pali.im (Postfix)
	id 29DB2792; Sun, 10 Jul 2022 20:11:31 +0200 (CEST)
Date: Sun, 10 Jul 2022 20:11:31 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32: Don't always pass -mcpu=powerpc to the
 compiler
Message-ID: <20220710181131.n6zbw4wot374cn7x@pali>
References: <e547df86b7195bb9cc5558afb4c74aeefe286849.1657474606.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e547df86b7195bb9cc5558afb4c74aeefe286849.1657474606.git.christophe.leroy@csgroup.eu>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sunday 10 July 2022 19:36:58 Christophe Leroy wrote:
> Since commit 4bf4f42a2feb ("powerpc/kbuild: Set default generic
> machine type for 32-bit compile"), when building a 32 bits kernel
> with a bi-arch version of GCC, or when building a book3s/32 kernel,
> the option -mcpu=powerpc is passed to GCC at all time, relying on it
> being eventually overriden by a subsequent -mcpu=xxxx.
> 
> But when building the same kernel with a 32 bits only version of GCC,
> that is not done, relying on gcc being built with the expected default
> CPU.
> 
> This logic has two problems. First, it is a bit fragile to rely on
> whether the GCC version is bi-arch or not, because today we can have
> bi-arch versions of GCC configured with a 32 bits default. Second,
> there are some versions of GCC which don't support -mcpu=powerpc,
> for instance for e500 SPE-only versions.
> 
> So, stop relying on this approximative logic and allow the user to
> decide whether he/she wants to use the toolchain's default CPU or if
> he/she wants to set one, and allow only possible CPUs based on the
> selected target.
> 
> Reported-by: Pali Rohár <pali@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Segher Boessenkool <segher@kernel.crashing.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Tested-by: Pali Rohár <pali@kernel.org>

Works fine with SPE-based gcc for e500v2 platform Freescale P2020.

I have small suggestion for naming convention, see below.

> ---
>  arch/powerpc/Makefile                  | 26 +-------------------------
>  arch/powerpc/platforms/Kconfig.cputype | 24 ++++++++++++++++++++----
>  2 files changed, 21 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index a0cd70712061..d54e1fe03551 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -15,23 +15,6 @@ HAS_BIARCH	:= $(call cc-option-yn, -m32)
>  # Set default 32 bits cross compilers for vdso and boot wrapper
>  CROSS32_COMPILE ?=
>  
> -ifeq ($(HAS_BIARCH),y)
> -ifeq ($(CROSS32_COMPILE),)
> -ifdef CONFIG_PPC32
> -# These options will be overridden by any -mcpu option that the CPU
> -# or platform code sets later on the command line, but they are needed
> -# to set a sane 32-bit cpu target for the 64-bit cross compiler which
> -# may default to the wrong ISA.
> -KBUILD_CFLAGS		+= -mcpu=powerpc
> -KBUILD_AFLAGS		+= -mcpu=powerpc
> -endif
> -endif
> -endif
> -
> -ifdef CONFIG_PPC_BOOK3S_32
> -KBUILD_CFLAGS		+= -mcpu=powerpc
> -endif
> -
>  # If we're on a ppc/ppc64/ppc64le machine use that defconfig, otherwise just use
>  # ppc64_defconfig because we have nothing better to go on.
>  uname := $(shell uname -m)
> @@ -183,6 +166,7 @@ endif
>  endif
>  
>  CFLAGS-$(CONFIG_TARGET_CPU_BOOL) += $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))
> +AFLAGS-$(CONFIG_TARGET_CPU_BOOL) += $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))
>  
>  # Altivec option not allowed with e500mc64 in GCC.
>  ifdef CONFIG_ALTIVEC
> @@ -193,14 +177,6 @@ endif
>  CFLAGS-$(CONFIG_E5500_CPU) += $(E5500_CPU)
>  CFLAGS-$(CONFIG_E6500_CPU) += $(call cc-option,-mcpu=e6500,$(E5500_CPU))
>  
> -ifdef CONFIG_PPC32
> -ifdef CONFIG_PPC_E500MC
> -CFLAGS-y += $(call cc-option,-mcpu=e500mc,-mcpu=powerpc)
> -else
> -CFLAGS-$(CONFIG_E500) += $(call cc-option,-mcpu=8540 -msoft-float,-mcpu=powerpc)
> -endif
> -endif
> -
>  asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
>  
>  KBUILD_CPPFLAGS	+= -I $(srctree)/arch/$(ARCH) $(asinstr)
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 383ed4fe6013..197653442d9f 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -117,7 +117,8 @@ endchoice
>  
>  choice
>  	prompt "CPU selection"
> -	default GENERIC_CPU
> +	default GENERIC_CPU if PPC64
> +	default POWERPC_CPU if PPC32
>  	help
>  	  This will create a kernel which is optimised for a particular CPU.
>  	  The resulting kernel may not run on other CPUs, so use this with care.
> @@ -135,9 +136,13 @@ config GENERIC_CPU
>  	select ARCH_HAS_FAST_MULTIPLIER
>  	select PPC_64S_HASH_MMU
>  
> -config GENERIC_CPU
> +config POWERPC_CPU
>  	bool "Generic 32 bits powerpc"
> -	depends on PPC32 && !PPC_8xx
> +	depends on PPC32 && !PPC_8xx && !E500
> +
> +config TOOLCHAIN_DEFAULT_CPU
> +	bool "Rely on the toolchain's implicit default CPU"
> +	depends on PPC32
>  
>  config CELL_CPU
>  	bool "Cell Broadband Engine"
> @@ -196,11 +201,19 @@ config G4_CPU
>  	depends on PPC_BOOK3S_32
>  	select ALTIVEC
>  
> +config 8540_CPU
> +	bool "8540"
> +	depends on PPC_85xx && !PPC_E500MC

MPC8540 is name of the first (Motorola) SoC which had e500(v1) core.
e500 cores are used also in new Freescale P1/P2 series and also in
BSC913x and C29x products.

So I would suggest to call this 'config E500_CPU' with description
'bool "e500 (8540)"' because all other *_CPU options are named by the
CPU core, not by the SoC product which core contains. There is e.g.
E5500_CPU, E300C2_CPU or E500MC_CPU.

It is confusing that gcc named this option "-mcpu=8540" and not
"-mcpu=e500". For example GNU AS call this option "-me500" and I read
somewhere that clang/llvm wanted to add "-mcpu=e500" as an alias.

For example with this change:

diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 6c2b2d2c8bfc..8c8dd3c066f9 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -202,8 +202,8 @@ config G4_CPU
 	depends on PPC_BOOK3S_32
 	select ALTIVEC
 
-config 8540_CPU
-	bool "8540"
+config E500_CPU
+	bool "e500 (8540)"
 	depends on PPC_85xx && !PPC_E500MC
 
 config E500MC_CPU
@@ -229,7 +229,7 @@ config TARGET_CPU
 	default "e300c2" if E300C2_CPU
 	default "e300c3" if E300C3_CPU
 	default "G4" if G4_CPU
-	default "8540" if 8540_CPU
+	default "8540" if E500_CPU
 	default "e500mc" if E500MC_CPU
 	default "powerpc" if POWERPC_CPU
 

> +
> +config E500MC_CPU
> +	bool "e500mc"
> +	depends on PPC_85xx && PPC_E500MC
> +
>  endchoice
>  
>  config TARGET_CPU_BOOL
>  	bool
> -	default !GENERIC_CPU
> +	default !GENERIC_CPU && !TOOLCHAIN_DEFAULT_CPU
>  
>  config TARGET_CPU
>  	string
> @@ -215,6 +228,9 @@ config TARGET_CPU
>  	default "e300c2" if E300C2_CPU
>  	default "e300c3" if E300C3_CPU
>  	default "G4" if G4_CPU
> +	default "8540" if 8540_CPU
> +	default "e500mc" if E500MC_CPU
> +	default "powerpc" if POWERPC_CPU
>  
>  config PPC_BOOK3S
>  	def_bool y
> -- 
> 2.36.1
> 

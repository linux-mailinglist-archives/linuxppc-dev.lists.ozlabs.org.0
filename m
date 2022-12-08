Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D522F647602
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 20:14:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSkNX4nwmz3cG7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 06:14:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sF+r+0o/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sF+r+0o/;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSkMX2BQsz3bfv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Dec 2022 06:13:28 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5ED1FB825FC;
	Thu,  8 Dec 2022 19:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D86C433D2;
	Thu,  8 Dec 2022 19:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670526802;
	bh=4S2EY5Lob8l4rRdqqTezVLflo0p1tzugJYBkZhUb91o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sF+r+0o/s3NagjT0nfubNgusdXqBVRdwdHxdPED8imL+82NjK1MBgsrb45IJhC9la
	 B13a54I16a74fe07b9cpE8GAcmJULm1sN7kK56UbjCK9lXKFyupA9xgyqdu1aJdPqF
	 gABlszvPFPHHjEBJ32TVULju7TO7U1SupPgUzU4w8qr64431x+hYcuWGhi39Ttkqfa
	 0wGD0pWExp+QisFysQ+7M4IgZC8YEw835AMUeLk16oFu/Q4H3xRZObEB3M848paY6U
	 2p00CEmQE0UrsHgZptlA2jpvbd0ISubWEOZdIwsTCb3TXAS6gJxnP54hPjMaTS4zPk
	 HaZxZlWtP9VDw==
Received: by pali.im (Postfix)
	id 4566E97E; Thu,  8 Dec 2022 20:13:18 +0100 (CET)
Date: Thu, 8 Dec 2022 20:13:18 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1] powerpc/64: Set default CPU in Kconfig
Message-ID: <20221208191318.air76sl5inxckmdp@pali>
References: <3fd60c2d8a28668a42b766b18362a526ef47e757.1670420281.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fd60c2d8a28668a42b766b18362a526ef47e757.1670420281.git.christophe.leroy@csgroup.eu>
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

On Wednesday 07 December 2022 14:38:40 Christophe Leroy wrote:
> Since 0069f3d14e7a ("powerpc/64e: Tie PPC_BOOK3E_64 to PPC_E500MC"),
> the only possible BOOK3E/64 are E500, so no need of a default CPU
> over the E5500.
> When the user selects book3e, he must have a e500 compatible compiler,
> and it won't work anymore with the default -mcpu=power64, see
> commit d6b551b8f90c ("powerpc/64e: Fix build failure with GCC 12
> (unrecognized opcode: `wrteei')")
> 
> For book3s/64, replace GENERIC_CPU by POWERPC64_CPU to match the PPC32
> POWERPC_CPU, and set a default mpcu value in Kconfig directly.
> 
> When a user selects a particular CPU, he must ensure his compiler has
> the requested capability. Therefore, remove hidden fallback, instead
> offer user the possibility to say he wants to use toolchain default.
> 
> Reported-by: Pali Rohár <pali@kernel.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Tested-by: Pali Rohár <pali@kernel.org>

$ make ARCH=powerpc CROSS_COMPILE=powerpc64-linux-gnu- corenet64_smp_defconfig
...
# configuration written to .config

$ grep CONFIG_TARGET_CPU .config
CONFIG_TARGET_CPU_BOOL=y
CONFIG_TARGET_CPU="e500mc64"

Without this patch CONFIG_TARGET_CPU is not set but CONFIG_TARGET_CPU_BOOL is.

> ---
>  arch/powerpc/Makefile                  | 22 +++++-----------------
>  arch/powerpc/platforms/Kconfig.cputype | 12 +++++++-----
>  2 files changed, 12 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index dc4cbf0a5ca9..bf5f0a998273 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -146,19 +146,6 @@ CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option, $(MULTIPLEWORD))
>  
>  CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option,-mno-readonly-in-sdata)
>  
> -ifdef CONFIG_PPC_BOOK3S_64
> -ifdef CONFIG_CPU_LITTLE_ENDIAN
> -CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=power8
> -else
> -CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=power4
> -endif
> -CFLAGS-$(CONFIG_GENERIC_CPU) += $(call cc-option,-mtune=power10,	\
> -				  $(call cc-option,-mtune=power9,	\
> -				  $(call cc-option,-mtune=power8)))
> -else ifdef CONFIG_PPC_BOOK3E_64
> -CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=powerpc64
> -endif
> -
>  ifdef CONFIG_FUNCTION_TRACER
>  CC_FLAGS_FTRACE := -pg
>  ifdef CONFIG_MPROFILE_KERNEL
> @@ -166,11 +153,12 @@ CC_FLAGS_FTRACE += -mprofile-kernel
>  endif
>  endif
>  
> -CFLAGS-$(CONFIG_TARGET_CPU_BOOL) += $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))
> -AFLAGS-$(CONFIG_TARGET_CPU_BOOL) += $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))
> +CFLAGS-$(CONFIG_TARGET_CPU_BOOL) += -mcpu=$(CONFIG_TARGET_CPU)
> +AFLAGS-$(CONFIG_TARGET_CPU_BOOL) += -mcpu=$(CONFIG_TARGET_CPU)
>  
> -CFLAGS-$(CONFIG_E5500_CPU) += $(call cc-option,-mcpu=e500mc64,-mcpu=powerpc64)
> -CFLAGS-$(CONFIG_E6500_CPU) += $(call cc-option,-mcpu=e6500,$(E5500_CPU))
> +CFLAGS-$(CONFIG_POWERPC64_CPU) += $(call cc-option,-mtune=power10,	\
> +				  $(call cc-option,-mtune=power9,	\
> +				  $(call cc-option,-mtune=power8)))
>  
>  asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
>  
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 9563336e3348..31cea2eeb59e 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -118,19 +118,18 @@ endchoice
>  
>  choice
>  	prompt "CPU selection"
> -	default GENERIC_CPU
>  	help
>  	  This will create a kernel which is optimised for a particular CPU.
>  	  The resulting kernel may not run on other CPUs, so use this with care.
>  
>  	  If unsure, select Generic.
>  
> -config GENERIC_CPU
> +config POWERPC64_CPU
>  	bool "Generic (POWER5 and PowerPC 970 and above)"
>  	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
>  	select PPC_64S_HASH_MMU
>  
> -config GENERIC_CPU
> +config POWERPC64_CPU
>  	bool "Generic (POWER8 and above)"
>  	depends on PPC_BOOK3S_64 && CPU_LITTLE_ENDIAN
>  	select ARCH_HAS_FAST_MULTIPLIER
> @@ -233,13 +232,12 @@ config E500MC_CPU
>  
>  config TOOLCHAIN_DEFAULT_CPU
>  	bool "Rely on the toolchain's implicit default CPU"
> -	depends on PPC32
>  
>  endchoice
>  
>  config TARGET_CPU_BOOL
>  	bool
> -	default !GENERIC_CPU && !TOOLCHAIN_DEFAULT_CPU
> +	default !TOOLCHAIN_DEFAULT_CPU
>  
>  config TARGET_CPU
>  	string
> @@ -251,6 +249,10 @@ config TARGET_CPU
>  	default "power8" if POWER8_CPU
>  	default "power9" if POWER9_CPU
>  	default "power10" if POWER10_CPU
> +	default "e500mc64" if E5500_CPU
> +	default "e6500" if E6500_CPU
> +	default "power4" if POWERPC64_CPU && !CPU_LITTLE_ENDIAN
> +	default "power8" if POWERPC64_CPU && CPU_LITTLE_ENDIAN
>  	default "405" if 405_CPU
>  	default "440" if 440_CPU
>  	default "464" if 464_CPU
> -- 
> 2.38.1
> 

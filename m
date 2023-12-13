Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F65811915
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 17:20:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PSNZEtly;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sr11L6mB8z3c5t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 03:20:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PSNZEtly;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sr10V6wGWz2yGv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 03:19:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DEA0A61C04;
	Wed, 13 Dec 2023 16:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D2AC433C9;
	Wed, 13 Dec 2023 16:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702484390;
	bh=rtYsdGUgzG4gShOq5eir9uSz6Dv02AOWRgbvbC1z6QE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PSNZEtlyKCT/FLY4w9ZppFBut3oFTo86KvXQ19A5ut2LSqARZgZyhF61vRtVNrlEe
	 Ay6EDQ78iJiWMBryaP7r58sTbMMPPeFtYOwsHvf0y/xUOHdevS95ZXyDZ5996bVweU
	 sv4KhhPsk0N6ZxNbb6aTXaRmvvfIxXMebINNc1JCdEbg3xS5+77zm0cfnfALLOjYaI
	 LOX2IHnhNjki/2k4b+A3P3mcp4sjgIq92Q/94wAC7sdnVuHgtC7eESr3vtcaq3I9gA
	 6uX/hRFS0gmB3XF6ZMoRq4x6IVDRMvD7vXlc24FhXwedhXTL2t+QN7yPIx4aLREPb6
	 C/OnndWIpOX3Q==
Date: Wed, 13 Dec 2023 16:19:44 +0000
From: Will Deacon <will@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>, ardb@kernel.org
Subject: Re: [RFC PATCH 04/12] arm64: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Message-ID: <20231213161944.GA32062@willie-the-truck>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-5-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208055501.2916202-5-samuel.holland@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 07, 2023 at 09:54:34PM -0800, Samuel Holland wrote:
> arm64 provides an equivalent to the common kernel-mode FPU API, but in a
> different header and using different function names. Add a wrapper
> header, and export CFLAGS adjustments as found in lib/raid6/Makefile.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
>  arch/arm64/Kconfig           |  1 +
>  arch/arm64/Makefile          |  9 ++++++++-
>  arch/arm64/include/asm/fpu.h | 17 +++++++++++++++++
>  3 files changed, 26 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/include/asm/fpu.h
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 7b071a00425d..485ac389ac11 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -30,6 +30,7 @@ config ARM64
>  	select ARCH_HAS_GCOV_PROFILE_ALL
>  	select ARCH_HAS_GIGANTIC_PAGE
>  	select ARCH_HAS_KCOV
> +	select ARCH_HAS_KERNEL_FPU_SUPPORT if KERNEL_MODE_NEON
>  	select ARCH_HAS_KEEPINITRD
>  	select ARCH_HAS_MEMBARRIER_SYNC_CORE
>  	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 9a2d3723cd0f..4a65f24c7998 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -36,7 +36,14 @@ ifeq ($(CONFIG_BROKEN_GAS_INST),y)
>  $(warning Detected assembler with broken .inst; disassembly will be unreliable)
>  endif
>  
> -KBUILD_CFLAGS	+= -mgeneral-regs-only	\
> +# The GCC option -ffreestanding is required in order to compile code containing
> +# ARM/NEON intrinsics in a non C99-compliant environment (such as the kernel)
> +CC_FLAGS_FPU	:= -ffreestanding
> +# Enable <arm_neon.h>
> +CC_FLAGS_FPU	+= -isystem $(shell $(CC) -print-file-name=include)
> +CC_FLAGS_NO_FPU	:= -mgeneral-regs-only
> +
> +KBUILD_CFLAGS	+= $(CC_FLAGS_NO_FPU) \
>  		   $(compat_vdso) $(cc_has_k_constraint)
>  KBUILD_CFLAGS	+= $(call cc-disable-warning, psabi)
>  KBUILD_AFLAGS	+= $(compat_vdso)

Can you use this to replace the same logic in arch/arm64/lib/Makefile,
like you do for arch/arm/?

Will

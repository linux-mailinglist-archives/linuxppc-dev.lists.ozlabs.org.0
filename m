Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 707181CEA5C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 03:58:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LgtZ39c5zDqmd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 11:57:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Lgrd1XnrzDqlc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 11:56:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=eXVA8bld; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49Lgrc0hFsz9sSW; Tue, 12 May 2020 11:56:16 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49Lgrb5p8Zz9sRY;
 Tue, 12 May 2020 11:56:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1589248575;
 bh=1rLVXiqQF0oXhqxfyOkX5mhyIRTT31QjSiTEBjqNbyI=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=eXVA8bld+l61UA1Ia5G4I+1hSYwg3WMOhnvBuQOl9dwHEr6dBdoPZLPVe+wSoFuKv
 Dg/L/Bf2y/bRFpDu4S3QVT09QDuGbCE+cmiG1L4/YW6dLKEDFhI2/SaAnE4EqRYg2J
 Zxutm8s7YFrVBrizm5vLEr1uK8jTwpAPKJr1wWWWgQPnaXqmZRZHo5kGEG6h04OAqy
 CSzXrg6Ok8L4N8HBlbhZpFSh5/8YJdGlCEllISwBO5YXpALrZRoU9ngirwrPjo1NMp
 wGUoUd227ktLOMAj+wpXJRGl047ovwLf6+AxJ5fHblxjXvbNsk6z10L1n3WN/LlAs8
 Cq9xaFhqjTCaA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Paul Mackerras <paulus@ozlabs.org>, linuxppc-dev@ozlabs.org,
 Benjamin Herrenschmidt <benh@ozlabs.org>, Michael Neuling <mikey@neuling.org>,
 Anton Blanchard <anton@ozlabs.org>
Subject: Re: [PATCH RFC 2/4] powerpc: Add Microwatt platform
In-Reply-To: <20200509050255.GC1464954@thinks.paulus.ozlabs.org>
References: <20200509050103.GA1464954@thinks.paulus.ozlabs.org>
 <20200509050255.GC1464954@thinks.paulus.ozlabs.org>
Date: Tue, 12 May 2020 11:56:33 +1000
Message-ID: <87sgg5c3vy.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Paul Mackerras <paulus@ozlabs.org> writes:
> Microwatt is a FPGA-based implementation of the Power ISA.  It
> currently only implements little-endian 64-bit mode, and does
> not (yet) support SMP.

... or FP or VSX or Altivec?

What about transactional memory?

> This adds a new machine type to support FPGA-based SoCs with a
> Microwatt core.
>
> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> ---
>  arch/powerpc/Kconfig                      |    2 +-
>  arch/powerpc/configs/microwatt_defconfig  | 1418 +++++++++++++++++++++
>  arch/powerpc/platforms/Kconfig            |    1 +
>  arch/powerpc/platforms/Makefile           |    1 +
>  arch/powerpc/platforms/microwatt/Kconfig  |    9 +
>  arch/powerpc/platforms/microwatt/Makefile |    1 +
>  arch/powerpc/platforms/microwatt/setup.c  |   40 +
>  7 files changed, 1471 insertions(+), 1 deletion(-)
>  create mode 100644 arch/powerpc/configs/microwatt_defconfig
>  create mode 100644 arch/powerpc/platforms/microwatt/Kconfig
>  create mode 100644 arch/powerpc/platforms/microwatt/Makefile
>  create mode 100644 arch/powerpc/platforms/microwatt/setup.c
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 497b7d0b2d7e..97286b8312f5 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -407,7 +407,7 @@ config HUGETLB_PAGE_SIZE_VARIABLE
>  
>  config MATH_EMULATION
>  	bool "Math emulation"
> -	depends on 4xx || PPC_8xx || PPC_MPC832x || BOOKE
> +	depends on 4xx || PPC_8xx || PPC_MPC832x || BOOKE || PPC_MICROWATT
>  	help
>  	  Some PowerPC chips designed for embedded applications do not have
>  	  a floating-point unit and therefore do not implement the
> diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/configs/microwatt_defconfig
> new file mode 100644
> index 000000000000..f4f4c965a786
> --- /dev/null
> +++ b/arch/powerpc/configs/microwatt_defconfig
> @@ -0,0 +1,1418 @@
> +#
> +# Automatically generated file; DO NOT EDIT.
> +# Linux/powerpc 5.6.0 Kernel Configuration
> +#
> +
> +#
> +# Compiler: powerpc64le-linux-gnu-gcc (GCC) 9.2.1 20190827 (Red Hat Cross 9.2.1-1)
> +#
> +CONFIG_CC_IS_GCC=y
> +CONFIG_GCC_VERSION=90201
> +CONFIG_CLANG_VERSION=0
> +CONFIG_CC_HAS_ASM_GOTO=y
> +CONFIG_CC_HAS_ASM_INLINE=y
> +CONFIG_CC_HAS_WARN_MAYBE_UNINITIALIZED=y
> +CONFIG_CC_DISABLE_WARN_MAYBE_UNINITIALIZED=y
> +CONFIG_IRQ_WORK=y
> +CONFIG_BUILDTIME_TABLE_SORT=y
> +CONFIG_THREAD_INFO_IN_TASK=y

This should be a minimised config generated with savedefconfig.

> diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
> index 1f8025383caa..5b701acc6afa 100644
> --- a/arch/powerpc/platforms/Kconfig
> +++ b/arch/powerpc/platforms/Kconfig
> @@ -20,6 +20,7 @@ source "arch/powerpc/platforms/embedded6xx/Kconfig"
>  source "arch/powerpc/platforms/44x/Kconfig"
>  source "arch/powerpc/platforms/40x/Kconfig"
>  source "arch/powerpc/platforms/amigaone/Kconfig"
> +source "arch/powerpc/platforms/microwatt/Kconfig"
>  
>  config KVM_GUEST
>  	bool "KVM Guest support"
> diff --git a/arch/powerpc/platforms/Makefile b/arch/powerpc/platforms/Makefile
> index 143d4417f6cc..edcb54cdb1a8 100644
> --- a/arch/powerpc/platforms/Makefile
> +++ b/arch/powerpc/platforms/Makefile
> @@ -22,3 +22,4 @@ obj-$(CONFIG_PPC_CELL)		+= cell/
>  obj-$(CONFIG_PPC_PS3)		+= ps3/
>  obj-$(CONFIG_EMBEDDED6xx)	+= embedded6xx/
>  obj-$(CONFIG_AMIGAONE)		+= amigaone/
> +obj-$(CONFIG_PPC_MICROWATT)	+= microwatt/
> diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
> new file mode 100644
> index 000000000000..981f722ae9ce
> --- /dev/null
> +++ b/arch/powerpc/platforms/microwatt/Kconfig
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0
> +config PPC_MICROWATT
> +	depends on PPC64 && PPC_BOOK3S

That can just be PPC_BOOK3S_64

I think it should also depend on !CPU_BIG_ENDIAN && !SMP ?

Should it also select MATH_EMULATION?
And MATH_EMULATION_FULL ?

> +	bool "Microwatt SoC platform"
> +	select PPC_XICS
> +	select PPC_NATIVE
> +	help
> +          This option enables support for FPGA-based Microwatt implementations.
> +
> diff --git a/arch/powerpc/platforms/microwatt/Makefile b/arch/powerpc/platforms/microwatt/Makefile
> new file mode 100644
> index 000000000000..e6885b3b2ee7
> --- /dev/null
> +++ b/arch/powerpc/platforms/microwatt/Makefile
> @@ -0,0 +1 @@
> +obj-y	+= setup.o
> diff --git a/arch/powerpc/platforms/microwatt/setup.c b/arch/powerpc/platforms/microwatt/setup.c
> new file mode 100644
> index 000000000000..3cfc5955a6fe
> --- /dev/null
> +++ b/arch/powerpc/platforms/microwatt/setup.c
> @@ -0,0 +1,40 @@
> +/*
> + * Microwatt FPGA-based SoC platform setup code.
> + *
> + * Copyright 2020 Paul Mackerras (paulus@ozlabs.org), IBM Corp.
> + */
> +
> +#include <linux/types.h>
> +#include <linux/kernel.h>
> +#include <linux/stddef.h>
> +#include <linux/init.h>
> +#include <linux/of.h>
> +#include <asm/machdep.h>
> +#include <asm/time.h>
> +
> +static void __init microwatt_calibrate_decr(void)
> +{
> +	ppc_tb_freq = 100000000;
> +	ppc_proc_freq = 100000000;
> +}

Why can't those come via the device tree?

> +
> +static void __init microwatt_setup_arch(void)
> +{
> +}

That can be NULL in ppc_md.

> +static void __init microwatt_init_IRQ(void)
> +{
> +}

Can be NULL in ppc_md.

> +static int __init microwatt_probe(void)
> +{
> +	return of_machine_is_compatible("microwatt-soc");
> +}
> +
> +define_machine(microwatt) {
> +	.name			= "microwatt",
> +	.probe			= microwatt_probe,
> +	.setup_arch		= microwatt_setup_arch,
> +	.init_IRQ		= microwatt_init_IRQ,
> +	.calibrate_decr		= microwatt_calibrate_decr,
> +};
> -- 
> 2.25.3

cheers

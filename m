Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F400617977
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 14:29:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zbQC1LxfzDqK9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 22:29:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zbN841c2zDqD4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 22:27:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44zbN73Xxsz9s9T;
 Wed,  8 May 2019 22:27:51 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/powernv: Move SCOM access code into powernv
 platform
In-Reply-To: <20190508063401.17463-1-ajd@linux.ibm.com>
References: <20190508063401.17463-1-ajd@linux.ibm.com>
Date: Wed, 08 May 2019 22:27:47 +1000
Message-ID: <878svhw2po.fsf@concordia.ellerman.id.au>
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

Andrew Donnellan <ajd@linux.ibm.com> writes:

> The powernv platform is the only one that directly accesses SCOMs. Move the
> support code to platforms/powernv, and get rid of the PPC_SCOM Kconfig
> option, as SCOM support is always selected when compiling for powernv.

This code was used on WSP / A2, back in the past which is why it
originally lived in sysdev.

> This also means that the Kconfig item for CONFIG_SCOM_DEBUGFS will actually
> show up in menuconfig, as previously it was the only labelled option in
> sysdev/Kconfig and wasn't actually in a menu.
>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/scom.h                   | 4 ++--

Can't scom.h move into powernv as well?

And do we even need the whole scom_controller abstraction?

If we ever have another platform that needs it we can always bring it
back.

cheers

>  arch/powerpc/platforms/powernv/Kconfig            | 5 ++++-
>  arch/powerpc/platforms/powernv/Makefile           | 2 +-
>  arch/powerpc/{sysdev => platforms/powernv}/scom.c | 0
>  arch/powerpc/sysdev/Kconfig                       | 7 -------
>  arch/powerpc/sysdev/Makefile                      | 2 --
>  6 files changed, 7 insertions(+), 13 deletions(-)
>  rename arch/powerpc/{sysdev => platforms/powernv}/scom.c (100%)
>
> diff --git a/arch/powerpc/include/asm/scom.h b/arch/powerpc/include/asm/scom.h
> index f5cde45b1161..acc6532a9a9e 100644
> --- a/arch/powerpc/include/asm/scom.h
> +++ b/arch/powerpc/include/asm/scom.h
> @@ -23,7 +23,7 @@
>  
>  #ifdef __KERNEL__
>  #ifndef __ASSEMBLY__
> -#ifdef CONFIG_PPC_SCOM
> +#ifdef CONFIG_PPC_POWERNV
>  
>  /*
>   * The SCOM bus is a sideband bus used for accessing various internal
> @@ -161,7 +161,7 @@ static inline int scom_write(scom_map_t map, u64 reg, u64 value)
>  }
>  
>  
> -#endif /* CONFIG_PPC_SCOM */
> +#endif /* CONFIG_PPC_POWERNV */
>  #endif /* __ASSEMBLY__ */
>  #endif /* __KERNEL__ */
>  #endif /* _ASM_POWERPC_SCOM_H */
> diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
> index 850eee860cf2..938803eab0ad 100644
> --- a/arch/powerpc/platforms/powernv/Kconfig
> +++ b/arch/powerpc/platforms/powernv/Kconfig
> @@ -12,7 +12,6 @@ config PPC_POWERNV
>  	select EPAPR_BOOT
>  	select PPC_INDIRECT_PIO
>  	select PPC_UDBG_16550
> -	select PPC_SCOM
>  	select ARCH_RANDOM
>  	select CPU_FREQ
>  	select PPC_DOORBELL
> @@ -47,3 +46,7 @@ config PPC_VAS
>  	  VAS adapters are found in POWER9 based systems.
>  
>  	  If unsure, say N.
> +
> +config SCOM_DEBUGFS
> +	bool "Expose SCOM controllers via debugfs"
> +	depends on DEBUG_FS
> diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
> index da2e99efbd04..4b1644150135 100644
> --- a/arch/powerpc/platforms/powernv/Makefile
> +++ b/arch/powerpc/platforms/powernv/Makefile
> @@ -4,12 +4,12 @@ obj-y			+= idle.o opal-rtc.o opal-nvram.o opal-lpc.o opal-flash.o
>  obj-y			+= rng.o opal-elog.o opal-dump.o opal-sysparam.o opal-sensor.o
>  obj-y			+= opal-msglog.o opal-hmi.o opal-power.o opal-irqchip.o
>  obj-y			+= opal-kmsg.o opal-powercap.o opal-psr.o opal-sensor-groups.o
> +obj-y			+= opal-xscom.o scom.o
>  
>  obj-$(CONFIG_SMP)	+= smp.o subcore.o subcore-asm.o
>  obj-$(CONFIG_PCI)	+= pci.o pci-ioda.o npu-dma.o pci-ioda-tce.o
>  obj-$(CONFIG_CXL_BASE)	+= pci-cxl.o
>  obj-$(CONFIG_EEH)	+= eeh-powernv.o
> -obj-$(CONFIG_PPC_SCOM)	+= opal-xscom.o
>  obj-$(CONFIG_MEMORY_FAILURE)	+= opal-memory-errors.o
>  obj-$(CONFIG_OPAL_PRD)	+= opal-prd.o
>  obj-$(CONFIG_PERF_EVENTS) += opal-imc.o
> diff --git a/arch/powerpc/sysdev/scom.c b/arch/powerpc/platforms/powernv/scom.c
> similarity index 100%
> rename from arch/powerpc/sysdev/scom.c
> rename to arch/powerpc/platforms/powernv/scom.c
> diff --git a/arch/powerpc/sysdev/Kconfig b/arch/powerpc/sysdev/Kconfig
> index e0dbec780fe9..7808d279ff1d 100644
> --- a/arch/powerpc/sysdev/Kconfig
> +++ b/arch/powerpc/sysdev/Kconfig
> @@ -28,13 +28,6 @@ config PPC_MSI_BITMAP
>  source "arch/powerpc/sysdev/xics/Kconfig"
>  source "arch/powerpc/sysdev/xive/Kconfig"
>  
> -config PPC_SCOM
> -	bool
> -
> -config SCOM_DEBUGFS
> -	bool "Expose SCOM controllers via debugfs"
> -	depends on PPC_SCOM && DEBUG_FS
> -
>  config GE_FPGA
>  	bool
>  
> diff --git a/arch/powerpc/sysdev/Makefile b/arch/powerpc/sysdev/Makefile
> index aaf23283ba0c..35d52d1d2fc0 100644
> --- a/arch/powerpc/sysdev/Makefile
> +++ b/arch/powerpc/sysdev/Makefile
> @@ -51,8 +51,6 @@ ifdef CONFIG_SUSPEND
>  obj-$(CONFIG_PPC_BOOK3S_32)	+= 6xx-suspend.o
>  endif
>  
> -obj-$(CONFIG_PPC_SCOM)		+= scom.o
> -
>  obj-$(CONFIG_PPC_EARLY_DEBUG_MEMCONS)	+= udbg_memcons.o
>  
>  obj-$(CONFIG_PPC_XICS)		+= xics/
> -- 
> 2.20.1

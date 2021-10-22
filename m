Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E160F43727D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 09:03:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbFgF37Mqz3c6j
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 18:03:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbFfq1dl7z2xrC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 18:02:57 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HbFfk4s7gz9sSV;
 Fri, 22 Oct 2021 09:02:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XVGossWXKwmh; Fri, 22 Oct 2021 09:02:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HbFfk3t98z9sST;
 Fri, 22 Oct 2021 09:02:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6DB6B8B816;
 Fri, 22 Oct 2021 09:02:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0mLNw9lnNfyS; Fri, 22 Oct 2021 09:02:54 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.57])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0C3B88B764;
 Fri, 22 Oct 2021 09:02:53 +0200 (CEST)
Subject: Re: [PATCH v3 15/18] powerpc/64s: Make hash MMU support configurable
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211021223013.2641952-1-npiggin@gmail.com>
 <20211021223013.2641952-16-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <7e10f779-e968-e723-cdbc-4510acdf64a8@csgroup.eu>
Date: Fri, 22 Oct 2021 09:02:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211021223013.2641952-16-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
Content-Transfer-Encoding: 8bit
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



Le 22/10/2021 à 00:30, Nicholas Piggin a écrit :
> This adds Kconfig selection which allows 64s hash MMU support to be
> disabled. It can be disabled if radix support is enabled, the minimum
> supported CPU type is POWER9 (or higher), and KVM is not selected.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/Kconfig                     |  3 ++-
>   arch/powerpc/include/asm/mmu.h           | 16 ++++++++++---
>   arch/powerpc/kernel/dt_cpu_ftrs.c        | 14 ++++++++----
>   arch/powerpc/kvm/Kconfig                 |  1 +
>   arch/powerpc/mm/init_64.c                | 15 +++++++++---
>   arch/powerpc/platforms/Kconfig.cputype   | 29 ++++++++++++++++++++++--
>   arch/powerpc/platforms/cell/Kconfig      |  1 +
>   arch/powerpc/platforms/maple/Kconfig     |  1 +
>   arch/powerpc/platforms/microwatt/Kconfig |  2 +-
>   arch/powerpc/platforms/pasemi/Kconfig    |  1 +
>   arch/powerpc/platforms/powermac/Kconfig  |  1 +
>   arch/powerpc/platforms/powernv/Kconfig   |  2 +-
>   12 files changed, 71 insertions(+), 15 deletions(-)
> 

> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index a208997ade88..1cf254a5d5d4 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype

> @@ -364,6 +371,17 @@ config SPE
>   
>   	  If in doubt, say Y here.
>   
> +config PPC_64S_HASH_MMU
> +	bool "Hash MMU Support"
> +	depends on PPC_BOOK3S_64
> +	select PPC_MM_SLICES
> +	default y
> +	help
> +	  Enable support for the Power ISA Hash style MMU. This is implemented
> +	  by all IBM Power and other Book3S CPUs.
> +
> +	  If you're unsure, say Y.
> +
>   config PPC_RADIX_MMU
>   	bool "Radix MMU Support"
>   	depends on PPC_BOOK3S_64
> @@ -374,9 +392,10 @@ config PPC_RADIX_MMU
>   	  is only implemented by IBM Power9 CPUs, if you don't have one of them
>   	  you can probably disable this.
>   
> -config PPC_RADIX_MMU_DEFAULT
> +config PPC_RADIX_MMU_DEFAULT_OPTION
>   	bool "Default to using the Radix MMU when possible"
>   	depends on PPC_RADIX_MMU
> +	depends on PPC_64S_HASH_MMU
>   	default y
>   	help
>   	  When the hardware supports the Radix MMU, default to using it unless
> @@ -387,6 +406,12 @@ config PPC_RADIX_MMU_DEFAULT
>   
>   	  If you're unsure, say Y.
>   
> +config PPC_RADIX_MMU_DEFAULT
> +	bool
> +	depends on PPC_BOOK3S_64
> +	depends on PPC_RADIX_MMU_DEFAULT_OPTION || !PPC_64S_HASH_MMU
> +	default y
> +

Why do you need that PPC_RADIX_MMU_DEFAULT_OPTION ?

What about

	config PPC_RADIX_MMU_DEFAULT
		bool "Default to using the Radix MMU when possible" if PPC_64S_HASH_MMU
		depends on PPC_RADIX_MMU
		depends on PPC_BOOK3S_64
		default y

>   config PPC_HAVE_KUEP
>   	bool
>   
> diff --git a/arch/powerpc/platforms/cell/Kconfig b/arch/powerpc/platforms/cell/Kconfig
> index db4465c51b56..faa894714a2a 100644
> --- a/arch/powerpc/platforms/cell/Kconfig
> +++ b/arch/powerpc/platforms/cell/Kconfig
> @@ -8,6 +8,7 @@ config PPC_CELL_COMMON
>   	select PPC_DCR_MMIO
>   	select PPC_INDIRECT_PIO
>   	select PPC_INDIRECT_MMIO
> +	select PPC_64S_HASH_MMU

Is this one (and the others) needed ?

Because it PPC_64S_HASH_MMU is 'default y', selection shouldn't be 
needed I think.

Did you check with savedefconfig ?


>   	select PPC_HASH_MMU_NATIVE
>   	select PPC_RTAS
>   	select IRQ_EDGE_EOI_HANDLER
> diff --git a/arch/powerpc/platforms/maple/Kconfig b/arch/powerpc/platforms/maple/Kconfig
> index 7fd84311ade5..4c058cc57c90 100644
> --- a/arch/powerpc/platforms/maple/Kconfig
> +++ b/arch/powerpc/platforms/maple/Kconfig
> @@ -9,6 +9,7 @@ config PPC_MAPLE
>   	select GENERIC_TBSYNC
>   	select PPC_UDBG_16550
>   	select PPC_970_NAP
> +	select PPC_64S_HASH_MMU
>   	select PPC_HASH_MMU_NATIVE
>   	select PPC_RTAS
>   	select MMIO_NVRAM
> diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
> index 62b51e37fc05..823192e9d38a 100644
> --- a/arch/powerpc/platforms/microwatt/Kconfig
> +++ b/arch/powerpc/platforms/microwatt/Kconfig
> @@ -5,7 +5,7 @@ config PPC_MICROWATT
>   	select PPC_XICS
>   	select PPC_ICS_NATIVE
>   	select PPC_ICP_NATIVE
> -	select PPC_HASH_MMU_NATIVE
> +	select PPC_HASH_MMU_NATIVE if PPC_64S_HASH_MMU
>   	select PPC_UDBG_16550
>   	select ARCH_RANDOM
>   	help
> diff --git a/arch/powerpc/platforms/pasemi/Kconfig b/arch/powerpc/platforms/pasemi/Kconfig
> index bc7137353a7f..85ae18ddd911 100644
> --- a/arch/powerpc/platforms/pasemi/Kconfig
> +++ b/arch/powerpc/platforms/pasemi/Kconfig
> @@ -5,6 +5,7 @@ config PPC_PASEMI
>   	select MPIC
>   	select FORCE_PCI
>   	select PPC_UDBG_16550
> +	select PPC_64S_HASH_MMU
>   	select PPC_HASH_MMU_NATIVE
>   	select MPIC_BROKEN_REGREAD
>   	help
> diff --git a/arch/powerpc/platforms/powermac/Kconfig b/arch/powerpc/platforms/powermac/Kconfig
> index 2b56df145b82..130707ec9f99 100644
> --- a/arch/powerpc/platforms/powermac/Kconfig
> +++ b/arch/powerpc/platforms/powermac/Kconfig
> @@ -6,6 +6,7 @@ config PPC_PMAC
>   	select FORCE_PCI
>   	select PPC_INDIRECT_PCI if PPC32
>   	select PPC_MPC106 if PPC32
> +	select PPC_64S_HASH_MMU if PPC64
>   	select PPC_HASH_MMU_NATIVE
>   	select ZONE_DMA if PPC32
>   	default y
> diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
> index cd754e116184..161dfe024085 100644
> --- a/arch/powerpc/platforms/powernv/Kconfig
> +++ b/arch/powerpc/platforms/powernv/Kconfig
> @@ -2,7 +2,7 @@
>   config PPC_POWERNV
>   	depends on PPC64 && PPC_BOOK3S
>   	bool "IBM PowerNV (Non-Virtualized) platform support"
> -	select PPC_HASH_MMU_NATIVE
> +	select PPC_HASH_MMU_NATIVE if PPC_64S_HASH_MMU
>   	select PPC_XICS
>   	select PPC_ICP_NATIVE
>   	select PPC_XIVE_NATIVE
> 

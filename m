Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9593A435A6C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 07:44:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZbyy16j2z3cTQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 16:44:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZbyM3xV1z2ymk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 16:44:11 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HZbyJ0kn4z9sSQ;
 Thu, 21 Oct 2021 07:44:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mrk50wiEjKAL; Thu, 21 Oct 2021 07:44:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HZbyH6jmXz9sSN;
 Thu, 21 Oct 2021 07:44:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D1FA48B80E;
 Thu, 21 Oct 2021 07:44:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8cxSS6DU5Q5e; Thu, 21 Oct 2021 07:44:07 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.154])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 705538B764;
 Thu, 21 Oct 2021 07:44:07 +0200 (CEST)
Subject: Re: [PATCH v2 14/16] powerpc/64s: Make hash MMU support configurable
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211021035417.2157804-1-npiggin@gmail.com>
 <20211021035417.2157804-15-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <2359b5b8-493b-1fc7-4d6e-c6065c3e4e9a@csgroup.eu>
Date: Thu, 21 Oct 2021 07:44:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211021035417.2157804-15-npiggin@gmail.com>
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



Le 21/10/2021 à 05:54, Nicholas Piggin a écrit :
> Thisa adds Kconfig selection which allows the 64s hash MMU code to be
> compiled out if radix is selected and the minimum supported CPU type is
> POWER9 or higher, and KVM is not selected.
> 
> This saves 128kB kernel image size (90kB text) on powernv_defconfig
> minus KVM, 350kB on pseries_defconfig minus KVM, 40kB on a tiny config.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/Kconfig                     |  1 +
>   arch/powerpc/kvm/Kconfig                 |  1 +
>   arch/powerpc/platforms/Kconfig.cputype   | 21 ++++++++++++++++++---
>   arch/powerpc/platforms/cell/Kconfig      |  1 +
>   arch/powerpc/platforms/maple/Kconfig     |  1 +
>   arch/powerpc/platforms/microwatt/Kconfig |  2 +-
>   arch/powerpc/platforms/pasemi/Kconfig    |  1 +
>   arch/powerpc/platforms/powermac/Kconfig  |  1 +
>   arch/powerpc/platforms/powernv/Kconfig   |  2 +-
>   9 files changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 4b34e408a3e6..5e122c67f6ca 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -936,6 +936,7 @@ config PPC_MEM_KEYS
>   	prompt "PowerPC Memory Protection Keys"
>   	def_bool y
>   	depends on PPC_BOOK3S_64
> +	depends on PPC_64S_HASH_MMU
>   	select ARCH_USES_HIGH_VMA_FLAGS
>   	select ARCH_HAS_PKEYS
>   	help
> diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
> index ff581d70f20c..4801424614be 100644
> --- a/arch/powerpc/kvm/Kconfig
> +++ b/arch/powerpc/kvm/Kconfig
> @@ -69,6 +69,7 @@ config KVM_BOOK3S_64
>   	select KVM_BOOK3S_64_HANDLER
>   	select KVM
>   	select KVM_BOOK3S_PR_POSSIBLE if !KVM_BOOK3S_HV_POSSIBLE
> +	select PPC_64S_HASH_MMU
>   	select SPAPR_TCE_IOMMU if IOMMU_SUPPORT && (PPC_PSERIES || PPC_POWERNV)
>   	help
>   	  Support running unmodified book3s_64 and book3s_32 guest kernels
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 01726e7f2c7f..1834cdd9626e 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -105,10 +105,9 @@ config PPC_BOOK3S_64
>   	select HAVE_MOVE_PMD
>   	select HAVE_MOVE_PUD
>   	select IRQ_WORK
> -	select PPC_64S_HASH_MMU
> -	select PPC_MM_SLICES
>   	select PPC_HAVE_KUEP
>   	select PPC_HAVE_KUAP
> +	select PPC_64S_HASH_MMU if !PPC_RADIX_MMU
>   
>   config PPC_BOOK3E_64
>   	bool "Embedded processors"
> @@ -131,11 +130,13 @@ choice
>   config GENERIC_CPU
>   	bool "Generic (POWER4 and above)"
>   	depends on PPC64 && !CPU_LITTLE_ENDIAN
> +	select PPC_64S_HASH_MMU if PPC_BOOK3S_64
>   
>   config GENERIC_CPU
>   	bool "Generic (POWER8 and above)"
>   	depends on PPC64 && CPU_LITTLE_ENDIAN
>   	select ARCH_HAS_FAST_MULTIPLIER
> +	select PPC_64S_HASH_MMU
>   
>   config GENERIC_CPU
>   	bool "Generic 32 bits powerpc"
> @@ -144,24 +145,29 @@ config GENERIC_CPU
>   config CELL_CPU
>   	bool "Cell Broadband Engine"
>   	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
> +	select PPC_64S_HASH_MMU
>   
>   config POWER5_CPU
>   	bool "POWER5"
>   	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
> +	select PPC_64S_HASH_MMU
>   
>   config POWER6_CPU
>   	bool "POWER6"
>   	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
> +	select PPC_64S_HASH_MMU
>   
>   config POWER7_CPU
>   	bool "POWER7"
>   	depends on PPC_BOOK3S_64
>   	select ARCH_HAS_FAST_MULTIPLIER
> +	select PPC_64S_HASH_MMU
>   
>   config POWER8_CPU
>   	bool "POWER8"
>   	depends on PPC_BOOK3S_64
>   	select ARCH_HAS_FAST_MULTIPLIER
> +	select PPC_64S_HASH_MMU
>   
>   config POWER9_CPU
>   	bool "POWER9"
> @@ -366,7 +372,15 @@ config SPE
>   	  If in doubt, say Y here.
>   
>   config PPC_64S_HASH_MMU
> -	bool
> +	bool "Hash MMU Support"
> +	depends on PPC_BOOK3S_64

Should already be in previous patch

> +	select PPC_MM_SLICES
> +	default y

Should already be in previous patch

> +	help
> +	  Enable support for the Power ISA Hash style MMU. This is implemented
> +	  by all IBM Power and other Book3S CPUs.
> +
> +	  If you're unsure, say Y.
>   
>   config PPC_RADIX_MMU
>   	bool "Radix MMU Support"
> @@ -381,6 +395,7 @@ config PPC_RADIX_MMU
>   config PPC_RADIX_MMU_DEFAULT
>   	bool "Default to using the Radix MMU when possible"
>   	depends on PPC_RADIX_MMU
> +	depends on PPC_64S_HASH_MMU
>   	default y
>   	help
>   	  When the hardware supports the Radix MMU, default to using it unless
> diff --git a/arch/powerpc/platforms/cell/Kconfig b/arch/powerpc/platforms/cell/Kconfig
> index db4465c51b56..faa894714a2a 100644
> --- a/arch/powerpc/platforms/cell/Kconfig
> +++ b/arch/powerpc/platforms/cell/Kconfig
> @@ -8,6 +8,7 @@ config PPC_CELL_COMMON
>   	select PPC_DCR_MMIO
>   	select PPC_INDIRECT_PIO
>   	select PPC_INDIRECT_MMIO
> +	select PPC_64S_HASH_MMU
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

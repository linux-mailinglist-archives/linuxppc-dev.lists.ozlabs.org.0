Return-Path: <linuxppc-dev+bounces-6503-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFFCA45FBB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 13:50:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2vT00s2Gz2yFP;
	Wed, 26 Feb 2025 23:50:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740574212;
	cv=none; b=dv9Jmof0sb5EJaKYRcO7N1JGL4bubZYk54CYCJeQJkeSmUvR/60lx+/e3rAHqy+vNt3f9kx+H1nwlIZYSnZ+Qlh1KXRDO1lsgDDSryWAiS+51lalfnF/IpUY6CeM0+b3E10/A/b7D784trdvU4A5u9eP+wLd/vjm1H/AGlieYyjEoiMgnVAJD3n3j0QId1HRVaQPBXm1S4B/hpcXjR7CCLif3/8C1T+VtN6QR9G/cIzu7qm+XBt5KvMd1FlQAnRP/SngxG2mb8pFtyaFmo61OS/1OBCqefQfXNROl+s8p0Nz52tHFxC2xxsdcifxBGF4CiGWNCkNrA778Jtje/ulUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740574212; c=relaxed/relaxed;
	bh=82g+h+XLZ6dPMWF8j10vwuVPT88jBYJj0+fN9e1vvvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W9S2A9+eRn1m3DZAK32XkfqCjZUWJhCMvq62oAAThiQwnXMDoJ6j+ZGa5oMDFqI2OL3Lb9MPbMpJcBHQpjpaXsrDC7u8mrG/jYZxMMmRCNHO0WWC1BmRrCTM1qvlkT4SbGi+w5ELfldxE6/uF7jkELwHKkdO8PF1qKXvz+lrhLO2kexUEdYLeSMljsk2ZG5jrjPyJtIg18+XM8c1/JOjK67WhJt+pBz63T05RYMfUWdyjRihoit+LMAQd+NLhIhOnEL6bDT2DmMU+Bo9aimsFLW16ERM3LykDoHnuBhZPe9MuFDyCWMxG6jP0w0gB/HFzb1ClcHii2xjEhG5cfTtiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2vSy6rCPz3bmY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 23:50:10 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z2v5y6mnsz9sSV;
	Wed, 26 Feb 2025 13:33:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qyUIDGDd7YTt; Wed, 26 Feb 2025 13:33:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z2v5y5KZYz9sST;
	Wed, 26 Feb 2025 13:33:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 73A718B78B;
	Wed, 26 Feb 2025 13:33:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 3SfOeDrhQ9ie; Wed, 26 Feb 2025 13:33:42 +0100 (CET)
Received: from [10.25.207.138] (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 20F848B77C;
	Wed, 26 Feb 2025 13:33:42 +0100 (CET)
Message-ID: <4f69c6de-0359-4a20-892b-073b93bd6035@csgroup.eu>
Date: Wed, 26 Feb 2025 13:33:41 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 5/5] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>
References: <20250226122404.1927473-1-anshuman.khandual@arm.com>
 <20250226122404.1927473-6-anshuman.khandual@arm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250226122404.1927473-6-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 26/02/2025 à 13:24, Anshuman Khandual a écrit :
> Platforms subscribe into generic ptdump implementation via GENERIC_PTDUMP.
> But generic ptdump gets enabled via PTDUMP_CORE. These configs combination
> is confusing as they sound very similar and does not differentiate between
> platform's feature subscription and feature enablement for ptdump. Rename
> the configs as ARCH_HAS_PTDUMP and PTDUMP making it more clear and improve
> readability.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: kvmarm@lists.linux.dev
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-mm@kvack.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu> (powerpc)

> ---
>   arch/arm64/Kconfig              |  2 +-
>   arch/arm64/include/asm/ptdump.h |  4 ++--
>   arch/arm64/kvm/Kconfig          |  4 ++--
>   arch/arm64/mm/Makefile          |  2 +-
>   arch/powerpc/Kconfig            |  2 +-
>   arch/powerpc/mm/Makefile        |  2 +-
>   arch/riscv/Kconfig              |  2 +-
>   arch/riscv/mm/Makefile          |  2 +-
>   arch/s390/Kconfig               |  2 +-
>   arch/s390/mm/Makefile           |  2 +-
>   arch/x86/Kconfig                |  2 +-
>   arch/x86/Kconfig.debug          |  2 +-
>   arch/x86/mm/Makefile            |  2 +-
>   mm/Kconfig.debug                | 12 ++++++------
>   mm/Makefile                     |  2 +-
>   15 files changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 940343beb3d4..5cf688ee01b7 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -41,6 +41,7 @@ config ARM64
>   	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
>   	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>   	select ARCH_HAS_NONLEAF_PMD_YOUNG if ARM64_HAFT
> +	select ARCH_HAS_PTDUMP
>   	select ARCH_HAS_PTE_DEVMAP
>   	select ARCH_HAS_PTE_SPECIAL
>   	select ARCH_HAS_HW_PTE_YOUNG
> @@ -157,7 +158,6 @@ config ARM64
>   	select GENERIC_IRQ_SHOW_LEVEL
>   	select GENERIC_LIB_DEVMEM_IS_ALLOWED
>   	select GENERIC_PCI_IOMAP
> -	select GENERIC_PTDUMP
>   	select GENERIC_SCHED_CLOCK
>   	select GENERIC_SMP_IDLE_THREAD
>   	select GENERIC_TIME_VSYSCALL
> diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
> index 6cf4aae05219..b2931d1ae0fb 100644
> --- a/arch/arm64/include/asm/ptdump.h
> +++ b/arch/arm64/include/asm/ptdump.h
> @@ -7,7 +7,7 @@
>   
>   #include <linux/ptdump.h>
>   
> -#ifdef CONFIG_PTDUMP_CORE
> +#ifdef CONFIG_PTDUMP
>   
>   #include <linux/mm_types.h>
>   #include <linux/seq_file.h>
> @@ -70,6 +70,6 @@ static inline void ptdump_debugfs_register(struct ptdump_info *info,
>   #else
>   static inline void note_page(struct ptdump_state *pt_st, unsigned long addr,
>   			     int level, u64 val) { }
> -#endif /* CONFIG_PTDUMP_CORE */
> +#endif /* CONFIG_PTDUMP */
>   
>   #endif /* __ASM_PTDUMP_H */
> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> index ead632ad01b4..096e45acadb2 100644
> --- a/arch/arm64/kvm/Kconfig
> +++ b/arch/arm64/kvm/Kconfig
> @@ -71,8 +71,8 @@ config PTDUMP_STAGE2_DEBUGFS
>   	depends on KVM
>   	depends on DEBUG_KERNEL
>   	depends on DEBUG_FS
> -	depends on GENERIC_PTDUMP
> -	select PTDUMP_CORE
> +	depends on ARCH_HAS_PTDUMP
> +	select PTDUMP
>   	default n
>   	help
>   	  Say Y here if you want to show the stage-2 kernel pagetables
> diff --git a/arch/arm64/mm/Makefile b/arch/arm64/mm/Makefile
> index fc92170a8f37..c26489cf96cd 100644
> --- a/arch/arm64/mm/Makefile
> +++ b/arch/arm64/mm/Makefile
> @@ -5,7 +5,7 @@ obj-y				:= dma-mapping.o extable.o fault.o init.o \
>   				   context.o proc.o pageattr.o fixmap.o
>   obj-$(CONFIG_ARM64_CONTPTE)	+= contpte.o
>   obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
> -obj-$(CONFIG_PTDUMP_CORE)	+= ptdump.o
> +obj-$(CONFIG_PTDUMP)		+= ptdump.o
>   obj-$(CONFIG_PTDUMP_DEBUGFS)	+= ptdump_debugfs.o
>   obj-$(CONFIG_TRANS_TABLE)	+= trans_pgd.o
>   obj-$(CONFIG_TRANS_TABLE)	+= trans_pgd-asm.o
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 424f188e62d9..6f1ae41dcf85 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -148,6 +148,7 @@ config PPC
>   	select ARCH_HAS_PHYS_TO_DMA
>   	select ARCH_HAS_PMEM_API
>   	select ARCH_HAS_PREEMPT_LAZY
> +	select ARCH_HAS_PTDUMP
>   	select ARCH_HAS_PTE_DEVMAP		if PPC_BOOK3S_64
>   	select ARCH_HAS_PTE_SPECIAL
>   	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
> @@ -206,7 +207,6 @@ config PPC
>   	select GENERIC_IRQ_SHOW
>   	select GENERIC_IRQ_SHOW_LEVEL
>   	select GENERIC_PCI_IOMAP		if PCI
> -	select GENERIC_PTDUMP
>   	select GENERIC_SMP_IDLE_THREAD
>   	select GENERIC_TIME_VSYSCALL
>   	select GENERIC_VDSO_TIME_NS
> diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
> index 0fe2f085c05a..8c1582b2987d 100644
> --- a/arch/powerpc/mm/Makefile
> +++ b/arch/powerpc/mm/Makefile
> @@ -15,5 +15,5 @@ obj-$(CONFIG_NUMA) += numa.o
>   obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
>   obj-$(CONFIG_NOT_COHERENT_CACHE) += dma-noncoherent.o
>   obj-$(CONFIG_PPC_COPRO_BASE)	+= copro_fault.o
> -obj-$(CONFIG_PTDUMP_CORE)	+= ptdump/
> +obj-$(CONFIG_PTDUMP)		+= ptdump/
>   obj-$(CONFIG_KASAN)		+= kasan/
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 7612c52e9b1e..353cf41d01f4 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -43,6 +43,7 @@ config RISCV
>   	select ARCH_HAS_PMEM_API
>   	select ARCH_HAS_PREEMPT_LAZY
>   	select ARCH_HAS_PREPARE_SYNC_CORE_CMD
> +	select ARCH_HAS_PTDUMP if MMU
>   	select ARCH_HAS_PTE_DEVMAP if 64BIT && MMU
>   	select ARCH_HAS_PTE_SPECIAL
>   	select ARCH_HAS_SET_DIRECT_MAP if MMU
> @@ -112,7 +113,6 @@ config RISCV
>   	select GENERIC_IRQ_SHOW_LEVEL
>   	select GENERIC_LIB_DEVMEM_IS_ALLOWED
>   	select GENERIC_PCI_IOMAP
> -	select GENERIC_PTDUMP if MMU
>   	select GENERIC_SCHED_CLOCK
>   	select GENERIC_SMP_IDLE_THREAD
>   	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
> diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> index cbe4d775ef56..b916a68d324a 100644
> --- a/arch/riscv/mm/Makefile
> +++ b/arch/riscv/mm/Makefile
> @@ -19,7 +19,7 @@ obj-y += context.o
>   obj-y += pmem.o
>   
>   obj-$(CONFIG_HUGETLB_PAGE) += hugetlbpage.o
> -obj-$(CONFIG_PTDUMP_CORE) += ptdump.o
> +obj-$(CONFIG_PTDUMP) += ptdump.o
>   obj-$(CONFIG_KASAN)   += kasan_init.o
>   
>   ifdef CONFIG_KASAN
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index 9c9ec08d78c7..dd9dd2f8e673 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -96,6 +96,7 @@ config S390
>   	select ARCH_HAS_MEM_ENCRYPT
>   	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
>   	select ARCH_HAS_PREEMPT_LAZY
> +	select ARCH_HAS_PTDUMP
>   	select ARCH_HAS_PTE_SPECIAL
>   	select ARCH_HAS_SCALED_CPUTIME
>   	select ARCH_HAS_SET_DIRECT_MAP
> @@ -163,7 +164,6 @@ config S390
>   	select GENERIC_CPU_VULNERABILITIES
>   	select GENERIC_ENTRY
>   	select GENERIC_GETTIMEOFDAY
> -	select GENERIC_PTDUMP
>   	select GENERIC_SMP_IDLE_THREAD
>   	select GENERIC_TIME_VSYSCALL
>   	select GENERIC_VDSO_TIME_NS
> diff --git a/arch/s390/mm/Makefile b/arch/s390/mm/Makefile
> index f6c2db7a8669..9726b91fe7e4 100644
> --- a/arch/s390/mm/Makefile
> +++ b/arch/s390/mm/Makefile
> @@ -9,6 +9,6 @@ obj-y		+= page-states.o pageattr.o pgtable.o pgalloc.o extable.o
>   obj-$(CONFIG_CMM)		+= cmm.o
>   obj-$(CONFIG_DEBUG_VIRTUAL)	+= physaddr.o
>   obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
> -obj-$(CONFIG_PTDUMP_CORE)	+= dump_pagetables.o
> +obj-$(CONFIG_PTDUMP)		+= dump_pagetables.o
>   obj-$(CONFIG_PGSTE)		+= gmap.o
>   obj-$(CONFIG_PFAULT)		+= pfault.o
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index be2c311f5118..39ecafffc7e3 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -26,6 +26,7 @@ config X86_64
>   	depends on 64BIT
>   	# Options that are inherently 64-bit kernel only:
>   	select ARCH_HAS_GIGANTIC_PAGE
> +	select ARCH_HAS_PTDUMP
>   	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>   	select ARCH_SUPPORTS_PER_VMA_LOCK
>   	select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
> @@ -174,7 +175,6 @@ config X86
>   	select GENERIC_IRQ_RESERVATION_MODE
>   	select GENERIC_IRQ_SHOW
>   	select GENERIC_PENDING_IRQ		if SMP
> -	select GENERIC_PTDUMP
>   	select GENERIC_SMP_IDLE_THREAD
>   	select GENERIC_TIME_VSYSCALL
>   	select GENERIC_GETTIMEOFDAY
> diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
> index 1eb4d23cdaae..c95c3aaadf97 100644
> --- a/arch/x86/Kconfig.debug
> +++ b/arch/x86/Kconfig.debug
> @@ -59,7 +59,7 @@ config EARLY_PRINTK_USB_XDBC
>   config EFI_PGT_DUMP
>   	bool "Dump the EFI pagetable"
>   	depends on EFI
> -	select PTDUMP_CORE
> +	select PTDUMP
>   	help
>   	  Enable this if you want to dump the EFI page table before
>   	  enabling virtual mode. This can be used to debug miscellaneous
> diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
> index 690fbf48e853..e0c99a8760ca 100644
> --- a/arch/x86/mm/Makefile
> +++ b/arch/x86/mm/Makefile
> @@ -39,7 +39,7 @@ CFLAGS_fault.o := -I $(src)/../include/asm/trace
>   obj-$(CONFIG_X86_32)		+= pgtable_32.o iomap_32.o
>   
>   obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
> -obj-$(CONFIG_PTDUMP_CORE)	+= dump_pagetables.o
> +obj-$(CONFIG_PTDUMP)		+= dump_pagetables.o
>   obj-$(CONFIG_PTDUMP_DEBUGFS)	+= debug_pagetables.o
>   
>   obj-$(CONFIG_HIGHMEM)		+= highmem_32.o
> diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
> index a51a1149909a..32b65073d0cc 100644
> --- a/mm/Kconfig.debug
> +++ b/mm/Kconfig.debug
> @@ -186,9 +186,9 @@ config ARCH_HAS_DEBUG_WX
>   config DEBUG_WX
>   	bool "Warn on W+X mappings at boot"
>   	depends on ARCH_HAS_DEBUG_WX
> -	depends on GENERIC_PTDUMP
> +	depends on ARCH_HAS_PTDUMP
>   	depends on MMU
> -	select PTDUMP_CORE
> +	select PTDUMP
>   	help
>   	  Generate a warning if any W+X mappings are found at boot.
>   
> @@ -213,18 +213,18 @@ config DEBUG_WX
>   
>   	  If in doubt, say "Y".
>   
> -config GENERIC_PTDUMP
> +config ARCH_HAS_PTDUMP
>   	bool
>   
> -config PTDUMP_CORE
> +config PTDUMP
>   	bool
>   
>   config PTDUMP_DEBUGFS
>   	bool "Export kernel pagetable layout to userspace via debugfs"
>   	depends on DEBUG_KERNEL
>   	depends on DEBUG_FS
> -	depends on GENERIC_PTDUMP
> -	select PTDUMP_CORE
> +	depends on ARCH_HAS_PTDUMP
> +	select PTDUMP
>   	help
>   	  Say Y here if you want to show the kernel pagetable layout in a
>   	  debugfs file. This information is only useful for kernel developers
> diff --git a/mm/Makefile b/mm/Makefile
> index 850386a67b3e..26dfecd4d396 100644
> --- a/mm/Makefile
> +++ b/mm/Makefile
> @@ -138,7 +138,7 @@ obj-$(CONFIG_ZONE_DEVICE) += memremap.o
>   obj-$(CONFIG_HMM_MIRROR) += hmm.o
>   obj-$(CONFIG_MEMFD_CREATE) += memfd.o
>   obj-$(CONFIG_MAPPING_DIRTY_HELPERS) += mapping_dirty_helpers.o
> -obj-$(CONFIG_PTDUMP_CORE) += ptdump.o
> +obj-$(CONFIG_PTDUMP) += ptdump.o
>   obj-$(CONFIG_PAGE_REPORTING) += page_reporting.o
>   obj-$(CONFIG_IO_MAPPING) += io-mapping.o
>   obj-$(CONFIG_HAVE_BOOTMEM_INFO_NODE) += bootmem_info.o



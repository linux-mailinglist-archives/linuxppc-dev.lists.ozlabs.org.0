Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1169393219
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 17:13:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrWYN6V1xz308D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 01:13:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TpgEYLQa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TpgEYLQa; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrWXt2pHdz2xvN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 01:13:18 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B3AE613BA;
 Thu, 27 May 2021 15:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622128395;
 bh=v4Y5CgfBMzp5T0CX+Epz9rKs73Qi5rHOJJTJ8WdHbRY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TpgEYLQa6fww76pD+EXqPpG4tWw4RVeiOxm1IKDenxYeudi6q9QrsMPBj8vWQKGHF
 V7/AI4UcdJsv4V6xu6Hb60ZhUJrk6fiYerMLikOSbIqSBxzhi3g7f2UU+7FR9Gqt9V
 C3Ne5JKZLMQDRYjaw8c8GWIEPtvXypd/75O7SfurJguzt92R4evulYOP3jYxwMk/E8
 HZLWeWb5dUdXXuTLVqxBjcStrY3S9YlmYJhjfnYYjB+C/OSSHD9RmNC0VDFJpsIM6w
 Pnmu3HDTg3AIUWWdpgI7DQ0ETS3eDvwT+YkmrmCWtuEnOu7h1QNKbK4vk/AJe8ndtI
 rvDl0qboF0+VQ==
Date: Thu, 27 May 2021 18:13:03 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH] mm: generalize ZONE_[DMA|DMA32]
Message-ID: <YK+2/79IZ0M9wtCm@kernel.org>
References: <20210527143047.123611-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527143047.123611-1-wangkefeng.wang@huawei.com>
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
Cc: linux-s390@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-ia64@vger.kernel.org, Will Deacon <will@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-mips@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 27, 2021 at 10:30:47PM +0800, Kefeng Wang wrote:
> ZONE_[DMA|DMA32] configs have duplicate definitions on platforms
> that subscribe them. Instead, just make them generic options which
> can be selected on applicable platforms.
> 
> Also only x86/arm64 architectures could enable both ZONE_DMA and
> ZONE_DMA32 if EXPERT, add ARCH_HAS_ZONE_DMA_SET to make dma zone
> configurable and visible on the two architectures.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org> 
> Cc: Catalin Marinas <catalin.marinas@arm.com> 
> Cc: Will Deacon <will@kernel.org> 
> Cc: Geert Uytterhoeven <geert@linux-m68k.org> 
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de> 
> Cc: "David S. Miller" <davem@davemloft.net> 
> Cc: Ingo Molnar <mingo@redhat.com> 
> Cc: Borislav Petkov <bp@alien8.de> 
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Richard Henderson <rth@twiddle.net> 
> Cc: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  arch/alpha/Kconfig                     |  5 +----
>  arch/arm/Kconfig                       |  3 ---
>  arch/arm64/Kconfig                     |  9 +--------
>  arch/ia64/Kconfig                      |  4 +---
>  arch/m68k/Kconfig                      |  5 +----
>  arch/microblaze/Kconfig                |  4 +---
>  arch/mips/Kconfig                      |  7 -------
>  arch/powerpc/Kconfig                   |  4 ----
>  arch/powerpc/platforms/Kconfig.cputype |  1 +
>  arch/riscv/Kconfig                     |  5 +----
>  arch/s390/Kconfig                      |  4 +---
>  arch/sparc/Kconfig                     |  5 +----
>  arch/x86/Kconfig                       | 15 ++-------------
>  mm/Kconfig                             | 11 +++++++++++
>  14 files changed, 22 insertions(+), 60 deletions(-)
> 
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index 5998106faa60..6a69a14c4825 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -40,6 +40,7 @@ config ALPHA
>  	select MMU_GATHER_NO_RANGE
>  	select SET_FS
>  	select SPARSEMEM_EXTREME if SPARSEMEM
> +	select ZONE_DMA
>  	help
>  	  The Alpha is a 64-bit general-purpose processor designed and
>  	  marketed by the Digital Equipment Corporation of blessed memory,
> @@ -65,10 +66,6 @@ config GENERIC_CALIBRATE_DELAY
>  	bool
>  	default y
>  
> -config ZONE_DMA
> -	bool
> -	default y
> -
>  config GENERIC_ISA_DMA
>  	bool
>  	default y
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 24804f11302d..000c3f80b58e 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -218,9 +218,6 @@ config GENERIC_CALIBRATE_DELAY
>  config ARCH_MAY_HAVE_PC_FDC
>  	bool
>  
> -config ZONE_DMA
> -	bool
> -
>  config ARCH_SUPPORTS_UPROBES
>  	def_bool y
>  
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 9f1d8566bbf9..42794474f37f 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -42,6 +42,7 @@ config ARM64
>  	select ARCH_HAS_SYSCALL_WRAPPER
>  	select ARCH_HAS_TEARDOWN_DMA_OPS if IOMMU_SUPPORT
>  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
> +	select ARCH_HAS_ZONE_DMA_SET if EXPERT
>  	select ARCH_HAVE_ELF_PROT
>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>  	select ARCH_INLINE_READ_LOCK if !PREEMPTION
> @@ -307,14 +308,6 @@ config GENERIC_CSUM
>  config GENERIC_CALIBRATE_DELAY
>  	def_bool y
>  
> -config ZONE_DMA
> -	bool "Support DMA zone" if EXPERT
> -	default y
> -
> -config ZONE_DMA32
> -	bool "Support DMA32 zone" if EXPERT
> -	default y
> -
>  config ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
>  	def_bool y
>  
> diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
> index 279252e3e0f7..fd8503a0088a 100644
> --- a/arch/ia64/Kconfig
> +++ b/arch/ia64/Kconfig
> @@ -60,6 +60,7 @@ config IA64
>  	select NUMA if !FLATMEM
>  	select PCI_MSI_ARCH_FALLBACKS if PCI_MSI
>  	select SET_FS
> +	select ZONE_DMA32
>  	default y
>  	help
>  	  The Itanium Processor Family is Intel's 64-bit successor to
> @@ -72,9 +73,6 @@ config 64BIT
>  	select ATA_NONSTANDARD if ATA
>  	default y
>  
> -config ZONE_DMA32
> -	def_bool y
> -
>  config MMU
>  	bool
>  	default y
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index 372e4e69c43a..05a729c6ad7f 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -34,6 +34,7 @@ config M68K
>  	select SET_FS
>  	select UACCESS_MEMCPY if !MMU
>  	select VIRT_TO_BUS
> +	select ZONE_DMA
>  
>  config CPU_BIG_ENDIAN
>  	def_bool y
> @@ -62,10 +63,6 @@ config TIME_LOW_RES
>  config NO_IOPORT_MAP
>  	def_bool y
>  
> -config ZONE_DMA
> -	bool
> -	default y
> -
>  config HZ
>  	int
>  	default 1000 if CLEOPATRA
> diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
> index 0660f47012bc..14a67a42fcae 100644
> --- a/arch/microblaze/Kconfig
> +++ b/arch/microblaze/Kconfig
> @@ -43,6 +43,7 @@ config MICROBLAZE
>  	select MMU_GATHER_NO_RANGE
>  	select SPARSE_IRQ
>  	select SET_FS
> +	select ZONE_DMA
>  
>  # Endianness selection
>  choice
> @@ -60,9 +61,6 @@ config CPU_LITTLE_ENDIAN
>  
>  endchoice
>  
> -config ZONE_DMA
> -	def_bool y
> -
>  config ARCH_HAS_ILOG2_U32
>  	def_bool n
>  
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index ed51970c08e7..430d5324f1af 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -3277,13 +3277,6 @@ config I8253
>  	select CLKSRC_I8253
>  	select CLKEVT_I8253
>  	select MIPS_EXTERNAL_TIMER
> -
> -config ZONE_DMA
> -	bool
> -
> -config ZONE_DMA32
> -	bool
> -
>  endmenu
>  
>  config TRAD_SIGNALS
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 088dd2afcfe4..0f78bb383a12 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -403,10 +403,6 @@ config PPC_ADV_DEBUG_DAC_RANGE
>  config PPC_DAWR
>  	bool
>  
> -config ZONE_DMA
> -	bool
> -	default y if PPC_BOOK3E_64
> -
>  config PGTABLE_LEVELS
>  	int
>  	default 2 if !PPC64
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index f998e655b570..7d271de8fcbd 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -111,6 +111,7 @@ config PPC_BOOK3E_64
>  	select PPC_FPU # Make it a choice ?
>  	select PPC_SMP_MUXED_IPI
>  	select PPC_DOORBELL
> +	select ZONE_DMA
>  
>  endchoice
>  
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a8ad8eb76120..d29643dee126 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -103,6 +103,7 @@ config RISCV
>  	select SYSCTL_EXCEPTION_TRACE
>  	select THREAD_INFO_IN_TASK
>  	select UACCESS_MEMCPY if !MMU
> +	select ZONE_DMA32 if 64BIT
>  
>  config ARCH_MMAP_RND_BITS_MIN
>  	default 18 if 64BIT
> @@ -132,10 +133,6 @@ config MMU
>  	  Select if you want MMU-based virtualised addressing space
>  	  support by paged memory management. If unsure, say 'Y'.
>  
> -config ZONE_DMA32
> -	bool
> -	default y if 64BIT
> -
>  config VA_BITS
>  	int
>  	default 32 if 32BIT
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index b4c7c34069f8..daab9d56957a 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -2,9 +2,6 @@
>  config MMU
>  	def_bool y
>  
> -config ZONE_DMA
> -	def_bool y
> -
>  config CPU_BIG_ENDIAN
>  	def_bool y
>  
> @@ -210,6 +207,7 @@ config S390
>  	select THREAD_INFO_IN_TASK
>  	select TTY
>  	select VIRT_CPU_ACCOUNTING
> +	select ZONE_DMA
>  	# Note: keep the above list sorted alphabetically
>  
>  config SCHED_OMIT_FRAME_POINTER
> diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
> index 164a5254c91c..39679664cc9a 100644
> --- a/arch/sparc/Kconfig
> +++ b/arch/sparc/Kconfig
> @@ -59,6 +59,7 @@ config SPARC32
>  	select CLZ_TAB
>  	select HAVE_UID16
>  	select OLD_SIGACTION
> +	select ZONE_DMA
>  
>  config SPARC64
>  	def_bool 64BIT
> @@ -141,10 +142,6 @@ config HIGHMEM
>  	default y if SPARC32
>  	select KMAP_LOCAL
>  
> -config ZONE_DMA
> -	bool
> -	default y if SPARC32
> -
>  config GENERIC_ISA_DMA
>  	bool
>  	default y if SPARC32
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 0045e1b44190..11cf8a0d6800 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -33,6 +33,7 @@ config X86_64
>  	select NEED_DMA_MAP_STATE
>  	select SWIOTLB
>  	select ARCH_HAS_ELFCORE_COMPAT
> +	select ZONE_DMA32
>  
>  config FORCE_DYNAMIC_FTRACE
>  	def_bool y
> @@ -93,6 +94,7 @@ config X86
>  	select ARCH_HAS_SYSCALL_WRAPPER
>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
>  	select ARCH_HAS_DEBUG_WX
> +	select ARCH_HAS_ZONE_DMA_SET if EXPERT
>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>  	select ARCH_MIGHT_HAVE_ACPI_PDC		if ACPI
>  	select ARCH_MIGHT_HAVE_PC_PARPORT
> @@ -343,9 +345,6 @@ config ARCH_SUSPEND_POSSIBLE
>  config ARCH_WANT_GENERAL_HUGETLB
>  	def_bool y
>  
> -config ZONE_DMA32
> -	def_bool y if X86_64
> -
>  config AUDIT_ARCH
>  	def_bool y if X86_64
>  
> @@ -393,16 +392,6 @@ config CC_HAS_SANE_STACKPROTECTOR
>  
>  menu "Processor type and features"
>  
> -config ZONE_DMA
> -	bool "DMA memory allocation support" if EXPERT
> -	default y
> -	help
> -	  DMA memory allocation support allows devices with less than 32-bit
> -	  addressing to allocate within the first 16MB of address space.
> -	  Disable if no such devices will be used.
> -
> -	  If unsure, say Y.
> -
>  config SMP
>  	bool "Symmetric multi-processing support"
>  	help
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 02d44e3420f5..68b0cbdc7968 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -789,6 +789,17 @@ config ARCH_HAS_CACHE_LINE_SIZE
>  config ARCH_HAS_PTE_DEVMAP
>  	bool
>  
> +config ARCH_HAS_ZONE_DMA_SET
> +	bool
> +
> +config ZONE_DMA
> +	bool "Support DMA zone" if ARCH_HAS_ZONE_DMA_SET
> +	default y if ARM64
> +
> +config ZONE_DMA32
> +	bool "Support DMA32 zone" if ARCH_HAS_ZONE_DMA_SET
> +	default y if ARM64
> +
>  config ZONE_DEVICE
>  	bool "Device memory (pmem, HMM, etc...) hotplug support"
>  	depends on MEMORY_HOTPLUG
> -- 
> 2.26.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
Sincerely yours,
Mike.

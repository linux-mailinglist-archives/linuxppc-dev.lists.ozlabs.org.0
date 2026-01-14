Return-Path: <linuxppc-dev+bounces-15685-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EF1D1CD2B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 08:27:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drd4T4tMtz2xpm;
	Wed, 14 Jan 2026 18:27:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=94.231.106.210
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768375673;
	cv=none; b=OQbuTO2ybEW0HwndE5ZXCnixvH/bB+1SxSq6Xurfbif3vmNga4eH+N0mNx3Q42Oil/I6YcBf0UQwqm1vlfEHBtgv9E3cm2HZP9CvOGggMJcgH5ZfvNslK0M4gC/s9p6uL/qF3Y1v4kFf3W186iDf5QJaOtZ+n/mQ5ws/HULnmBo6pKpeuaogNlrQxV8ItwUwqfrHxeRVyOrbuvp0/bdpeNS+l6S9C+Ep3nrOdzz/JkwQF1gh9fjFxPCauRzZ0bTMxUo3IhKOoeAQ9ElyzpPWrGRksqC6FQkxjVFx5Z4HEZ7GXwFEvJagjqyZIx5z4SfhQ5wMBl5lDMKzKjQslPsZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768375673; c=relaxed/relaxed;
	bh=JoLWp43HOYjwRJyNJsc67cs6D8z3kCKzn/0ykuDh8HA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XZh2Oq4PxBirk48u15urn4KXhbe0bPhqk4pMtpTJP4D+9mHo7u2LAKfkIrIx2hFIWC4w8LmSWFqevYWS4F7ok6Z2NG2GV+R88te1vsA4wOX3QiO/1w6P2kOBW/QsziL7be3U5nIcbAgjquzwIsYc2/S8LvSdzO34o+kyEsdtOoFeypyzfZtS51aB5TeMjy/18fhvUnyQM+FgZj8H/0+TzH6I6KPo1IwjDyAu81DqkTnavPgjwXUEzhjJ9p5TpLLNhB5q0oLAxKh5+V2Q9o1wi5bcoc51ohk20nHVe9Yf5JsAOi7oc3H870WcQAQ4x2SZyQqGxg5Kgpw1sk67Ed4PhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; dkim=fail header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=simplycom2 header.b=U/MxLTb8 reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org) smtp.mailfrom=gaisler.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=simplycom2 header.b=U/MxLTb8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gaisler.com (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org)
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drd4S2cTqz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 18:27:52 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4drd4P0pSdz1DR2x;
	Wed, 14 Jan 2026 08:27:49 +0100 (CET)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4drd4M6G39z1DDdR;
	Wed, 14 Jan 2026 08:27:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1768375668;
	bh=JoLWp43HOYjwRJyNJsc67cs6D8z3kCKzn/0ykuDh8HA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=U/MxLTb8zVdLMDfDaOBJbtayShpVqfmLzNsYBnvb64wtspGFMsgZTsrPC3wOoIaLu
	 kywwgDewFftKwA6/dELQHSxQdr6U4eCgbU5b2Xv1hnprAYzD6M28R5fasXD6TsgefO
	 KmidDVQEATQE2TP78neAQZVbaqPpTu5dP9dDpFmN85FmL+ftYaO/Rrjcs0ASbXQD2y
	 W24XwIYxbWV0LDjwKC7UzmRqMIEpZwEprXedMxQaZGak44dCLvtMH16KyfU1yvIpsR
	 AKhv2uLMHt2sI3Gcd+z9fbTl4EjeW/ZFS3inFDmkwr/j1qOMllDjqxmUZAxnM2akcS
	 wSePWEQv/mSSw==
Message-ID: <45e4a43d-8996-4296-9df9-d5f2a8efcefd@gaisler.com>
Date: Wed, 14 Jan 2026 08:27:47 +0100
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/14] mm: introduce CONFIG_ARCH_HAS_LAZY_MMU_MODE
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251215150323.2218608-1-kevin.brodsky@arm.com>
 <20251215150323.2218608-7-kevin.brodsky@arm.com>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20251215150323.2218608-7-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-12-15 16:03, Kevin Brodsky wrote:
> Architectures currently opt in for implementing lazy_mmu helpers by
> defining __HAVE_ARCH_ENTER_LAZY_MMU_MODE.
> 
> In preparation for introducing a generic lazy_mmu layer that will
> require storage in task_struct, let's switch to a cleaner approach:
> instead of defining a macro, select a CONFIG option.
> 
> This patch introduces CONFIG_ARCH_HAS_LAZY_MMU_MODE and has each
> arch select it when it implements lazy_mmu helpers.
> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is removed and <linux/pgtable.h>
> relies on the new CONFIG instead.
> 
> On x86, lazy_mmu helpers are only implemented if PARAVIRT_XXL is
> selected. This creates some complications in arch/x86/boot/, because
> a few files manually undefine PARAVIRT* options. As a result
> <asm/paravirt.h> does not define the lazy_mmu helpers, but this
> breaks the build as <linux/pgtable.h> only defines them if
> !CONFIG_ARCH_HAS_LAZY_MMU_MODE. There does not seem to be a clean
> way out of this - let's just undefine that new CONFIG too.
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/Kconfig                                 | 1 +
>  arch/arm64/include/asm/pgtable.h                   | 1 -
>  arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 2 --
>  arch/powerpc/platforms/Kconfig.cputype             | 1 +
>  arch/sparc/Kconfig                                 | 1 +
>  arch/sparc/include/asm/tlbflush_64.h               | 2 --
>  arch/x86/Kconfig                                   | 1 +
>  arch/x86/boot/compressed/misc.h                    | 1 +
>  arch/x86/boot/startup/sme.c                        | 1 +
>  arch/x86/include/asm/paravirt.h                    | 1 -
>  include/linux/pgtable.h                            | 2 +-
>  mm/Kconfig                                         | 7 +++++++
>  12 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 93173f0a09c7..3fb4603c0e16 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -35,6 +35,7 @@ config ARM64
>  	select ARCH_HAS_KCOV
>  	select ARCH_HAS_KERNEL_FPU_SUPPORT if KERNEL_MODE_NEON
>  	select ARCH_HAS_KEEPINITRD
> +	select ARCH_HAS_LAZY_MMU_MODE
>  	select ARCH_HAS_MEMBARRIER_SYNC_CORE
>  	select ARCH_HAS_MEM_ENCRYPT
>  	select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 64d5f1d9cce9..f7d66c261347 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -80,7 +80,6 @@ static inline void queue_pte_barriers(void)
>  	}
>  }
>  
> -#define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
>  static inline void arch_enter_lazy_mmu_mode(void)
>  {
>  	/*
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> index 2d45f57df169..565c1b7c3eae 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> @@ -24,8 +24,6 @@ DECLARE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
>  
>  extern void __flush_tlb_pending(struct ppc64_tlb_batch *batch);
>  
> -#define __HAVE_ARCH_ENTER_LAZY_MMU_MODE
> -
>  static inline void arch_enter_lazy_mmu_mode(void)
>  {
>  	struct ppc64_tlb_batch *batch;
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 4c321a8ea896..f399917c17bd 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -93,6 +93,7 @@ config PPC_BOOK3S_64
>  	select IRQ_WORK
>  	select PPC_64S_HASH_MMU if !PPC_RADIX_MMU
>  	select KASAN_VMALLOC if KASAN
> +	select ARCH_HAS_LAZY_MMU_MODE
>  
>  config PPC_BOOK3E_64
>  	bool "Embedded processors"
> diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
> index a630d373e645..2bad14744ca4 100644
> --- a/arch/sparc/Kconfig
> +++ b/arch/sparc/Kconfig
> @@ -112,6 +112,7 @@ config SPARC64
>  	select NEED_PER_CPU_PAGE_FIRST_CHUNK
>  	select ARCH_SUPPORTS_SCHED_SMT if SMP
>  	select ARCH_SUPPORTS_SCHED_MC  if SMP
> +	select ARCH_HAS_LAZY_MMU_MODE
>  
>  config ARCH_PROC_KCORE_TEXT
>  	def_bool y
> diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
> index 925bb5d7a4e1..4e1036728e2f 100644
> --- a/arch/sparc/include/asm/tlbflush_64.h
> +++ b/arch/sparc/include/asm/tlbflush_64.h
> @@ -39,8 +39,6 @@ static inline void flush_tlb_range(struct vm_area_struct *vma,
>  
>  void flush_tlb_kernel_range(unsigned long start, unsigned long end);
>  
> -#define __HAVE_ARCH_ENTER_LAZY_MMU_MODE
> -
>  void flush_tlb_pending(void);
>  void arch_enter_lazy_mmu_mode(void);
>  void arch_flush_lazy_mmu_mode(void);
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 80527299f859..2427a66cb0fe 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -808,6 +808,7 @@ config PARAVIRT
>  config PARAVIRT_XXL
>  	bool
>  	depends on X86_64
> +	select ARCH_HAS_LAZY_MMU_MODE
>  
>  config PARAVIRT_DEBUG
>  	bool "paravirt-ops debugging"
> diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
> index fd855e32c9b9..4f86c5903e03 100644
> --- a/arch/x86/boot/compressed/misc.h
> +++ b/arch/x86/boot/compressed/misc.h
> @@ -11,6 +11,7 @@
>  #undef CONFIG_PARAVIRT
>  #undef CONFIG_PARAVIRT_XXL
>  #undef CONFIG_PARAVIRT_SPINLOCKS
> +#undef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>  #undef CONFIG_KASAN
>  #undef CONFIG_KASAN_GENERIC
>  
> diff --git a/arch/x86/boot/startup/sme.c b/arch/x86/boot/startup/sme.c
> index e7ea65f3f1d6..b76a7c95dfe1 100644
> --- a/arch/x86/boot/startup/sme.c
> +++ b/arch/x86/boot/startup/sme.c
> @@ -24,6 +24,7 @@
>  #undef CONFIG_PARAVIRT
>  #undef CONFIG_PARAVIRT_XXL
>  #undef CONFIG_PARAVIRT_SPINLOCKS
> +#undef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>  
>  /*
>   * This code runs before CPU feature bits are set. By default, the
> diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
> index b5e59a7ba0d0..13f9cd31c8f8 100644
> --- a/arch/x86/include/asm/paravirt.h
> +++ b/arch/x86/include/asm/paravirt.h
> @@ -526,7 +526,6 @@ static inline void arch_end_context_switch(struct task_struct *next)
>  	PVOP_VCALL1(cpu.end_context_switch, next);
>  }
>  
> -#define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
>  static inline void arch_enter_lazy_mmu_mode(void)
>  {
>  	PVOP_VCALL0(mmu.lazy_mode.enter);
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 1abc4a1c3d72..d46d86959bd6 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -235,7 +235,7 @@ static inline int pmd_dirty(pmd_t pmd)
>   *
>   * Nesting is not permitted and the mode cannot be used in interrupt context.
>   */
> -#ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
> +#ifndef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>  static inline void arch_enter_lazy_mmu_mode(void) {}
>  static inline void arch_leave_lazy_mmu_mode(void) {}
>  static inline void arch_flush_lazy_mmu_mode(void) {}
> diff --git a/mm/Kconfig b/mm/Kconfig
> index bd0ea5454af8..62073bd61544 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1464,6 +1464,13 @@ config PT_RECLAIM
>  config FIND_NORMAL_PAGE
>  	def_bool n
>  
> +config ARCH_HAS_LAZY_MMU_MODE
> +	bool
> +	help
> +	  The architecture uses the lazy MMU mode. This allows changes to
> +	  MMU-related architectural state to be deferred until the mode is
> +	  exited. See <linux/pgtable.h> for details.
> +
>  source "mm/damon/Kconfig"
>  
>  endmenu

Acked-by: Andreas Larsson <andreas@gaisler.com> # sparc

Cheers,
Andreas



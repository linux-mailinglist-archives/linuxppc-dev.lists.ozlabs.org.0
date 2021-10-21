Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65949435A6A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 07:43:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZbxk71P4z3cBK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 16:43:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZbxJ5Bx6z2y8R
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 16:43:14 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HZbxC2ZMvz9sSQ;
 Thu, 21 Oct 2021 07:43:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c1dY7tLbgq3r; Thu, 21 Oct 2021 07:43:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HZbxC1Gnrz9sSN;
 Thu, 21 Oct 2021 07:43:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 12D2A8B80E;
 Thu, 21 Oct 2021 07:43:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qRQoSA5NOLWQ; Thu, 21 Oct 2021 07:43:10 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.154])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 993BA8B764;
 Thu, 21 Oct 2021 07:43:10 +0200 (CEST)
Subject: Re: [PATCH v2 13/16] powerpc/64s: Move hash MMU code under a new
 Kconfig name
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211021035417.2157804-1-npiggin@gmail.com>
 <20211021035417.2157804-14-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <affad7bd-64c5-d9eb-c80a-81c4ff67d6e2@csgroup.eu>
Date: Thu, 21 Oct 2021 07:43:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211021035417.2157804-14-npiggin@gmail.com>
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
> Introduce a new option CONFIG_PPC_64S_HASH_MMU, and make 64s hash
> code depend on it.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/Kconfig                          |  2 +-
>   arch/powerpc/include/asm/book3s/64/mmu.h      | 19 +++++++++--
>   .../include/asm/book3s/64/tlbflush-hash.h     |  7 ++++
>   arch/powerpc/include/asm/book3s/pgtable.h     |  4 +++
>   arch/powerpc/include/asm/mmu.h                | 16 +++++++--
>   arch/powerpc/include/asm/mmu_context.h        |  2 ++
>   arch/powerpc/include/asm/paca.h               |  8 +++++
>   arch/powerpc/kernel/asm-offsets.c             |  2 ++
>   arch/powerpc/kernel/dt_cpu_ftrs.c             | 14 +++++---
>   arch/powerpc/kernel/entry_64.S                |  4 +--
>   arch/powerpc/kernel/exceptions-64s.S          | 16 +++++++++
>   arch/powerpc/kernel/mce.c                     |  2 +-
>   arch/powerpc/kernel/mce_power.c               | 10 ++++--
>   arch/powerpc/kernel/paca.c                    | 18 ++++------
>   arch/powerpc/kernel/process.c                 | 13 +++----
>   arch/powerpc/kernel/prom.c                    |  2 ++
>   arch/powerpc/kernel/setup_64.c                |  5 +++
>   arch/powerpc/kexec/core_64.c                  |  4 +--
>   arch/powerpc/kexec/ranges.c                   |  4 +++
>   arch/powerpc/mm/book3s64/Makefile             | 15 ++++----
>   arch/powerpc/mm/book3s64/hugetlbpage.c        |  2 ++
>   arch/powerpc/mm/book3s64/mmu_context.c        | 34 +++++++++++++++----
>   arch/powerpc/mm/book3s64/radix_pgtable.c      |  4 +++
>   arch/powerpc/mm/copro_fault.c                 |  2 ++
>   arch/powerpc/mm/ioremap.c                     | 13 ++++---
>   arch/powerpc/mm/pgtable.c                     | 10 ++++--
>   arch/powerpc/mm/ptdump/Makefile               |  2 +-
>   arch/powerpc/platforms/Kconfig.cputype        |  4 +++
>   arch/powerpc/platforms/powernv/idle.c         |  2 ++
>   arch/powerpc/platforms/powernv/setup.c        |  2 ++
>   arch/powerpc/platforms/pseries/lpar.c         | 11 ++++--
>   arch/powerpc/platforms/pseries/lparcfg.c      |  2 +-
>   arch/powerpc/platforms/pseries/mobility.c     |  6 ++++
>   arch/powerpc/platforms/pseries/ras.c          |  2 ++
>   arch/powerpc/platforms/pseries/reconfig.c     |  2 ++
>   arch/powerpc/platforms/pseries/setup.c        |  6 ++--
>   arch/powerpc/xmon/xmon.c                      |  8 +++--
>   drivers/misc/lkdtm/Makefile                   |  2 +-
>   drivers/misc/lkdtm/core.c                     |  2 +-
>   39 files changed, 219 insertions(+), 64 deletions(-)

I'm still unconfortable with the quantity of files impacted in that commit.

> 

> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
> index c02f42d1031e..d94ebae386b6 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h

> @@ -193,8 +198,15 @@ static inline struct subpage_prot_table *mm_ctx_subpage_prot(mm_context_t *ctx)
>   extern int mmu_linear_psize;
>   extern int mmu_virtual_psize;
>   extern int mmu_vmalloc_psize;
> -extern int mmu_vmemmap_psize;
>   extern int mmu_io_psize;
> +#else /* CONFIG_PPC_64S_HASH_MMU */
> +#ifdef CONFIG_PPC_64K_PAGES

Avoid nested #ifdefs and do

#elif defined(CONFIG_PPC_64K_PAGES)

> +#define mmu_virtual_psize MMU_PAGE_64K
> +#else
> +#define mmu_virtual_psize MMU_PAGE_4K
> +#endif
> +#endif
> +extern int mmu_vmemmap_psize;
>   
>   /* MMU initialization */
>   void mmu_early_init_devtree(void);
> @@ -233,7 +245,8 @@ static inline void setup_initial_memory_limit(phys_addr_t first_memblock_base,
>   	 * know which translations we will pick. Hence go with hash
>   	 * restrictions.
>   	 */
> -	return hash__setup_initial_memory_limit(first_memblock_base,
> +	if (!radix_enabled())
> +		return hash__setup_initial_memory_limit(first_memblock_base,
>   					   first_memblock_size);
>   }
>   
> @@ -255,6 +268,7 @@ static inline void radix_init_pseries(void) { }
>   void cleanup_cpu_mmu_context(void);
>   #endif
>   
> +#ifdef CONFIG_PPC_64S_HASH_MMU
>   static inline int get_user_context(mm_context_t *ctx, unsigned long ea)
>   {
>   	int index = ea >> MAX_EA_BITS_PER_CONTEXT;
> @@ -274,6 +288,7 @@ static inline unsigned long get_user_vsid(mm_context_t *ctx,
>   
>   	return get_vsid(context, ea, ssize);
>   }
> +#endif
>   
>   #endif /* __ASSEMBLY__ */
>   #endif /* _ASM_POWERPC_BOOK3S_64_MMU_H_ */
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> index 3b95769739c7..06f4bd09eecf 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> @@ -112,8 +112,15 @@ static inline void hash__flush_tlb_kernel_range(unsigned long start,
>   
>   struct mmu_gather;
>   extern void hash__tlb_flush(struct mmu_gather *tlb);
> +extern void flush_tlb_pmd_range(struct mm_struct *mm, pmd_t *pmd,

'extern' is superfluous.

> +				unsigned long addr);
> +
> +#ifdef CONFIG_PPC_64S_HASH_MMU
>   /* Private function for use by PCI IO mapping code */
>   extern void __flush_hash_table_range(unsigned long start, unsigned long end);
>   extern void flush_tlb_pmd_range(struct mm_struct *mm, pmd_t *pmd,
>   				unsigned long addr);
> +#else
> +static inline void __flush_hash_table_range(unsigned long start, unsigned long end) { }
> +#endif
>   #endif /*  _ASM_POWERPC_BOOK3S_64_TLBFLUSH_HASH_H */

> diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
> index 8abe8e42e045..226417f26145 100644
> --- a/arch/powerpc/include/asm/mmu.h
> +++ b/arch/powerpc/include/asm/mmu.h
> @@ -157,7 +157,7 @@ DECLARE_PER_CPU(int, next_tlbcam_idx);
>   
>   enum {
>   	MMU_FTRS_POSSIBLE =
> -#if defined(CONFIG_PPC_BOOK3S_64) || defined(CONFIG_PPC_BOOK3S_604)
> +#if defined(CONFIG_PPC_BOOK3S_604)
>   		MMU_FTR_HPTE_TABLE |
>   #endif
>   #ifdef CONFIG_PPC_8xx
> @@ -184,15 +184,18 @@ enum {
>   		MMU_FTR_USE_TLBRSRV | MMU_FTR_USE_PAIRED_MAS |
>   #endif
>   #ifdef CONFIG_PPC_BOOK3S_64
> +		MMU_FTR_KERNEL_RO |
> +#ifdef CONFIG_PPC_64S_HASH_MMU
>   		MMU_FTR_NO_SLBIE_B | MMU_FTR_16M_PAGE | MMU_FTR_TLBIEL |
>   		MMU_FTR_LOCKLESS_TLBIE | MMU_FTR_CI_LARGE_PAGE |
>   		MMU_FTR_1T_SEGMENT | MMU_FTR_TLBIE_CROP_VA |
> -		MMU_FTR_KERNEL_RO | MMU_FTR_68_BIT_VA |
> +		MMU_FTR_68_BIT_VA | MMU_FTR_HPTE_TABLE |
>   #endif
>   #ifdef CONFIG_PPC_RADIX_MMU
>   		MMU_FTR_TYPE_RADIX |
>   		MMU_FTR_GTSE |
>   #endif /* CONFIG_PPC_RADIX_MMU */
> +#endif
>   #ifdef CONFIG_PPC_KUAP
>   	MMU_FTR_BOOK3S_KUAP |
>   #endif /* CONFIG_PPC_KUAP */
> @@ -223,6 +226,13 @@ enum {
>   #ifdef CONFIG_E500
>   #define MMU_FTRS_ALWAYS		MMU_FTR_TYPE_FSL_E
>   #endif
> +#ifdef CONFIG_PPC_BOOK3S_64

No need of this CONFIG_PPC_BOOK3S_64 ifdef, it is necessarily defined if 
either CONFIG_PPC_RADIX_MMU or CONFIG_PPC_64S_HASH_MMU is defined


> +#if defined(CONFIG_PPC_RADIX_MMU) && !defined(CONFIG_PPC_64S_HASH_MMU)
> +#define MMU_FTRS_ALWAYS		MMU_FTR_TYPE_RADIX
> +#elif !defined(CONFIG_PPC_RADIX_MMU) && defined(CONFIG_PPC_64S_HASH_MMU)
> +#define MMU_FTRS_ALWAYS		MMU_FTR_HPTE_TABLE
> +#endif
> +#endif
>   
>   #ifndef MMU_FTRS_ALWAYS
>   #define MMU_FTRS_ALWAYS		0

> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index 046c99e31d01..65b695e9401e 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -1369,11 +1369,15 @@ EXC_COMMON_BEGIN(data_access_common)
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	andis.	r0,r4,DSISR_DABRMATCH@h
>   	bne-	1f
> +#ifdef CONFIG_PPC_64S_HASH_MMU
>   BEGIN_MMU_FTR_SECTION
>   	bl	do_hash_fault
>   MMU_FTR_SECTION_ELSE
>   	bl	do_page_fault
>   ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
> +#else
> +	bl	do_page_fault
> +#endif

Maybe we could always branch to do_page_fault() and get redirected to 
do_hash_fault() from do_page_fault() if BOOK3S64 && !radix_enabled() ?

Another solution is to make it a GAS macro ?

>   	b	interrupt_return_srr
>   
>   1:	bl	do_break
> @@ -1416,6 +1420,7 @@ EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
>   EXC_VIRT_END(data_access_slb, 0x4380, 0x80)
>   EXC_COMMON_BEGIN(data_access_slb_common)
>   	GEN_COMMON data_access_slb
> +#ifdef CONFIG_PPC_64S_HASH_MMU
>   BEGIN_MMU_FTR_SECTION
>   	/* HPT case, do SLB fault */
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
> @@ -1428,6 +1433,9 @@ MMU_FTR_SECTION_ELSE
>   	/* Radix case, access is outside page table range */
>   	li	r3,-EFAULT
>   ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
> +#else
> +	li	r3,-EFAULT
> +#endif
>   	std	r3,RESULT(r1)
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	do_bad_segment_interrupt
> @@ -1462,11 +1470,15 @@ EXC_VIRT_END(instruction_access, 0x4400, 0x80)
>   EXC_COMMON_BEGIN(instruction_access_common)
>   	GEN_COMMON instruction_access
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
> +#ifdef CONFIG_PPC_64S_HASH_MMU
>   BEGIN_MMU_FTR_SECTION
>   	bl	do_hash_fault
>   MMU_FTR_SECTION_ELSE
>   	bl	do_page_fault
>   ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
> +#else
> +	bl	do_page_fault
> +#endif

Same as above.

>   	b	interrupt_return_srr
>   
>   

> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index 7d4bcbc3124e..59b1a1833143 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -887,6 +887,8 @@ void __init setup_per_cpu_areas(void)
>   	} else if (radix_enabled()) {
>   		atom_size = PAGE_SIZE;
>   	} else {
> +#ifdef CONFIG_PPC_64S_HASH_MMU

Use IS_ENABLED()


> +
>   		/*
>   		 * Linear mapping is one of 4K, 1M and 16M.  For 4K, no need
>   		 * to group units.  For larger mappings, use 1M atom which
> @@ -896,6 +898,9 @@ void __init setup_per_cpu_areas(void)
>   			atom_size = PAGE_SIZE;
>   		else
>   			atom_size = 1 << 20;
> +#else
> +		BUILD_BUG(); // radix_enabled() should be constant true
> +#endif
>   	}
>   
>   	if (pcpu_chosen_fc != PCPU_FC_PAGE) {

> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> index cd16b407f47e..ab105d33e0b0 100644
> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c
> @@ -81,9 +81,6 @@ static struct page *maybe_pte_to_page(pte_t pte)
>   
>   static pte_t set_pte_filter_hash(pte_t pte)
>   {
> -	if (radix_enabled())
> -		return pte;
> -
>   	pte = __pte(pte_val(pte) & ~_PAGE_HPTEFLAGS);
>   	if (pte_looks_normal(pte) && !(cpu_has_feature(CPU_FTR_COHERENT_ICACHE) ||
>   				       cpu_has_feature(CPU_FTR_NOEXECUTE))) {
> @@ -112,6 +109,9 @@ static inline pte_t set_pte_filter(pte_t pte)
>   {
>   	struct page *pg;
>   
> +	if (radix_enabled())
> +		return pte;
> +
>   	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
>   		return set_pte_filter_hash(pte);
>   
> @@ -144,6 +144,10 @@ static pte_t set_access_flags_filter(pte_t pte, struct vm_area_struct *vma,
>   {
>   	struct page *pg;
>   
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	return pte;
> +#endif

Aren't you changing the behaviour here for RADIX ?

Anyway, can use IS_ENABLED()

> +
>   	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
>   		return pte;
>   
> diff --git a/arch/powerpc/mm/ptdump/Makefile b/arch/powerpc/mm/ptdump/Makefile
> index 4050cbb55acf..b533caaf0910 100644
> --- a/arch/powerpc/mm/ptdump/Makefile
> +++ b/arch/powerpc/mm/ptdump/Makefile
> @@ -10,5 +10,5 @@ obj-$(CONFIG_PPC_BOOK3S_64)	+= book3s64.o
>   
>   ifdef CONFIG_PTDUMP_DEBUGFS
>   obj-$(CONFIG_PPC_BOOK3S_32)	+= bats.o segment_regs.o
> -obj-$(CONFIG_PPC_BOOK3S_64)	+= hashpagetable.o
> +obj-$(CONFIG_PPC_64S_HASH_MMU)	+= hashpagetable.o
>   endif
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index a208997ade88..01726e7f2c7f 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -105,6 +105,7 @@ config PPC_BOOK3S_64
>   	select HAVE_MOVE_PMD
>   	select HAVE_MOVE_PUD
>   	select IRQ_WORK
> +	select PPC_64S_HASH_MMU

Not needed

>   	select PPC_MM_SLICES
>   	select PPC_HAVE_KUEP
>   	select PPC_HAVE_KUAP
> @@ -364,6 +365,9 @@ config SPE
>   
>   	  If in doubt, say Y here.
>   
> +config PPC_64S_HASH_MMU
> +	bool

Add
	depends on PPC_BOOK3S_64
	default y

> +
>   config PPC_RADIX_MMU
>   	bool "Radix MMU Support"
>   	depends on PPC_BOOK3S_64

> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index dd8241c009e5..33de8d798c95 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -1160,9 +1160,11 @@ cmds(struct pt_regs *excp)
>   			show_tasks();
>   			break;
>   #ifdef CONFIG_PPC_BOOK3S
> +#ifdef CONFIG_PPC_64S_HASH_MMU

And BOOK3S/32 ???

>   		case 'u':
>   			dump_segments();
>   			break;
> +#endif
>   #elif defined(CONFIG_44x)
>   		case 'u':
>   			dump_tlb_44x();

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C7A437294
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 09:18:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbG0s2my8z3cVX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 18:18:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbG0Q6TJwz3002
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 18:18:12 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HbG0K46zqz9sSX;
 Fri, 22 Oct 2021 09:18:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RkW8_IH4yqXM; Fri, 22 Oct 2021 09:18:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HbG0K2pWGz9sSV;
 Fri, 22 Oct 2021 09:18:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4A04A8B816;
 Fri, 22 Oct 2021 09:18:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id urwDeUDn0Jgk; Fri, 22 Oct 2021 09:18:09 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.57])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DFE258B764;
 Fri, 22 Oct 2021 09:18:08 +0200 (CEST)
Subject: Re: [PATCH v3 16/18] powerpc/64s: Move hash MMU support code under
 CONFIG_PPC_64S_HASH_MMU
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211021223013.2641952-1-npiggin@gmail.com>
 <20211021223013.2641952-17-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <cfd73dd0-a7a2-b8b3-34d8-5a225758b056@csgroup.eu>
Date: Fri, 22 Oct 2021 09:18:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211021223013.2641952-17-npiggin@gmail.com>
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
> Compiling out hash support code when CONFIG_PPC_64S_HASH_MMU=n saves
> 128kB kernel image size (90kB text) on powernv_defconfig minus KVM,
> 350kB on pseries_defconfig minus KVM, 40kB on a tiny config.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/Kconfig                          |  2 +-
>   arch/powerpc/include/asm/book3s/64/mmu.h      | 19 +++++++++--
>   .../include/asm/book3s/64/tlbflush-hash.h     |  7 ++++
>   arch/powerpc/include/asm/book3s/pgtable.h     |  4 +++
>   arch/powerpc/include/asm/mmu_context.h        |  2 ++
>   arch/powerpc/include/asm/paca.h               |  8 +++++
>   arch/powerpc/kernel/asm-offsets.c             |  2 ++
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
>   arch/powerpc/mm/book3s64/pgtable.c            |  2 +-
>   arch/powerpc/mm/book3s64/radix_pgtable.c      |  4 +++
>   arch/powerpc/mm/copro_fault.c                 |  2 ++
>   arch/powerpc/mm/ptdump/Makefile               |  2 +-
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
>   35 files changed, 177 insertions(+), 51 deletions(-)
> 

> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
> index c02f42d1031e..d94ebae386b6 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> @@ -233,7 +245,8 @@ static inline void setup_initial_memory_limit(phys_addr_t first_memblock_base,
>   	 * know which translations we will pick. Hence go with hash
>   	 * restrictions.
>   	 */
> -	return hash__setup_initial_memory_limit(first_memblock_base,
> +	if (!radix_enabled())
> +		return hash__setup_initial_memory_limit(first_memblock_base,
>   					   first_memblock_size);

It is a void function, using return is not correct.


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
> +				unsigned long addr);

'extern' is superflous

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

> diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
> index c10fc8a72fb3..ae8d6c91dcd9 100644
> --- a/arch/powerpc/mm/book3s64/mmu_context.c
> +++ b/arch/powerpc/mm/book3s64/mmu_context.c
> @@ -31,6 +31,7 @@ static int alloc_context_id(int min_id, int max_id)
>   	return ida_alloc_range(&mmu_context_ida, min_id, max_id, GFP_KERNEL);
>   }
>   
> +#ifdef CONFIG_PPC_64S_HASH_MMU
>   void hash__reserve_context_id(int id)
>   {
>   	int result = ida_alloc_range(&mmu_context_ida, id, id, GFP_KERNEL);
> @@ -50,7 +51,9 @@ int hash__alloc_context_id(void)
>   	return alloc_context_id(MIN_USER_CONTEXT, max);
>   }
>   EXPORT_SYMBOL_GPL(hash__alloc_context_id);
> +#endif
>   
> +#ifdef CONFIG_PPC_64S_HASH_MMU
>   static int realloc_context_ids(mm_context_t *ctx)
>   {
>   	int i, id;
> @@ -144,12 +147,21 @@ static int hash__init_new_context(struct mm_struct *mm)
>   	return index;
>   }
>   
> +void slb_setup_new_exec(void);

Include arch/powerpc/mm/book3s64/internal.h instead

> +
>   void hash__setup_new_exec(void)
>   {
>   	slice_setup_new_exec();
>   
>   	slb_setup_new_exec();
>   }
> +#else
> +static inline int hash__init_new_context(struct mm_struct *mm)
> +{
> +	BUILD_BUG();
> +	return 0;
> +}
> +#endif
>   
>   static int radix__init_new_context(struct mm_struct *mm)
>   {

> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index 7d556b5513e4..57d2d797c4f6 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -535,7 +535,7 @@ static int __init pgtable_debugfs_setup(void)
>   }
>   arch_initcall(pgtable_debugfs_setup);
>   
> -#ifdef CONFIG_ZONE_DEVICE
> +#if defined(CONFIG_ZONE_DEVICE) && defined(ARCH_HAS_MEMREMAP_COMPAT_ALIGN)

Patch 12 does

	select ARCH_HAS_MEMREMAP_COMPAT_ALIGN	if PPC_BOOK3S_64

So this change is not needed

>   /*
>    * Override the generic version in mm/memremap.c.
>    *

> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index dd8241c009e5..30f764476c30 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -1160,9 +1160,11 @@ cmds(struct pt_regs *excp)
>   			show_tasks();
>   			break;
>   #ifdef CONFIG_PPC_BOOK3S
> +#if defined(CONFIG_PPC32) || defined(CONFIG_PPC_64S_HASH_MMU)

I think you'll get a build failure here.

dump_segments() is defined only with CONFIG_PPC_BOOK3S_64 and 
CONFIG_PPC_BOOK3S_32, see

https://elixir.bootlin.com/linux/v5.15-rc5/source/arch/powerpc/xmon/xmon.c#L3745

and

https://elixir.bootlin.com/linux/v5.15-rc5/source/arch/powerpc/xmon/xmon.c#L3784

>   		case 'u':
>   			dump_segments();
>   			break;
> +#endif
>   #elif defined(CONFIG_44x)
>   		case 'u':
>   			dump_tlb_44x();

Return-Path: <linuxppc-dev+bounces-90-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 892E395253E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2024 00:08:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wkj80721Zz2xJF;
	Thu, 15 Aug 2024 08:08:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkZSB4x7dz2yDx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2024 03:07:20 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WkZS30Hl8z9sRy;
	Wed, 14 Aug 2024 19:07:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6RLC8oXk8pzU; Wed, 14 Aug 2024 19:07:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WkZS25Rvpz9sRs;
	Wed, 14 Aug 2024 19:07:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9438C8B775;
	Wed, 14 Aug 2024 19:07:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0OK_QPZ8iJ6b; Wed, 14 Aug 2024 19:07:14 +0200 (CEST)
Received: from [192.168.232.91] (unknown [192.168.232.91])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0A40D8B764;
	Wed, 14 Aug 2024 19:07:14 +0200 (CEST)
Message-ID: <898f4c98-f72a-4ade-b5c6-8efaa852da4d@csgroup.eu>
Date: Wed, 14 Aug 2024 19:07:13 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 01/10] book3s64/hash: Remove kfence support temporarily
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Donet Tom <donettom@linux.vnet.ibm.com>,
 Pavithra Prakash <pavrampu@linux.vnet.ibm.com>
References: <cover.1722408881.git.ritesh.list@gmail.com>
 <b6a09a2f5495b144048929280a11338a2e70ba33.1722408881.git.ritesh.list@gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <b6a09a2f5495b144048929280a11338a2e70ba33.1722408881.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 31/07/2024 à 09:56, Ritesh Harjani (IBM) a écrit :
> [Vous ne recevez pas souvent de courriers de ritesh.list@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Kfence on book3s Hash on pseries is anyways broken. It fails to boot
> due to RMA size limitation. That is because, kfence with Hash uses
> debug_pagealloc infrastructure. debug_pagealloc allocates linear map
> for entire dram size instead of just kfence relevant objects.
> This means for 16TB of DRAM it will require (16TB >> PAGE_SHIFT)
> which is 256MB which is half of RMA region on P8.
> crash kernel reserves 256MB and we also need 2048 * 16KB * 3 for
> emergency stack and some more for paca allocations.
> That means there is not enough memory for reserving the full linear map
> in the RMA region, if the DRAM size is too big (>=16TB)
> (The issue is seen above 8TB with crash kernel 256 MB reservation).
> 
> Now Kfence does not require linear memory map for entire DRAM.
> It only needs for kfence objects. So this patch temporarily removes the
> kfence functionality since debug_pagealloc code needs some refactoring.
> We will bring in kfence on Hash support in later patches.
> 
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>   arch/powerpc/include/asm/kfence.h     |  5 +++++
>   arch/powerpc/mm/book3s64/hash_utils.c | 16 +++++++++++-----
>   2 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kfence.h b/arch/powerpc/include/asm/kfence.h
> index fab124ada1c7..f3a9476a71b3 100644
> --- a/arch/powerpc/include/asm/kfence.h
> +++ b/arch/powerpc/include/asm/kfence.h
> @@ -10,6 +10,7 @@
> 
>   #include <linux/mm.h>
>   #include <asm/pgtable.h>
> +#include <asm/mmu.h>
> 
>   #ifdef CONFIG_PPC64_ELF_ABI_V1
>   #define ARCH_FUNC_PREFIX "."
> @@ -25,6 +26,10 @@ static inline void disable_kfence(void)
> 
>   static inline bool arch_kfence_init_pool(void)
>   {
> +#ifdef CONFIG_PPC64
> +       if (!radix_enabled())
> +               return false;
> +#endif

Avoid #ifdefs whenever possible. Here you can do:

	if (IS_ENABLED(CONFIG_PPC64) && !radix_enabled())
		return false;

>          return !kfence_disabled;
>   }
>   #endif
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 01c3b4b65241..1a1b50735fa0 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -431,7 +431,7 @@ int htab_bolt_mapping(unsigned long vstart, unsigned long vend,
>                          break;
> 
>                  cond_resched();
> -               if (debug_pagealloc_enabled_or_kfence() &&
> +               if (debug_pagealloc_enabled() &&
>                          (paddr >> PAGE_SHIFT) < linear_map_hash_count)
>                          linear_map_hash_slots[paddr >> PAGE_SHIFT] = ret | 0x80;
>          }
> @@ -814,7 +814,7 @@ static void __init htab_init_page_sizes(void)
>          bool aligned = true;
>          init_hpte_page_sizes();
> 
> -       if (!debug_pagealloc_enabled_or_kfence()) {
> +       if (!debug_pagealloc_enabled()) {
>                  /*
>                   * Pick a size for the linear mapping. Currently, we only
>                   * support 16M, 1M and 4K which is the default
> @@ -1134,7 +1134,7 @@ static void __init htab_initialize(void)
> 
>          prot = pgprot_val(PAGE_KERNEL);
> 
> -       if (debug_pagealloc_enabled_or_kfence()) {
> +       if (debug_pagealloc_enabled()) {
>                  linear_map_hash_count = memblock_end_of_DRAM() >> PAGE_SHIFT;
>                  linear_map_hash_slots = memblock_alloc_try_nid(
>                                  linear_map_hash_count, 1, MEMBLOCK_LOW_LIMIT,
> @@ -2117,7 +2117,7 @@ void hpt_do_stress(unsigned long ea, unsigned long hpte_group)
>          }
>   }
> 
> -#if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
> +#if defined(CONFIG_DEBUG_PAGEALLOC)

Use #ifdef

>   static DEFINE_RAW_SPINLOCK(linear_map_hash_lock);
> 
>   static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
> @@ -2191,7 +2191,13 @@ int hash__kernel_map_pages(struct page *page, int numpages, int enable)
>          local_irq_restore(flags);
>          return 0;
>   }
> -#endif /* CONFIG_DEBUG_PAGEALLOC || CONFIG_KFENCE */
> +#else /* CONFIG_DEBUG_PAGEALLOC */
> +int hash__kernel_map_pages(struct page *page, int numpages,
> +                                        int enable)
> +{
> +       return 0;
> +}
> +#endif /* CONFIG_DEBUG_PAGEALLOC */
> 
>   void hash__setup_initial_memory_limit(phys_addr_t first_memblock_base,
>                                  phys_addr_t first_memblock_size)
> --
> 2.45.2
> 


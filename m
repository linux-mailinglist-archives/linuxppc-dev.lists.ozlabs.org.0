Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAC13022E6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 09:44:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPNh266pRzDqsd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 19:44:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPNdz2BBwzDqpM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jan 2021 19:42:15 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DPNdq1m6Tz9tx0J;
 Mon, 25 Jan 2021 09:42:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id AlOAqHfQxURs; Mon, 25 Jan 2021 09:42:07 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DPNdq0GGQz9tx0H;
 Mon, 25 Jan 2021 09:42:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8D91C8B784;
 Mon, 25 Jan 2021 09:42:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QbIhTspIBlNr; Mon, 25 Jan 2021 09:42:11 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4DC8A8B780;
 Mon, 25 Jan 2021 09:42:11 +0100 (CET)
Subject: Re: [PATCH v10 06/12] powerpc: inline huge vmap supported functions
To: Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
References: <20210124082230.2118861-1-npiggin@gmail.com>
 <20210124082230.2118861-7-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c03010a7-a358-0321-d5d4-80a770c2213f@csgroup.eu>
Date: Mon, 25 Jan 2021 09:42:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210124082230.2118861-7-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: linux-arch@vger.kernel.org, Ding Tianhong <dingtianhong@huawei.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Zefan Li <lizefan@huawei.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/01/2021 à 09:22, Nicholas Piggin a écrit :
> This allows unsupported levels to be constant folded away, and so
> p4d_free_pud_page can be removed because it's no longer linked to.

Ah, ok, you did it here. Why not squashing this patch into patch 5 directly ?

> 
> Cc: linuxppc-dev@lists.ozlabs.org
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/vmalloc.h       | 19 ++++++++++++++++---
>   arch/powerpc/mm/book3s64/radix_pgtable.c | 21 ---------------------
>   2 files changed, 16 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/vmalloc.h b/arch/powerpc/include/asm/vmalloc.h
> index 105abb73f075..3f0c153befb0 100644
> --- a/arch/powerpc/include/asm/vmalloc.h
> +++ b/arch/powerpc/include/asm/vmalloc.h
> @@ -1,12 +1,25 @@
>   #ifndef _ASM_POWERPC_VMALLOC_H
>   #define _ASM_POWERPC_VMALLOC_H
>   
> +#include <asm/mmu.h>
>   #include <asm/page.h>
>   
>   #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
> -bool arch_vmap_p4d_supported(pgprot_t prot);
> -bool arch_vmap_pud_supported(pgprot_t prot);
> -bool arch_vmap_pmd_supported(pgprot_t prot);
> +static inline bool arch_vmap_p4d_supported(pgprot_t prot)
> +{
> +	return false;
> +}
> +
> +static inline bool arch_vmap_pud_supported(pgprot_t prot)
> +{
> +	/* HPT does not cope with large pages in the vmalloc area */
> +	return radix_enabled();
> +}
> +
> +static inline bool arch_vmap_pmd_supported(pgprot_t prot)
> +{
> +	return radix_enabled();
> +}
>   #endif
>   
>   #endif /* _ASM_POWERPC_VMALLOC_H */
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 743807fc210f..8da62afccee5 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -1082,22 +1082,6 @@ void radix__ptep_modify_prot_commit(struct vm_area_struct *vma,
>   	set_pte_at(mm, addr, ptep, pte);
>   }
>   
> -bool arch_vmap_pud_supported(pgprot_t prot)
> -{
> -	/* HPT does not cope with large pages in the vmalloc area */
> -	return radix_enabled();
> -}
> -
> -bool arch_vmap_pmd_supported(pgprot_t prot)
> -{
> -	return radix_enabled();
> -}
> -
> -int p4d_free_pud_page(p4d_t *p4d, unsigned long addr)
> -{
> -	return 0;
> -}
> -
>   int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
>   {
>   	pte_t *ptep = (pte_t *)pud;
> @@ -1181,8 +1165,3 @@ int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
>   
>   	return 1;
>   }
> -
> -bool arch_vmap_p4d_supported(pgprot_t prot)
> -{
> -	return false;
> -}
> 

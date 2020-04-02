Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1613E19BF36
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 12:21:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tJxw0X2tzDrQn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 21:21:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=IUpg5kiP; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tJvc2VLqzDrF1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 21:19:24 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48tJvW28wWz9txXF;
 Thu,  2 Apr 2020 12:19:19 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=IUpg5kiP; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Yjz7IgmAzaAj; Thu,  2 Apr 2020 12:19:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48tJvW0xcFz9txX0;
 Thu,  2 Apr 2020 12:19:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585822759; bh=PlmUTdpMIrJzpaiSJTBQgMj7cnXxamyWLnCDK47mlYI=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=IUpg5kiPE+r/VtM0RhTVmrfOVaC/i8EsaaiY08m7L4iZ5O9iF7WdPqRhGOGwczMvu
 SwhamkcG6i9QuE00Q4GspqSefvoNd0Q+/yHPJOiHwAc+J8IEZH6Mp6fgBPfWFhxoZM
 bYcAWbk25ic6SJ7YiZIjHbIIl7ppHxlaq53ZksCk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 37E1F8B8C6;
 Thu,  2 Apr 2020 12:19:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pM3YlHv-9AW2; Thu,  2 Apr 2020 12:19:20 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9462A8B75E;
 Thu,  2 Apr 2020 12:19:19 +0200 (CEST)
Subject: Re: [PATCH v1 06/46] powerpc/kasan: Refactor update of early shadow
 mappings
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1584360343.git.christophe.leroy@c-s.fr>
 <5eb93a773184aa0d36faa93c096b21cbe0a069c9.1584360344.git.christophe.leroy@c-s.fr>
Message-ID: <18fb9f4b-d110-ee41-af44-09a1f5072ecf@c-s.fr>
Date: Thu, 2 Apr 2020 12:19:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <5eb93a773184aa0d36faa93c096b21cbe0a069c9.1584360344.git.christophe.leroy@c-s.fr>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael,

Le 16/03/2020 à 13:35, Christophe Leroy a écrit :
> kasan_remap_early_shadow_ro() and kasan_unmap_early_shadow_vmalloc()
> are both updating the early shadow mapping: the first one sets
> the mapping read-only while the other clears the mapping.
> 
> Refactor and create kasan_update_early_region()

There is a trivial conflict with this patch on powerpc/next.
Do you plan to take this series for 5.7 ? I so, I can repost the series 
now with the fix, or just this patch ?

Otherwise, what are your plans ? This series (Patches 18 and 19) will 
conflict with the 40x removal series as both do things about that 
PTE_ATOMIC_UPDATE stuff. Which series would go first ?

Thanks
Christophe

> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>   arch/powerpc/mm/kasan/kasan_init_32.c | 39 +++++++++++++--------------
>   1 file changed, 18 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
> index c9d053078c37..65fd8b891f8e 100644
> --- a/arch/powerpc/mm/kasan/kasan_init_32.c
> +++ b/arch/powerpc/mm/kasan/kasan_init_32.c
> @@ -79,45 +79,42 @@ static int __init kasan_init_region(void *start, size_t size)
>   	return 0;
>   }
>   
> -static void __init kasan_remap_early_shadow_ro(void)
> +static void __init
> +kasan_update_early_region(unsigned long k_start, unsigned long k_end, pte_t pte)
>   {
> -	pgprot_t prot = kasan_prot_ro();
> -	unsigned long k_start = KASAN_SHADOW_START;
> -	unsigned long k_end = KASAN_SHADOW_END;
>   	unsigned long k_cur;
>   	phys_addr_t pa = __pa(kasan_early_shadow_page);
>   
> -	kasan_populate_pte(kasan_early_shadow_pte, prot);
> -
> -	for (k_cur = k_start & PAGE_MASK; k_cur < k_end; k_cur += PAGE_SIZE) {
> +	for (k_cur = k_start; k_cur < k_end; k_cur += PAGE_SIZE) {
>   		pmd_t *pmd = pmd_ptr_k(k_cur);
>   		pte_t *ptep = pte_offset_kernel(pmd, k_cur);
>   
>   		if ((pte_val(*ptep) & PTE_RPN_MASK) != pa)
>   			continue;
>   
> -		__set_pte_at(&init_mm, k_cur, ptep, pfn_pte(PHYS_PFN(pa), prot), 0);
> +		__set_pte_at(&init_mm, k_cur, ptep, pte, 0);
>   	}
> -	flush_tlb_kernel_range(KASAN_SHADOW_START, KASAN_SHADOW_END);
> +
> +	flush_tlb_kernel_range(k_start, k_end);
>   }
>   
> -static void __init kasan_unmap_early_shadow_vmalloc(void)
> +static void __init kasan_remap_early_shadow_ro(void)
>   {
> -	unsigned long k_start = (unsigned long)kasan_mem_to_shadow((void *)VMALLOC_START);
> -	unsigned long k_end = (unsigned long)kasan_mem_to_shadow((void *)VMALLOC_END);
> -	unsigned long k_cur;
> +	pgprot_t prot = kasan_prot_ro();
>   	phys_addr_t pa = __pa(kasan_early_shadow_page);
>   
> -	for (k_cur = k_start & PAGE_MASK; k_cur < k_end; k_cur += PAGE_SIZE) {
> -		pmd_t *pmd = pmd_offset(pud_offset(pgd_offset_k(k_cur), k_cur), k_cur);
> -		pte_t *ptep = pte_offset_kernel(pmd, k_cur);
> +	kasan_populate_pte(kasan_early_shadow_pte, prot);
>   
> -		if ((pte_val(*ptep) & PTE_RPN_MASK) != pa)
> -			continue;
> +	kasan_update_early_region(KASAN_SHADOW_START, KASAN_SHADOW_END,
> +				  pfn_pte(PHYS_PFN(pa), prot));
> +}
>   
> -		__set_pte_at(&init_mm, k_cur, ptep, __pte(0), 0);
> -	}
> -	flush_tlb_kernel_range(k_start, k_end);
> +static void __init kasan_unmap_early_shadow_vmalloc(void)
> +{
> +	unsigned long k_start = (unsigned long)kasan_mem_to_shadow((void *)VMALLOC_START);
> +	unsigned long k_end = (unsigned long)kasan_mem_to_shadow((void *)VMALLOC_END);
> +
> +	kasan_update_early_region(k_start, k_end, __pte(0));
>   }
>   
>   static void __init kasan_mmu_init(void)
> 

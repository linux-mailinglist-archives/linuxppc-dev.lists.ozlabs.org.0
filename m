Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EF23C36A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 07:26:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NJPl5jyLzDqTD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 15:26:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="ge66Y4D5"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NJMp0112zDq9W
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 15:24:21 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45NJMj2w3Mz9tyqV;
 Tue, 11 Jun 2019 07:24:17 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ge66Y4D5; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id fyyoRIc-tH9n; Tue, 11 Jun 2019 07:24:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45NJMj1qNQz9v0p3;
 Tue, 11 Jun 2019 07:24:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560230657; bh=OryAugs7TR5ttspxYLjCji77PWxYn28+eCLlZmxKaSs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ge66Y4D5NeVyJ1VEQFUPgGLiA0P3jcJWqY2opg9SNR+Gi6jCSbFEKId7BcIp99i89
 EIu0mGTtgWYmMO1xM/HrXU+JTOvwk17csNdMcyiw3aJG6vDtoQO4uVB9sjnCZ4epop
 OMJ3bY9p4GgZfOsdsmRormyDBmzDV+7Ach9IkAFs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0778E8B7D4;
 Tue, 11 Jun 2019 07:24:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id A-475R45ce_Y; Tue, 11 Jun 2019 07:24:17 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6DB748B75B;
 Tue, 11 Jun 2019 07:24:17 +0200 (CEST)
Subject: Re: [PATCH 1/4] mm: Move ioremap page table mapping function to mm/
To: Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org
References: <20190610043838.27916-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <86991f76-2101-8087-37db-d939d5d744fa@c-s.fr>
Date: Tue, 11 Jun 2019 07:24:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190610043838.27916-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 10/06/2019 à 06:38, Nicholas Piggin a écrit :
> ioremap_page_range is a generic function to create a kernel virtual
> mapping, move it to mm/vmalloc.c and rename it vmap_range.
> 
> For clarity with this move, also:
> - Rename vunmap_page_range (vmap_range's inverse) to vunmap_range.
> - Rename vmap_page_range (which takes a page array) to vmap_pages.

Maybe it would be easier to follow the change if the name change was 
done in another patch than the move.

> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> 
> Fixed up the arm64 compile errors, fixed a few bugs, and tidied
> things up a bit more.
> 
> Have tested powerpc and x86 but not arm64, would appreciate a review
> and test of the arm64 patch if possible.
> 
>   include/linux/vmalloc.h |   3 +
>   lib/ioremap.c           | 173 +++---------------------------
>   mm/vmalloc.c            | 228 ++++++++++++++++++++++++++++++++++++----
>   3 files changed, 229 insertions(+), 175 deletions(-)
> 
> diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
> index 51e131245379..812bea5866d6 100644
> --- a/include/linux/vmalloc.h
> +++ b/include/linux/vmalloc.h
> @@ -147,6 +147,9 @@ extern struct vm_struct *find_vm_area(const void *addr);
>   extern int map_vm_area(struct vm_struct *area, pgprot_t prot,
>   			struct page **pages);
>   #ifdef CONFIG_MMU
> +extern int vmap_range(unsigned long addr,
> +		       unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
> +		       unsigned int max_page_shift);

Drop extern keyword here.

As checkpatch tells you, 'CHECK:AVOID_EXTERNS: extern prototypes should 
be avoided in .h files'

Christophe

>   extern int map_kernel_range_noflush(unsigned long start, unsigned long size,
>   				    pgprot_t prot, struct page **pages);
>   extern void unmap_kernel_range_noflush(unsigned long addr, unsigned long size);
> diff --git a/lib/ioremap.c b/lib/ioremap.c
> index 063213685563..e13946da8ec3 100644
> --- a/lib/ioremap.c
> +++ b/lib/ioremap.c
> @@ -58,165 +58,24 @@ static inline int ioremap_pud_enabled(void) { return 0; }
>   static inline int ioremap_pmd_enabled(void) { return 0; }
>   #endif	/* CONFIG_HAVE_ARCH_HUGE_VMAP */
>   
> -static int ioremap_pte_range(pmd_t *pmd, unsigned long addr,
> -		unsigned long end, phys_addr_t phys_addr, pgprot_t prot)
> -{
> -	pte_t *pte;
> -	u64 pfn;
> -
> -	pfn = phys_addr >> PAGE_SHIFT;
> -	pte = pte_alloc_kernel(pmd, addr);
> -	if (!pte)
> -		return -ENOMEM;
> -	do {
> -		BUG_ON(!pte_none(*pte));
> -		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
> -		pfn++;
> -	} while (pte++, addr += PAGE_SIZE, addr != end);
> -	return 0;
> -}
> -
> -static int ioremap_try_huge_pmd(pmd_t *pmd, unsigned long addr,
> -				unsigned long end, phys_addr_t phys_addr,
> -				pgprot_t prot)
> -{
> -	if (!ioremap_pmd_enabled())
> -		return 0;
> -
> -	if ((end - addr) != PMD_SIZE)
> -		return 0;
> -
> -	if (!IS_ALIGNED(phys_addr, PMD_SIZE))
> -		return 0;
> -
> -	if (pmd_present(*pmd) && !pmd_free_pte_page(pmd, addr))
> -		return 0;
> -
> -	return pmd_set_huge(pmd, phys_addr, prot);
> -}
> -
> -static inline int ioremap_pmd_range(pud_t *pud, unsigned long addr,
> -		unsigned long end, phys_addr_t phys_addr, pgprot_t prot)
> -{
> -	pmd_t *pmd;
> -	unsigned long next;
> -
> -	pmd = pmd_alloc(&init_mm, pud, addr);
> -	if (!pmd)
> -		return -ENOMEM;
> -	do {
> -		next = pmd_addr_end(addr, end);
> -
> -		if (ioremap_try_huge_pmd(pmd, addr, next, phys_addr, prot))
> -			continue;
> -
> -		if (ioremap_pte_range(pmd, addr, next, phys_addr, prot))
> -			return -ENOMEM;
> -	} while (pmd++, phys_addr += (next - addr), addr = next, addr != end);
> -	return 0;
> -}
> -
> -static int ioremap_try_huge_pud(pud_t *pud, unsigned long addr,
> -				unsigned long end, phys_addr_t phys_addr,
> -				pgprot_t prot)
> -{
> -	if (!ioremap_pud_enabled())
> -		return 0;
> -
> -	if ((end - addr) != PUD_SIZE)
> -		return 0;
> -
> -	if (!IS_ALIGNED(phys_addr, PUD_SIZE))
> -		return 0;
> -
> -	if (pud_present(*pud) && !pud_free_pmd_page(pud, addr))
> -		return 0;
> -
> -	return pud_set_huge(pud, phys_addr, prot);
> -}
> -
> -static inline int ioremap_pud_range(p4d_t *p4d, unsigned long addr,
> -		unsigned long end, phys_addr_t phys_addr, pgprot_t prot)
> -{
> -	pud_t *pud;
> -	unsigned long next;
> -
> -	pud = pud_alloc(&init_mm, p4d, addr);
> -	if (!pud)
> -		return -ENOMEM;
> -	do {
> -		next = pud_addr_end(addr, end);
> -
> -		if (ioremap_try_huge_pud(pud, addr, next, phys_addr, prot))
> -			continue;
> -
> -		if (ioremap_pmd_range(pud, addr, next, phys_addr, prot))
> -			return -ENOMEM;
> -	} while (pud++, phys_addr += (next - addr), addr = next, addr != end);
> -	return 0;
> -}
> -
> -static int ioremap_try_huge_p4d(p4d_t *p4d, unsigned long addr,
> -				unsigned long end, phys_addr_t phys_addr,
> -				pgprot_t prot)
> -{
> -	if (!ioremap_p4d_enabled())
> -		return 0;
> -
> -	if ((end - addr) != P4D_SIZE)
> -		return 0;
> -
> -	if (!IS_ALIGNED(phys_addr, P4D_SIZE))
> -		return 0;
> -
> -	if (p4d_present(*p4d) && !p4d_free_pud_page(p4d, addr))
> -		return 0;
> -
> -	return p4d_set_huge(p4d, phys_addr, prot);
> -}
> -
> -static inline int ioremap_p4d_range(pgd_t *pgd, unsigned long addr,
> -		unsigned long end, phys_addr_t phys_addr, pgprot_t prot)
> -{
> -	p4d_t *p4d;
> -	unsigned long next;
> -
> -	p4d = p4d_alloc(&init_mm, pgd, addr);
> -	if (!p4d)
> -		return -ENOMEM;
> -	do {
> -		next = p4d_addr_end(addr, end);
> -
> -		if (ioremap_try_huge_p4d(p4d, addr, next, phys_addr, prot))
> -			continue;
> -
> -		if (ioremap_pud_range(p4d, addr, next, phys_addr, prot))
> -			return -ENOMEM;
> -	} while (p4d++, phys_addr += (next - addr), addr = next, addr != end);
> -	return 0;
> -}
> -
>   int ioremap_page_range(unsigned long addr,
>   		       unsigned long end, phys_addr_t phys_addr, pgprot_t prot)
>   {
> -	pgd_t *pgd;
> -	unsigned long start;
> -	unsigned long next;
> -	int err;
> -
> -	might_sleep();
> -	BUG_ON(addr >= end);
> -
> -	start = addr;
> -	pgd = pgd_offset_k(addr);
> -	do {
> -		next = pgd_addr_end(addr, end);
> -		err = ioremap_p4d_range(pgd, addr, next, phys_addr, prot);
> -		if (err)
> -			break;
> -	} while (pgd++, phys_addr += (next - addr), addr = next, addr != end);
> -
> -	flush_cache_vmap(start, end);
> +	unsigned int max_page_shift = PAGE_SHIFT;
> +
> +	/*
> +	 * Due to the max_page_shift parameter to vmap_range, platforms must
> +	 * enable all smaller sizes to take advantage of a given size,
> +	 * otherwise fall back to small pages.
> +	 */
> +	if (ioremap_pmd_enabled()) {
> +		max_page_shift = PMD_SHIFT;
> +		if (ioremap_pud_enabled()) {
> +			max_page_shift = PUD_SHIFT;
> +			if (ioremap_p4d_enabled())
> +				max_page_shift = P4D_SHIFT;
> +		}
> +	}
>   
> -	return err;
> +	return vmap_range(addr, end, phys_addr, prot, max_page_shift);
>   }
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 233af6936c93..dd27cfb29b10 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -119,7 +119,7 @@ static void vunmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end)
>   	} while (p4d++, addr = next, addr != end);
>   }
>   
> -static void vunmap_page_range(unsigned long addr, unsigned long end)
> +static void vunmap_range(unsigned long addr, unsigned long end)
>   {
>   	pgd_t *pgd;
>   	unsigned long next;
> @@ -135,6 +135,198 @@ static void vunmap_page_range(unsigned long addr, unsigned long end)
>   }
>   
>   static int vmap_pte_range(pmd_t *pmd, unsigned long addr,
> +			unsigned long end, phys_addr_t phys_addr, pgprot_t prot)
> +{
> +	pte_t *pte;
> +	u64 pfn;
> +
> +	pfn = phys_addr >> PAGE_SHIFT;
> +	pte = pte_alloc_kernel(pmd, addr);
> +	if (!pte)
> +		return -ENOMEM;
> +	do {
> +		BUG_ON(!pte_none(*pte));
> +		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
> +		pfn++;
> +	} while (pte++, addr += PAGE_SIZE, addr != end);
> +	return 0;
> +}
> +
> +static int vmap_try_huge_pmd(pmd_t *pmd, unsigned long addr,
> +			unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
> +			unsigned int max_page_shift)
> +{
> +	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
> +		return 0;
> +
> +	if (max_page_shift < PMD_SHIFT)
> +		return 0;
> +
> +	if ((end - addr) != PMD_SIZE)
> +		return 0;
> +
> +	if (!IS_ALIGNED(phys_addr, PMD_SIZE))
> +		return 0;
> +
> +	if (pmd_present(*pmd) && !pmd_free_pte_page(pmd, addr))
> +		return 0;
> +
> +	return pmd_set_huge(pmd, phys_addr, prot);
> +}
> +
> +static inline int vmap_pmd_range(pud_t *pud, unsigned long addr,
> +			unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
> +			unsigned int max_page_shift)
> +{
> +	pmd_t *pmd;
> +	unsigned long next;
> +
> +	pmd = pmd_alloc(&init_mm, pud, addr);
> +	if (!pmd)
> +		return -ENOMEM;
> +	do {
> +		next = pmd_addr_end(addr, end);
> +
> +		if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot,
> +					max_page_shift))
> +			continue;
> +
> +		if (vmap_pte_range(pmd, addr, next, phys_addr, prot))
> +			return -ENOMEM;
> +	} while (pmd++, phys_addr += (next - addr), addr = next, addr != end);
> +	return 0;
> +}
> +
> +static int vmap_try_huge_pud(pud_t *pud, unsigned long addr,
> +			unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
> +			unsigned int max_page_shift)
> +{
> +	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
> +		return 0;
> +
> +	if (max_page_shift < PUD_SHIFT)
> +		return 0;
> +
> +	if ((end - addr) != PUD_SIZE)
> +		return 0;
> +
> +	if (!IS_ALIGNED(phys_addr, PUD_SIZE))
> +		return 0;
> +
> +	if (pud_present(*pud) && !pud_free_pmd_page(pud, addr))
> +		return 0;
> +
> +	return pud_set_huge(pud, phys_addr, prot);
> +}
> +
> +static inline int vmap_pud_range(p4d_t *p4d, unsigned long addr,
> +			unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
> +			unsigned int max_page_shift)
> +{
> +	pud_t *pud;
> +	unsigned long next;
> +
> +	pud = pud_alloc(&init_mm, p4d, addr);
> +	if (!pud)
> +		return -ENOMEM;
> +	do {
> +		next = pud_addr_end(addr, end);
> +
> +		if (vmap_try_huge_pud(pud, addr, next, phys_addr, prot,
> +					max_page_shift))
> +			continue;
> +
> +		if (vmap_pmd_range(pud, addr, next, phys_addr, prot,
> +					max_page_shift))
> +			return -ENOMEM;
> +	} while (pud++, phys_addr += (next - addr), addr = next, addr != end);
> +	return 0;
> +}
> +
> +static int vmap_try_huge_p4d(p4d_t *p4d, unsigned long addr,
> +			unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
> +			unsigned int max_page_shift)
> +{
> +	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
> +		return 0;
> +
> +	if (max_page_shift < P4D_SHIFT)
> +		return 0;
> +
> +	if ((end - addr) != P4D_SIZE)
> +		return 0;
> +
> +	if (!IS_ALIGNED(phys_addr, P4D_SIZE))
> +		return 0;
> +
> +	if (p4d_present(*p4d) && !p4d_free_pud_page(p4d, addr))
> +		return 0;
> +
> +	return p4d_set_huge(p4d, phys_addr, prot);
> +}
> +
> +static inline int vmap_p4d_range(pgd_t *pgd, unsigned long addr,
> +			unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
> +			unsigned int max_page_shift)
> +{
> +	p4d_t *p4d;
> +	unsigned long next;
> +
> +	p4d = p4d_alloc(&init_mm, pgd, addr);
> +	if (!p4d)
> +		return -ENOMEM;
> +	do {
> +		next = p4d_addr_end(addr, end);
> +
> +		if (vmap_try_huge_p4d(p4d, addr, next, phys_addr, prot,
> +					max_page_shift))
> +			continue;
> +
> +		if (vmap_pud_range(p4d, addr, next, phys_addr, prot,
> +					max_page_shift))
> +			return -ENOMEM;
> +	} while (p4d++, phys_addr += (next - addr), addr = next, addr != end);
> +	return 0;
> +}
> +
> +static int vmap_range_noflush(unsigned long addr,
> +			unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
> +			unsigned int max_page_shift)
> +{
> +	pgd_t *pgd;
> +	unsigned long start;
> +	unsigned long next;
> +	int err;
> +
> +	might_sleep();
> +	BUG_ON(addr >= end);
> +
> +	start = addr;
> +	pgd = pgd_offset_k(addr);
> +	do {
> +		next = pgd_addr_end(addr, end);
> +		err = vmap_p4d_range(pgd, addr, next, phys_addr, prot,
> +					max_page_shift);
> +		if (err)
> +			break;
> +	} while (pgd++, phys_addr += (next - addr), addr = next, addr != end);
> +
> +	return err;
> +}
> +
> +int vmap_range(unsigned long addr,
> +		       unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
> +		       unsigned int max_page_shift)
> +{
> +	int ret;
> +
> +	ret = vmap_range_noflush(addr, end, phys_addr, prot, max_page_shift);
> +	flush_cache_vmap(addr, end);
> +
> +	return ret;
> +}
> +
> +static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>   		unsigned long end, pgprot_t prot, struct page **pages, int *nr)
>   {
>   	pte_t *pte;
> @@ -160,7 +352,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr,
>   	return 0;
>   }
>   
> -static int vmap_pmd_range(pud_t *pud, unsigned long addr,
> +static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
>   		unsigned long end, pgprot_t prot, struct page **pages, int *nr)
>   {
>   	pmd_t *pmd;
> @@ -171,13 +363,13 @@ static int vmap_pmd_range(pud_t *pud, unsigned long addr,
>   		return -ENOMEM;
>   	do {
>   		next = pmd_addr_end(addr, end);
> -		if (vmap_pte_range(pmd, addr, next, prot, pages, nr))
> +		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr))
>   			return -ENOMEM;
>   	} while (pmd++, addr = next, addr != end);
>   	return 0;
>   }
>   
> -static int vmap_pud_range(p4d_t *p4d, unsigned long addr,
> +static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
>   		unsigned long end, pgprot_t prot, struct page **pages, int *nr)
>   {
>   	pud_t *pud;
> @@ -188,13 +380,13 @@ static int vmap_pud_range(p4d_t *p4d, unsigned long addr,
>   		return -ENOMEM;
>   	do {
>   		next = pud_addr_end(addr, end);
> -		if (vmap_pmd_range(pud, addr, next, prot, pages, nr))
> +		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr))
>   			return -ENOMEM;
>   	} while (pud++, addr = next, addr != end);
>   	return 0;
>   }
>   
> -static int vmap_p4d_range(pgd_t *pgd, unsigned long addr,
> +static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
>   		unsigned long end, pgprot_t prot, struct page **pages, int *nr)
>   {
>   	p4d_t *p4d;
> @@ -205,7 +397,7 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr,
>   		return -ENOMEM;
>   	do {
>   		next = p4d_addr_end(addr, end);
> -		if (vmap_pud_range(p4d, addr, next, prot, pages, nr))
> +		if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr))
>   			return -ENOMEM;
>   	} while (p4d++, addr = next, addr != end);
>   	return 0;
> @@ -217,7 +409,7 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr,
>    *
>    * Ie. pte at addr+N*PAGE_SIZE shall point to pfn corresponding to pages[N]
>    */
> -static int vmap_page_range_noflush(unsigned long start, unsigned long end,
> +static int vmap_pages_range_noflush(unsigned long start, unsigned long end,
>   				   pgprot_t prot, struct page **pages)
>   {
>   	pgd_t *pgd;
> @@ -230,7 +422,7 @@ static int vmap_page_range_noflush(unsigned long start, unsigned long end,
>   	pgd = pgd_offset_k(addr);
>   	do {
>   		next = pgd_addr_end(addr, end);
> -		err = vmap_p4d_range(pgd, addr, next, prot, pages, &nr);
> +		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr);
>   		if (err)
>   			return err;
>   	} while (pgd++, addr = next, addr != end);
> @@ -238,12 +430,12 @@ static int vmap_page_range_noflush(unsigned long start, unsigned long end,
>   	return nr;
>   }
>   
> -static int vmap_page_range(unsigned long start, unsigned long end,
> +static int vmap_pages_range(unsigned long start, unsigned long end,
>   			   pgprot_t prot, struct page **pages)
>   {
>   	int ret;
>   
> -	ret = vmap_page_range_noflush(start, end, prot, pages);
> +	ret = vmap_pages_range_noflush(start, end, prot, pages);
>   	flush_cache_vmap(start, end);
>   	return ret;
>   }
> @@ -1148,7 +1340,7 @@ static void free_vmap_area(struct vmap_area *va)
>    */
>   static void unmap_vmap_area(struct vmap_area *va)
>   {
> -	vunmap_page_range(va->va_start, va->va_end);
> +	vunmap_range(va->va_start, va->va_end);
>   }
>   
>   /*
> @@ -1586,7 +1778,7 @@ static void vb_free(const void *addr, unsigned long size)
>   	rcu_read_unlock();
>   	BUG_ON(!vb);
>   
> -	vunmap_page_range((unsigned long)addr, (unsigned long)addr + size);
> +	vunmap_range((unsigned long)addr, (unsigned long)addr + size);
>   
>   	if (debug_pagealloc_enabled())
>   		flush_tlb_kernel_range((unsigned long)addr,
> @@ -1736,7 +1928,7 @@ void *vm_map_ram(struct page **pages, unsigned int count, int node, pgprot_t pro
>   		addr = va->va_start;
>   		mem = (void *)addr;
>   	}
> -	if (vmap_page_range(addr, addr + size, prot, pages) < 0) {
> +	if (vmap_pages_range(addr, addr + size, prot, pages) < 0) {
>   		vm_unmap_ram(mem, count);
>   		return NULL;
>   	}
> @@ -1903,7 +2095,7 @@ void __init vmalloc_init(void)
>   int map_kernel_range_noflush(unsigned long addr, unsigned long size,
>   			     pgprot_t prot, struct page **pages)
>   {
> -	return vmap_page_range_noflush(addr, addr + size, prot, pages);
> +	return vmap_pages_range_noflush(addr, addr + size, prot, pages);
>   }
>   
>   /**
> @@ -1922,7 +2114,7 @@ int map_kernel_range_noflush(unsigned long addr, unsigned long size,
>    */
>   void unmap_kernel_range_noflush(unsigned long addr, unsigned long size)
>   {
> -	vunmap_page_range(addr, addr + size);
> +	vunmap_range(addr, addr + size);
>   }
>   EXPORT_SYMBOL_GPL(unmap_kernel_range_noflush);
>   
> @@ -1939,7 +2131,7 @@ void unmap_kernel_range(unsigned long addr, unsigned long size)
>   	unsigned long end = addr + size;
>   
>   	flush_cache_vunmap(addr, end);
> -	vunmap_page_range(addr, end);
> +	vunmap_range(addr, end);
>   	flush_tlb_kernel_range(addr, end);
>   }
>   EXPORT_SYMBOL_GPL(unmap_kernel_range);
> @@ -1950,7 +2142,7 @@ int map_vm_area(struct vm_struct *area, pgprot_t prot, struct page **pages)
>   	unsigned long end = addr + get_vm_area_size(area);
>   	int err;
>   
> -	err = vmap_page_range(addr, end, prot, pages);
> +	err = vmap_pages_range(addr, end, prot, pages);
>   
>   	return err > 0 ? 0 : err;
>   }
> 

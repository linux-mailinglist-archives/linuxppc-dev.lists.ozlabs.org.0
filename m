Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 739DC8CE407
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 12:11:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AezsDtp4;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=p2GbzN14;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AezsDtp4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=p2GbzN14;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vm0wM4Skdz79Pn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 20:02:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AezsDtp4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=p2GbzN14;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AezsDtp4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=p2GbzN14;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vm0vb10Z8z79BC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 20:02:18 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2A12520913;
	Fri, 24 May 2024 10:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716544935; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xw1st+132+7cHCcLHCU/tSryVepFeMRD9GXc7kRHvs8=;
	b=AezsDtp4nSh+oMxw4BDtIl8rUEG4B/dd5g0C+qTgkZ9UaqwK89pMiN8ZL4ghT+pIxCPh7a
	aca/TuSYfLUggQx1tR/9iN48LoZc6xfKKAezrd9/sNhR0V+z1dW6ja0Bu5yDmg+Eiq55cn
	CFTmBaVFynSV0riudVMXrWRh1gYOmvw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716544935;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xw1st+132+7cHCcLHCU/tSryVepFeMRD9GXc7kRHvs8=;
	b=p2GbzN1460fVO19DD2/E4e+jfP7mmwuNtu3pPoX8XCQBKgVVZC3MlwEikoLvxOM/c5cDTF
	L4awJK6sVy12VOAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716544935; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xw1st+132+7cHCcLHCU/tSryVepFeMRD9GXc7kRHvs8=;
	b=AezsDtp4nSh+oMxw4BDtIl8rUEG4B/dd5g0C+qTgkZ9UaqwK89pMiN8ZL4ghT+pIxCPh7a
	aca/TuSYfLUggQx1tR/9iN48LoZc6xfKKAezrd9/sNhR0V+z1dW6ja0Bu5yDmg+Eiq55cn
	CFTmBaVFynSV0riudVMXrWRh1gYOmvw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716544935;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xw1st+132+7cHCcLHCU/tSryVepFeMRD9GXc7kRHvs8=;
	b=p2GbzN1460fVO19DD2/E4e+jfP7mmwuNtu3pPoX8XCQBKgVVZC3MlwEikoLvxOM/c5cDTF
	L4awJK6sVy12VOAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A427513A6B;
	Fri, 24 May 2024 10:02:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id j/JnJaZlUGbvPgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 24 May 2024 10:02:14 +0000
Date: Fri, 24 May 2024 12:02:09 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v2 07/20] powerpc/8xx: Rework support for 8M pages
 using contiguous PTE entries
Message-ID: <ZlBlob3qQYJyjLtU@localhost.localdomain>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
 <71017345495dadf0cb96839d261ffeb904dbfef8.1715971869.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71017345495dadf0cb96839d261ffeb904dbfef8.1715971869.git.christophe.leroy@csgroup.eu>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,nvidia.com,redhat.com,ellerman.id.au,gmail.com,vger.kernel.org,kvack.org,lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 17, 2024 at 09:00:01PM +0200, Christophe Leroy wrote:
> In order to fit better with standard Linux page tables layout, add
> support for 8M pages using contiguous PTE entries in a standard
> page table. Page tables will then be populated with 1024 similar
> entries and two PMD entries will point to that page table.
> 
> The PMD entries also get a flag to tell it is addressing an 8M page,
> this is required for the HW tablewalk assistance.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

I guess that this will slightly change if you remove patch#1 and patch#2
as you said you will.
So I will not comment on the overall design because I do not know how it will
look afterwards, but just some things that caught my eye

> --- a/arch/powerpc/include/asm/hugetlb.h
> +++ b/arch/powerpc/include/asm/hugetlb.h
> @@ -41,7 +41,16 @@ void hugetlb_free_pgd_range(struct mmu_gather *tlb, unsigned long addr,
>  static inline pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
>  					    unsigned long addr, pte_t *ptep)
>  {
> -	return __pte(pte_update(mm, addr, ptep, ~0UL, 0, 1));
> +	pmd_t *pmdp = (pmd_t *)ptep;
> +	pte_t pte;
> +
> +	if (IS_ENABLED(CONFIG_PPC_8xx) && pmdp == pmd_off(mm, ALIGN_DOWN(addr, SZ_8M))) {

There are quite some places where you do the "pmd_off" to check whether that
is a 8MB entry.
I think it would make somse sense to have some kind of macro/function to make
more clear what we are checking against.
e.g:

 #define pmd_is_SZ_8M(mm, addr, pmdp) (pmdp == pmd_off(mm, ALIGN_DOWN(addr, SZ_8M)))
 (or whatever name you see fit)
 
then you would just need

 if (IS_ENABLED(CONFIG_PPC_8xx && pmd_is_SZ_8M(mm, addr, pdmp))

Because I see that is also scaterred in 8xx code.


> +		pte = __pte(pte_update(mm, addr, pte_offset_kernel(pmdp, 0), ~0UL, 0, 1));
> +		pte_update(mm, addr, pte_offset_kernel(pmdp + 1, 0), ~0UL, 0, 1);

I have this fresh one because I recently read about 8xx pagetables, but not sure
how my memory will survive this, so maybe throw a little comment in there that
we are pointing the two pmds to the area.

Also, the way we pass the parameters here to pte_update() is a bit awkward.
Ideally we should be using some meaningful names?

 clr_all_bits = ~0UL
 set_bits = 0
 bool is_huge = true

 pte_update(mm, addr, pte_offset_kernel(pmdp + 1, 0), clr_all_bits, set_bits, is_huge)

or something along those lines

> -static inline int check_and_get_huge_psize(int shift)
> -{
> -	return shift_to_mmu_psize(shift);
> +	if (pmdp == pmd_off(mm, ALIGN_DOWN(addr, SZ_8M)))

Here you could also use the pmd_is_SZ_8M()

> +		ptep = pte_offset_kernel(pmdp, 0);
> +	return ptep_get(ptep);
>  }
>  
>  #define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
> @@ -53,7 +33,14 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
>  static inline void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
>  				  pte_t *ptep, unsigned long sz)
>  {
> -	pte_update(mm, addr, ptep, ~0UL, 0, 1);
> +	pmd_t *pmdp = (pmd_t *)ptep;
> +
> +	if (pmdp == pmd_off(mm, ALIGN_DOWN(addr, SZ_8M))) {
> +		pte_update(mm, addr, pte_offset_kernel(pmdp, 0), ~0UL, 0, 1);
> +		pte_update(mm, addr, pte_offset_kernel(pmdp + 1, 0), ~0UL, 0, 1);
> +	} else {
> +		pte_update(mm, addr, ptep, ~0UL, 0, 1);
> +	}

Could we not leverage this in huge_ptep_get_and_clear()?
AFAICS,

 huge_pet_get_and_clear(mm, addr, pte_t *p) 
 {
      pte_t pte = pte_val(*p);

      huge_pte_clear(mm, addr, p);
      return pte;
 }

Or maybe it is not that easy if different powerpc platforms provide their own.
It might be worth checking though.

>  }
>  
>  #define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
> @@ -63,7 +50,14 @@ static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
>  	unsigned long clr = ~pte_val(pte_wrprotect(__pte(~0)));
>  	unsigned long set = pte_val(pte_wrprotect(__pte(0)));
>  
> -	pte_update(mm, addr, ptep, clr, set, 1);
> +	pmd_t *pmdp = (pmd_t *)ptep;
> +
> +	if (pmdp == pmd_off(mm, ALIGN_DOWN(addr, SZ_8M))) {
> +		pte_update(mm, addr, pte_offset_kernel(pmdp, 0), clr, set, 1);
> +		pte_update(mm, addr, pte_offset_kernel(pmdp + 1, 0), clr, set, 1);
> +	} else {
> +		pte_update(mm, addr, ptep, clr, set, 1);

I would replace the "1" with "is_huge" or "huge", as being done in
__ptep_set_access_flags , something that makes it more clear without the need
to check pte_update().

  
>  #endif /* _ASM_POWERPC_PGALLOC_32_H */
> diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
> index 07df6b664861..b05cc4f87713 100644
> --- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
> +++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
...
> - * For other page sizes, we have a single entry in the table.
> + * For 8M pages, we have 1024 entries as if it was
> + * 4M pages, but they are flagged as 8M pages for the hardware.

Maybe drop a comment that a single PMD entry is worth 4MB, so

> + * For 4k pages, we have a single entry in the table.
>   */
> -static pmd_t *pmd_off(struct mm_struct *mm, unsigned long addr);
> -static int hugepd_ok(hugepd_t hpd);
> -
>  static inline int number_of_cells_per_pte(pmd_t *pmd, pte_basic_t val, int huge)
>  {
>  	if (!huge)
>  		return PAGE_SIZE / SZ_4K;
> -	else if (hugepd_ok(*((hugepd_t *)pmd)))
> -		return 1;
> +	else if ((pmd_val(*pmd) & _PMD_PAGE_MASK) == _PMD_PAGE_8M)
> +		return SZ_4M / SZ_4K;

this becomes more intuitive.

  
> +static inline void pmd_populate_kernel_size(struct mm_struct *mm, pmd_t *pmdp,
> +					    pte_t *pte, unsigned long sz)
> +{
> +	if (sz == SZ_8M)
> +		*pmdp = __pmd(__pa(pte) | _PMD_PRESENT | _PMD_PAGE_8M);
> +	else
> +		*pmdp = __pmd(__pa(pte) | _PMD_PRESENT);
> +}
> +
> +static inline void pmd_populate_size(struct mm_struct *mm, pmd_t *pmdp,
> +				     pgtable_t pte_page, unsigned long sz)
> +{
> +	if (sz == SZ_8M)
> +		*pmdp = __pmd(__pa(pte_page) | _PMD_USER | _PMD_PRESENT | _PMD_PAGE_8M);
> +	else
> +		*pmdp = __pmd(__pa(pte_page) | _PMD_USER | _PMD_PRESENT);
> +}

In patch#1 you mentioned this will change with the removal of patch#1
and patch#2.

> --- a/arch/powerpc/mm/hugetlbpage.c
> +++ b/arch/powerpc/mm/hugetlbpage.c
> @@ -183,9 +183,6 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
>  	if (!hpdp)
>  		return NULL;
>  
> -	if (IS_ENABLED(CONFIG_PPC_8xx) && pshift < PMD_SHIFT)
> -		return pte_alloc_huge(mm, (pmd_t *)hpdp, addr, sz);
> -
>  	BUG_ON(!hugepd_none(*hpdp) && !hugepd_ok(*hpdp));
>  
>  	if (hugepd_none(*hpdp) && __hugepte_alloc(mm, hpdp, addr,
> @@ -198,10 +195,18 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
>  pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
>  		      unsigned long addr, unsigned long sz)
>  {
> +	pmd_t *pmd = pmd_off(mm, addr);
> +
>  	if (sz < PMD_SIZE)
> -		return pte_alloc_huge(mm, pmd_off(mm, addr), addr, sz);
> +		return pte_alloc_huge(mm, pmd, addr, sz);
>  
> -	return NULL;
> +	if (sz != SZ_8M)
> +		return NULL;
> +	if (!pte_alloc_huge(mm, pmd, addr, sz))
> +		return NULL;
> +	if (!pte_alloc_huge(mm, pmd + 1, addr, sz))
> +		return NULL;
> +	return (pte_t *)pmd;

I think that having the check for invalid huge page sizes upfront would
make more sense, maybe just a matter of taste.

 /* Unsupported size */
 if (sz > PMD_SIZE && sz = SZ_8M)
     return NULL;

 if (sz < PMD_SIZE)
    ...
 /* 8MB huge pages */
 ...

 return (pte_t *) pmd;

Also, I am not a big fan of the two separate pte_alloc_huge() for pmd#0+pmd#1,
and I am thinking we might want to hide that within a function and drop a
comment in there explaining why we are updatng both pmds.
 
 

> diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
> index d93433e26ded..99f656b3f9f3 100644
> --- a/arch/powerpc/mm/nohash/8xx.c
> +++ b/arch/powerpc/mm/nohash/8xx.c
> @@ -48,20 +48,6 @@ unsigned long p_block_mapped(phys_addr_t pa)
>  	return 0;
>  }
>  
> -static pte_t __init *early_hugepd_alloc_kernel(hugepd_t *pmdp, unsigned long va)
> -{
> -	if (hpd_val(*pmdp) == 0) {
> -		pte_t *ptep = memblock_alloc(sizeof(pte_basic_t), SZ_4K);
> -
> -		if (!ptep)
> -			return NULL;
> -
> -		hugepd_populate_kernel((hugepd_t *)pmdp, ptep, PAGE_SHIFT_8M);
> -		hugepd_populate_kernel((hugepd_t *)pmdp + 1, ptep, PAGE_SHIFT_8M);
> -	}
> -	return hugepte_offset(*(hugepd_t *)pmdp, va, PGDIR_SHIFT);
> -}
> -
>  static int __ref __early_map_kernel_hugepage(unsigned long va, phys_addr_t pa,
>  					     pgprot_t prot, int psize, bool new)

Am I blind or do we never use the 'new' parameter?
I checked the tree and it seems we always pass it 'true'.

arch/powerpc/mm/nohash/8xx.c:		err = __early_map_kernel_hugepage(v, p, prot, MMU_PAGE_512K, new);
arch/powerpc/mm/nohash/8xx.c:		err = __early_map_kernel_hugepage(v, p, prot, MMU_PAGE_8M, new);
arch/powerpc/mm/nohash/8xx.c:		err = __early_map_kernel_hugepage(v, p, prot, MMU_PAGE_512K, new);
arch/powerpc/mm/nohash/8xx.c:
__early_map_kernel_hugepage(VIRT_IMMR_BASE, PHYS_IMMR_BASE, PAGE_KERNEL_NCG, MMU_PAGE_512K, true);

I think we can drop the 'new' and the block code that tries to handle
it?

> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> index acdf64c9b93e..59f0d7706d2f 100644
> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c

> +void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
> +		     pte_t pte, unsigned long sz)
> +{
> +	pmd_t *pmdp = pmd_off(mm, addr);
> +
> +	pte = set_pte_filter(pte, addr);
> +
> +	if (sz == SZ_8M) {
> +		__set_huge_pte_at(pmdp, pte_offset_kernel(pmdp, 0), pte_val(pte));
> +		__set_huge_pte_at(pmdp, pte_offset_kernel(pmdp + 1, 0), pte_val(pte) + SZ_4M);

You also mentioned that this would slightly change after you drop
patch#0 and patch#1.
The only comment I have right know would be to add a little comment
explaining the layout (the replication of 1024 entries), or just
something like "see comment from number_of_cells_per_pte".

 

-- 
Oscar Salvador
SUSE Labs

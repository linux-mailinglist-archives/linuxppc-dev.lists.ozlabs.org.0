Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AFE19A4FC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 07:53:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sb366y7SzDqyY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 16:53:22 +1100 (AEDT)
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
 header.s=mail header.b=q0u1J306; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sb0S4sxlzDqyX
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 16:51:03 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48sb0K1Fkkz9v2Xx;
 Wed,  1 Apr 2020 07:50:57 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=q0u1J306; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id XIFDLGC5ibp4; Wed,  1 Apr 2020 07:50:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48sb0J6Zqsz9v2Xw;
 Wed,  1 Apr 2020 07:50:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585720256; bh=7GWEqEq58tW4m2v0Z65LQJeXfEN+M/Za0UY517KJvUU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=q0u1J306HtXgFZxI/glneLWllakMVRZQUYW+0NdI6Beai3nwXXFjMKvQpz5hhShos
 UCsiuyyNDIJx0kogUI8HpZwRGIafQcKKPm8tsiJbHQ5iGPu1eJGGWd1o3/MMrgMAVr
 2Mpf/+6jqh6vGK2JoftHJG8l/5XqcHMip0IfN/kA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C42C88B778;
 Wed,  1 Apr 2020 07:50:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wwpDc7RYndyL; Wed,  1 Apr 2020 07:50:57 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C2DB8B752;
 Wed,  1 Apr 2020 07:50:56 +0200 (CEST)
Subject: Re: [PATCH v7 7/7] powerpc/32: use set_memory_attr()
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
References: <20200331044825.591653-1-ruscur@russell.cc>
 <20200331044825.591653-8-ruscur@russell.cc>
 <e61a1f88-1ad6-ca26-790b-f036faacb790@c-s.fr>
 <6b003f8d254d1614cec838e1c032c3005d52d44d.camel@russell.cc>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e6651703-000b-6238-d853-d282daebba0f@c-s.fr>
Date: Wed, 1 Apr 2020 07:50:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <6b003f8d254d1614cec838e1c032c3005d52d44d.camel@russell.cc>
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
Cc: kernel-hardening@lists.openwall.com, ajd@linux.ibm.com, npiggin@gmail.com,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/04/2020 à 04:27, Russell Currey a écrit :
> On Tue, 2020-03-31 at 11:56 +0200, Christophe Leroy wrote:
>>
>> Le 31/03/2020 à 06:48, Russell Currey a écrit :
>>> From: Christophe Leroy <christophe.leroy@c-s.fr>
>>>
>>> Use set_memory_attr() instead of the PPC32 specific
>>> change_page_attr()
>>>
>>> change_page_attr() was checking that the address was not mapped by
>>> blocks and was handling highmem, but that's unneeded because the
>>> affected pages can't be in highmem and block mapping verification
>>> is already done by the callers.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>> ---
>>>    arch/powerpc/mm/pgtable_32.c | 95 ++++---------------------------
>>> -----
>>>    1 file changed, 10 insertions(+), 85 deletions(-)
>>>
>>> diff --git a/arch/powerpc/mm/pgtable_32.c
>>> b/arch/powerpc/mm/pgtable_32.c
>>> index 5fb90edd865e..3d92eaf3ee2f 100644
>>> --- a/arch/powerpc/mm/pgtable_32.c
>>> +++ b/arch/powerpc/mm/pgtable_32.c
>>> @@ -23,6 +23,7 @@
>>>    #include <linux/highmem.h>
>>>    #include <linux/memblock.h>
>>>    #include <linux/slab.h>
>>> +#include <linux/set_memory.h>
>>>    
>>>    #include <asm/pgtable.h>
>>>    #include <asm/pgalloc.h>
>>> @@ -121,99 +122,20 @@ void __init mapin_ram(void)
>>>    	}
>>>    }
>>>    
>>> -/* Scan the real Linux page tables and return a PTE pointer for
>>> - * a virtual address in a context.
>>> - * Returns true (1) if PTE was found, zero otherwise.  The pointer
>>> to
>>> - * the PTE pointer is unmodified if PTE is not found.
>>> - */
>>> -static int
>>> -get_pteptr(struct mm_struct *mm, unsigned long addr, pte_t **ptep,
>>> pmd_t **pmdp)
>>
>> This will conflict, get_pteptr() is gone now, see
>> https://github.com/linuxppc/linux/commit/2efc7c085f05870eda6f29ac71eeb83f3bd54415
>>
>> Christophe
> 
> OK cool, so I can just drop that hunk?  Will try that and make sure it
> rebases on powerpc/next

Well, you still have to remove __change_page_attr_noflush() and 
change_page_attr(), everything else in this patch should still be the same.

Christophe

> 
> - Russell
> 
>>
>>
>>> -{
>>> -        pgd_t	*pgd;
>>> -	pud_t	*pud;
>>> -        pmd_t	*pmd;
>>> -        pte_t	*pte;
>>> -        int     retval = 0;
>>> -
>>> -        pgd = pgd_offset(mm, addr & PAGE_MASK);
>>> -        if (pgd) {
>>> -		pud = pud_offset(pgd, addr & PAGE_MASK);
>>> -		if (pud && pud_present(*pud)) {
>>> -			pmd = pmd_offset(pud, addr & PAGE_MASK);
>>> -			if (pmd_present(*pmd)) {
>>> -				pte = pte_offset_map(pmd, addr &
>>> PAGE_MASK);
>>> -				if (pte) {
>>> -					retval = 1;
>>> -					*ptep = pte;
>>> -					if (pmdp)
>>> -						*pmdp = pmd;
>>> -					/* XXX caller needs to do
>>> pte_unmap, yuck */
>>> -				}
>>> -			}
>>> -		}
>>> -        }
>>> -        return(retval);
>>> -}
>>> -
>>> -static int __change_page_attr_noflush(struct page *page, pgprot_t
>>> prot)
>>> -{
>>> -	pte_t *kpte;
>>> -	pmd_t *kpmd;
>>> -	unsigned long address;
>>> -
>>> -	BUG_ON(PageHighMem(page));
>>> -	address = (unsigned long)page_address(page);
>>> -
>>> -	if (v_block_mapped(address))
>>> -		return 0;
>>> -	if (!get_pteptr(&init_mm, address, &kpte, &kpmd))
>>> -		return -EINVAL;
>>> -	__set_pte_at(&init_mm, address, kpte, mk_pte(page, prot), 0);
>>> -	pte_unmap(kpte);
>>> -
>>> -	return 0;
>>> -}
>>> -
>>> -/*
>>> - * Change the page attributes of an page in the linear mapping.
>>> - *
>>> - * THIS DOES NOTHING WITH BAT MAPPINGS, DEBUG USE ONLY
>>> - */
>>> -static int change_page_attr(struct page *page, int numpages,
>>> pgprot_t prot)
>>> -{
>>> -	int i, err = 0;
>>> -	unsigned long flags;
>>> -	struct page *start = page;
>>> -
>>> -	local_irq_save(flags);
>>> -	for (i = 0; i < numpages; i++, page++) {
>>> -		err = __change_page_attr_noflush(page, prot);
>>> -		if (err)
>>> -			break;
>>> -	}
>>> -	wmb();
>>> -	local_irq_restore(flags);
>>> -	flush_tlb_kernel_range((unsigned long)page_address(start),
>>> -			       (unsigned long)page_address(page));
>>> -	return err;
>>> -}
>>> -
>>>    void mark_initmem_nx(void)
>>>    {
>>> -	struct page *page = virt_to_page(_sinittext);
>>>    	unsigned long numpages = PFN_UP((unsigned long)_einittext) -
>>>    				 PFN_DOWN((unsigned long)_sinittext);
>>>    
>>>    	if (v_block_mapped((unsigned long)_stext + 1))
>>>    		mmu_mark_initmem_nx();
>>>    	else
>>> -		change_page_attr(page, numpages, PAGE_KERNEL);
>>> +		set_memory_attr((unsigned long)_sinittext, numpages,
>>> PAGE_KERNEL);
>>>    }
>>>    
>>>    #ifdef CONFIG_STRICT_KERNEL_RWX
>>>    void mark_rodata_ro(void)
>>>    {
>>> -	struct page *page;
>>>    	unsigned long numpages;
>>>    
>>>    	if (v_block_mapped((unsigned long)_sinittext)) {
>>> @@ -222,20 +144,18 @@ void mark_rodata_ro(void)
>>>    		return;
>>>    	}
>>>    
>>> -	page = virt_to_page(_stext);
>>>    	numpages = PFN_UP((unsigned long)_etext) -
>>>    		   PFN_DOWN((unsigned long)_stext);
>>>    
>>> -	change_page_attr(page, numpages, PAGE_KERNEL_ROX);
>>> +	set_memory_attr((unsigned long)_stext, numpages,
>>> PAGE_KERNEL_ROX);
>>>    	/*
>>>    	 * mark .rodata as read only. Use __init_begin rather than
>>> __end_rodata
>>>    	 * to cover NOTES and EXCEPTION_TABLE.
>>>    	 */
>>> -	page = virt_to_page(__start_rodata);
>>>    	numpages = PFN_UP((unsigned long)__init_begin) -
>>>    		   PFN_DOWN((unsigned long)__start_rodata);
>>>    
>>> -	change_page_attr(page, numpages, PAGE_KERNEL_RO);
>>> +	set_memory_attr((unsigned long)__start_rodata, numpages,
>>> PAGE_KERNEL_RO);
>>>    
>>>    	// mark_initmem_nx() should have already run by now
>>>    	ptdump_check_wx();
>>> @@ -245,9 +165,14 @@ void mark_rodata_ro(void)
>>>    #ifdef CONFIG_DEBUG_PAGEALLOC
>>>    void __kernel_map_pages(struct page *page, int numpages, int
>>> enable)
>>>    {
>>> +	unsigned long addr = (unsigned long)page_address(page);
>>> +
>>>    	if (PageHighMem(page))
>>>    		return;
>>>    
>>> -	change_page_attr(page, numpages, enable ? PAGE_KERNEL :
>>> __pgprot(0));
>>> +	if (enable)
>>> +		set_memory_attr(addr, numpages, PAGE_KERNEL);
>>> +	else
>>> +		set_memory_attr(addr, numpages, __pgprot(0));
>>>    }
>>>    #endif /* CONFIG_DEBUG_PAGEALLOC */
>>>

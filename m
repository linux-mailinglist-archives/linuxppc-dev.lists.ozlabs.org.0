Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CFC19A396
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 04:29:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sVWX3PX4zDqxh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 13:29:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=HtD3wsJj; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=3eeTtB7H; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sVTD3jVBzDqNT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 13:27:11 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6F9B55C01EE;
 Tue, 31 Mar 2020 22:27:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 31 Mar 2020 22:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 s63t4ACPjdaoozA6otkunN9r8sBgEHkAalmoDPBLcls=; b=HtD3wsJjJDow8pDP
 t9GfiCzRDGwy2FATICmx8uRjshbX2ZFMwkDS75Zy/EDa3J6IY2v3eRuLc5uQoeTn
 Er48LPymYFAs5Orb8jmjtk2d8AZ0px/WSSN3UJAQVY80lALiZPFGSR6a7S/FJlyl
 jpF7w5I5SkmoNcrNGf0MvT3x0vTiulG+Q250swDpRrg8i/AwFQBblw5KDPVoJg/X
 lCiim8Jl1OFvYhZN/9aMEKm7ZLyM0UB7na8QMiJwR2kV2wRbF92Hy00vHT2QbJ22
 uueU0cNaG/QtQy1ZLtfLDtGy5ED3nPjnBgwgHtm+P2K4qJoqRVJSfsMJEdy1eR37
 PhRqlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=s63t4ACPjdaoozA6otkunN9r8sBgEHkAalmoDPBLc
 ls=; b=3eeTtB7HZDmjzKBQmp7V7FOKx5oCAu34Lp9XsHmTgxKppQBx/UfWH4SQq
 ejLjV9x2HWgBf84bAxle6kjS9pKfNW6FFChVkQANoErKAEpdbzoMyaS7FmpfezLf
 UbK/EzdIC7pNaL58uSThsJkYxsuD8wuUs8t9f303PQmNkj/rv4ufb+mgVRPoI5FD
 gvEi9QSP7/5DeIxOZcBflTPz7WTS/YiYD6Yp5rXmZPs6SiL2FFnnVKXEbn7k9JMS
 ZO1RmwqDiJ2rCCfiQvb6PrelqYSrrFF6PPEZimDkxiRdHhDpMTlilKlnGVawwsTx
 MX6esFuOb6h12hPQk6cgB5RfnP6Ig==
X-ME-Sender: <xms:_PuDXidzfFsp7YEmbKI8iX_MdbTv01e-UroISkZUMkPX9Gjws3qvHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtddugddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddutddmnecujfgurhepkffuhffvffgjfhgtfggggfesthekredttder
 jeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
 gvlhhlrdgttgeqnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvuddr
 geehrddvuddvrddvfeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:_PuDXgj9_VpgyQu-h0g68lLfdw5OkvxuPltzJw-dt6DnDZlt6LTvfw>
 <xmx:_PuDXiqfbv6GpgolC21lNicMRYNRsIZ3iEhbqBOmcrYr__X1p0JZMw>
 <xmx:_PuDXoF4o5ChVf6nsJtUykyBsOWH4RMvmsp8OnkO5uE2ksFJ5IkWcQ>
 <xmx:_fuDXrvixVeHOvSz-SK6sGa595iL2Eo9CFLv86wTEMlylv_d6pfOEA>
Received: from crackle.ozlabs.ibm.com
 (ppp121-45-212-239.bras1.cbr2.internode.on.net [121.45.212.239])
 by mail.messagingengine.com (Postfix) with ESMTPA id 419203280059;
 Tue, 31 Mar 2020 22:27:06 -0400 (EDT)
Message-ID: <6b003f8d254d1614cec838e1c032c3005d52d44d.camel@russell.cc>
Subject: Re: [PATCH v7 7/7] powerpc/32: use set_memory_attr()
From: Russell Currey <ruscur@russell.cc>
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 01 Apr 2020 13:27:03 +1100
In-Reply-To: <e61a1f88-1ad6-ca26-790b-f036faacb790@c-s.fr>
References: <20200331044825.591653-1-ruscur@russell.cc>
 <20200331044825.591653-8-ruscur@russell.cc>
 <e61a1f88-1ad6-ca26-790b-f036faacb790@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1 
MIME-Version: 1.0
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

On Tue, 2020-03-31 at 11:56 +0200, Christophe Leroy wrote:
> 
> Le 31/03/2020 à 06:48, Russell Currey a écrit :
> > From: Christophe Leroy <christophe.leroy@c-s.fr>
> > 
> > Use set_memory_attr() instead of the PPC32 specific
> > change_page_attr()
> > 
> > change_page_attr() was checking that the address was not mapped by
> > blocks and was handling highmem, but that's unneeded because the
> > affected pages can't be in highmem and block mapping verification
> > is already done by the callers.
> > 
> > Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> > ---
> >   arch/powerpc/mm/pgtable_32.c | 95 ++++---------------------------
> > -----
> >   1 file changed, 10 insertions(+), 85 deletions(-)
> > 
> > diff --git a/arch/powerpc/mm/pgtable_32.c
> > b/arch/powerpc/mm/pgtable_32.c
> > index 5fb90edd865e..3d92eaf3ee2f 100644
> > --- a/arch/powerpc/mm/pgtable_32.c
> > +++ b/arch/powerpc/mm/pgtable_32.c
> > @@ -23,6 +23,7 @@
> >   #include <linux/highmem.h>
> >   #include <linux/memblock.h>
> >   #include <linux/slab.h>
> > +#include <linux/set_memory.h>
> >   
> >   #include <asm/pgtable.h>
> >   #include <asm/pgalloc.h>
> > @@ -121,99 +122,20 @@ void __init mapin_ram(void)
> >   	}
> >   }
> >   
> > -/* Scan the real Linux page tables and return a PTE pointer for
> > - * a virtual address in a context.
> > - * Returns true (1) if PTE was found, zero otherwise.  The pointer
> > to
> > - * the PTE pointer is unmodified if PTE is not found.
> > - */
> > -static int
> > -get_pteptr(struct mm_struct *mm, unsigned long addr, pte_t **ptep,
> > pmd_t **pmdp)
> 
> This will conflict, get_pteptr() is gone now, see 
> https://github.com/linuxppc/linux/commit/2efc7c085f05870eda6f29ac71eeb83f3bd54415
> 
> Christophe

OK cool, so I can just drop that hunk?  Will try that and make sure it
rebases on powerpc/next

- Russell

> 
> 
> > -{
> > -        pgd_t	*pgd;
> > -	pud_t	*pud;
> > -        pmd_t	*pmd;
> > -        pte_t	*pte;
> > -        int     retval = 0;
> > -
> > -        pgd = pgd_offset(mm, addr & PAGE_MASK);
> > -        if (pgd) {
> > -		pud = pud_offset(pgd, addr & PAGE_MASK);
> > -		if (pud && pud_present(*pud)) {
> > -			pmd = pmd_offset(pud, addr & PAGE_MASK);
> > -			if (pmd_present(*pmd)) {
> > -				pte = pte_offset_map(pmd, addr &
> > PAGE_MASK);
> > -				if (pte) {
> > -					retval = 1;
> > -					*ptep = pte;
> > -					if (pmdp)
> > -						*pmdp = pmd;
> > -					/* XXX caller needs to do
> > pte_unmap, yuck */
> > -				}
> > -			}
> > -		}
> > -        }
> > -        return(retval);
> > -}
> > -
> > -static int __change_page_attr_noflush(struct page *page, pgprot_t
> > prot)
> > -{
> > -	pte_t *kpte;
> > -	pmd_t *kpmd;
> > -	unsigned long address;
> > -
> > -	BUG_ON(PageHighMem(page));
> > -	address = (unsigned long)page_address(page);
> > -
> > -	if (v_block_mapped(address))
> > -		return 0;
> > -	if (!get_pteptr(&init_mm, address, &kpte, &kpmd))
> > -		return -EINVAL;
> > -	__set_pte_at(&init_mm, address, kpte, mk_pte(page, prot), 0);
> > -	pte_unmap(kpte);
> > -
> > -	return 0;
> > -}
> > -
> > -/*
> > - * Change the page attributes of an page in the linear mapping.
> > - *
> > - * THIS DOES NOTHING WITH BAT MAPPINGS, DEBUG USE ONLY
> > - */
> > -static int change_page_attr(struct page *page, int numpages,
> > pgprot_t prot)
> > -{
> > -	int i, err = 0;
> > -	unsigned long flags;
> > -	struct page *start = page;
> > -
> > -	local_irq_save(flags);
> > -	for (i = 0; i < numpages; i++, page++) {
> > -		err = __change_page_attr_noflush(page, prot);
> > -		if (err)
> > -			break;
> > -	}
> > -	wmb();
> > -	local_irq_restore(flags);
> > -	flush_tlb_kernel_range((unsigned long)page_address(start),
> > -			       (unsigned long)page_address(page));
> > -	return err;
> > -}
> > -
> >   void mark_initmem_nx(void)
> >   {
> > -	struct page *page = virt_to_page(_sinittext);
> >   	unsigned long numpages = PFN_UP((unsigned long)_einittext) -
> >   				 PFN_DOWN((unsigned long)_sinittext);
> >   
> >   	if (v_block_mapped((unsigned long)_stext + 1))
> >   		mmu_mark_initmem_nx();
> >   	else
> > -		change_page_attr(page, numpages, PAGE_KERNEL);
> > +		set_memory_attr((unsigned long)_sinittext, numpages,
> > PAGE_KERNEL);
> >   }
> >   
> >   #ifdef CONFIG_STRICT_KERNEL_RWX
> >   void mark_rodata_ro(void)
> >   {
> > -	struct page *page;
> >   	unsigned long numpages;
> >   
> >   	if (v_block_mapped((unsigned long)_sinittext)) {
> > @@ -222,20 +144,18 @@ void mark_rodata_ro(void)
> >   		return;
> >   	}
> >   
> > -	page = virt_to_page(_stext);
> >   	numpages = PFN_UP((unsigned long)_etext) -
> >   		   PFN_DOWN((unsigned long)_stext);
> >   
> > -	change_page_attr(page, numpages, PAGE_KERNEL_ROX);
> > +	set_memory_attr((unsigned long)_stext, numpages,
> > PAGE_KERNEL_ROX);
> >   	/*
> >   	 * mark .rodata as read only. Use __init_begin rather than
> > __end_rodata
> >   	 * to cover NOTES and EXCEPTION_TABLE.
> >   	 */
> > -	page = virt_to_page(__start_rodata);
> >   	numpages = PFN_UP((unsigned long)__init_begin) -
> >   		   PFN_DOWN((unsigned long)__start_rodata);
> >   
> > -	change_page_attr(page, numpages, PAGE_KERNEL_RO);
> > +	set_memory_attr((unsigned long)__start_rodata, numpages,
> > PAGE_KERNEL_RO);
> >   
> >   	// mark_initmem_nx() should have already run by now
> >   	ptdump_check_wx();
> > @@ -245,9 +165,14 @@ void mark_rodata_ro(void)
> >   #ifdef CONFIG_DEBUG_PAGEALLOC
> >   void __kernel_map_pages(struct page *page, int numpages, int
> > enable)
> >   {
> > +	unsigned long addr = (unsigned long)page_address(page);
> > +
> >   	if (PageHighMem(page))
> >   		return;
> >   
> > -	change_page_attr(page, numpages, enable ? PAGE_KERNEL :
> > __pgprot(0));
> > +	if (enable)
> > +		set_memory_attr(addr, numpages, PAGE_KERNEL);
> > +	else
> > +		set_memory_attr(addr, numpages, __pgprot(0));
> >   }
> >   #endif /* CONFIG_DEBUG_PAGEALLOC */
> > 


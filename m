Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E9894B327
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 00:38:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2guZOYZ9;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=IB5N8gDs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfQ6w4yrrz3cXy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 08:38:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2guZOYZ9;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=IB5N8gDs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfQ6D6W4Pz2xjM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 08:37:24 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723070242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ijzboojuY5XpUno0lk+35UbNznLU2ucd6kpR6qcMWxg=;
	b=2guZOYZ99eyTcewCEP8xSZxwsHPHCJoQsL15+KAEcO68JB85EE+Hd6SCbExGA8OqLINdLh
	mX32IGFpl1TmhRwBqJ+dF0jiQHcEBoZBV+AltYSVcbizerrFhRVdNW9OkKsHUlLl/RpVL9
	iyJoFp1hsL/2Izml40cfR4Bgi2fluswxwsvarN4ZmHFECUAurABZ5b6xRyopii7S45bIcd
	FEtgLFzszmtb4INfqVZrUIR9w6gSju9DqSiPuZF37VxavgThej1oJKme+a1nQ2rLwmKD82
	RoYUBkCzU/T/WzNZWB+ndNEBkuWHKIi+tMWb5a+GNDneBs2LwmGEj77sWmPIfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723070242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ijzboojuY5XpUno0lk+35UbNznLU2ucd6kpR6qcMWxg=;
	b=IB5N8gDs6FBpyO8gAD9i3Vzt37QlGsQG8iqeySMgtnjM8GKUrJWBMjTtXMeWMZFSrrqVIv
	yXjA4dOnrV6rqPBg==
To: Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH v4 6/7] mm/x86: Add missing pud helpers
In-Reply-To: <20240807194812.819412-7-peterx@redhat.com>
References: <20240807194812.819412-1-peterx@redhat.com>
 <20240807194812.819412-7-peterx@redhat.com>
Date: Thu, 08 Aug 2024 00:37:21 +0200
Message-ID: <875xsc0xjy.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, peterx@redhat.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill
 A . Shutemov" <kirill@shutemov.name>, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 07 2024 at 15:48, Peter Xu wrote:
> These new helpers will be needed for pud entry updates soon.  Introduce
> these helpers by referencing the pmd ones.  Namely:
>
> - pudp_invalidate()
> - pud_modify()

Zero content about what these helpers do and why they are needed. That's
not how it works, really.

  
> +static inline pud_t pud_mkinvalid(pud_t pud)
> +{
> +	return pfn_pud(pud_pfn(pud),
> +		       __pgprot(pud_flags(pud) & ~(_PAGE_PRESENT|_PAGE_PROTNONE)));

100 characters...

> +}
> +
>  static inline u64 flip_protnone_guard(u64 oldval, u64 val, u64 mask);
>  
>  static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
> @@ -834,14 +840,8 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
>  	pmd_result = __pmd(val);
>  
>  	/*
> -	 * To avoid creating Write=0,Dirty=1 PMDs, pte_modify() needs to avoid:
> -	 *  1. Marking Write=0 PMDs Dirty=1
> -	 *  2. Marking Dirty=1 PMDs Write=0
> -	 *
> -	 * The first case cannot happen because the _PAGE_CHG_MASK will filter
> -	 * out any Dirty bit passed in newprot. Handle the second case by
> -	 * going through the mksaveddirty exercise. Only do this if the old
> -	 * value was Write=1 to avoid doing this on Shadow Stack PTEs.
> +	 * Avoid creating shadow stack PMD by accident.  See comment in
> +	 * pte_modify().

The changelog is utterly silent about this comment update.

>  	 */
>  	if (oldval & _PAGE_RW)
>  		pmd_result = pmd_mksaveddirty(pmd_result);
> @@ -851,6 +851,29 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
>  	return pmd_result;
>  }
>  
> +static inline pud_t pud_modify(pud_t pud, pgprot_t newprot)
> +{
> +	pudval_t val = pud_val(pud), oldval = val;
> +	pud_t pud_result;
> +
> +	val &= _HPAGE_CHG_MASK;
> +	val |= check_pgprot(newprot) & ~_HPAGE_CHG_MASK;
> +	val = flip_protnone_guard(oldval, val, PHYSICAL_PUD_PAGE_MASK);
> +
> +	pud_result = __pud(val);
> +
> +	/*
> +	 * Avoid creating shadow stack PUD by accident.  See comment in
> +	 * pte_modify().
> +	 */
> +	if (oldval & _PAGE_RW)
> +		pud_result = pud_mksaveddirty(pud_result);
> +	else
> +		pud_result = pud_clear_saveddirty(pud_result);
> +
> +	return pud_result;
> +}
> +
>  /*
>   * mprotect needs to preserve PAT and encryption bits when updating
>   * vm_page_prot
> @@ -1389,10 +1412,26 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>  }
>  #endif
>  
> +static inline pud_t pudp_establish(struct vm_area_struct *vma,
> +		unsigned long address, pud_t *pudp, pud_t pud)

Random line break alignment.... See documentation.

> +{
> +	page_table_check_pud_set(vma->vm_mm, pudp, pud);
> +	if (IS_ENABLED(CONFIG_SMP)) {
> +		return xchg(pudp, pud);
> +	} else {
> +		pud_t old = *pudp;
> +		WRITE_ONCE(*pudp, pud);

Lacks a newline between variable declaration and code.

But seriously, why optimizing for !SMP? That's a pointless exercise and
a guarantee for bitrot.

> +		return old;
> +	}
> +}
> +
>  #define __HAVE_ARCH_PMDP_INVALIDATE_AD
>  extern pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma,
>  				unsigned long address, pmd_t *pmdp);
>  
> +pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
> +		      pud_t *pudp);

While 'extern' is not required, please keep the file style consistent
and use the 100 characters...

> --- a/arch/x86/mm/pgtable.c
> +++ b/arch/x86/mm/pgtable.c
> @@ -641,6 +641,18 @@ pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma, unsigned long address,
>  }
>  #endif
>  
> +#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && \
> +	defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
> +pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
> +		     pud_t *pudp)
> +{
> +	VM_WARN_ON_ONCE(!pud_present(*pudp));
> +	pud_t old = pudp_establish(vma, address, pudp, pud_mkinvalid(*pudp));
> +	flush_pud_tlb_range(vma, address, address + HPAGE_PUD_SIZE);
> +	return old;

Your keyboard clearly lacks a newline key ...

Thanks,

        tglx

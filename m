Return-Path: <linuxppc-dev+bounces-10826-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ABBB21CB7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 07:07:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1KJ62j3tz3cgg;
	Tue, 12 Aug 2025 15:07:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::b3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754974565;
	cv=none; b=XYaLRpLTvXLQFQTvELbIKUv8bguvTp0vwqyaLyd9JHaViPK3N2Gr4arBRAZ23JANGERoLNR/QMKCDVbst9mibhNNCu9gEDm7KDj2TRJijpQfe2Ay7QwCCx1QolPZDTHr9Sj/THr73oxAt+F5lRwaKaW5J6BYD/oqg/UePQraUUlSM5LxmtCOrGT9eCxl5SIzqiS8gvP+BB+186XDQbJ7IJKqw82CtrVpHFBxtKMiyLouIw/NCRu5t9QFLePhAuqzqSMZpKQFVl/XHalEjsq36tp324BV/DiApzmFFKGRI7xeYB0FAFd2kgaRQP6MEp6WoD/evIFLlse5II+oh5NKXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754974565; c=relaxed/relaxed;
	bh=vxkRGPtW/Hy53i4ls2hik5N/SCj/n27xlLut7svn+U8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ew73SwLQzxSfSMDdAwclmyl9K2pxTfVOl73KUhRkuMdgzhU91OVQ2HTi/271r8QidfeJVe/x2qGdLrTlGdMnBNgEBmKfo0PjTkB9jW1iMVaBDWcG3emCToG2bJ+0u6AlFq910CzpnoWhunlyjg/vGl66Cy/w3Fp2mLykKqcU3EK4sAU1AKoxd6mL9MlUSELLabdCdHSL6cJIvKGrSQW0M8GHZNR2xLJK6Zuaowl/bW64imMZpUTh9ObiK69DKJFdrj9Yoo17OTK/yU8LXMmgf7OcEeX4J01vJrdnV0P9mL2xNMi3LRb3JtR37fO1jsXRaKlMZOhNx3QhJClfI76Fyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p9Nqks/m; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::b3; helo=out-179.mta1.migadu.com; envelope-from=lance.yang@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p9Nqks/m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b3; helo=out-179.mta1.migadu.com; envelope-from=lance.yang@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 132 seconds by postgrey-1.37 at boromir; Tue, 12 Aug 2025 14:56:01 AEST
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [IPv6:2001:41d0:203:375::b3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1K2n6LrBz3ccr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 14:56:01 +1000 (AEST)
Message-ID: <4865af61-7343-4c60-b4e2-f142f92b7c79@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754974406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vxkRGPtW/Hy53i4ls2hik5N/SCj/n27xlLut7svn+U8=;
	b=p9Nqks/mlOZN/tGrqRDmjtIpBiBe1xj7j/3hPcPcHoAgdhOSWGsOvQGG4WWQYwUf16ocpN
	/eSOnoYSrPeVJDmil+MF/Q4G88O3SeFZwq9agCDOjLtfcZ875hNUGHK2AXTesoYOVApLl4
	Vj8yiy6OgDEwRzTUKixNKG2ngK13V1Y=
Date: Tue, 12 Aug 2025 12:52:59 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Subject: Re: [PATCH v3 01/11] mm/huge_memory: move more common code into
 insert_pmd()
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox
 <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 Hugh Dickins <hughd@google.com>, Oscar Salvador <osalvador@suse.de>,
 Alistair Popple <apopple@nvidia.com>, Wei Yang <richard.weiyang@gmail.com>,
 linux-kernel@vger.kernel.org
References: <20250811112631.759341-1-david@redhat.com>
 <20250811112631.759341-2-david@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20250811112631.759341-2-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 2025/8/11 19:26, David Hildenbrand wrote:
> Let's clean it all further up.
> 
> No functional change intended.
> 
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> Reviewed-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Nice. Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>

Thanks,
Lance

> ---
>   mm/huge_memory.c | 72 ++++++++++++++++--------------------------------
>   1 file changed, 24 insertions(+), 48 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 2b4ea5a2ce7d2..5314a89d676f1 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1379,15 +1379,25 @@ struct folio_or_pfn {
>   	bool is_folio;
>   };
>   
> -static int insert_pmd(struct vm_area_struct *vma, unsigned long addr,
> +static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
>   		pmd_t *pmd, struct folio_or_pfn fop, pgprot_t prot,
> -		bool write, pgtable_t pgtable)
> +		bool write)
>   {
>   	struct mm_struct *mm = vma->vm_mm;
> +	pgtable_t pgtable = NULL;
> +	spinlock_t *ptl;
>   	pmd_t entry;
>   
> -	lockdep_assert_held(pmd_lockptr(mm, pmd));
> +	if (addr < vma->vm_start || addr >= vma->vm_end)
> +		return VM_FAULT_SIGBUS;
>   
> +	if (arch_needs_pgtable_deposit()) {
> +		pgtable = pte_alloc_one(vma->vm_mm);
> +		if (!pgtable)
> +			return VM_FAULT_OOM;
> +	}
> +
> +	ptl = pmd_lock(mm, pmd);
>   	if (!pmd_none(*pmd)) {
>   		const unsigned long pfn = fop.is_folio ? folio_pfn(fop.folio) :
>   					  fop.pfn;
> @@ -1395,15 +1405,14 @@ static int insert_pmd(struct vm_area_struct *vma, unsigned long addr,
>   		if (write) {
>   			if (pmd_pfn(*pmd) != pfn) {
>   				WARN_ON_ONCE(!is_huge_zero_pmd(*pmd));
> -				return -EEXIST;
> +				goto out_unlock;
>   			}
>   			entry = pmd_mkyoung(*pmd);
>   			entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
>   			if (pmdp_set_access_flags(vma, addr, pmd, entry, 1))
>   				update_mmu_cache_pmd(vma, addr, pmd);
>   		}
> -
> -		return -EEXIST;
> +		goto out_unlock;
>   	}
>   
>   	if (fop.is_folio) {
> @@ -1424,11 +1433,17 @@ static int insert_pmd(struct vm_area_struct *vma, unsigned long addr,
>   	if (pgtable) {
>   		pgtable_trans_huge_deposit(mm, pmd, pgtable);
>   		mm_inc_nr_ptes(mm);
> +		pgtable = NULL;
>   	}
>   
>   	set_pmd_at(mm, addr, pmd, entry);
>   	update_mmu_cache_pmd(vma, addr, pmd);
> -	return 0;
> +
> +out_unlock:
> +	spin_unlock(ptl);
> +	if (pgtable)
> +		pte_free(mm, pgtable);
> +	return VM_FAULT_NOPAGE;
>   }
>   
>   /**
> @@ -1450,9 +1465,6 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, unsigned long pfn,
>   	struct folio_or_pfn fop = {
>   		.pfn = pfn,
>   	};
> -	pgtable_t pgtable = NULL;
> -	spinlock_t *ptl;
> -	int error;
>   
>   	/*
>   	 * If we had pmd_special, we could avoid all these restrictions,
> @@ -1464,25 +1476,9 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, unsigned long pfn,
>   						(VM_PFNMAP|VM_MIXEDMAP));
>   	BUG_ON((vma->vm_flags & VM_PFNMAP) && is_cow_mapping(vma->vm_flags));
>   
> -	if (addr < vma->vm_start || addr >= vma->vm_end)
> -		return VM_FAULT_SIGBUS;
> -
> -	if (arch_needs_pgtable_deposit()) {
> -		pgtable = pte_alloc_one(vma->vm_mm);
> -		if (!pgtable)
> -			return VM_FAULT_OOM;
> -	}
> -
>   	pfnmap_setup_cachemode_pfn(pfn, &pgprot);
>   
> -	ptl = pmd_lock(vma->vm_mm, vmf->pmd);
> -	error = insert_pmd(vma, addr, vmf->pmd, fop, pgprot, write,
> -			   pgtable);
> -	spin_unlock(ptl);
> -	if (error && pgtable)
> -		pte_free(vma->vm_mm, pgtable);
> -
> -	return VM_FAULT_NOPAGE;
> +	return insert_pmd(vma, addr, vmf->pmd, fop, pgprot, write);
>   }
>   EXPORT_SYMBOL_GPL(vmf_insert_pfn_pmd);
>   
> @@ -1491,35 +1487,15 @@ vm_fault_t vmf_insert_folio_pmd(struct vm_fault *vmf, struct folio *folio,
>   {
>   	struct vm_area_struct *vma = vmf->vma;
>   	unsigned long addr = vmf->address & PMD_MASK;
> -	struct mm_struct *mm = vma->vm_mm;
>   	struct folio_or_pfn fop = {
>   		.folio = folio,
>   		.is_folio = true,
>   	};
> -	spinlock_t *ptl;
> -	pgtable_t pgtable = NULL;
> -	int error;
> -
> -	if (addr < vma->vm_start || addr >= vma->vm_end)
> -		return VM_FAULT_SIGBUS;
>   
>   	if (WARN_ON_ONCE(folio_order(folio) != PMD_ORDER))
>   		return VM_FAULT_SIGBUS;
>   
> -	if (arch_needs_pgtable_deposit()) {
> -		pgtable = pte_alloc_one(vma->vm_mm);
> -		if (!pgtable)
> -			return VM_FAULT_OOM;
> -	}
> -
> -	ptl = pmd_lock(mm, vmf->pmd);
> -	error = insert_pmd(vma, addr, vmf->pmd, fop, vma->vm_page_prot,
> -			   write, pgtable);
> -	spin_unlock(ptl);
> -	if (error && pgtable)
> -		pte_free(mm, pgtable);
> -
> -	return VM_FAULT_NOPAGE;
> +	return insert_pmd(vma, addr, vmf->pmd, fop, vma->vm_page_prot, write);
>   }
>   EXPORT_SYMBOL_GPL(vmf_insert_folio_pmd);
>   



Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8ACD1294EF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2019 12:21:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hH432FHVzDqMV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2019 22:21:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hH0m4390zDqLv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2019 22:18:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="Ny5yu/Dr"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47hH0k3YDBz9sNH;
 Mon, 23 Dec 2019 22:18:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1577099927;
 bh=coknfwz3CFC41+VHAcVx24BmlrzXEcpZ6K0FtHJFoFc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Ny5yu/Dr2YZr3GJmE9/0JZeuslUESnVf5NTmEDI6MwRmeX2CrMs+6koir9/QL4y52
 rPaD0NWKIgSOGSWoRIwIwXtwWFLNwXFfkRLEpiywpTQOKbRwIUc+vbDiAKqeDS94CO
 lIXcgxMztkvW2n85dRuIBqeJ/iZmHHVtW3laAcX+sCK2TksKt4iafqrVSonOYZoTO2
 bZas7r9iA2Vw9JWQHflL1EDNgcjq2wL5TNNS8ppTHq5KWldSH/PeqfjNm8HuPLCcUi
 uSsTh+mNKiZyTPHcAnpKuedBmLTrvgKpmx19jXYbrkfG0yS20R/nQl5z/U1pHbaESb
 8uTkCDPY5XAiQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel v3] powerpc/book3s64: Fix error handling in
 mm_iommu_do_alloc()
In-Reply-To: <20191223060351.26359-1-aik@ozlabs.ru>
References: <20191223060351.26359-1-aik@ozlabs.ru>
Date: Mon, 23 Dec 2019 22:18:40 +1100
Message-ID: <87mubjl27j.fsf@mpe.ellerman.id.au>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Jan Kara <jack@suse.cz>,
 kvm-ppc@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:

> The last jump to free_exit in mm_iommu_do_alloc() happens after page
> pointers in struct mm_iommu_table_group_mem_t were already converted to
> physical addresses. Thus calling put_page() on these physical addresses
> will likely crash.
>
> This moves the loop which calculates the pageshift and converts page
> struct pointers to physical addresses later after the point when
> we cannot fail; thus eliminating the need to convert pointers back.
>
> Fixes: eb9d7a62c386 ("powerpc/mm_iommu: Fix potential deadlock")
> Reported-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> Changes:
> v3:
> * move pointers conversion after the last possible failure point
> ---
>  arch/powerpc/mm/book3s64/iommu_api.c | 39 +++++++++++++++-------------
>  1 file changed, 21 insertions(+), 18 deletions(-)
>
> diff --git a/arch/powerpc/mm/book3s64/iommu_api.c b/arch/powerpc/mm/book3s64/iommu_api.c
> index 56cc84520577..ef164851738b 100644
> --- a/arch/powerpc/mm/book3s64/iommu_api.c
> +++ b/arch/powerpc/mm/book3s64/iommu_api.c
> @@ -121,24 +121,6 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
>  		goto free_exit;
>  	}
>  
> -	pageshift = PAGE_SHIFT;
> -	for (i = 0; i < entries; ++i) {
> -		struct page *page = mem->hpages[i];
> -
> -		/*
> -		 * Allow to use larger than 64k IOMMU pages. Only do that
> -		 * if we are backed by hugetlb.
> -		 */
> -		if ((mem->pageshift > PAGE_SHIFT) && PageHuge(page))
> -			pageshift = page_shift(compound_head(page));
> -		mem->pageshift = min(mem->pageshift, pageshift);
> -		/*
> -		 * We don't need struct page reference any more, switch
> -		 * to physical address.
> -		 */
> -		mem->hpas[i] = page_to_pfn(page) << PAGE_SHIFT;
> -	}
> -
>  good_exit:
>  	atomic64_set(&mem->mapped, 1);
>  	mem->used = 1;
> @@ -158,6 +140,27 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
>  		}
>  	}
>  
> +	if (mem->dev_hpa == MM_IOMMU_TABLE_INVALID_HPA) {

Couldn't you avoid testing this again ...

> +		/*
> +		 * Allow to use larger than 64k IOMMU pages. Only do that
> +		 * if we are backed by hugetlb. Skip device memory as it is not
> +		 * backed with page structs.
> +		 */
> +		pageshift = PAGE_SHIFT;
> +		for (i = 0; i < entries; ++i) {

... by making this loop up to `pinned`.

`pinned` is only incremented in the loop that does the GUP, and there's
a check that pinned == entries after that loop.

So when we get here we know pinned == entries, and if pinned is zero
it's because we took the (dev_hpa != MM_IOMMU_TABLE_INVALID_HPA) case at
the start of the function to get here.

Or do you think that's too subtle to rely on?

cheers

> +			struct page *page = mem->hpages[i];
> +
> +			if ((mem->pageshift > PAGE_SHIFT) && PageHuge(page))
> +				pageshift = page_shift(compound_head(page));
> +			mem->pageshift = min(mem->pageshift, pageshift);
> +			/*
> +			 * We don't need struct page reference any more, switch
> +			 * to physical address.
> +			 */
> +			mem->hpas[i] = page_to_pfn(page) << PAGE_SHIFT;
> +		}
> +	}
> +
>  	list_add_rcu(&mem->next, &mm->context.iommu_group_mem_list);
>  
>  	mutex_unlock(&mem_list_mutex);
> -- 
> 2.17.1

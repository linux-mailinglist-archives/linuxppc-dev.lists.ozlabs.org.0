Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 399A5718A77
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 21:49:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWfx45qLYz3fFy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 05:49:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=m1HfrX1d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=m1HfrX1d;
	dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWfwC2LNpz30Ky
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 05:48:57 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-64d1a0d640cso116782b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 12:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1685562534; x=1688154534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g7hK4Ihr/VoqnHJzO2kR1sxTTtgLAwvIitCKGJz96Cs=;
        b=m1HfrX1d0iJrg+rPFbOc0G/EwLDsJOG4WmFnWZUC/hngBLshCk/dSjpllXkf6w5Mie
         7a+hGH7hDYlUiTFWNkP20zXoGtcdP7dBe6wS57RHTvOOxwgoyUZPfcl93kds42O3WmVp
         nosyhRzPvsymvj2A+C8B5+cUwBvyd0CG9/ZCxraPDb0KMEMwy5jEUPxu0z9L3FkU8yC9
         UBNCmi3MSdp3iKteRZowGajvH0SWJyKV5QT90Qg+h21zFe3lXODmDUuF8+ZA2FzkFH8O
         fTnASsBqcMv1hbeFKEuaheXLYbinSOf/EX1HXc5s3ZZJv/376WWovjrPsnii4owhdByS
         ROEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685562534; x=1688154534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7hK4Ihr/VoqnHJzO2kR1sxTTtgLAwvIitCKGJz96Cs=;
        b=Pi3R302z1JE7267C0bYSmvZ2jOWlYQzbeU4qGHx8uARnOlCoBy83eF4RGcY3C0xB6B
         K7imj4Kmzsnb4k2mVGN+ia3AEOg+lhdrXqhpnAjvbqdxjI2gY3ndiPQxp9aWf+lNNGJQ
         B2aMnWWRWL5KGltwh1NK0O/8b4kV0hgAHcjkJXgtQ1Ey6VmmDaemf3Be7LCKAsId8PQY
         Yakr6Y1fq+rQoLb/Wvveq5xhX03opjZlJQucFUt06OZRNyH+Unfqy8zvhEk/mbWYUtXO
         VhmumE3blFeMOzMXUSKPJ+MG2CKgGqi0Bfk75IapZmybJVDmoe7eHF+aF3Gv050IADjG
         RfyQ==
X-Gm-Message-State: AC+VfDyOwyt/SdWHJYxyPEI4TyiG/BYAR6TfDZzVxVRJbqweQH5IXvoo
	m54/PgVkUcOPW9yuZuyG8rcodA==
X-Google-Smtp-Source: ACHHUZ6IHdLCo36F3u4uaEk/Y7Ym7GEOFEfVy22jQHGr8ZjdNvbxqGcqQPgiW3ENI9gy4GtmlFgXnA==
X-Received: by 2002:a05:6a20:a109:b0:10b:6698:769d with SMTP id q9-20020a056a20a10900b0010b6698769dmr6344322pzk.11.1685562534252;
        Wed, 31 May 2023 12:48:54 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001ac55a5e5eesm1782100plf.121.2023.05.31.12.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 12:48:53 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1q4RoS-001854-Ch;
	Wed, 31 May 2023 16:48:52 -0300
Date: Wed, 31 May 2023 16:48:52 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH 08/12] mm/pgtable: add pte_free_defer() for pgtable as
 page
Message-ID: <ZHekpAKJ05cr/GLl@ziepe.ca>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
 <739964d-c535-4db4-90ec-2166285b4d47@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <739964d-c535-4db4-90ec-2166285b4d47@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Z
 heng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Zack Rusin <zackr@vmware.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 28, 2023 at 11:23:47PM -0700, Hugh Dickins wrote:
> Add the generic pte_free_defer(), to call pte_free() via call_rcu().
> pte_free_defer() will be called inside khugepaged's retract_page_tables()
> loop, where allocating extra memory cannot be relied upon.  This version
> suits all those architectures which use an unfragmented page for one page
> table (none of whose pte_free()s use the mm arg which was passed to it).
> 
> Signed-off-by: Hugh Dickins <hughd@google.com>
> ---
>  include/linux/pgtable.h |  2 ++
>  mm/pgtable-generic.c    | 20 ++++++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 8b0fc7fdc46f..62a8732d92f0 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -112,6 +112,8 @@ static inline void pte_unmap(pte_t *pte)
>  }
>  #endif
>  
> +void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable);
> +
>  /* Find an entry in the second-level page table.. */
>  #ifndef pmd_offset
>  static inline pmd_t *pmd_offset(pud_t *pud, unsigned long address)
> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> index d28b63386cef..471697dcb244 100644
> --- a/mm/pgtable-generic.c
> +++ b/mm/pgtable-generic.c
> @@ -13,6 +13,7 @@
>  #include <linux/swap.h>
>  #include <linux/swapops.h>
>  #include <linux/mm_inline.h>
> +#include <asm/pgalloc.h>
>  #include <asm/tlb.h>
>  
>  /*
> @@ -230,6 +231,25 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long address,
>  	return pmd;
>  }
>  #endif
> +
> +/* arch define pte_free_defer in asm/pgalloc.h for its own implementation */
> +#ifndef pte_free_defer
> +static void pte_free_now(struct rcu_head *head)
> +{
> +	struct page *page;
> +
> +	page = container_of(head, struct page, rcu_head);
> +	pte_free(NULL /* mm not passed and not used */, (pgtable_t)page);
> +}
> +
> +void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
> +{
> +	struct page *page;
> +
> +	page = pgtable;
> +	call_rcu(&page->rcu_head, pte_free_now);

People have told me that we can't use the rcu_head on the struct page
backing page table blocks. I understood it was because PPC was using
that memory for something else.

I was hoping Mathew's folio conversion would help clarify this..

On the flip side, if we are able to use rcu_head here then we should
use it everywhere and also use it mmu_gather.c instead of allocating
memory and having the smp_call_function() fallback. This would fix it
to be actual RCU.

There have been a few talks that it sure would be nice if the page
tables were always freed via RCU and every arch just turns on
CONFIG_MMU_GATHER_RCU_TABLE_FREE. It seems to me that patch 10 is kind
of half doing that by making this one path always use RCU on all
arches.

AFAIK the main reason it hasn't been done was the lack of a rcu_head..

Jason

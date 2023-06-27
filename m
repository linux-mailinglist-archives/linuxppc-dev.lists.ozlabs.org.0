Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D527401D6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 19:02:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=fv4aOli3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qr9xC5Cjvz3bkM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 03:02:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=fv4aOli3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qr9wK18YFz2yHT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 03:01:18 +1000 (AEST)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7659db6fb4bso2800885a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 10:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1687885273; x=1690477273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pGj4zIY05LUVw6x8uPMdw5L+2KzhNBDHJ+ePBOrWYt0=;
        b=fv4aOli3RZQEuSykjh0KPJosM74wknroYSqHFVHSdVChqt5dE0DVgXlrRYmt1CvOnY
         r9QI0fTgfFUWgqXHSsZNrLc1f1ayXFTJny6re162pz73LDYLIDX6x6Nul8W8uuDPtVWR
         xoZkJB0tiNVJUTKpK+B42I9Ds4Qf24HB1E8PYwh06kJrMPtStHsczNkteBBirKb849fq
         SKJQDQJ4TcsB3DjhjpUqZxyJnRgGPJeMW2bpLrpcW54Dv8Mu2lATNH6KyyDAxb5Vfuu4
         oITAc+4BgUG5kzFG16sOvZjbagDHdS79UTpKP1GYZUDMG7cnLhcr7J+U+MeYG16MZmqp
         f/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687885273; x=1690477273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGj4zIY05LUVw6x8uPMdw5L+2KzhNBDHJ+ePBOrWYt0=;
        b=OZb9d6KGjqdRMUvbz+XqYfy/AFqIfkOYgG0XaNIRG1mWsn+fX7o1tYA6uJUldL8+QQ
         GI1JBuVoX9naur16Z/p177to82sH1N//851f/aeb0LnviByyL5zPetd2O+bNBbdNQVa+
         9yEMu439UUrxEWS+9lwTb135rBLAdiJoySiE05eJTNx6J46L4q8zGQqemIoruJP9nm65
         ZlcXvbsHmSvRTbcDiUsAzpIUL0MnunEA2dzdZb3yQbCvm8Gx/L7wN7Ty8ZaVwtN/w15F
         STgen52X43xx2cwR52tibdsp1fosr1zM2lNodtEbrV6HLa/K4IL3pYdMcDBB5mbFBUdG
         uNnw==
X-Gm-Message-State: AC+VfDzoYfNpf6vrxG6jZQfN+S2aiwwh8StEoIPLF4HOQVEXpbGWxchz
	Ec3kXQf3Y36F85LK4xy1a9mIjQ==
X-Google-Smtp-Source: ACHHUZ6oaDuFjtrZalcD7+2mNq8I8fqsW/Qlz3+39Q2yb+iaemspbajCtES18RCk5gRY5Hel+BhpGw==
X-Received: by 2002:ad4:5b81:0:b0:616:5755:ca5d with SMTP id 1-20020ad45b81000000b006165755ca5dmr37937429qvp.4.1687885272640;
        Tue, 27 Jun 2023 10:01:12 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id w14-20020a0cef8e000000b0062df95d7ef6sm3777254qvr.115.2023.06.27.10.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 10:01:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qEC3z-008yOA-DP;
	Tue, 27 Jun 2023 14:01:11 -0300
Date: Tue, 27 Jun 2023 14:01:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v2 05/12] powerpc: add pte_free_defer() for pgtables
 sharing page
Message-ID: <ZJsV19f41CrfkFYa@ziepe.ca>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
 <5cd9f442-61da-4c3d-eca-b7f44d22aa5f@google.com>
 <ZJGRa4zvsXfc43vB@ziepe.ca>
 <2ad8b6cf-692a-ff89-ecc-586c20c5e07f@google.com>
 <ZJI7xkXWmjrE1yY3@ziepe.ca>
 <c8284d0-91cb-b65e-4c95-bfeb627234f@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8284d0-91cb-b65e-4c95-bfeb627234f@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <p
 asha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David Sc. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 21, 2023 at 07:36:11PM -0700, Hugh Dickins wrote:
> [PATCH v3 05/12] powerpc: add pte_free_defer() for pgtables sharing page
> 
> Add powerpc-specific pte_free_defer(), to free table page via call_rcu().
> pte_free_defer() will be called inside khugepaged's retract_page_tables()
> loop, where allocating extra memory cannot be relied upon.  This precedes
> the generic version to avoid build breakage from incompatible pgtable_t.
> 
> This is awkward because the struct page contains only one rcu_head, but
> that page may be shared between PTE_FRAG_NR pagetables, each wanting to
> use the rcu_head at the same time.  But powerpc never reuses a fragment
> once it has been freed: so mark the page Active in pte_free_defer(),
> before calling pte_fragment_free() directly; and there call_rcu() to
> pte_free_now() when last fragment is freed and the page is PageActive.
> 
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> Signed-off-by: Hugh Dickins <hughd@google.com>
> ---
>  arch/powerpc/include/asm/pgalloc.h |  4 ++++
>  arch/powerpc/mm/pgtable-frag.c     | 29 ++++++++++++++++++++++++++---
>  2 files changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/pgalloc.h b/arch/powerpc/include/asm/pgalloc.h
> index 3360cad78ace..3a971e2a8c73 100644
> --- a/arch/powerpc/include/asm/pgalloc.h
> +++ b/arch/powerpc/include/asm/pgalloc.h
> @@ -45,6 +45,10 @@ static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
>  	pte_fragment_free((unsigned long *)ptepage, 0);
>  }
>  
> +/* arch use pte_free_defer() implementation in arch/powerpc/mm/pgtable-frag.c */
> +#define pte_free_defer pte_free_defer
> +void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable);
> +
>  /*
>   * Functions that deal with pagetables that could be at any level of
>   * the table need to be passed an "index_size" so they know how to
> diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
> index 20652daa1d7e..0c6b68130025 100644
> --- a/arch/powerpc/mm/pgtable-frag.c
> +++ b/arch/powerpc/mm/pgtable-frag.c
> @@ -106,6 +106,15 @@ pte_t *pte_fragment_alloc(struct mm_struct *mm, int kernel)
>  	return __alloc_for_ptecache(mm, kernel);
>  }
>  
> +static void pte_free_now(struct rcu_head *head)
> +{
> +	struct page *page;
> +
> +	page = container_of(head, struct page, rcu_head);
> +	pgtable_pte_page_dtor(page);
> +	__free_page(page);
> +}
> +
>  void pte_fragment_free(unsigned long *table, int kernel)
>  {
>  	struct page *page = virt_to_page(table);
> @@ -115,8 +124,22 @@ void pte_fragment_free(unsigned long *table, int kernel)
>  
>  	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
>  	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
> -		if (!kernel)
> -			pgtable_pte_page_dtor(page);
> -		__free_page(page);
> +		if (kernel)
> +			__free_page(page);
> +		else if (TestClearPageActive(page))
> +			call_rcu(&page->rcu_head, pte_free_now);
> +		else
> +			pte_free_now(&page->rcu_head);
>  	}
>  }
> +
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
> +{
> +	struct page *page;
> +
> +	page = virt_to_page(pgtable);
> +	SetPageActive(page);
> +	pte_fragment_free((unsigned long *)pgtable, 0);
> +}
> +#endif /* CONFIG_TRANSPARENT_HUGEPAGE */

Yes, this makes sense to me, very simple..

I always for get these details but atomic_dec_and_test() is a release?
So the SetPageActive is guarenteed to be visible in another thread
that reaches 0?

Thanks,
Jason

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D817235E3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 05:47:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZxHs1lsTz3fDf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 13:47:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Lh96h/lD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Lh96h/lD;
	dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZxGg13gvz3dy5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 13:46:18 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-ba8151a744fso6305169276.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jun 2023 20:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686023175; x=1688615175;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PlaL5MaaVR+UDyIKMcm/yVvL4j9So7q5GkztpswdgME=;
        b=Lh96h/lDBcM3YSyz9v0Y3hvn7WuORPJViVjZHLCN9PyefN+x22jni/n5lbS1fhDzrP
         MpfKmVOs152zYpqX3g4u6c2D3DRgfMdP0/v6bviAT2MpzbSHHzT1WdHzhjJORbV5NjXz
         jTv8PNQ5uMu1rp4+lvGDpvPAo82GPLIFe4aaBe54H7wLp25+DpCiXVidTHgAusjDQEhI
         TJFlr+5pMFQolpJxSr6enqhcJJhZ9X5gzEO7McG7JDXjJjoYrjC13MU7AkvrFgfcVyfe
         eiqkT7oQJVsvZwL6YReJ17clGDoHjRRLJvavtOawvtgSEat8w13ANyRjIWkZ8nkQaS29
         7W1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686023175; x=1688615175;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PlaL5MaaVR+UDyIKMcm/yVvL4j9So7q5GkztpswdgME=;
        b=RvuGaKq8fPNJtJr4DsrZYYOYt+s5Kl2A+khOoIfAU6jhX8/qBQEixnLJOhKH3Sq2T+
         YOKm7e2/WNiPVzMJI6oHK1lSDgXo4L31DgQBH2gJqboJmVJN+JrAgaUj7/oguj/YPSWx
         YzdnW/ItrIyCpS3LicKRDYAj51wwdcpWwtbu/av4Dz7CzMp3m1pIG6Bnmo62ATL8QDrt
         OnVYhzidXXxdS0YmgR7gvdRACl98fSTiar8wCi/63Shs0Ddbhx+z7mgpHrTHqWcIsWVW
         LB0kC2bGFCbqqpN83NfGH5mRmJ8U/OWZdlLi9bj/y55AJIXNeMZVXSHWXs2CW5zO/cl7
         cOyA==
X-Gm-Message-State: AC+VfDyIQJpUe9s3AqDeAaKKf7Ood89WlbROXTR7A2Pn99prY6RprsLf
	svYCX+e/um7X/7X65/KV7+c1Gw==
X-Google-Smtp-Source: ACHHUZ5ebo+2BnNCxDC86vNc4dj3ZHSCTA/lrxyp5IcLZWVSZfUvSH7wOGeKHnVgJiNuE/6SI1T17Q==
X-Received: by 2002:a81:6dc6:0:b0:569:e7cb:c1d3 with SMTP id i189-20020a816dc6000000b00569e7cbc1d3mr1004573ywc.47.1686023175399;
        Mon, 05 Jun 2023 20:46:15 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id v80-20020a814853000000b0055a18d8479csm3761428ywa.21.2023.06.05.20.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 20:46:14 -0700 (PDT)
Date: Mon, 5 Jun 2023 20:46:10 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH 06/12] sparc: add pte_free_defer() for pgtables sharing
 page
In-Reply-To: <f8d84fb8-eb9-6649-7137-715c6010468c@google.com>
Message-ID: <ba73bd57-4bcf-e555-2a9e-a21f2e4214b@google.com>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com> <f8d84fb8-eb9-6649-7137-715c6010468c@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Ca
 rstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Zack Rusin <zackr@vmware.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 28 May 2023, Hugh Dickins wrote:

> Add sparc-specific pte_free_defer(), to call pte_free() via call_rcu().
> pte_free_defer() will be called inside khugepaged's retract_page_tables()
> loop, where allocating extra memory cannot be relied upon.  This precedes
> the generic version to avoid build breakage from incompatible pgtable_t.

sparc32 supports pagetables sharing a page, but does not support THP;
sparc64 supports THP, but does not support pagetables sharing a page.
So the sparc-specific pte_free_defer() is as simple as the generic one,
except for converting between pte_t *pgtable_t and struct page *.
The patch should be fine as posted (except its title is misleading).

> 
> Signed-off-by: Hugh Dickins <hughd@google.com>
> ---
>  arch/sparc/include/asm/pgalloc_64.h |  4 ++++
>  arch/sparc/mm/init_64.c             | 16 ++++++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/arch/sparc/include/asm/pgalloc_64.h b/arch/sparc/include/asm/pgalloc_64.h
> index 7b5561d17ab1..caa7632be4c2 100644
> --- a/arch/sparc/include/asm/pgalloc_64.h
> +++ b/arch/sparc/include/asm/pgalloc_64.h
> @@ -65,6 +65,10 @@ pgtable_t pte_alloc_one(struct mm_struct *mm);
>  void pte_free_kernel(struct mm_struct *mm, pte_t *pte);
>  void pte_free(struct mm_struct *mm, pgtable_t ptepage);
>  
> +/* arch use pte_free_defer() implementation in arch/sparc/mm/init_64.c */
> +#define pte_free_defer pte_free_defer
> +void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable);
> +
>  #define pmd_populate_kernel(MM, PMD, PTE)	pmd_set(MM, PMD, PTE)
>  #define pmd_populate(MM, PMD, PTE)		pmd_set(MM, PMD, PTE)
>  
> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
> index 04f9db0c3111..b7c6aa085ef6 100644
> --- a/arch/sparc/mm/init_64.c
> +++ b/arch/sparc/mm/init_64.c
> @@ -2930,6 +2930,22 @@ void pgtable_free(void *table, bool is_page)
>  }
>  
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +static void pte_free_now(struct rcu_head *head)
> +{
> +	struct page *page;
> +
> +	page = container_of(head, struct page, rcu_head);
> +	__pte_free((pgtable_t)page_to_virt(page));
> +}
> +
> +void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
> +{
> +	struct page *page;
> +
> +	page = virt_to_page(pgtable);
> +	call_rcu(&page->rcu_head, pte_free_now);
> +}
> +
>  void update_mmu_cache_pmd(struct vm_area_struct *vma, unsigned long addr,
>  			  pmd_t *pmd)
>  {
> -- 
> 2.35.3
> 
> 

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFCA724B4E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 20:24:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbJlq6LDNz3dxL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 04:24:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=jPTtD7S9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::f33; helo=mail-qv1-xf33.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=jPTtD7S9;
	dkim-atps=neutral
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbJky1kc3z2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 04:23:36 +1000 (AEST)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6261616efd2so51097356d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 11:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1686075812; x=1688667812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lRK8iTgMb5TScoKA9P/J+NjKmgAke6TT3GAMczOWAY4=;
        b=jPTtD7S91r09g5GZ5enOvX5p1h2bE1pdqCLmsV5LGnWj/qXlaFjTKr8u0jEgv/8EJa
         hY4FdwIqOIk7kTUaBc7VFbHJ+am4ZQIgpqa0l/+TL8DzoNdAIe62OPQVQ4ra11vVpelk
         DoqXX3ISlkm0edxF8e7WCTJSKm1Ipzzf3dQhhjoYWQ+naJIg49ZDRYNQH9PkIULo4N/q
         q0XGCvK12HESNzBwtCGHKf5j7mgSphBf2k76g+ZYrWGEJkNVJi15JYjsMZWJ6iplKlfX
         evTLvuaVNlMPAeqT4m1wTzu2PYZ1Ez+MjP+uRqkV2x2SNfBLoSWj6/MhrLMSfsLM4C27
         YAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686075812; x=1688667812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRK8iTgMb5TScoKA9P/J+NjKmgAke6TT3GAMczOWAY4=;
        b=iDjxE+QZobGTzXQJXQOz00Vea1LVTcc7id6y+0j3jp53Ewh1fCT2ClP27IKBjLoAQl
         A4kbyDPI9+9k6lE4H7UKOdZKAHkbgJ9c2hxtdq8nvvnX4oMHClH5zIgXy1XF972GfMtW
         pnR2v2kkhdL1DbbagXlchbbzKyboU+8CCWVUojnvrakEewXnElkqQmxsi7tfDiQ0MZeD
         RZESkCs+fVi7PrYpsOJZNu1raYR08tJCzgJmdrWtr4mmZLtC7T5vo+DZWfY92YAhNtwx
         T5r9jYgosu9ALmYNoJg1oX77D7OIVw2+43lQnJpmje1MlGsLeVRWz1LtwPpRdZ/K4Hw8
         +DuQ==
X-Gm-Message-State: AC+VfDw3X4NaZ/PDyn/ZD9+lRidV6Jr3HVOhUSmQLly4rmWTcHYzch0P
	DwrNcpWWkJ6o9VOb95i5C6kTEA==
X-Google-Smtp-Source: ACHHUZ5YVdCH5/dS9hodEJr36EZ44XO5GEyKgrVSvJAfG4M8kimdM0r3/RKcMebdOYHUsIqUASQktw==
X-Received: by 2002:a05:6214:124d:b0:62b:4e7e:8aba with SMTP id r13-20020a056214124d00b0062b4e7e8abamr366606qvv.60.1686075811887;
        Tue, 06 Jun 2023 11:23:31 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id ff24-20020a05622a4d9800b003f9baa693c7sm26279qtb.10.2023.06.06.11.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 11:23:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1q6bL8-0030Xz-9V;
	Tue, 06 Jun 2023 15:23:30 -0300
Date: Tue, 6 Jun 2023 15:23:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH 05/12] powerpc: add pte_free_defer() for pgtables sharing
 page
Message-ID: <ZH95oobIqN0WO5MK@ziepe.ca>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
 <28eb289f-ea2c-8eb9-63bb-9f7d7b9ccc11@google.com>
 <ZHSwWgLWaEd+zi/g@casper.infradead.org>
 <ZHn6n5eVTsr4Wl8x@ziepe.ca>
 <4df4909f-f5dd-6f94-9792-8f2949f542b3@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4df4909f-f5dd-6f94-9792-8f2949f542b3@google.com>
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

On Mon, Jun 05, 2023 at 08:40:01PM -0700, Hugh Dickins wrote:

> diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
> index 20652daa1d7e..e4f58c5fc2ac 100644
> --- a/arch/powerpc/mm/pgtable-frag.c
> +++ b/arch/powerpc/mm/pgtable-frag.c
> @@ -120,3 +120,54 @@ void pte_fragment_free(unsigned long *table, int kernel)
>  		__free_page(page);
>  	}
>  }
> +
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +#define PTE_FREE_DEFERRED 0x10000 /* beyond any PTE_FRAG_NR */
> +
> +static void pte_free_now(struct rcu_head *head)
> +{
> +	struct page *page;
> +	int refcount;
> +
> +	page = container_of(head, struct page, rcu_head);
> +	refcount = atomic_sub_return(PTE_FREE_DEFERRED - 1,
> +				     &page->pt_frag_refcount);
> +	if (refcount < PTE_FREE_DEFERRED) {
> +		pte_fragment_free((unsigned long *)page_address(page), 0);
> +		return;
> +	}

From what I can tell power doesn't recycle the sub fragment into any
kind of free list. It just waits for the last fragment to be unused
and then frees the whole page.

So why not simply go into pte_fragment_free() and do the call_rcu directly:

	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
		if (!kernel)
			pgtable_pte_page_dtor(page);
		call_rcu(&page->rcu_head, free_page_rcu)

?

Jason

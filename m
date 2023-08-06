Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4975C771386
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Aug 2023 05:56:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=nHQK9bAV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RJQcP6s5nz3cNt
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Aug 2023 13:56:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=nHQK9bAV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RJQbN3Q0Sz2yVw
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Aug 2023 13:55:43 +1000 (AEST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-583f65806f8so37715187b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 05 Aug 2023 20:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691294138; x=1691898938;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m2K+k0UoOXs6D5uLva9XkEFbd09ZRm9Z7/lr2pw8hZw=;
        b=nHQK9bAViVteBZuYzu1hSOzZou4B7CZHQRLaLY6OQhD1zUjj/ni/sFz980Hez3g6xP
         +XJdU9vnCkIdIo4sxbPl3r3sYiHSM+SwI9Q4fpiZIBM4Eof2E8FuwdvUmKXrdVFtQlcx
         ww+ZM5dOPHj7CUMoYM0F9VEscwNfVfykgHQSeFqLDRH8X8nndU7fw98QPxNlNPhr9jfi
         w3PvJYAodiPLKRnlfP8VbYcBqtQImekRiz1F15mmV39CZybLJVmANRH5/iuTvgm0WOhL
         SpUQkdBJ71frR6f2MxShl/q+q+TV2Ok4ynKVWq7SSJQkDn4kFZWzeTN8D/KeteoSw1o9
         EKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691294138; x=1691898938;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m2K+k0UoOXs6D5uLva9XkEFbd09ZRm9Z7/lr2pw8hZw=;
        b=NmyR2eJUCJbikuqhCQ9jtWNTPNNvgZXvKSLIDjSAOnq/atDvbM1oxBbkCf0oH4fC/U
         vkL5ZRvgnQrgYUpwxoYq7aSrqgdlwz4jbCXRaWHrfLyddOhYqxRHa1XPNAmARGjvbTBN
         0lkKFNV8rHJ8jCKCscYo9Ghpr9KnF5uG+uvzFSUFhPP6UyiirDvT97RS1MS9YJPB6x/A
         dtvDde833qYVN5CW+h7XSlts7j5jsw2gbA2XApRvBvQye3HfT/U2qNWIe3VgOW3KrrBK
         iE7eugwB3ma7X+XSt5hpoyaIG9y1vOLrSOI73YzQ6LhWpCqoJp2Wg0nqy+z87VMpZ8gH
         mxDA==
X-Gm-Message-State: AOJu0YyFZg5/qdUAzpzVVwfWEX+iwJuR+DP+kl693c6Ax7p6Tkvv3+uL
	SCkQiz6PmLOyVyA7l4gjQt5DJQ==
X-Google-Smtp-Source: AGHT+IFiva5XFrTVBq0jEtYJXpVvro3rzuVZhewsSXihKRs8BSeQq4Tb3piHb2uK39Vd3DI+t0W0ew==
X-Received: by 2002:a0d:d488:0:b0:56d:5272:d540 with SMTP id w130-20020a0dd488000000b0056d5272d540mr6237470ywd.46.1691294138477;
        Sat, 05 Aug 2023 20:55:38 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id a64-20020a0df143000000b00576e67820f3sm1861323ywf.66.2023.08.05.20.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 20:55:37 -0700 (PDT)
Date: Sat, 5 Aug 2023 20:55:25 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v3 10/13] mm/khugepaged: collapse_pte_mapped_thp() with
 mmap_read_lock()
In-Reply-To: <0df84f9f-e9b0-80b1-4c9e-95abc1a73a96@bytedance.com>
Message-ID: <884f20fe-d642-3a5f-522a-d756c3443bb4@google.com>
References: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com> <b53be6a4-7715-51f9-aad-f1347dcb7c4@google.com> <0df84f9f-e9b0-80b1-4c9e-95abc1a73a96@bytedance.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <t
 homas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 3 Aug 2023, Qi Zheng wrote:
> On 2023/7/12 12:42, Hugh Dickins wrote:
> > Bring collapse_and_free_pmd() back into collapse_pte_mapped_thp().
> > It does need mmap_read_lock(), but it does not need mmap_write_lock(),
> > nor vma_start_write() nor i_mmap lock nor anon_vma lock.  All racing
> > paths are relying on pte_offset_map_lock() and pmd_lock(), so use those.
...
> > @@ -1681,47 +1634,76 @@ int collapse_pte_mapped_thp(struct mm_struct *mm,
> > unsigned long addr,
> >   
> >     if (pte_none(ptent))
> >   			continue;
> > -		page = vm_normal_page(vma, addr, ptent);
> > -		if (WARN_ON_ONCE(page && is_zone_device_page(page)))
> > +		/*
> > +		 * We dropped ptl after the first scan, to do the
> > mmu_notifier:
> > +		 * page lock stops more PTEs of the hpage being faulted in,
> > but
> > +		 * does not stop write faults COWing anon copies from existing
> > +		 * PTEs; and does not stop those being swapped out or
> > migrated.
> > +		 */
> > +		if (!pte_present(ptent)) {
> > +			result = SCAN_PTE_NON_PRESENT;
> >   			goto abort;
> > +		}
> > +		page = vm_normal_page(vma, addr, ptent);
> > +		if (hpage + i != page)
> > +			goto abort;
> > +
> > +		/*
> > +		 * Must clear entry, or a racing truncate may re-remove it.
> > +		 * TLB flush can be left until pmdp_collapse_flush() does it.
> > +		 * PTE dirty? Shmem page is already dirty; file is read-only.
> > +		 */
> > +		pte_clear(mm, addr, pte);
> 
> This is not non-present PTE entry, so we should call ptep_clear() to let
> page_table_check track the PTE clearing operation, right? Otherwise it
> may lead to false positives?

You are right: thanks a lot for catching that: fix patch follows.

Hugh

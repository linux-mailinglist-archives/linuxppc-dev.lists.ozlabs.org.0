Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D043071F9D9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 08:04:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXXWX3Wxtz3fCX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 16:04:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Y1BisDvM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Y1BisDvM;
	dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXXVd2HyKz3dwj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 16:03:20 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-bad05c6b389so1818047276.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 23:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685685796; x=1688277796;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7zsFlKAGcv+fQqN1VVT9TBfhOrr8gOpZnbD5J9Rbft4=;
        b=Y1BisDvMhSzU6oLolCbfFVEgLMBmkQqmlhDVPpW2AJeK8jBOlWFdFzL1tmuKOpvK63
         GHp/SMU2i1PecHncq+b0lH3okXqlru+09I8QXCT9NALz59R7lsKaFrIT52Hiqg0zxTrC
         jqOVLA4YrHbMJ8glWqmmX18tl8OerbjfR8d4jWr1vj09V6zTyWVo1xxkRbkx8FKG4Z9E
         o7UIT7SMKh+6qHbb35DHGZE2LGVQgAMuvaanUZKjDX1mZVWuXTA1af7RiiJxIJKDI/Fw
         yZw6JHtIxsA5qBBvdFUR4HhBdS3PC2/xGlBXKlhRRsZvH9HBG7Q8HWGC15eDYbLtpv+i
         H45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685685796; x=1688277796;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7zsFlKAGcv+fQqN1VVT9TBfhOrr8gOpZnbD5J9Rbft4=;
        b=FaG/a+7HbnOPxWUPWY8Oe2SXUcT/FR9BrZoYlkpPyI+DAvSW+gGF89aT0fV+CSbo15
         fPmj4aWGstyxHbMUI1NqSjl3A0sDL+626a7J0Av9tJP0e58vzAvEsJbC6GDzUOId8Ozk
         iykbV/cyvRuh6CB2lJAdEgo5KurOKDNFmUUBtHTRqih5ds06BWKVN8DPymNgewxVMBG7
         EHjqttgalVLeoq/f6+8uAw0reBW4JWf87aGrBQ46siLJnDUe9nDKt6vBQR+NlP7g0bDZ
         1umMQOW72LKwB32O1pZdfXFbLF1PEIs9XLno7oKqTbzYDQ0ArayIQetBa/HF258VO/7B
         rm6Q==
X-Gm-Message-State: AC+VfDzUx8wgwtsQcLUiS2W2WFHHZ+2womGuIexuHGtstSwrx1H+MgD0
	LTM4Yw7u/Y9VrgbmEXpjFqJYUw==
X-Google-Smtp-Source: ACHHUZ6eYdbQngpbs2i38U7FBW9tfhwKdbT7ZR71DCB3qxUId8cHs0QRFbdpfBZ1Bt76wUVanJBNhQ==
X-Received: by 2002:a0d:d447:0:b0:568:bec5:ebaf with SMTP id w68-20020a0dd447000000b00568bec5ebafmr12482758ywd.12.1685685796445;
        Thu, 01 Jun 2023 23:03:16 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id u17-20020a818411000000b0055d7fc2b704sm184207ywf.16.2023.06.01.23.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 23:03:15 -0700 (PDT)
Date: Thu, 1 Jun 2023 23:03:11 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 08/12] mm/pgtable: add pte_free_defer() for pgtable as
 page
In-Reply-To: <ZHekpAKJ05cr/GLl@ziepe.ca>
Message-ID: <a7f4722-8af2-f7be-eada-ff1e6e918da1@google.com>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com> <739964d-c535-4db4-90ec-2166285b4d47@google.com> <ZHekpAKJ05cr/GLl@ziepe.ca>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Anshuman Khandual <anshu
 man.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 31 May 2023, Jason Gunthorpe wrote:
> On Sun, May 28, 2023 at 11:23:47PM -0700, Hugh Dickins wrote:
> > Add the generic pte_free_defer(), to call pte_free() via call_rcu().
> > pte_free_defer() will be called inside khugepaged's retract_page_tables()
> > loop, where allocating extra memory cannot be relied upon.  This version
> > suits all those architectures which use an unfragmented page for one page
> > table (none of whose pte_free()s use the mm arg which was passed to it).
> > 
> > Signed-off-by: Hugh Dickins <hughd@google.com>
> > ---
> > +	page = pgtable;
> > +	call_rcu(&page->rcu_head, pte_free_now);
> 
> People have told me that we can't use the rcu_head on the struct page
> backing page table blocks. I understood it was because PPC was using
> that memory for something else.

In the 05/12 thread, Matthew pointed out that powerpc (and a few others)
use the one struct page for multiple page tables, and the lack of
multiple rcu_heads means I've got that patch and 06/12 sparc and
07/12 s390 embarrassingly wrong (whereas this generic 08/12 is okay).

I believe I know the extra grossness needed for powerpc and sparc: I had
it already for powerpc, but fooled myself into thinking not yet needed.

But (I haven't quite got there yet) it looks like Gerald is pointing
out that s390 is using lru which coincides with rcu_head: I already knew
s390 the most difficult, but that will be another layer of difficulty.

I expect it was s390 which people warned you of.

> 
> I was hoping Mathew's folio conversion would help clarify this..

I doubt that: what we have for use today is pages, however they are
dressed up.

> 
> On the flip side, if we are able to use rcu_head here then we should
> use it everywhere and also use it mmu_gather.c instead of allocating
> memory and having the smp_call_function() fallback. This would fix it
> to be actual RCU.
> 
> There have been a few talks that it sure would be nice if the page
> tables were always freed via RCU and every arch just turns on
> CONFIG_MMU_GATHER_RCU_TABLE_FREE. It seems to me that patch 10 is kind
> of half doing that by making this one path always use RCU on all
> arches.
> 
> AFAIK the main reason it hasn't been done was the lack of a rcu_head..

I haven't paid attention to that part of the history, and won't be
competent to propagate this further, into MMU-Gather-World; but agree
that would be a satisfying conclusion.

Hugh

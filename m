Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C827281FA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 15:59:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcQn96kG8z3f7w
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 23:59:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=c3kx8K7t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=c3kx8K7t;
	dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcQmG2TcVz3dx7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 23:58:38 +1000 (AEST)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-39a505b901dso424420b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 06:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1686232715; x=1688824715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UNu2/S7sKOt+ubQCHoHXnO+tkZORQ3Sbd1tjf3f4Mr4=;
        b=c3kx8K7tTcukv+anoLR5JE3/ubg8q5CO3nzZOO6SU5CXIix8vczuprLx4rXVDWTdEX
         hs+E+zzja4ua8gGSjBrbVm6Ep8+L0fOEvdhrqVYJLxFv130wvOZzdjAaB2Flhgb2TRRb
         uqPK/7XI63a9Wl2IZQN4DEejxckFyPyr0xFuvLWArVQ/+f9ud9V5FeMXJ6bonL6nPSkP
         ZAWsLq+XfvZHPiGRN/xo7lAPtKsiLx+Q72RSIJ86pzS9EcuyNwtp9F9J96kqArgULjkv
         3GfO6CrfSEhxuYeCqGRvjyHkvsZI1BdV24dd8bBsMQRPPswYuaCUpkJe5qj8Iwetk/KI
         UiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686232715; x=1688824715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNu2/S7sKOt+ubQCHoHXnO+tkZORQ3Sbd1tjf3f4Mr4=;
        b=ghxUF3Ur43rIafrDT/zBY85nx2axYbz+9K2O/OPkrzO/1v5SkQf2gGJZMhpzeqL1Fr
         ZmWQFWgRedkoF90Ll3iZsOdEfX21Szdz26AOTIwaX6PFzaF9lS+ZEaywO/DGldSldq/v
         xhYkCxHWj7VMhhl3we77TH+LhO2MWiLWRq3EQpzjRH0Ps9+W8cL5wQ6Jl8/5+CO062xy
         e7wsYHEkTMZuMKEwG8bpqE2j9mThUk2kqbHbK/iA5qMkOQAjN8L/kDKvgsKptiKQgyea
         +Q8zN45ZrJd+6dAYSoeT2mOao+Unup/J90QphhMTCC2vG6fEH51HE72eN3QnHQlhKOe/
         rapg==
X-Gm-Message-State: AC+VfDxgxBzXGlnQMBjwwdgmrg8vYVanu8vXuLfjqnS9QdHuhyVgS7MG
	wVarFHvC4RiwwxbvtJMFyok4nw==
X-Google-Smtp-Source: ACHHUZ79SDvHlQrsY3n06C+42lQZ8V3VBEDt3rX4FxqxgeXDKorKznGSCHqgRSC89Wx2XwVPR9xrlA==
X-Received: by 2002:aca:90e:0:b0:397:f9f2:76b with SMTP id 14-20020aca090e000000b00397f9f2076bmr8071851oij.30.1686232715650;
        Thu, 08 Jun 2023 06:58:35 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id pg4-20020a17090b1e0400b00256a4d59bfasm3119836pjb.23.2023.06.08.06.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 06:58:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1q7G9o-003TSq-VU;
	Thu, 08 Jun 2023 10:58:32 -0300
Date: Thu, 8 Jun 2023 10:58:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH 07/12] s390: add pte_free_defer(), with use of
 mmdrop_async()
Message-ID: <ZIHeiDf9srvRagfr@ziepe.ca>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
 <6dd63b39-e71f-2e8b-7e0-83e02f3bcb39@google.com>
 <175ebec8-761-c3f-2d98-6c3bd87161c8@google.com>
 <20230606214037.09c6b280@thinkpad-T15>
 <dbed4c5-1d-f278-d03a-66f5eff5e48e@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbed4c5-1d-f278-d03a-66f5eff5e48e@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily G
 orbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 07, 2023 at 08:35:05PM -0700, Hugh Dickins wrote:

> My current thinking (but may be proved wrong) is along the lines of:
> why does something on its way to being freed need to be on any list
> than the rcu_head list?  I expect the current answer is, that the
> other half is allocated, so the page won't be freed; but I hope that
> we can put it back on that list once we're through with the rcu_head.

I was having the same thought. It is pretty tricky, but if this was
made into some core helper then PPC and S390 could both use it and PPC
would get a nice upgrade to have the S390 frag re-use instead of
leaking frags.

Broadly we have three states:

 all frags free
 at least one frag free
 all frags used

'all frags free' should be returned to the allocator
'at least one frag free' should have the struct page on the mmu_struct's list
'all frags used' should be on no list.

So if we go from 
  all frags used -> at least one frag free
Then we put it on the RCU then the RCU puts it on the mmu_struct list

If we go from 
   at least one frag free -> all frags free
Then we take it off the mmu_struct list, put it on the RCU, and RCU
frees it.

Your trick to put the list_head for the mm_struct list into the frag
memory looks like the right direction. So 'at least one frag free' has
a single already RCU free'd frag hold the list head pointer. Thus we
never use the LRU and the rcu_head is always available.

The struct page itself can contain the actual free frag bitmask.

I think if we split up the memory used for pt_frag_refcount we can get
enough bits to keep track of everything. With only 2-4 frags we should
be OK.

So we track this data in the struct page:
  - Current RCU free TODO bitmask - if non-zero then a RCU is already
    triggered
  - Next RCU TODO bitmaks - If an RCU is already triggrered then we
    accumulate more free'd frags here
  - Current Free Bits - Only updated by the RCU callback

?

We'd also need to store the mmu_struct pointer in the struct page for
the RCU to be able to add/remove from the mm_struct list.

I'm not sure how much of the work can be done with atomics and how
much would need to rely on spinlock inside the mm_struct.

It feels feasible and not so bad. :)

Figure it out and test it on S390 then make power use the same common
code, and we get full RCU page table freeing using a reliable rcu_head
on both of these previously troublesome architectures :) Yay

Jason

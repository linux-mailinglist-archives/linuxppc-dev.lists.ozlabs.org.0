Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD4F71FA3D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 08:40:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXYJz5cy8z3f0B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 16:40:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=MQbltgtZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=MQbltgtZ;
	dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXYHM27lhz3f09
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 16:38:38 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-bacf9edc87bso1758997276.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 23:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685687915; x=1688279915;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tpZOczBsR4xfXgaOr7JAksIfJeH0zAVR4HOmdqn2WnM=;
        b=MQbltgtZnpxjctQr+uFVsewY5VE5NXUP+fgzpdshkW8VMDLi/jmX8Tm6cJEVN75KO5
         eMzQQeVHyaOg5im7MqrpVvZmNtbY70bJPquEYjFZnpqOQiwh3ggGEuUZOqPQRJyrYh/W
         i+iggUJfR2oZ0kl76ZzZLWFVADgUlsLiALbp15wr01z/YGZ4gs3TU2SO+DR0aQhnSTOT
         dtI6TRsVuo4JEZoVSXAGY14e1RV+60jnzQrNU20RmPK7rqniXU/2wk1vKjSgTxR1Jys6
         GAfhWX9n0uNxF5CP8nHZ8MEGqQL56HNKZn101HF3ximV36n96JF/CdcYDCKEOlrhAPpq
         +j9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685687915; x=1688279915;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tpZOczBsR4xfXgaOr7JAksIfJeH0zAVR4HOmdqn2WnM=;
        b=HyI+nlCNovSbXerJi8kfCbSb7reelG/N9r3aTSzqGf9FNNZNyK9N4kCCA/4/Fhzl7w
         SxvP04yplNVgsI8CXLtmGV3TDP/O33sRyf8cubbSNgF75umI0qGvIoYs9AuD1hF2nGhz
         eC2wbUTWgira8YhZitF+gpg6W/heEuJmM7HF+aQ0l6WJdRnBtnlS3YdFCxrvTW/9iYan
         BO2RXIXpasUmbw7fH5odUeXK+PECzjL6wQWealhTRPs9MMnJ1yf2i/6dpJNCO5CNv4SW
         eBu34DEew0vN40USGIRLuxYnjWme3qw3ZjPOMSKJgwXgduF7JFlr9feeFqiAMmYdTIQD
         gj1w==
X-Gm-Message-State: AC+VfDzprRFskAoHJ2NgXPDy9avLsJ4NmVv7zQxfKU3IMvwbE35lL4Vj
	xsuEdhBtpKdRDioSQjWG/cPIiQ==
X-Google-Smtp-Source: ACHHUZ6P8SSTMurOYYj/ALnVvhi3BuZn/ynwQtygsqQ/alJ03V+5vTPE5OsmNbOnOcV3aojCWBT3dw==
X-Received: by 2002:a81:a50c:0:b0:55d:afe6:ebcf with SMTP id u12-20020a81a50c000000b0055dafe6ebcfmr10875964ywg.46.1685687915164;
        Thu, 01 Jun 2023 23:38:35 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id v16-20020a814810000000b005688deeefc2sm199574ywa.20.2023.06.01.23.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 23:38:34 -0700 (PDT)
Date: Thu, 1 Jun 2023 23:38:30 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Subject: Re: [PATCH 05/12] powerpc: add pte_free_defer() for pgtables sharing
 page
In-Reply-To: <20230601155751.7c949ca4@thinkpad-T15>
Message-ID: <d6af2345-40b0-e6fc-56d2-bce778632da9@google.com>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com> <28eb289f-ea2c-8eb9-63bb-9f7d7b9ccc11@google.com> <ZHSwWgLWaEd+zi/g@casper.infradead.org> <a8df11d-55ae-64bc-edcb-d383a7a941ea@google.com> <20230601155751.7c949ca4@thinkpad-T15>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@solee
 n.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 1 Jun 2023, Gerald Schaefer wrote:
> On Mon, 29 May 2023 07:36:40 -0700 (PDT)
> Hugh Dickins <hughd@google.com> wrote:
> > On Mon, 29 May 2023, Matthew Wilcox wrote:
> > > On Sun, May 28, 2023 at 11:20:21PM -0700, Hugh Dickins wrote:  
> > > > +void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
> > > > +{
> > > > +	struct page *page;
> > > > +
> > > > +	page = virt_to_page(pgtable);
> > > > +	call_rcu(&page->rcu_head, pte_free_now);
> > > > +}  
> > > 
> > > This can't be safe (on ppc).  IIRC you might have up to 16x4k page
> > > tables sharing one 64kB page.  So if you have two page tables from the
> > > same page being defer-freed simultaneously, you'll reuse the rcu_head
> > > and I cannot imagine things go well from that point.  
> > 
> > Oh yes, of course, thanks for catching that so quickly.
> > So my s390 and sparc implementations will be equally broken.
> > 
> > > 
> > > I have no idea how to solve this problem.  
> > 
> > I do: I'll have to go back to the more complicated implementation we
> > actually ran with on powerpc - I was thinking those complications just
> > related to deposit/withdraw matters, forgetting the one-rcu_head issue.
> > 
> > It uses large (0x10000) increments of the page refcount, avoiding
> > call_rcu() when already active.
> > 
> > It's not a complication I had wanted to explain or test for now,
> > but we shall have to.  Should apply equally well to sparc, but s390
> > more of a problem, since s390 already has its own refcount cleverness.
> 
> Yes, we have 2 pagetables in one 4K page, which could result in same
> rcu_head reuse. It might be possible to use the cleverness from our
> page_table_free() function, e.g. to only do the call_rcu() once, for
> the case where both 2K pagetable fragments become unused, similar to
> how we decide when to actually call __free_page().

Yes, I expect that it will be possible to mesh in with s390's cleverness
there; but I may not be clever enough to do so myself - it was easier to
get right by going my own way - except that the multiply-used rcu_head
soon showed that I'd not got it right at all :-(

> 
> However, it might be much worse, and page->rcu_head from a pagetable
> page cannot be used at all for s390, because we also use page->lru
> to keep our list of free 2K pagetable fragments. I always get confused
> by struct page unions, so not completely sure, but it seems to me that
> page->rcu_head would overlay with page->lru, right?

However, I believe you are right that it's worse.  I'm glad to hear
that you get confused by the struct page unions, me too, I preferred the
old pre-union days when we could see at a glance which fields overlaid.
(Perhaps I'm nostalgically exaggerating that "see at a glance" ease.)

But I think I remember the discussions when rcu_head, and compound_head
at lru.next, came in: with the agreement that rcu_head.next would at
least be 2-aligned to avoid PageTail - ah, it's even commented in the
fundamental include/linux/types.h.

Sigh.  I don't at this moment know what to do for s390:
it is frustrating to be held up by just the one architecture.
But big thanks to you, Gerald, for bringing this to light.

Hugh

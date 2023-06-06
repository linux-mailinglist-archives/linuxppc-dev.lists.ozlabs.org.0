Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E79B1724C15
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 21:04:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbKf94zCpz3f7F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 05:04:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AFuQrzjW;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ixywks/5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AFuQrzjW;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ixywks/5;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbKdF0SVGz3cjY
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 05:03:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686078218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bmPwhcLQLS6QAOJhnaZRrlptzdg2mUtfNMjjPY6LfS8=;
	b=AFuQrzjWZt9DInEY1lFNe2Dkl2jWUeOnZvEx5qHaeGepugKSmH3uiA6RXeZM6tL2ddVh48
	DmlcdnHCQCHqUaJaJTJi4xa7fyWwzBuf0roPU+B8OJVu5y5PjQqcZGmW0Z02eAWTJ5Qn2d
	evCVBAC6WjTzbhU7/EYtMPaLsJ+bbMg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686078219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bmPwhcLQLS6QAOJhnaZRrlptzdg2mUtfNMjjPY6LfS8=;
	b=Ixywks/5q2Dkjdxe/1P1jArLDrquO2XlluTEvpyQblc2F5MfZa8hmG/7Gde274weT2Y2m/
	ExgOi3XLZv2fcLvTqU13x+L/VWrkRiXyiRNmLXp2CuEagxYYxU/2IRWKQxb/Y1j32/LiTA
	uu/0XmqbTOoNr9rsbA1HXS0hqFekeCA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-EmGxPcuOMue9JpXo1eylpQ-1; Tue, 06 Jun 2023 15:03:37 -0400
X-MC-Unique: EmGxPcuOMue9JpXo1eylpQ-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-75e681229c5so62267185a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 12:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686078216; x=1688670216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmPwhcLQLS6QAOJhnaZRrlptzdg2mUtfNMjjPY6LfS8=;
        b=mEjaFVBwCmvc11iFH72xp7JP/3QWZF82OCj0QhsQ7j1PYPg2lEc1Uq9ykSbz9lNQYA
         TkzU9Af8mZEDx5wecso0CDg32pIgMTK/qSW/ey8FEuZh9+BktJESAX61veKXZuWHNPHb
         ctzb3U6VG8AzdEO/BMZvSI/AiagllzvBA4ZzaaYpql7G+fX+weXvcdkBPkhAYefU2jYZ
         Sg26J3oP8Njx0WSJ1hY1bRnSvKvoAo8JjQp7icLsTLFyeiLo3ZIF7t+9k3t2k1YtsT52
         c6rRCEeq7SDuTuJfHjN8h5WUPmstUYJPGIkD7BHBRAPAxwonx9/Ujm1GcAHwSes3LC7u
         Gv4w==
X-Gm-Message-State: AC+VfDzzdNiiRb1BknkPSj2u9BVxI1ot1UBsjUCZK/1ly1AjnwdH8nkU
	oXBtRIVSxxlPGi64kK2KkM9es5sltKCFvE4S6gC+BiwHVU0xT8X9SsF+nrAywSV1OFiUqgru8oY
	f5AH42iWPS8apzCcLJ3pY71DZvw==
X-Received: by 2002:a05:620a:2b92:b0:75b:23a1:69f0 with SMTP id dz18-20020a05620a2b9200b0075b23a169f0mr3107594qkb.7.1686078216679;
        Tue, 06 Jun 2023 12:03:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5C5YMccZA+iUS9RAssWOgobvDgS7+Te3WrU+7dZkM3FviCtXVqQlWbzikNWhoOiLhOPK8t2g==
X-Received: by 2002:a05:620a:2b92:b0:75b:23a1:69f0 with SMTP id dz18-20020a05620a2b9200b0075b23a169f0mr3107557qkb.7.1686078216403;
        Tue, 06 Jun 2023 12:03:36 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com. [99.254.144.39])
        by smtp.gmail.com with ESMTPSA id d14-20020a05620a166e00b0074636e35405sm5100311qko.65.2023.06.06.12.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 12:03:35 -0700 (PDT)
Date: Tue, 6 Jun 2023 15:03:31 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 05/12] powerpc: add pte_free_defer() for pgtables sharing
 page
Message-ID: <ZH+DAxLhIYpTlIFc@x1n>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
 <28eb289f-ea2c-8eb9-63bb-9f7d7b9ccc11@google.com>
 <ZHSwWgLWaEd+zi/g@casper.infradead.org>
 <ZHn6n5eVTsr4Wl8x@ziepe.ca>
 <4df4909f-f5dd-6f94-9792-8f2949f542b3@google.com>
 <ZH95oobIqN0WO5MK@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <ZH95oobIqN0WO5MK@ziepe.ca>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Anshuman Khandual <anshuman.khandual@arm.com>
 , Heiko Carstens <hca@linux.ibm.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Zack Rusin <zackr@vmware.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 06, 2023 at 03:23:30PM -0300, Jason Gunthorpe wrote:
> On Mon, Jun 05, 2023 at 08:40:01PM -0700, Hugh Dickins wrote:
> 
> > diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
> > index 20652daa1d7e..e4f58c5fc2ac 100644
> > --- a/arch/powerpc/mm/pgtable-frag.c
> > +++ b/arch/powerpc/mm/pgtable-frag.c
> > @@ -120,3 +120,54 @@ void pte_fragment_free(unsigned long *table, int kernel)
> >  		__free_page(page);
> >  	}
> >  }
> > +
> > +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > +#define PTE_FREE_DEFERRED 0x10000 /* beyond any PTE_FRAG_NR */
> > +
> > +static void pte_free_now(struct rcu_head *head)
> > +{
> > +	struct page *page;
> > +	int refcount;
> > +
> > +	page = container_of(head, struct page, rcu_head);
> > +	refcount = atomic_sub_return(PTE_FREE_DEFERRED - 1,
> > +				     &page->pt_frag_refcount);
> > +	if (refcount < PTE_FREE_DEFERRED) {
> > +		pte_fragment_free((unsigned long *)page_address(page), 0);
> > +		return;
> > +	}
> 
> From what I can tell power doesn't recycle the sub fragment into any
> kind of free list. It just waits for the last fragment to be unused
> and then frees the whole page.
> 
> So why not simply go into pte_fragment_free() and do the call_rcu directly:
> 
> 	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
> 	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
> 		if (!kernel)
> 			pgtable_pte_page_dtor(page);
> 		call_rcu(&page->rcu_head, free_page_rcu)

We need to be careful on the lock being freed in pgtable_pte_page_dtor(),
in Hugh's series IIUC we need the spinlock being there for the rcu section
alongside the page itself.  So even if to do so we'll need to also rcu call 
pgtable_pte_page_dtor() when needed.

-- 
Peter Xu


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4937724C92
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 21:09:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbKlm3JMQz3bkD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 05:09:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FJFr/wVI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FJFr/wVI;
	dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbKkx61Qlz3dqw
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 05:08:41 +1000 (AEST)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6b280319df5so1761033a34.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 12:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1686078518; x=1688670518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IBKThEgW3NTUkiZRvoX00WYF0JkCsCOEnA4ezJ54Iw0=;
        b=FJFr/wVIfPdoTjvHgpxP3od5kCmSMH1Z0JrOBWgah9N0Buw0Lqq2GUP2GVXw6WOiRh
         c++a4+grcHjQUmrxZiqzadYduVRf1CjUAli+D+QVPy9jcNL51cCAxEPrkdxnOFwEvhnb
         yJu3DX76dubw3UjpXKmY8bLxybb3MkH1N7SDa2D3lfFWRbwwkD/iwvDq5Rbs4pKZHixV
         RtekPOxZJPk6BJtOGDh+2UFQd8Mq/YXw/gd5ayUOvGPplgDFeju7Fn5HsUTFW/r4mQOQ
         KmK3lw44ULOSI0p8hKsZ+RHFSRdJo1L5kdi+DoAT49/RG5m4rt+DVmg8pGjnsJ3eO7lg
         Wt/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686078518; x=1688670518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBKThEgW3NTUkiZRvoX00WYF0JkCsCOEnA4ezJ54Iw0=;
        b=bt2wtK668Pgh+fdcFTRwoatPgDgfQQFxAtT3IdiKM9qNUxD/MfP5eM352toBlmtY1O
         Htg41e78/7dPOh+MaTGXJFQsIEwfj+jQuyHyg6Ba7ZlmeNjRvB20TdOTbkcTNsgatlCh
         KcripggX7Ihv5BAizcujyQ2caIVghYCDwHAIZeTnJtK3TYFCRE3vPb/zB8R3AdEi3Pae
         Q6hzSSK+8MTlmVXaagrR/39b+SEYzgkdadNjWokCMmvesRxAC29qx5mcDORKqQ6GqC4/
         IRCxYFwql9X76ICMmAcqOnH/Bqah8+ekszM9PNTxapwj5F2boX/hwcRg+UQ5+o2QfJmt
         /feg==
X-Gm-Message-State: AC+VfDxvhneEdjOF6uPmiaRfQgkchrOgRrMwgrhIJZ5vMYwWYOuODr+i
	wr5rcfnrMIRTXMzVTgP38MRUZA==
X-Google-Smtp-Source: ACHHUZ48+nKNEQNTWy8wtaVIu/9suMpGBPu4hlCMZiSBnV9dLjpuiCkwZXnEA6HwkSqHl0CVdHIYlw==
X-Received: by 2002:a05:6358:c407:b0:11b:3e4d:a203 with SMTP id ff7-20020a056358c40700b0011b3e4da203mr614356rwb.23.1686078517796;
        Tue, 06 Jun 2023 12:08:37 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id f36-20020a631f24000000b0051f14839bf3sm7777289pgf.34.2023.06.06.12.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 12:08:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1q6c2k-0030xL-9k;
	Tue, 06 Jun 2023 16:08:34 -0300
Date: Tue, 6 Jun 2023 16:08:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 05/12] powerpc: add pte_free_defer() for pgtables sharing
 page
Message-ID: <ZH+EMp9RuEVOjVNb@ziepe.ca>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
 <28eb289f-ea2c-8eb9-63bb-9f7d7b9ccc11@google.com>
 <ZHSwWgLWaEd+zi/g@casper.infradead.org>
 <ZHn6n5eVTsr4Wl8x@ziepe.ca>
 <4df4909f-f5dd-6f94-9792-8f2949f542b3@google.com>
 <ZH95oobIqN0WO5MK@ziepe.ca>
 <ZH+DAxLhIYpTlIFc@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZH+DAxLhIYpTlIFc@x1n>
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

On Tue, Jun 06, 2023 at 03:03:31PM -0400, Peter Xu wrote:
> On Tue, Jun 06, 2023 at 03:23:30PM -0300, Jason Gunthorpe wrote:
> > On Mon, Jun 05, 2023 at 08:40:01PM -0700, Hugh Dickins wrote:
> > 
> > > diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
> > > index 20652daa1d7e..e4f58c5fc2ac 100644
> > > --- a/arch/powerpc/mm/pgtable-frag.c
> > > +++ b/arch/powerpc/mm/pgtable-frag.c
> > > @@ -120,3 +120,54 @@ void pte_fragment_free(unsigned long *table, int kernel)
> > >  		__free_page(page);
> > >  	}
> > >  }
> > > +
> > > +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > > +#define PTE_FREE_DEFERRED 0x10000 /* beyond any PTE_FRAG_NR */
> > > +
> > > +static void pte_free_now(struct rcu_head *head)
> > > +{
> > > +	struct page *page;
> > > +	int refcount;
> > > +
> > > +	page = container_of(head, struct page, rcu_head);
> > > +	refcount = atomic_sub_return(PTE_FREE_DEFERRED - 1,
> > > +				     &page->pt_frag_refcount);
> > > +	if (refcount < PTE_FREE_DEFERRED) {
> > > +		pte_fragment_free((unsigned long *)page_address(page), 0);
> > > +		return;
> > > +	}
> > 
> > From what I can tell power doesn't recycle the sub fragment into any
> > kind of free list. It just waits for the last fragment to be unused
> > and then frees the whole page.
> > 
> > So why not simply go into pte_fragment_free() and do the call_rcu directly:
> > 
> > 	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
> > 	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
> > 		if (!kernel)
> > 			pgtable_pte_page_dtor(page);
> > 		call_rcu(&page->rcu_head, free_page_rcu)
> 
> We need to be careful on the lock being freed in pgtable_pte_page_dtor(),
> in Hugh's series IIUC we need the spinlock being there for the rcu section
> alongside the page itself.  So even if to do so we'll need to also rcu call 
> pgtable_pte_page_dtor() when needed.

Er yes, I botched that, the dtor and the free_page should be in a the
rcu callback function

Jason

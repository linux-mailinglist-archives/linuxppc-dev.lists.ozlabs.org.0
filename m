Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D1C7492C7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 02:53:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=xC2HINTq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxJ1l3Ng2z3bwk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 10:53:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=xC2HINTq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxJ0q1QWcz303Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 10:52:57 +1000 (AEST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5768a7e3adbso20064707b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jul 2023 17:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688604771; x=1691196771;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=brYvfzxZIpzg2ekRWtSDETsKA5c6SQ0IrxunDSGxGEc=;
        b=xC2HINTq+WsZ6bkXuW3ZbQpuGJQPT0iM01isllTqlWtK8a2fGIX46T+CbpEjT8G16s
         qDwnKfQKJVRy3oyeXo3yIpwxKde63vyF9pF0VSWiUoHLL8dLOXgHf+38v8oCfcvJw4Er
         ejlXEu+OTpfpAhBvOyVGD80VixV4DfU44J6sigPGD6rA2/MjKGssOiRnE44ygD7T63vp
         t+E6BvJuJrICBNXpe1Szr6pynzSjeStiuBoj25z5M9pljiFW7x7bX1duA718XuUIxoIv
         aPIZ+mwTRAfYj6FjsOtWyUjzjmTTqQ+MgOlxxBZxAlxSWo3w6TfWylHqInFCKAu2bu68
         t/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688604771; x=1691196771;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=brYvfzxZIpzg2ekRWtSDETsKA5c6SQ0IrxunDSGxGEc=;
        b=V4Kb+MWsH6TGZBJXyaXw6/OBMGKz7CVigRnIaeXt7tpi2j83jcvSj8uyhrUAzrRV+f
         gpNj9D8GJAleDVxIkTMHaNh3ytc7thDoJhkL/eQ6olEOKXS39ziphQYx+q1n5TAUwm5U
         SpR3/LUI6ZH4ukE3w6kXalIIYIs8LHYKtHzFT876iVxzubywVSQhCxf4jQik0xwMNy5z
         62QKN6iprpZm7h2gVcROaxK6o3+4UIVKSIVIef+8g6alukruzozfYcPi/CkQ4Xoq3SVh
         VVhVRuF6iAFmuX6lmu2usb3aS0Ke85pxcvlrf5z3uB0zn3oL2xji3SuYsEK+tNLimU4l
         6IOQ==
X-Gm-Message-State: ABy/qLYB8U/ZCUEdDaMnC+YQ5uLN2w8hkR/saw5Q/U2ZyolnDrGou431
	Jr4l6jm/pylpoG3XLZSccqnZoA==
X-Google-Smtp-Source: APBJJlGRAVoxAYVowQcijWwmVf4ESHfCTlO+TpznIilMWn3o7JH0E6ojbd/bR9jPjq/VIj7YN/NLDQ==
X-Received: by 2002:a0d:dfca:0:b0:56c:fbd2:edec with SMTP id i193-20020a0ddfca000000b0056cfbd2edecmr557929ywe.6.1688604771513;
        Wed, 05 Jul 2023 17:52:51 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id o207-20020a0dccd8000000b00568c1c919d2sm29463ywd.29.2023.07.05.17.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 17:52:51 -0700 (PDT)
Date: Wed, 5 Jul 2023 17:52:40 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH v2 07/12] s390: add pte_free_defer() for pgtables sharing
 page
In-Reply-To: <ZKUR0HItN2Va8J1D@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Message-ID: <8c6a4a46-2d17-8cfb-50f-f89f1d44973f@google.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com> <a722dbec-bd9e-1213-1edd-53cd547aa4f@google.com> <20230628211624.531cdc58@thinkpad-T15> <cd7c2851-1440-7220-6c53-16b343b1474@google.com> <ZJ2hsM5Tn+yUZ5ZV@ziepe.ca> <20230629175645.7654d0a8@thinkpad-T15>
 <edaa96f-80c1-1252-acbb-71c4f045b035@google.com> <7bef5695-fa4a-7215-7e9d-d4a83161c7ab@google.com> <ZKUR0HItN2Va8J1D@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.co
 m>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 5 Jul 2023, Alexander Gordeev wrote:
> On Sat, Jul 01, 2023 at 09:32:38PM -0700, Hugh Dickins wrote:
> > On Thu, 29 Jun 2023, Hugh Dickins wrote:
> 
> Hi Hugh,
> 
> ...
> 
> > +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > +void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
> > +{
> > +	struct page *page;
> 
> If I got your and Claudio conversation right, you were going to add
> here WARN_ON_ONCE() in case of mm_alloc_pgste(mm)?

Well, Claudio approved, so I would have put it in, if we had stuck with
that version which had "if (mm_alloc_pgste(mm)) {" in pte_free_defer();
but once that went away, it became somewhat irrelevant... to me anyway.

But I don't mind adding it here, in the v3 I'll post when -rc1 is out,
if it might help you guys - there is some point, since pte_free_defer()
is a route which can usefully check for such a case, without confusion
from harmless traffic from immediate frees of just-in-case allocations.

But don't expect it to catch all such cases (if they exist): another
category of s390 page_table_free()s comes from the PageAnon
zap_deposited_table() in zap_huge_pmd(): those tables might or might
not have been exposed to userspace at some time in the past.

I'll add the WARN_ON_ONCE in pte_free_defer() (after checking that
WARN_ON_ONCE is the one we want - I get confused by all the different
flavours of WARN, and have to check the header file each time to be
sure of the syntax and semantics): but be aware that it won't be
checking all potential cases.

Hugh

> 
> > +	page = virt_to_page(pgtable);
> > +	SetPageActive(page);
> > +	page_table_free(mm, (unsigned long *)pgtable);
> > +}
> > +#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> > +
> >  /*
> >   * Base infrastructure required to generate basic asces, region, segment,
> >   * and page tables that do not make use of enhanced features like EDAT1.
> 
> Thanks!

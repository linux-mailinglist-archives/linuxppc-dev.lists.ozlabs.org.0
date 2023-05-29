Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00560714C43
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 16:37:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVJ5z5ddrz3fGL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 00:37:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=hcjUS9Az;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=hcjUS9Az;
	dkim-atps=neutral
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVJ563Mfyz2xZp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 00:36:57 +1000 (AEST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-565de553de1so27501367b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 07:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685371013; x=1687963013;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HIWQIR7wu23EvgpQrMt3Yo6E002JcBFAWWYI7+iQQZo=;
        b=hcjUS9Azm3/0RU+gKaiie6ZifVpF/OCAFapGW8HSxUO0W2rMy4ULofPLAkozr5dK65
         BDXwIAbVAuU/9a+lI2H3m13nnKdLi9zmmQuy+OAud0Tyk7LSzBGneDZiQGCG1giRjNu9
         uNLOY9ugLp7w4phKfq/dZQoeuFCLLe61eTU31G57MHbDfFRtSZLl49v+kfNWsWi5cnow
         WBeAUiF/9G+YnMzJ93YlNpiESaX402fmYTQ9v4+kFDL9TaoSMswWpzsbP6ko87Ro2qDL
         jCa+etQGtPqZWRpF5v3idcRSj250qlhVNpCbJ+mqK5gUOrh2LrGExHBOAMEBuLDEOBy2
         RzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685371013; x=1687963013;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HIWQIR7wu23EvgpQrMt3Yo6E002JcBFAWWYI7+iQQZo=;
        b=gnKO2bKQD4Wur2JX57tTlZDjRZWaz88uxwC6Wst5Mqku0WEU5GSAxD8R8n1VX1UwvH
         ThBudx6n+isyFRZtpIIuUWUIP3uDv/xio+de4PssccGWn0kdIRtUjCD7i7u04kYl6Sf5
         UOHIeGQ6++xyS/8rnsQnOwC/fwue6wuadvDJsUsgbzkiZjepLRi09tVQR3o5zujrlE77
         /zbs8Gg1rBbo0qmyLwQOTFSjKhHgO4ot64bCC10SmY7NLmsrlqging2wTX4C1YdIzcVu
         KS9Btpd6FRcaL/jeHFHK8AlnlbFeC0SO//Ezw/wxNfryRa0SFjcTk11F56zRScbOSAeE
         f4UQ==
X-Gm-Message-State: AC+VfDwBesn/a21ZTzmbomBY+ZaVKZba1bz7eK0wLQyjUU6Ds79BJ97e
	te5RxUkOy7NNkJ5DCqshmbUB5g==
X-Google-Smtp-Source: ACHHUZ7JQdplHPjQnLsPrFKY4x7o6203nPCvCFds9aIA594vHBEun4NndGVaRztw2DY/LseAyCeavw==
X-Received: by 2002:a81:a60a:0:b0:565:350f:3332 with SMTP id i10-20020a81a60a000000b00565350f3332mr10401354ywa.9.1685371012657;
        Mon, 29 May 2023 07:36:52 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id u189-20020a0dd2c6000000b00559be540b56sm3639714ywd.134.2023.05.29.07.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 07:36:52 -0700 (PDT)
Date: Mon, 29 May 2023 07:36:40 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 05/12] powerpc: add pte_free_defer() for pgtables sharing
 page
In-Reply-To: <ZHSwWgLWaEd+zi/g@casper.infradead.org>
Message-ID: <a8df11d-55ae-64bc-edcb-d383a7a941ea@google.com>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com> <28eb289f-ea2c-8eb9-63bb-9f7d7b9ccc11@google.com> <ZHSwWgLWaEd+zi/g@casper.infradead.org>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heik
 o Carstens <hca@linux.ibm.com>, Peter Xu <peterx@redhat.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Zack Rusin <zackr@vmware.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 29 May 2023, Matthew Wilcox wrote:
> On Sun, May 28, 2023 at 11:20:21PM -0700, Hugh Dickins wrote:
> > +void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
> > +{
> > +	struct page *page;
> > +
> > +	page = virt_to_page(pgtable);
> > +	call_rcu(&page->rcu_head, pte_free_now);
> > +}
> 
> This can't be safe (on ppc).  IIRC you might have up to 16x4k page
> tables sharing one 64kB page.  So if you have two page tables from the
> same page being defer-freed simultaneously, you'll reuse the rcu_head
> and I cannot imagine things go well from that point.

Oh yes, of course, thanks for catching that so quickly.
So my s390 and sparc implementations will be equally broken.

> 
> I have no idea how to solve this problem.

I do: I'll have to go back to the more complicated implementation we
actually ran with on powerpc - I was thinking those complications just
related to deposit/withdraw matters, forgetting the one-rcu_head issue.

It uses large (0x10000) increments of the page refcount, avoiding
call_rcu() when already active.

It's not a complication I had wanted to explain or test for now,
but we shall have to.  Should apply equally well to sparc, but s390
more of a problem, since s390 already has its own refcount cleverness.

Thanks, I must dash, out much of the day.

Hugh

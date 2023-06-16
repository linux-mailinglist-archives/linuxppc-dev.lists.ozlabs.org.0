Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF05733B06
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 22:39:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=QBNdm8qv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjWH45dfYz3c01
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 06:39:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=QBNdm8qv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjWG80jVpz3bZK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 06:38:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fw74FAZhkocnJnJyLR/WQNNOz26kiObyhL++hGG0nWw=; b=QBNdm8qv6j/A/iWrMKfpB6M7G8
	dX02GHdjAg9rPGckqaKAq0nuLHgnEOZOUcT5iS1KFKrWFBJlTrkF2I4g5N2YgCfsexrQECwyFoHPp
	z6yd+/vIl/PequagU7pGV8UNE2yhdOrdkDT+t3SJSVONZj6Q1cQWhoxiK+7FUVh/Fb17OdOH8kjtt
	OWIuj2P4ze5K/i70TfCVLOSJSXO+Ry9WEoIoy6BlMNh0EJ1wlu/c8zXDIuEPPIicVlz2AV+6m8LDv
	lA4vOEDBJYuPKGoF8lu2OSuuFhx10iSF/LiB0UcYpqrALuMFJM02PbH03w+/bd9OLb/nrxdqasmpe
	J/m6D//w==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qAGD7-009Lj7-EI; Fri, 16 Jun 2023 20:38:21 +0000
Date: Fri, 16 Jun 2023 21:38:21 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v4 04/34] pgtable: Create struct ptdesc
Message-ID: <ZIzIPQBXvnMtQekj@casper.infradead.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-5-vishal.moola@gmail.com>
 <fd63179-6ad6-fd86-79d6-2833c91111f8@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd63179-6ad6-fd86-79d6-2833c91111f8@google.com>
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
Cc: kvm@vger.kernel.org, linux-sh@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-csky@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-openrisc@vger.kernel.org, linux-mips@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 15, 2023 at 12:57:19AM -0700, Hugh Dickins wrote:
> Probably just trivial collisions in most architectures, which either
> of us can easily adjust to the other; powerpc likely to be more awkward,
> but fairly easily resolved; s390 quite a problem.
> 
> I've so far been unable to post a v2 of my series (and powerpc and s390
> were stupidly wrong in the v1), because a good s390 patch is not yet
> decided - Gerald Schaefer and I are currently working on that, on the
> s390 list (I took off most Ccs until we are settled and I can post v2).
> 
> As you have no doubt found yourself, s390 has sophisticated handling of
> free half-pages already, and I need to add rcu_head usage in there too:
> it's tricky to squeeze it all in, and ptdesc does not appear to help us
> in any way (though mostly it's just changing some field names, okay).
> 
> If ptdesc were actually allowing a flexible structure which architectures
> could add into, that would (in some future) be nice; but of course at
> present it's still fitting it all into one struct page, and mandating
> new restrictions which just make an architecture's job harder.

The intent is to get ptdescs to be dynamically allocated at some point
in the ~2-3 years out future when we have finished the folio project ...
which is not a terribly helpful thing for me to say.

I have three suggestions, probably all dreadful:

1. s390 could change its behaviour to always allocate page tables in
pairs.  That is, it fills in two pmd_t entries any time it takes a fault
in either of them.

2. We could allocate two or four pages at a time for s390 to allocate
2kB pages from.  That gives us a lot more space to store RCU heads.

3. We could use s390 as a guinea-pig for dynamic ptdesc allocation.
Every time we allocate a struct page, we have a slab cache for an
s390-special definition of struct ptdesc, we allocate a ptdesc and store
a pointer to that in compound_head.

We could sweeten #3 by doing that not just for s390 but also for every
configuration which has ALLOC_SPLIT_PTLOCKS today.  That would get rid
of the ambiguity between "is ptl a pointer or a lock".

> But I've no desire to undo powerpc's use of pt_frag_refcount:
> just warning that we may want to undo any use of it in s390.

I would dearly love ppc & s390 to use the _same_ scheme to solve the
same problem.

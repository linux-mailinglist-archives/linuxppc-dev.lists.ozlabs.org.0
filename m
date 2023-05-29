Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0B6714B78
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 16:04:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVHMC6CJLz3fGG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 00:04:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=lDre3Kyc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=lDre3Kyc;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVHLQ1HJSz30QD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 00:03:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8n/gSgUfVLp+2xUxKUXJObyidN3fOaenRgCYrh0plbg=; b=lDre3KycVopHJgQtSVi6Ft0h2+
	/6KcXeh5DDgTYRWUam42o5WNWijcaqCZOd3dx2HAurqm8z1fldvnXLpCnoSy0NLLn08cXknKDuPGQ
	gYTInVr7Mv6sz5/UedpbbXKAgGCEtbEPUwJS3HU859+6q2mrf+Vst5r6bVYq4QYO4FOSwRHoda1Dn
	5iV/2BvS3JTHI2796pUfUpALVlmDgyKCBvF/8JWEkyCLv2cJ9H9RqEbD681UXQ5f6iLi2mlHWJs6k
	+YJbLW+C+/rFR09hhGpAEembhtRGCh+/zp9btJ5yU++252/kk/VTdEAS56sP+b2VQVAXRo/gquNr/
	Yo5hUC4w==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q3dRi-005SM1-Ch; Mon, 29 May 2023 14:02:02 +0000
Date: Mon, 29 May 2023 15:02:02 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH 05/12] powerpc: add pte_free_defer() for pgtables sharing
 page
Message-ID: <ZHSwWgLWaEd+zi/g@casper.infradead.org>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
 <28eb289f-ea2c-8eb9-63bb-9f7d7b9ccc11@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28eb289f-ea2c-8eb9-63bb-9f7d7b9ccc11@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, P
 eter Xu <peterx@redhat.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Zack Rusin <zackr@vmware.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 28, 2023 at 11:20:21PM -0700, Hugh Dickins wrote:
> +void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
> +{
> +	struct page *page;
> +
> +	page = virt_to_page(pgtable);
> +	call_rcu(&page->rcu_head, pte_free_now);
> +}

This can't be safe (on ppc).  IIRC you might have up to 16x4k page
tables sharing one 64kB page.  So if you have two page tables from the
same page being defer-freed simultaneously, you'll reuse the rcu_head
and I cannot imagine things go well from that point.

I have no idea how to solve this problem.

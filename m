Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E04F714B49
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 15:59:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVHFn1yXBz3f7v
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 23:59:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=fuY62XaN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=fuY62XaN;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVHDs1mx1z3bbZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 23:58:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=daJr36z+xkb/H/fiOexwZNK30Bl/V66a5KNArnHZvM8=; b=fuY62XaNQ1pid4PNx3bW9OvYFH
	W2MZp/QZXjFmThuV9a1DJcWOd+JYQNxPMJygXk9c0KUuaPqy0M9u/r+Vs27UTvHbWDtYVnA+RTTp6
	jB78eAY5YpAKoIS/61GR1/oSnkSEWJbGBUTSyEmZ9+18f/mzDRAupMRvltvNWDYeS4BcrG9tm2BJf
	9eiEdU9vtilsjcpBoR5QNebyugV+d/7DnGaOatu9kYBzf4L0AOTycICgaBuWc/MrIP0hG9cSOgII0
	Ru6GHGxtFSG/YbqlMBCcSBH4IipXcVzJCce6Tp4PdiiqApnnSuEbaBiJJr4ds9zEpfuv9ZaAXKVgR
	jTQB7oWw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q3dMZ-005SA0-VJ; Mon, 29 May 2023 13:56:44 +0000
Date: Mon, 29 May 2023 14:56:43 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH 02/12] mm/pgtable: add PAE safety to __pte_offset_map()
Message-ID: <ZHSvG8UIaq14I/5p@casper.infradead.org>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
 <923480d5-35ab-7cac-79d0-343d16e29318@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <923480d5-35ab-7cac-79d0-343d16e29318@google.com>
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

On Sun, May 28, 2023 at 11:16:16PM -0700, Hugh Dickins wrote:
> +#if defined(CONFIG_GUP_GET_PXX_LOW_HIGH) && \
> +	(defined(CONFIG_SMP) || defined(CONFIG_PREEMPT_RCU))
> +/*
> + * See the comment above ptep_get_lockless() in include/linux/pgtable.h:
> + * the barriers in pmdp_get_lockless() cannot guarantee that the value in
> + * pmd_high actually belongs with the value in pmd_low; but holding interrupts
> + * off blocks the TLB flush between present updates, which guarantees that a
> + * successful __pte_offset_map() points to a page from matched halves.
> + */
> +#define config_might_irq_save(flags)	local_irq_save(flags)
> +#define config_might_irq_restore(flags)	local_irq_restore(flags)
> +#else
> +#define config_might_irq_save(flags)
> +#define config_might_irq_restore(flags)

I don't like the name.  It should indicate that it's PMD-related, so
pmd_read_start(flags) / pmd_read_end(flags)?


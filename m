Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D19C988743E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 21:49:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=QVRAKzAU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1ZDw4BwFz3vgJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 07:49:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=QVRAKzAU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1ZD855YPz3vcb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 07:48:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5D07ECE182D;
	Fri, 22 Mar 2024 20:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52B0C433C7;
	Fri, 22 Mar 2024 20:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1711140499;
	bh=Uf9dSpYITp6bxdnwZZqCFp6GDVfEBgn7BjvTh1fsU0E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QVRAKzAUPqWp2P8fFfJjymQCiqf8/IWwd1wmqWmnRlxsqAjKHpKVO/2FMY54BdYVe
	 MtuhTuaPMg1SbalsaWAguHK6KathmRCmewglEhgp1kUsqyLrxGR7rhkCkBiCs/cIST
	 Foh0xWAZf8YKEf1Z8kAQrZNZWmXaYiyM/6VzFqZo=
Date: Fri, 22 Mar 2024 13:48:18 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: peterx@redhat.com
Subject: Re: [PATCH v3 12/12] mm/gup: Handle hugetlb in the generic
 follow_page_mask code
Message-Id: <20240322134818.9b312f77629f79fcf1564b6f@linux-foundation.org>
In-Reply-To: <20240321220802.679544-13-peterx@redhat.com>
References: <20240321220802.679544-1-peterx@redhat.com>
	<20240321220802.679544-13-peterx@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 21 Mar 2024 18:08:02 -0400 peterx@redhat.com wrote:

> From: Peter Xu <peterx@redhat.com>
> 
> Now follow_page() is ready to handle hugetlb pages in whatever form, and
> over all architectures.  Switch to the generic code path.
> 
> Time to retire hugetlb_follow_page_mask(), following the previous
> retirement of follow_hugetlb_page() in 4849807114b8.
> 
> There may be a slight difference of how the loops run when processing slow
> GUP over a large hugetlb range on cont_pte/cont_pmd supported archs: each
> loop of __get_user_pages() will resolve one pgtable entry with the patch
> applied, rather than relying on the size of hugetlb hstate, the latter may
> cover multiple entries in one loop.
> 
> A quick performance test on an aarch64 VM on M1 chip shows 15% degrade over
> a tight loop of slow gup after the path switched.  That shouldn't be a
> problem because slow-gup should not be a hot path for GUP in general: when
> page is commonly present, fast-gup will already succeed, while when the
> page is indeed missing and require a follow up page fault, the slow gup
> degrade will probably buried in the fault paths anyway.  It also explains
> why slow gup for THP used to be very slow before 57edfcfd3419 ("mm/gup:
> accelerate thp gup even for "pages != NULL"") lands, the latter not part of
> a performance analysis but a side benefit.  If the performance will be a
> concern, we can consider handle CONT_PTE in follow_page().
> 
> Before that is justified to be necessary, keep everything clean and simple.
> 

mm/gup.c:33:21: warning: 'follow_hugepd' declared 'static' but never defined [-Wunused-function]
   33 | static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
      |                     ^~~~~~~~~~~~~

--- a/mm/gup.c~mm-gup-handle-hugepd-for-follow_page-fix
+++ a/mm/gup.c
@@ -30,10 +30,12 @@ struct follow_page_context {
 	unsigned int page_mask;
 };
 
+#ifdef CONFIG_HAVE_FAST_GUP
 static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
 				  unsigned long addr, unsigned int pdshift,
 				  unsigned int flags,
 				  struct follow_page_context *ctx);
+#endif
 
 static inline void sanity_check_pinned_pages(struct page **pages,
 					     unsigned long npages)
_


This looks inelegant.

That's two build issues so far.  Please be more expansive in the
Kconfig variations when testing.  Especially when mucking with pgtable
macros.



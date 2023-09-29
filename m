Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 807DF7B3CCD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Sep 2023 00:56:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=H347bVg3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ry5LZ2Ztvz3chV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Sep 2023 08:56:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=H347bVg3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ry5Kk1xH5z30YZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Sep 2023 08:55:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 18EBCB8218B;
	Fri, 29 Sep 2023 22:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942E1C433C8;
	Fri, 29 Sep 2023 22:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1696028132;
	bh=KNRUE/bqgzjbX6niCi2O3ojYnR3wGKaiurwRPiLMZgU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H347bVg3Ycwc1wo6fcrd5Afmv52WRMyS8kXf5asP0Hop0dFWRmi9dccDtxsRfaMmr
	 beZRv2asIxXtXgsfyxef/3GiWLYzkObX9fg3zHh/V4JdY4gPbUHVu0w6DeGcUN0ej0
	 v1lvGNFIqjesuhlZ8VxDTlfZ0rzO1cdIF879OkVI=
Date: Fri, 29 Sep 2023 15:55:30 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v6 4/9] mm: thp: Introduce anon_orders and
 anon_always_mask sysfs files
Message-Id: <20230929155530.a51e68e03e47a06b6b84c689@linux-foundation.org>
In-Reply-To: <20230929114421.3761121-5-ryan.roberts@arm.com>
References: <20230929114421.3761121-1-ryan.roberts@arm.com>
	<20230929114421.3761121-5-ryan.roberts@arm.com>
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
Cc: linux-arm-kernel@lists.infradead.org, David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, John Hubbard <jhubbard@nvidia.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, David Hildenbrand <david@redhat.com>, Hugh Dickins <hughd@google.com>, Yin Fengwei <fengwei.yin@intel.com>, Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Luis Chamberlain <mcgrof@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>, "Huang, Ying" <ying.huang@intel.com>, Itaru Kitayama <itaru.kitayama@gmail.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 29 Sep 2023 12:44:15 +0100 Ryan Roberts <ryan.roberts@arm.com> wrote:

> In preparation for adding support for anonymous large folios that are
> smaller than the PMD-size, introduce 2 new sysfs files that will be used
> to control the new behaviours via the transparent_hugepage interface.
> For now, the kernel still only supports PMD-order anonymous THP, so when
> reading back anon_orders, it will reflect that. Therefore there are no
> behavioural changes intended here.

powerpc strikes again.  ARCH=powerpc allmodconfig:


In file included from ./include/linux/bits.h:6,
                 from ./include/linux/ratelimit_types.h:5,
                 from ./include/linux/printk.h:9,
                 from ./include/asm-generic/bug.h:22,
                 from ./arch/powerpc/include/asm/bug.h:116,
                 from ./include/linux/bug.h:5,
                 from ./include/linux/mmdebug.h:5,
                 from ./include/linux/mm.h:6,
                 from mm/huge_memory.c:8:
./include/vdso/bits.h:7:33: error: initializer element is not constant
    7 | #define BIT(nr)                 (UL(1) << (nr))
      |                                 ^
mm/huge_memory.c:77:47: note: in expansion of macro 'BIT'
   77 | unsigned int huge_anon_orders __read_mostly = BIT(PMD_ORDER);
      |                                               ^~~

We keep tripping over this.  I wish there was a way to fix it.



Style whine: an all-caps identifier is supposed to be a constant,
dammit.

	#define PTE_INDEX_SIZE  __pte_index_size

Nope.



I did this:

--- a/mm/huge_memory.c~mm-thp-introduce-anon_orders-and-anon_always_mask-sysfs-files-fix
+++ a/mm/huge_memory.c
@@ -74,7 +74,7 @@ static unsigned long deferred_split_scan
 static atomic_t huge_zero_refcount;
 struct page *huge_zero_page __read_mostly;
 unsigned long huge_zero_pfn __read_mostly = ~0UL;
-unsigned int huge_anon_orders __read_mostly = BIT(PMD_ORDER);
+unsigned int huge_anon_orders __read_mostly;
 static unsigned int huge_anon_always_mask __read_mostly;
 
 /**
@@ -528,6 +528,9 @@ static int __init hugepage_init_sysfs(st
 {
 	int err;
 
+	/* powerpc's PMD_ORDER isn't a compile-time constant */
+	huge_anon_orders = BIT(PMD_ORDER);
+
 	*hugepage_kobj = kobject_create_and_add("transparent_hugepage", mm_kobj);
 	if (unlikely(!*hugepage_kobj)) {
 		pr_err("failed to create transparent hugepage kobject\n");
_


I assume this is set up early enough.

I don't know why powerpc's PTE_INDEX_SIZE is variable.  Hopefully it
has been set up by this time and it won't get altered.  


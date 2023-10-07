Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D27DA7BCA68
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 00:55:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CyilkWGn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S30xS6DTmz3d26
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 09:55:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CyilkWGn;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S30wd5m7Cz3bPM
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Oct 2023 09:54:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1696719265;
	bh=nbk6q9Yf8RtraLdUwwm6uSKRHWkNNpARqVFKgzAyVkY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CyilkWGntWBxGsb8/XLbizmV96t6hMY+W0oQpxspY3WK2Zh0/R+joh7+C88GFimV3
	 6I5g2B4Dt2Xy+wj9DW/HuxK8tyxrSKxDPP7oNzaxvdscosPR/vDjlFPma8eZgFv6+G
	 uQ/RHEyrZOZ4Ga1RPNBGnPQAKoEcdrniyh0eOgpfh44rH+bJaeiBGUPMx8MWSQU7UY
	 LNh2tKDZ5Hn1nHnyTit7RGBb6gLwaex8nvFzsEQxmBY98k0X6xlE+Ot6LEQwu9o8dz
	 tlT32psHUtCIwAtIXIHSWPGI1WDqRVZQnxpg6bO5PFz5v8KTolLpb8r45OssLtfpBu
	 Ejp+7pALj8xzQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S30wb2SbSz4x7V;
	Sun,  8 Oct 2023 09:54:23 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrew Morton <akpm@linux-foundation.org>, Ryan Roberts
 <ryan.roberts@arm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v6 4/9] mm: thp: Introduce anon_orders and
 anon_always_mask sysfs files
In-Reply-To: <20230929155530.a51e68e03e47a06b6b84c689@linux-foundation.org>
References: <20230929114421.3761121-1-ryan.roberts@arm.com>
 <20230929114421.3761121-5-ryan.roberts@arm.com>
 <20230929155530.a51e68e03e47a06b6b84c689@linux-foundation.org>
Date: Sun, 08 Oct 2023 09:54:22 +1100
Message-ID: <87fs2mrqld.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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

Andrew Morton <akpm@linux-foundation.org> writes:
> On Fri, 29 Sep 2023 12:44:15 +0100 Ryan Roberts <ryan.roberts@arm.com> wrote:
>
>> In preparation for adding support for anonymous large folios that are
>> smaller than the PMD-size, introduce 2 new sysfs files that will be used
>> to control the new behaviours via the transparent_hugepage interface.
>> For now, the kernel still only supports PMD-order anonymous THP, so when
>> reading back anon_orders, it will reflect that. Therefore there are no
>> behavioural changes intended here.
>
> powerpc strikes again.  ARCH=powerpc allmodconfig:
>
>
> In file included from ./include/linux/bits.h:6,
>                  from ./include/linux/ratelimit_types.h:5,
>                  from ./include/linux/printk.h:9,
>                  from ./include/asm-generic/bug.h:22,
>                  from ./arch/powerpc/include/asm/bug.h:116,
>                  from ./include/linux/bug.h:5,
>                  from ./include/linux/mmdebug.h:5,
>                  from ./include/linux/mm.h:6,
>                  from mm/huge_memory.c:8:
> ./include/vdso/bits.h:7:33: error: initializer element is not constant
>     7 | #define BIT(nr)                 (UL(1) << (nr))
>       |                                 ^
> mm/huge_memory.c:77:47: note: in expansion of macro 'BIT'
>    77 | unsigned int huge_anon_orders __read_mostly = BIT(PMD_ORDER);
>       |                                               ^~~
>
> We keep tripping over this.  I wish there was a way to fix it.

I can't think of any solution, other than ripping the code out.

To catch it earlier we'd need a generic compile-time test that all values
derived from the page table geometry are only used in places that don't
require a constant. I can't think of a way to write a test for that.

Or submitters could compile-test for powerpc - one can dream :D

> Style whine: an all-caps identifier is supposed to be a constant,
> dammit.
>
> 	#define PTE_INDEX_SIZE  __pte_index_size
>
> Nope.

I agree it's ugly. It was done that way because PTE_INDEX_SIZE used to
be constant, and still is for 32-bit PPC and 64-bit Book3E PPC.

We could rename PTE_INDEX_SIZE itself, but we'd still have eg.
PTE_TABLE_SIZE which is used in generic code, and which would be
sometimes constant and sometimes not for different powerpc subarches.

> I did this:
>
> --- a/mm/huge_memory.c~mm-thp-introduce-anon_orders-and-anon_always_mask-sysfs-files-fix
> +++ a/mm/huge_memory.c
> @@ -74,7 +74,7 @@ static unsigned long deferred_split_scan
>  static atomic_t huge_zero_refcount;
>  struct page *huge_zero_page __read_mostly;
>  unsigned long huge_zero_pfn __read_mostly = ~0UL;
> -unsigned int huge_anon_orders __read_mostly = BIT(PMD_ORDER);
> +unsigned int huge_anon_orders __read_mostly;
>  static unsigned int huge_anon_always_mask __read_mostly;
>  
>  /**
> @@ -528,6 +528,9 @@ static int __init hugepage_init_sysfs(st
>  {
>  	int err;
>  
> +	/* powerpc's PMD_ORDER isn't a compile-time constant */
> +	huge_anon_orders = BIT(PMD_ORDER);
> +
>  	*hugepage_kobj = kobject_create_and_add("transparent_hugepage", mm_kobj);
>  	if (unlikely(!*hugepage_kobj)) {
>  		pr_err("failed to create transparent hugepage kobject\n");
> _
>
>
> I assume this is set up early enough.

Yes it should be.

> I don't know why powerpc's PTE_INDEX_SIZE is variable.

To allow a single vmlinux to boot using either the Hashed Page Table
MMU, or Radix Tree MMU, which have different page table geometry.

That's a pretty crucial feature for distros, so that they can build a
single kernel to boot on Power8/9/10.

cheers

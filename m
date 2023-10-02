Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BCF7B4FF9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 12:16:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RzcLN3zFYz3vcg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 21:16:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RzcKt5JYBz3c50
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Oct 2023 21:15:59 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52724C15;
	Mon,  2 Oct 2023 03:16:04 -0700 (PDT)
Received: from [10.57.66.79] (unknown [10.57.66.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A3983F762;
	Mon,  2 Oct 2023 03:15:22 -0700 (PDT)
Message-ID: <3fabc0ed-9f2e-4ad6-ac40-aabdacff1cf2@arm.com>
Date: Mon, 2 Oct 2023 11:15:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/9] mm: thp: Introduce anon_orders and
 anon_always_mask sysfs files
Content-Language: en-GB
To: Andrew Morton <akpm@linux-foundation.org>
References: <20230929114421.3761121-1-ryan.roberts@arm.com>
 <20230929114421.3761121-5-ryan.roberts@arm.com>
 <20230929155530.a51e68e03e47a06b6b84c689@linux-foundation.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20230929155530.a51e68e03e47a06b6b84c689@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
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

On 29/09/2023 23:55, Andrew Morton wrote:
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

Ahh my bad, sorry about that - I built various configs and arches but not powerpc.

> 
> We keep tripping over this.  I wish there was a way to fix it.
> 
> 
> 
> Style whine: an all-caps identifier is supposed to be a constant,
> dammit.
> 
> 	#define PTE_INDEX_SIZE  __pte_index_size
> 
> Nope.
> 
> 
> 
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

Yes this should be fine.

> 
> I don't know why powerpc's PTE_INDEX_SIZE is variable.  Hopefully it
> has been set up by this time and it won't get altered.  

Looks that way from the code; its set during early_init_mmu().

Anyway, I'll take the fix into my next spin if I need to do one. I see you've
taken it into mm-unstable - thanks! But given I'm introducing UABI, I was
expecting some comments and a probably need for a new rev. I'd like to think we
are getting there though.

Thanks,
Ryan


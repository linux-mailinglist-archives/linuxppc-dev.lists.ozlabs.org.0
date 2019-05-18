Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 533592235F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2019 13:17:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 455jLK6JYzzDqVV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2019 21:17:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 455jHW07wdzDq7j
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2019 21:15:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 455jHV6gjMz9s4V; Sat, 18 May 2019 21:15:02 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 455jHV6CgFz9s9N; Sat, 18 May 2019 21:15:02 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 7338874c337f01dc84597a5500a588732725ffc6
X-Patchwork-Hint: ignore
In-Reply-To: <20190514134321.25575-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/mm: Fix crashes with hugepages & 4K pages
Message-Id: <455jHV6CgFz9s9N@ozlabs.org>
Date: Sat, 18 May 2019 21:15:02 +1000 (AEST)
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
Cc: aneesh.kumar@linux.vnet.ibm.com, sachinp@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-05-14 at 13:43:21 UTC, Michael Ellerman wrote:
> The recent commit to cleanup ifdefs in the hugepage initialisation led
> to crashes when using 4K pages as reported by Sachin:
> 
>   BUG: Kernel NULL pointer dereference at 0x0000001c
>   Faulting instruction address: 0xc000000001d1e58c
>   Oops: Kernel access of bad area, sig: 11 [#1]
>   LE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
>   ...
>   CPU: 3 PID: 4635 Comm: futex_wake04 Tainted: G        W  O      5.1.0-next-20190507-autotest #1
>   NIP:  c000000001d1e58c LR: c000000001d1e54c CTR: 0000000000000000
>   REGS: c000000004937890 TRAP: 0300
>   MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 22424822  XER: 00000000
>   CFAR: c00000000183e9e0 DAR: 000000000000001c DSISR: 40000000 IRQMASK: 0
>   ...
>   NIP kmem_cache_alloc+0xbc/0x5a0
>   LR  kmem_cache_alloc+0x7c/0x5a0
>   Call Trace:
>     huge_pte_alloc+0x580/0x950
>     hugetlb_fault+0x9a0/0x1250
>     handle_mm_fault+0x490/0x4a0
>     __do_page_fault+0x77c/0x1f00
>     do_page_fault+0x28/0x50
>     handle_page_fault+0x18/0x38
> 
> This is caused by us trying to allocate from a NULL kmem cache in
> __hugepte_alloc(). The kmem cache is NULL because it was never
> allocated in hugetlbpage_init(), because add_huge_page_size() returned
> an error.
> 
> The reason add_huge_page_size() returned an error is a simple typo, we
> are calling check_and_get_huge_psize(size) when we should be passing
> shift instead.
> 
> The fact that we're able to trigger this path when the kmem caches are
> NULL is a separate bug, ie. we should not advertise any hugepage sizes
> if we haven't setup the required caches for them.
> 
> This was only seen with 4K pages, with 64K pages we don't need to
> allocate any extra kmem caches because the 16M hugepage just occupies
> a single entry at the PMD level.
> 
> Fixes: 723f268f19da ("powerpc/mm: cleanup ifdef mess in add_huge_page_size()")
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Tested-by: Sachin Sant <sachinp@linux.ibm.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Applied to powerpc fixes.

https://git.kernel.org/powerpc/c/7338874c337f01dc84597a5500a58873

cheers

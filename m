Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A51E84E575D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 18:23:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNwDG3sfhz3081
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 04:23:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org;
 receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNwCr6KXJz2xDD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 04:22:48 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 423D060B6A;
 Wed, 23 Mar 2022 17:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0EDCC340E8;
 Wed, 23 Mar 2022 17:22:42 +0000 (UTC)
Date: Wed, 23 Mar 2022 17:22:38 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ariel Marcovitch <arielmarcovitch@gmail.com>
Subject: Re: False positive kmemleak report for dtb properties names on powerpc
Message-ID: <YjtXXlnbEp64eL0T@arm.com>
References: <9dd08bb5-f39e-53d8-f88d-bec598a08c93@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9dd08bb5-f39e-53d8-f88d-bec598a08c93@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, paulus@samba.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ariel,

On Fri, Feb 18, 2022 at 09:45:51PM +0200, Ariel Marcovitch wrote:
> I was running a powerpc 32bit kernel (built using
> qemu_ppc_mpc8544ds_defconfig
> buildroot config, with enabling DEBUGFS+KMEMLEAK+HIGHMEM in the kernel
> config)
> on qemu and invoked the kmemleak scan (twice. for some reason the first time
> wasn't enough).
[...]
> I got 97 leak reports, all similar to the following:
[...]
> memblock_alloc lets kmemleak know about the allocated memory using
> kmemleak_alloc_phys (in mm/memblock.c:memblock_alloc_range_nid()).
> 
> The problem is with the following code (mm/kmemleak.c):
> 
> ```c
> 
> void __ref kmemleak_alloc_phys(phys_addr_t phys, size_t size, int min_count,
>                                gfp_t gfp)
> {
>         if (!IS_ENABLED(CONFIG_HIGHMEM) || PHYS_PFN(phys) < max_low_pfn)
>                 kmemleak_alloc(__va(phys), size, min_count, gfp);
> }
> 
> ```
> 
> When CONFIG_HIGHMEM is enabled, the pfn of the allocated memory is checked
> against max_low_pfn, to make sure it is not in the HIGHMEM zone.
> 
> However, when called through unflatten_device_tree(), max_low_pfn is not yet
> initialized in powerpc.
> 
> max_low_pfn is initialized (when NUMA is disabled) in
> arch/powerpc/mm/mem.c:mem_topology_setup() which is called only after
> unflatten_device_tree() is called in the same function (setup_arch()).
> 
> Because max_low_pfn is global it is 0 before initialization, so as far as
> kmemleak_alloc_phys() is concerned, every memory is HIGHMEM (: and the
> allocated memory is not tracked by kmemleak, causing references to objects
> allocated later with kmalloc() to be ignored and these objects are marked as
> leaked.

Thanks for digging into this. It looks like the logic doesn't work (not
sure whether it ever worked).

> I actually tried to find out whether this happen on other arches as well,
> and it seems like arm64 also have this problem when dtb is used instead of
> acpi, although I haven't had the chance to confirm this.

arm64 doesn't enable CONFIG_HIGHMEM, so it's not affected.

> I don't suppose I can just shuffle the calls in setup_arch() around, so I
> wanted to hear your opinions first

I think it's better if we change the logic than shuffling the calls.
IIUC MEMBLOCK_ALLOC_ACCESSIBLE means that __va() works on the phys
address return by memblock, so something like below (untested):

-------------8<----------------------
diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 7580baa76af1..f3599e857c13 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -1127,8 +1127,7 @@ EXPORT_SYMBOL(kmemleak_no_scan);
 void __ref kmemleak_alloc_phys(phys_addr_t phys, size_t size, int min_count,
 			       gfp_t gfp)
 {
-	if (!IS_ENABLED(CONFIG_HIGHMEM) || PHYS_PFN(phys) < max_low_pfn)
-		kmemleak_alloc(__va(phys), size, min_count, gfp);
+	kmemleak_alloc(__va(phys), size, min_count, gfp);
 }
 EXPORT_SYMBOL(kmemleak_alloc_phys);
 
diff --git a/mm/memblock.c b/mm/memblock.c
index b12a364f2766..2515bd4331e8 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1397,7 +1397,7 @@ phys_addr_t __init memblock_alloc_range_nid(phys_addr_t size,
 	 * Skip kmemleak for those places like kasan_init() and
 	 * early_pgtable_alloc() due to high volume.
 	 */
-	if (end != MEMBLOCK_ALLOC_NOLEAKTRACE)
+	if (end == MEMBLOCK_ALLOC_ACCESSIBLE)
 		/*
 		 * The min_count is set to 0 so that memblock allocated
 		 * blocks are never reported as leaks. This is because many
-------------8<----------------------

But I'm not sure whether we'd now miss some genuine allocations where
the memblock limit is different from MEMBLOCK_ALLOC_ACCESSIBLE but still
within the lowmem limit. If the above works, we can probably get rid of
some other kmemleak callbacks in the kernel.

Adding Mike for any input on memblock.

-- 
Catalin

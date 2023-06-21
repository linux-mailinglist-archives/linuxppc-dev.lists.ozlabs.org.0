Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7397379F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 05:52:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qkWxn4h+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qm8jH4zwNz3bYt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 13:52:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qkWxn4h+;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qm8hN326jz300t
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 13:52:04 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Qm8hM0kYcz4wgC;
	Wed, 21 Jun 2023 13:52:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1687319523;
	bh=ev4/x1519eJIoPsG7DY94Nr3djNYODadAwI3LCl7mnY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qkWxn4h+GOxx8szqHvQtWqL57cAwiLczYmT0qwTjzWrKitU9khT9PvY9G4/hwaNPL
	 0qlWlUaI6+pesgFdx26taK/fIdg3RhE41C7GAbGinmZllbmjD9X/7q3KpqObpVITNA
	 +Sc5sK4GSE2MIpVwNQpeX2RVAKrRdc4ScAy20ZZXTbHAiQSeoZZHfVfNoIfMYyer8H
	 sIaacfMGx+p2aSDOojTlvMjKGgUCxGYZIu3t9xKPScqP8vjtjmSfQ/JUYYrkQRMI5h
	 fbKEmI08E61F4YCUAZWHjODIMwfsFzLXHwgf6vsGaS39jxjwkioTFLYpSMaWMh9tgM
	 2EQcscNvY2fTA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sachin Sant <sachinp@linux.ibm.com>, linux-mm@kvack.org
Subject: Re: [6.4.0-rc7-next-20230620] Boot failure on IBM Power LPAR
In-Reply-To: <E6B3DD9B-8577-450E-A043-E4B307CE379C@linux.ibm.com>
References: <E6B3DD9B-8577-450E-A043-E4B307CE379C@linux.ibm.com>
Date: Wed, 21 Jun 2023 13:52:01 +1000
Message-ID: <87edm5pj4u.fsf@mail.lhotse>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sachin Sant <sachinp@linux.ibm.com> writes:
> 6.4.0-rc7-next-20230620 fails to boot on IBM Power LPAR with following
>
> [ 5.548368] BUG: Unable to handle kernel data access at 0x95bdcf954bc34e73
> [ 5.548380] Faulting instruction address: 0xc000000000548090
> [ 5.548384] Oops: Kernel access of bad area, sig: 11 [#1]
> [ 5.548387] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> [ 5.548391] Modules linked in: nf_tables(E) nfnetlink(E) sunrpc(E) binfmt_misc(E) pseries_rng(E) aes_gcm_p10_crypto(E) drm(E) drm_panel_orientation_quirks(E) xfs(E) libcrc32c(E) sd_mod(E) sr_mod(E) t10_pi(E) crc64_rocksoft_generic(E) cdrom(E) crc64_rocksoft(E) crc64(E) sg(E) ibmvscsi(E) scsi_transport_srp(E) ibmveth(E) vmx_crypto(E) fuse(E)
> [ 5.548413] CPU: 1 PID: 789 Comm: systemd-udevd Tainted: G E 6.4.0-rc7-next-20230620 #1
> [ 5.548417] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1030.20 (NH1030_058) hv:phyp pSeries
> [ 5.548421] NIP: c000000000548090 LR: c000000000547fbc CTR: c0000000004206f0
> [ 5.548424] REGS: c0000000afb536f0 TRAP: 0380 Tainted: G E (6.4.0-rc7-next-20230620)
> [ 5.548427] MSR: 800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> CR: 88028202 XER: 20040000
> [ 5.548436] CFAR: c000000000547fc4 IRQMASK: 0 
> [ 5.548436] GPR00: c000000000547fbc c0000000afb53990 c0000000014b1600 0000000000000000 
> [ 5.548436] GPR04: 0000000000000cc0 00000000000034d8 0000000000000e6f ed5e02cab43c21e0 
> [ 5.548436] GPR08: 0000000000000e6e 0000000000000058 0000001356ea0000 0000000000002000 
> [ 5.548436] GPR12: c0000000004206f0 c0000013fffff300 0000000000000000 0000000000000000 
> [ 5.548436] GPR16: 0000000000000000 0000000000000000 0000000000000000 c000000092f43708 
> [ 5.548436] GPR20: c000000092f436b0 0000000000000000 fffffffffff7dfff c0000000afa80000 
> [ 5.548436] GPR24: c000000002b87aa0 00000000000000b8 c000000000159914 0000000000000cc0 
> [ 5.548436] GPR28: 95bdcf954bc34e1b c00000000a1fafc0 0000000000000000 c000000003019800 
> [ 5.548473] NIP [c000000000548090] kmem_cache_alloc+0x1a0/0x420
> [ 5.548480] LR [c000000000547fbc] kmem_cache_alloc+0xcc/0x420
> [ 5.548485] Call Trace:
> [ 5.548487] [c0000000afb53990] [c000000000547fbc] kmem_cache_alloc+0xcc/0x420 (unreliable)
> [ 5.548493] [c0000000afb53a00] [c000000000159914] vm_area_dup+0x44/0xf0
> [ 5.548499] [c0000000afb53a40] [c00000000015a638] dup_mmap+0x298/0x8b0
> [ 5.548504] [c0000000afb53bb0] [c00000000015acd0] dup_mm.constprop.0+0x80/0x180
> [ 5.548509] [c0000000afb53bf0] [c00000000015bdc0] copy_process+0xc00/0x1510
> [ 5.548514] [c0000000afb53cb0] [c00000000015c848] kernel_clone+0xb8/0x5a0
> [ 5.548519] [c0000000afb53d30] [c00000000015ceb8] __do_sys_clone+0x88/0xd0
> [ 5.548524] [c0000000afb53e10] [c000000000033bcc] system_call_exception+0x13c/0x340
> [ 5.548529] [c0000000afb53e50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
> [ 5.548534] --- interrupt: 3000 at 0x7fff87f0c178
> [ 5.548538] NIP: 00007fff87f0c178 LR: 0000000000000000 CTR: 0000000000000000
> [ 5.548540] REGS: c0000000afb53e80 TRAP: 3000 Tainted: G E (6.4.0-rc7-next-20230620)
> [ 5.548544] MSR: 800000000000f033 <SF,EE,PR,FP,ME,IR,DR,RI,LE> CR: 44004204 XER: 00000000
> [ 5.548552] IRQMASK: 0 
> [ 5.548552] GPR00: 0000000000000078 00007ffffde8cb80 00007fff88637500 0000000001200011 
> [ 5.548552] GPR04: 0000000000000000 0000000000000000 0000000000000000 00007fff888bd490 
> [ 5.548552] GPR08: 0000000000000001 0000000000000000 0000000000000000 0000000000000000 
> [ 5.548552] GPR12: 0000000000000000 00007fff888c4c00 0000000000000002 00007ffffde95698 
> [ 5.548552] GPR16: 00007ffffde95690 00007ffffde95688 00007ffffde956a0 0000000000000028 
> [ 5.548552] GPR20: 0000000132bca308 0000000000000001 0000000000000001 0000000000000315 
> [ 5.548552] GPR24: 0000000000000003 0000000000000040 0000000000000000 0000000000000003 
> [ 5.548552] GPR28: 0000000000000000 0000000000000000 00007ffffde8cf24 0000000000000045 
> [ 5.548586] NIP [00007fff87f0c178] 0x7fff87f0c178
> [ 5.548589] LR [0000000000000000] 0x0
> [ 5.548591] --- interrupt: 3000
> [ 5.548593] Code: e93f0000 7ce95214 e9070008 7f89502a e9270010 2e3c0000 41920258 2c290000 41820250 813f0028 e8ff00b8 38c80001 <7fdc482a> 7d3c4a14 79250022 552ac03e 
> [ 5.548605] ---[ end trace 0000000000000000 ]---
> [ 5.550849] pstore: backend (nvram) writing error (-1)
> [ 5.550852] 
> Starting Network Manager...
> [ 5.566384] BUG: Bad rss-counter state mm:00000000dc60f1c1 type:MM_ANONPAGES val:36
> [ 5.568784] BUG: Bad rss-counter state mm:000000008eb9341b type:MM_ANONPAGES val:36
> [ 5.689774] BUG: Bad rss-counter state mm:00000000edbda345 type:MM_ANONPAGES val:36
> [ 5.692187] BUG: Bad rss-counter state mm:000000003f7ec21f type:MM_ANONPAGES val:36
> [ 5.705947] BUG: Bad rss-counter state mm:00000000cdbb7cfd type:MM_ANONPAGES val:36
> [ 6.550855] Kernel panic - not syncing: Fatal exception
> [ 6.568226] Rebooting in 10 seconds..
>
> The problem was introduced in 6.4.0-rc7-next-20230619. I tried git bisect, but unsure of the
> result reported by it. Bisect points to following patch
>
> # git bisect bad
> 70c94cc2eefd4f98d222834cbe7512804977c2d4 is the first bad commit
> commit 70c94cc2eefd4f98d222834cbe7512804977c2d4
> Merge: 48f5ee5c48c3 3fe08f7d5e80
> Author: Stephen Rothwell <sfr@canb.auug.org.au>
> Date:   Tue Jun 20 09:43:25 2023 +1000
>
>     Merge branch 'mm-everything' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>          # Conflicts:
>          #       mm/mmap.c

Usually bisect pointing to a merge means something has gone wrong with
the bisect. It's not impossible for a merge to be the cause of a bug,
but IME it's rare.

In this case though the merge itself has a reasonably large diff, so
it's more likely that the merge itself has introduced a bug.

commit 70c94cc2eefd4f98d222834cbe7512804977c2d4
Merge: 48f5ee5c48c3 3fe08f7d5e80
Author:     Stephen Rothwell <sfr@canb.auug.org.au>
AuthorDate: Tue Jun 20 09:43:25 2023 +1000
Commit:     Stephen Rothwell <sfr@canb.auug.org.au>
CommitDate: Tue Jun 20 09:43:25 2023 +1000

    Merge branch 'mm-everything' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
    
    # Conflicts:
    #       mm/mmap.c

diff --cc mm/mmap.c
index 98cda6f72605,474a0d856622..9a93b054148a
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@@ -2398,15 -2409,27 +2396,29 @@@ do_vmi_align_munmap(struct vma_iterato
  			if (error)
  				goto end_split_failed;
  		}
 -		mas_set(&mas_detach, count);
 -		error = munmap_sidetree(next, &mas_detach);
 -		if (error)
 -			goto munmap_sidetree_failed;
 +		vma_start_write(next);
- 		mas_set_range(&mas_detach, next->vm_start, next->vm_end - 1);
 +		if (mas_store_gfp(&mas_detach, next, GFP_KERNEL))
 +			goto munmap_gather_failed;
 +		vma_mark_detached(next, true);
 +		if (next->vm_flags & VM_LOCKED)
 +			locked_vm += vma_pages(next);
  
  		count++;
+ 		if (unlikely(uf)) {
+ 			/*
+ 			 * If userfaultfd_unmap_prep returns an error the vmas
+ 			 * will remain split, but userland will get a
+ 			 * highly unexpected error anyway. This is no
+ 			 * different than the case where the first of the two
+ 			 * __split_vma fails, but we don't undo the first
+ 			 * split, despite we could. This is unlikely enough
+ 			 * failure that it's not worth optimizing it for.
+ 			 */
+ 			error = userfaultfd_unmap_prep(next, start, end, uf);
+ 
+ 			if (error)
+ 				goto userfaultfd_error;
+ 		}
  #ifdef CONFIG_DEBUG_VM_MAPLE_TREE
  		BUG_ON(next->vm_start < start);
  		BUG_ON(next->vm_start > end);
@@@ -2454,14 -2455,18 +2444,20 @@@
  		BUG_ON(count != test_count);
  	}
  #endif
- 	/* Point of no return */
 +	error = -ENOMEM;
- 	vma_iter_set(vmi, start);
+ 	while (vma_iter_addr(vmi) > start)
+ 		vma_iter_prev_range(vmi);
+ 
  	if (vma_iter_clear_gfp(vmi, start, end, GFP_KERNEL))
 -		return -ENOMEM;
 +		goto clear_tree_failed;
  
 +	mm->locked_vm -= locked_vm;
  	mm->map_count -= count;
+ 	prev = vma_iter_prev_range(vmi);
+ 	next = vma_next(vmi);
+ 	if (next)
+ 		vma_iter_prev_range(vmi);
+ 
  	/*
  	 * Do not downgrade mmap_lock if we are next to VM_GROWSDOWN or
  	 * VM_GROWSUP VMA. Such VMAs can change their size under


cheers

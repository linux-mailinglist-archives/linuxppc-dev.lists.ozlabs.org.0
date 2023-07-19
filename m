Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 754C975A281
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 00:52:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Kw87m58v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5rfq2fl0z3c4C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 08:52:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Kw87m58v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sj@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5rdr4SHWz2yV0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 08:51:12 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0C2466164F;
	Wed, 19 Jul 2023 22:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6007C433C8;
	Wed, 19 Jul 2023 22:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689807068;
	bh=d5+z1ZEyAaAcKeXUkztdUKRNArMaOIqIm8Y7klWaUoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kw87m58vIVCFwitWVjfmUAUmlDPnSKOm3YyLm0fF//4cY0ejJvhclPAe4BTet4sg7
	 PZWH4+CT+o6QEdbY79P+Pk+jqO91k95UWJCOQ16AqMSlgIdKvRe/ysJGMPhyyUltoo
	 jF/zr4EPYCO8rXFrFhwXe5xValGJGHuL9lrS5rQEsdtvwikgsd8/FGoJeFja6d2gDW
	 CkczsyZbmaVBbFWrKVOoqlr8xyJ6g0p5bwjSFX3j6K3jaz3s26ustuKdaP5QpFeVp/
	 3PHzhzWa2eUmsdArIm1IO6Fftp4271kbJUXp+8cC2kxDvLrkqUstD5wd8b/8GGYjhJ
	 IvjVGisMM8wJw==
From: SeongJae Park <sj@kernel.org>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v2 3/5] mmu_notifiers: Call invalidate_range() when invalidating TLBs
Date: Wed, 19 Jul 2023 22:51:05 +0000
Message-Id: <20230719225105.1934-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <8f293bb51a423afa71ddc3ba46e9f323ee9ffbc7.1689768831.git-series.apopple@nvidia.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kevin.tian@intel.com, x86@kernel.org, ajd@linux.ibm.com, kvm@vger.kernel.org, linux-mm@kvack.org, catalin.marinas@arm.com, seanjc@google.com, will@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, zhi.wang.linux@gmail.com, jgg@ziepe.ca, iommu@lists.linux.dev, nicolinc@nvidia.com, jhubbard@nvidia.com, fbarrat@linux.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Alistair,

On Wed, 19 Jul 2023 22:18:44 +1000 Alistair Popple <apopple@nvidia.com> wrote:

> The invalidate_range() is going to become an architecture specific mmu
> notifier used to keep the TLB of secondary MMUs such as an IOMMU in
> sync with the CPU page tables. Currently it is called from separate
> code paths to the main CPU TLB invalidations. This can lead to a
> secondary TLB not getting invalidated when required and makes it hard
> to reason about when exactly the secondary TLB is invalidated.
> 
> To fix this move the notifier call to the architecture specific TLB
> maintenance functions for architectures that have secondary MMUs
> requiring explicit software invalidations.
> 
> This fixes a SMMU bug on ARM64. On ARM64 PTE permission upgrades
> require a TLB invalidation. This invalidation is done by the
> architecutre specific ptep_set_access_flags() which calls
> flush_tlb_page() if required. However this doesn't call the notifier
> resulting in infinite faults being generated by devices using the SMMU
> if it has previously cached a read-only PTE in it's TLB.
> 
> Moving the invalidations into the TLB invalidation functions ensures
> all invalidations happen at the same time as the CPU invalidation. The
> architecture specific flush_tlb_all() routines do not call the
> notifier as none of the IOMMUs require this.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>

I found below kernel NULL-dereference issue on latest mm-unstable tree, and
bisect points me to the commit of this patch, namely
75c400f82d347af1307010a3e06f3aa5d831d995.

To reproduce, I use 'stress-ng --bigheap $(nproc)'.  The issue happens as soon
as it starts reclaiming memory.  I didn't dive deep into this yet, but
reporting this issue first, since you might have an idea already.


[   69.824805] BUG: kernel NULL pointer dereference, address: 0000000000000498
[   69.826983] #PF: supervisor read access in kernel mode
[   69.828716] #PF: error_code(0x0000) - not-present page
[   69.830249] PGD 0 P4D 0
[   69.830784] Oops: 0000 [#4] PREEMPT SMP PTI
[   69.831881] CPU: 2 PID: 201 Comm: kworker/u72:2 Tainted: G      D W          6.5.0-rc1+ #311
[   69.834221] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-pr4
[   69.837459] Workqueue: writeback wb_workfn (flush-251:0)
[   69.839422] RIP: 0010:arch_tlbbatch_flush (include/linux/mmu_notifier.h:497 (discriminator 3) arch/x86/mm/tlb.c:1268 (discriminator 3))
[ 69.841140] Code: e8 c5 dd d2 00 bf 01 00 00 00 e8 0b df 05 00 65 8b 05 cc 90 f9 63 85 c0 74 4b 65 48c

Code starting with the faulting instruction
===========================================
   0:   e8 c5 dd d2 00          callq  0xd2ddca
   5:   bf 01 00 00 00          mov    $0x1,%edi
   a:   e8 0b df 05 00          callq  0x5df1a
   f:   65 8b 05 cc 90 f9 63    mov    %gs:0x63f990cc(%rip),%eax        # 0x63f990e2
  16:   85 c0                   test   %eax,%eax
  18:   74 4b                   je     0x65
  1a:   65                      gs
  1b:   8c                      .byte 0x8c
[   69.846840] RSP: 0000:ffffbf77007fb048 EFLAGS: 00010286
[   69.848464] RAX: ffff9bfd81970000 RBX: 0000000000000002 RCX: 0000000000000000
[   69.851016] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000000000000
[   69.853070] RBP: ffffbf77007fb068 R08: 0000000000000001 R09: 0000000000000000
[   69.855213] R10: ffff9bfd81970f10 R11: 0000000000000000 R12: ffff9bfd81970f10
[   69.857456] R13: ffff9c1bbd4b28c0 R14: 0000000000000003 R15: ffffe75b88f4a808
[   69.860213] FS:  0000000000000000(0000) GS:ffff9c1bbd480000(0000) knlGS:0000000000000000
[   69.862211] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   69.863624] CR2: 0000000000000498 CR3: 00000001112ca000 CR4: 00000000000006e0
[   69.865907] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   69.868146] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   69.870414] Call Trace:
[   69.871222]  <TASK>
[   69.871823] ? show_regs (arch/x86/kernel/dumpstack.c:479)
[   69.872855] ? __die_body (arch/x86/kernel/dumpstack.c:421)
[   69.873733] ? __die (arch/x86/kernel/dumpstack.c:435)
[   69.874576] ? page_fault_oops (arch/x86/mm/fault.c:707)
[   69.875657] ? search_bpf_extables (kernel/bpf/core.c:751)
[   69.876854] ? arch_tlbbatch_flush (include/linux/mmu_notifier.h:497 (discriminator 3) arch/x86/mm/tlb.c:1268 (discriminator 3))
[   69.878146] ? search_exception_tables (kernel/extable.c:64)
[   69.879931] ? kernelmode_fixup_or_oops (arch/x86/mm/fault.c:762)
[   69.881284] ? __bad_area_nosemaphore (arch/x86/mm/fault.c:860)
[   69.882722] ? bad_area_nosemaphore (arch/x86/mm/fault.c:867)
[   69.884276] ? do_user_addr_fault (arch/x86/mm/fault.c:1458)
[   69.885800] ? check_preemption_disabled (lib/smp_processor_id.c:42)
[   69.887428] ? exc_page_fault (arch/x86/include/asm/paravirt.h:695 arch/x86/mm/fault.c:1495 arch/x86/mm/fault.c:1543)
[   69.888435] ? asm_exc_page_fault (arch/x86/include/asm/idtentry.h:570)
[   69.889955] ? arch_tlbbatch_flush (include/linux/mmu_notifier.h:497 (discriminator 3) arch/x86/mm/tlb.c:1268 (discriminator 3))
[   69.891564] ? arch_tlbbatch_flush (arch/x86/include/asm/preempt.h:104 (discriminator 1) arch/x86/mm/tlb.c:1267 (discriminator 1))
[   69.892779] try_to_unmap_flush_dirty (mm/rmap.c:622 mm/rmap.c:632)
[   69.893970] shrink_folio_list (mm/vmscan.c:2015)
[   69.895243] shrink_inactive_list (include/linux/spinlock.h:376 mm/vmscan.c:2616)
[   69.896816] shrink_lruvec (mm/vmscan.c:2855 mm/vmscan.c:6303)
[   69.897952] ? rmqueue_bulk (mm/page_alloc.c:2228)
[   69.899385] shrink_node (mm/vmscan.c:6491 mm/vmscan.c:6524)
[   69.900447] do_try_to_free_pages (mm/vmscan.c:6705 mm/vmscan.c:6825)
[   69.901548] try_to_free_pages (mm/vmscan.c:7060)
[   69.902540] __alloc_pages_slowpath.constprop.0 (include/linux/sched/mm.h:380 mm/page_alloc.c:3716 mm/page_alloc.c:3735 mm/page_alloc.c:4140)
[   69.904307] ? sched_cpu_deactivate (kernel/sched/core.c:9728)
[   69.905427] __alloc_pages (mm/page_alloc.c:4525)
[   69.906735] alloc_pages (mm/mempolicy.c:2284)
[   69.907604] new_slab (mm/slub.c:1866 mm/slub.c:2009 mm/slub.c:2062)
[   69.908414] ? chksum_update (crypto/crc32c_generic.c:88)
[   69.909348] ___slab_alloc (mm/slub.c:3216 (discriminator 3))
[   69.910093] ? ext4_mb_new_blocks (fs/ext4/mballoc.c:5538 fs/ext4/mballoc.c:6129)
[   69.911885] ? __enqueue_entity (kernel/sched/fair.c:646)
[   69.913085] ? x2apic_send_IPI (arch/x86/include/asm/paravirt.h:196 arch/x86/include/asm/paravirt.h:229 arch/x86/include/asm/apic.h:240 arch/x86/kernel/apic/x2apic_phys.c:126 arch/x86/kernel/apic/x2apic_phys.c:48)
[   69.914143] ? native_smp_send_reschedule (arch/x86/kernel/apic/ipi.c:72)
[   69.915777] ? sbitmap_find_bit (lib/sbitmap.c:146 lib/sbitmap.c:178 lib/sbitmap.c:199)
[   69.917011] ? ext4_mb_new_blocks (fs/ext4/mballoc.c:5538 fs/ext4/mballoc.c:6129)
[   69.917996] __slab_alloc.isra.0 (mm/slub.c:3314)
[   69.919309] kmem_cache_alloc (mm/slub.c:3367 mm/slub.c:3460 mm/slub.c:3478 mm/slub.c:3485 mm/slub.c:3494)
[   69.920239] ? ext4_mb_new_blocks (fs/ext4/mballoc.c:5538 fs/ext4/mballoc.c:6129)
[   69.921291] ext4_mb_new_blocks (fs/ext4/mballoc.c:5538 fs/ext4/mballoc.c:6129)
[   69.922496] ? ext4_cache_extents (fs/ext4/extents.c:543 (discriminator 2))
[   69.923591] ext4_ext_map_blocks (fs/ext4/extents.c:4286)
[   69.925039] ext4_map_blocks (fs/ext4/inode.c:621)
[   69.926478] ? kmem_cache_alloc (arch/x86/include/asm/jump_label.h:55 include/linux/memcontrol.h:1777 mm/slab.h:522 mm/slab.h:770 mm/slub.c:3470 mm/slub.c:3478 mm/slub.c:3485 mm/slub.c:3494)
[   69.927813] ? ext4_alloc_io_end_vec (fs/ext4/page-io.c:61)
[   69.928851] ext4_do_writepages (fs/ext4/inode.c:2159 fs/ext4/inode.c:2212 fs/ext4/inode.c:2677)
[   69.930008] ? update_sd_lb_stats.constprop.0 (kernel/sched/fair.c:9501 kernel/sched/fair.c:10163)
[   69.931662] ext4_writepages (fs/ext4/inode.c:2766)
[   69.932728] do_writepages (mm/page-writeback.c:2553)
[   69.933403] ? __wb_calc_thresh (mm/page-writeback.c:875)
[   69.934168] __writeback_single_inode (fs/fs-writeback.c:1603)
[   69.935101] ? _raw_spin_unlock (arch/x86/include/asm/preempt.h:104 include/linux/spinlock_api_smp.h:143 kernel/locking/spinlock.c:186)
[   69.936219] writeback_sb_inodes (fs/fs-writeback.c:1896)
[   69.937408] __writeback_inodes_wb (fs/fs-writeback.c:1966)
[   69.938612] wb_writeback (fs/fs-writeback.c:2072)
[   69.939548] wb_workfn (fs/fs-writeback.c:2142 fs/fs-writeback.c:2230 fs/fs-writeback.c:2257)
[   69.940439] ? __switch_to (arch/x86/include/asm/paravirt.h:300 arch/x86/kernel/process_64.c:583)
[   69.941694] process_one_work (arch/x86/include/asm/jump_label.h:27 include/linux/jump_label.h:207 include/trace/events/workqueue.h:108 kernel/workqueue.c:2602)
[   69.943189] worker_thread (include/linux/list.h:292 kernel/workqueue.c:2749)
[   69.944403] ? __pfx_worker_thread (kernel/workqueue.c:2691)
[   69.945491] kthread (kernel/kthread.c:389)
[   69.946333] ? __pfx_kthread (kernel/kthread.c:342)
[   69.947109] ret_from_fork (arch/x86/entry/entry_64.S:314)
[   69.948097]  </TASK>
[   69.948944] Modules linked in: ppdev input_leds joydev parport_pc parport serio_raw qemu_fw_cfg mac_hi
[   69.958916] Dumping ftrace buffer:
[   69.961197]    (ftrace buffer empty)
[   69.962797] CR2: 0000000000000498
[   69.964431] ---[ end trace 0000000000000000 ]---
[   69.966440] RIP: 0010:arch_tlbbatch_flush (include/linux/mmu_notifier.h:497 (discriminator 3) arch/x86/mm/tlb.c:1268 (discriminator 3))
[ 69.969546] Code: e8 c5 dd d2 00 bf 01 00 00 00 e8 0b df 05 00 65 8b 05 cc 90 f9 63 85 c0 74 4b 65 48c

Code starting with the faulting instruction
===========================================
   0:   e8 c5 dd d2 00          callq  0xd2ddca
   5:   bf 01 00 00 00          mov    $0x1,%edi
   a:   e8 0b df 05 00          callq  0x5df1a
   f:   65 8b 05 cc 90 f9 63    mov    %gs:0x63f990cc(%rip),%eax        # 0x63f990e2
  16:   85 c0                   test   %eax,%eax
  18:   74 4b                   je     0x65
  1a:   65                      gs
  1b:   8c                      .byte 0x8c
[   69.979017] RSP: 0000:ffffbf770005f6d8 EFLAGS: 00010286
[   69.981894] RAX: ffff9bfd8090af80 RBX: 0000000000000003 RCX: 0000000000000000
[   69.985344] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000000000000
[   69.988499] RBP: ffffbf770005f6f8 R08: 0000000000000001 R09: 0000000000000000
[   69.991677] R10: ffff9bfd8090be90 R11: 0000000000000000 R12: ffff9bfd8090be90
[   69.994926] R13: ffff9c1bbd4f28c0 R14: 0000000000000004 R15: ffffe75b84499d08
[   69.998152] FS:  0000000000000000(0000) GS:ffff9c1bbd480000(0000) knlGS:0000000000000000
[   70.001874] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   70.004419] CR2: 0000000000000498 CR3: 00000001112ca000 CR4: 00000000000006e0
[   70.007517] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   70.010951] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400



Thanks,
SJ

[...]

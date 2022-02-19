Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 328064BC472
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 02:12:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0rBm4lwxz3cZd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 12:12:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kt4n1Qqg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kt4n1Qqg; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0rB34Tx4z30hm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 12:11:39 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7102DB82677
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 01:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D9D8C340E9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 01:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645233096;
 bh=9kQwINsQJN4nfRGwECxMLaMXvUKb6NI50U5mC+BP6eo=;
 h=From:To:Subject:Date:From;
 b=kt4n1Qqgj5WH9ewV16jeJaSM0YsA3b6tngsvV9nwoGK9tjC2BpCaeylLcFobZqd9x
 j56EOQtB31viuu+YZKRWs38yQIzFwBupAPhID9V1yD+3m/yismookYXajDPKuJEp83
 U4FCtLhQKqhlJ8iKKoxxFJjQQwfP40w37ssU6XZjsSpuCXG9/i8OnDU6tTl/1s6oCS
 r03MaZWN5wwzh45YHW8bZa0cplma3ScfDft4qkt4W2qwBQavXCULqyZnIs7XFjFxYl
 0bKbz+f6CXOQMfciG58oEgNpPeKuJzoIA4qa2Q70oYZMBmGOms78V72gT91m255qZa
 PbLuc6T4wCAhA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 18486C05FCE; Sat, 19 Feb 2022 01:11:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215622] New: WARNING: possible irq lock inversion dependency
 detected
Date: Sat, 19 Feb 2022 01:11:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215622-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D215622

            Bug ID: 215622
           Summary: WARNING: possible irq lock inversion dependency
                    detected
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.17-rc4
          Hardware: PPC-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: No

Created attachment 300484
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300484&action=3Dedit
dmesg (5.17-rc4, PowerMac G5 11,2)

Don't know whether this has something to do or in common with a netconsole
issue I unearthed on other hardware (bug #212509)...

But as the trace looks different I'll post this as a seperate bug:

[...]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
WARNING: possible irq lock inversion dependency detected
5.17.0-rc4-PowerMacG5+ #2 Not tainted
--------------------------------------------------------
swapper/0/1 just changed the state of lock:
c0000000013e4490 (native_tlbie_lock){+.-.}-{2:2}, at: .tlbie+0x70/0x10c
but this lock was taken by another, HARDIRQ-safe lock in the past:
 (console_owner){-...}-{0:0}


and interrupts could create inverse lock ordering between them.


other info that might help us debug this:
Chain exists of:
  console_owner --> target_list_lock --> native_tlbie_lock

 Possible interrupt unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(native_tlbie_lock);
                               local_irq_disable();
                               lock(console_owner);
                               lock(target_list_lock);
  <Interrupt>
    lock(console_owner);

 *** DEADLOCK ***

no locks held by swapper/0/1.

the shortest dependencies between 2nd lock and 1st lock:
  -> (console_owner){-...}-{0:0} ops: 994 {
     IN-HARDIRQ-W at:
                        .lock_acquire+0x290/0x2e8
                        .console_unlock+0x2fc/0x628
                        .vprintk_emit+0x270/0x280
                        .vprintk+0x8c/0x94
                        ._printk+0x30/0x44
                        .crng_fast_load+0x128/0x17c
                        .add_interrupt_randomness+0x330/0x488
                        .handle_irq_event_percpu+0x28/0x54
                        .handle_irq_event+0x44/0x70
                        .handle_fasteoi_irq+0xac/0x158
                        .handle_irq_desc+0x34/0x54
                        .__do_irq+0x174/0x250
                        .__do_IRQ+0xac/0xb4
                        init_stack+0x3820/0x4000
                        .do_IRQ+0xd0/0x124
                        hardware_interrupt_common_virt+0x208/0x210
                        .power4_idle+0x3c/0x70
                        .arch_cpu_idle+0x8c/0x114
                        .default_idle_call+0x7c/0xd4
                        .do_idle+0x118/0x12c
                        .cpu_startup_entry+0x28/0x2c
                        .rest_init+0x1bc/0x1c8
                        .start_kernel+0xba8/0xca0
                        start_here_common+0x1c/0x44
     INITIAL USE at:
                       .lock_acquire+0x290/0x2e8
                       .console_unlock+0x2fc/0x628
                       .vprintk_emit+0x270/0x280
                       .vprintk+0x8c/0x94
                       ._printk+0x30/0x44
                       .start_kernel+0xc4/0xca0
                       start_here_common+0x1c/0x44
   }
   ... key      at: [<c000000001430c30>] console_owner_dep_map+0x0/0x28
   ... acquired at:
   ._raw_spin_lock_irqsave+0x6c/0x98
   .write_msg+0x64/0x10c
   .console_unlock+0x53c/0x628
   .register_console+0x250/0x330
   .init_netconsole+0x538/0x610
   .do_one_initcall+0x100/0x2dc
   .kernel_init_freeable+0x644/0x748
   .kernel_init+0x20/0x178
   .ret_from_kernel_thread+0x58/0x60

 -> (target_list_lock){....}-{2:2} ops: 461 {
    INITIAL USE at:
                     .lock_acquire+0x290/0x2e8
                     ._raw_spin_lock_irqsave+0x6c/0x98
                     .init_netconsole+0x40c/0x610
                     .do_one_initcall+0x100/0x2dc
                     .kernel_init_freeable+0x644/0x748
                     .kernel_init+0x20/0x178
                     .ret_from_kernel_thread+0x58/0x60
  }
  ... key      at: [<c0000000014e8918>] target_list_lock+0x18/0x40
  ... acquired at:
   ._raw_spin_lock+0x44/0x68
   .tlbie+0x70/0x10c
   .native_hpte_invalidate+0xcc/0x114
   .hash__kernel_map_pages+0x270/0x280
   .debug_pagealloc_unmap_pages+0x34/0x40
   .free_unref_page_prepare+0x2c8/0x314
   .free_unref_page+0x38/0xdc
   .__free_slab+0xc4/0x158
   .kfree_skbmem+0x5c/0x7c
   .zap_completion_queue+0x128/0x130
   .netpoll_send_skb+0x2e0/0x348
   .write_msg+0xfc/0x10c
   .console_unlock+0x53c/0x628
   .vprintk_emit+0x270/0x280
   .vprintk+0x8c/0x94
   ._printk+0x30/0x44
   .register_console+0x288/0x330
   .init_netconsole+0x538/0x610
   .do_one_initcall+0x100/0x2dc
   .kernel_init_freeable+0x644/0x748
   .kernel_init+0x20/0x178
   .ret_from_kernel_thread+0x58/0x60

-> (native_tlbie_lock){+.-.}-{2:2} ops: 4044007 {
   HARDIRQ-ON-W at:
                    .lock_acquire+0x290/0x2e8
                    ._raw_spin_lock+0x44/0x68
                    .tlbie+0x70/0x10c
                    .hash__change_memory_range+0xa8/0xc0
                    .hash__mark_initmem_nx+0x3c/0x58
                    .mark_initmem_nx+0x10/0x24
                    .free_initmem+0x24/0x5c
                    .kernel_init+0x38/0x178
                    .ret_from_kernel_thread+0x58/0x60
   IN-SOFTIRQ-W at:
                    .lock_acquire+0x290/0x2e8
                    ._raw_spin_lock+0x44/0x68
                    .tlbie+0x70/0x10c
                    .native_hpte_invalidate+0xcc/0x114
                    .hash__kernel_map_pages+0x270/0x280
                    .debug_pagealloc_unmap_pages+0x34/0x40
                    .free_unref_page_prepare+0x2c8/0x314
                    .free_unref_page+0x38/0xdc
                    .__free_slab+0xc4/0x158
                    .free_object_rcu+0xac/0x138
                    .rcu_core+0x858/0x10b8
                    .__do_softirq+0x31c/0x484
                    .run_ksoftirqd+0x44/0x80
                    .smpboot_thread_fn+0x230/0x238
                    .kthread+0x110/0x118
                    .ret_from_kernel_thread+0x58/0x60
   INITIAL USE at:
                   .lock_acquire+0x290/0x2e8
                   ._raw_spin_lock+0x44/0x68
                   .tlbie+0x70/0x10c
                   .native_hpte_invalidate+0xcc/0x114
                   .hash__kernel_map_pages+0x270/0x280
                   .debug_pagealloc_unmap_pages+0x34/0x40
                   .__free_pages_ok+0x174/0x2a0
                   .deferred_free_range+0x150/0x230
                   .deferred_init_maxorder+0x428/0x4e0
                   .deferred_grow_zone+0x238/0x2dc
                   .get_page_from_freelist+0x204/0x7e4
                   .__alloc_pages+0xc4/0x23c
                   .alloc_slab_page.constprop.0+0x70/0x78
                   .new_slab+0xcc/0x360
                   .__kmem_cache_create+0x210/0x3dc
                   .create_boot_cache+0xa8/0x15c
                   .kmem_cache_init+0x140/0x34c
                   .start_kernel+0x708/0xca0
                   start_here_common+0x1c/0x44
 }
 ... key      at: [<c0000000013e4490>] native_tlbie_lock+0x18/0x40
 ... acquired at:
   .__lock_acquire+0x64c/0x14d0
   .lock_acquire+0x290/0x2e8
   ._raw_spin_lock+0x44/0x68
   .tlbie+0x70/0x10c
   .hash__change_memory_range+0xa8/0xc0
   .hash__mark_initmem_nx+0x3c/0x58
   .mark_initmem_nx+0x10/0x24
   .free_initmem+0x24/0x5c
   .kernel_init+0x38/0x178
   .ret_from_kernel_thread+0x58/0x60


stack backtrace:
CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.17.0-rc4-PowerMacG5+ #2
Call Trace:
[c000000002973610] [c000000000552e8c] .dump_stack_lvl+0x98/0xe0 (unreliable)
[c0000000029736a0] [c0000000000c7534] .print_irq_inversion_bug+0x1a8/0x220
[c000000002973750] [c0000000000c81a4] .mark_lock+0x2c8/0x3d8
[c000000002973860] [c0000000000c9818] .__lock_acquire+0x64c/0x14d0
[c000000002973980] [c0000000000cb0c8] .lock_acquire+0x290/0x2e8
[c000000002973a90] [c00000000082ca64] ._raw_spin_lock+0x44/0x68
[c000000002973b10] [c00000000003abfc] .tlbie+0x70/0x10c
[c000000002973bb0] [c000000000036874] .hash__change_memory_range+0xa8/0xc0
[c000000002973c50] [c000000000037124] .hash__mark_initmem_nx+0x3c/0x58
[c000000002973cc0] [c000000000033cb8] .mark_initmem_nx+0x10/0x24
[c000000002973d30] [c000000000033040] .free_initmem+0x24/0x5c
[c000000002973da0] [c00000000001084c] .kernel_init+0x38/0x178
[c000000002973e10] [c00000000000bb70] .ret_from_kernel_thread+0x58/0x60
[...]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

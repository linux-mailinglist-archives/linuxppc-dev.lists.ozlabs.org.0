Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CFD83AA1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 22:49:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4636FJ57SCzDqm6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 06:49:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=bugzilla.kernel.org
 (client-ip=198.145.29.98; helo=mail.wl.linuxfoundation.org;
 envelope-from=bugzilla-daemon@bugzilla.kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4636CN4lDSzDqjk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 06:47:43 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 0225E28849
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2019 20:47:41 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 00B5828981; Tue,  6 Aug 2019 20:47:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 204371] BUG kmalloc-4k (Tainted: G        W        ): Object
 padding overwritten
Date: Tue, 06 Aug 2019 20:47:37 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Memory Management
X-Bugzilla-Component: Slab Allocator
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: akpm@linux-foundation.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204371-206035-4NTkYRy7Ju@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204371-206035@https.bugzilla.kernel.org/>
References: <bug-204371-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204371

--- Comment #6 from Erhard F. (erhard_f@mailbox.org) ---
On Wed, 31 Jul 2019 12:09:54 +0000
bugzilla-daemon@bugzilla.kernel.org wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=3D204371
>=20
> --- Comment #4 from mpe@ellerman.id.au ---
> bugzilla-daemon@bugzilla.kernel.org writes:
>=20
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D204371
> >
> > --- Comment #2 from Andrew Morton (akpm@linux-foundation.org) ---
> > (switched to email.  Please respond via emailed reply-to-all, not via t=
he
> > bugzilla web interface).
> >
> >
> > On Mon, 29 Jul 2019 22:35:48 +0000 bugzilla-daemon@bugzilla.kernel.org
> wrote:
> >=20=20
> >> https://bugzilla.kernel.org/show_bug.cgi?id=3D204371
> >>=20
> >>             Bug ID: 204371
> >>            Summary: BUG kmalloc-4k (Tainted: G        W        ): Obje=
ct
> >>                     padding overwritten
> >>            Product: Memory Management
> >>            Version: 2.5
> >>     Kernel Version: 5.3.0-rc2
> >>           Hardware: PPC-32
> >>                 OS: Linux
> >>               Tree: Mainline
> >>             Status: NEW
> >>           Severity: normal
> >>           Priority: P1
> >>          Component: Slab Allocator
> >>           Assignee: akpm@linux-foundation.org
> >>           Reporter: erhard_f@mailbox.org
> >>         Regression: No=20=20
> >
> > cc'ing various people here.
> >
> > I suspect proc_cgroup_show() is innocent and that perhaps
> > bpf_prepare_filter() had a memory scribble.  iirc there has been at
> > least one recent pretty serious bpf fix applied recently.  Can others
> > please take a look?=20=20
>=20
> I haven't been able to reproduce this on a 64-bit or 32-bit powerpc
> machine here. But I don't run gentoo userspace, so I suspect I'm not
> tripping the same path at boot. I did run the seccomp selftest and that
> didn't trip it either.

Had the time to test this on my G5 11,2. It's kernel 5.3-rc3 now, also boot=
ing
from a zstd:1 compressed btrfs partition. Without SLUB_DEBUG_ON selected in=
 the
kernel, the machine boots seemingly fine, with SLUB_DEBUG_ON I get this:

[...]
Aug 06 22:26:35 T800 kernel: BTRFS info (device sda7): use zstd compression,
level 1
Aug 06 22:26:35 T800 kernel: BTRFS info (device sda7): disk space caching is
enabled
Aug 06 22:26:38 T800 kernel:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
Aug 06 22:26:38 T800 kernel: BUG kmalloc-4k (Tainted: G        W        ):
Object padding overwritten
Aug 06 22:26:38 T800 kernel:
---------------------------------------------------------------------------=
--
Aug 06 22:26:38 T800 kernel: INFO: 0x0000000062cd4309-0x000000004edab9d1. F=
irst
byte 0x0 instead of 0x5a
Aug 06 22:26:38 T800 kernel: INFO: Slab 0x0000000070aa589a objects=3D7 used=
=3D7
fp=3D0x0000000016708aa5 flags=3D0x7fe00000010200
Aug 06 22:26:38 T800 kernel: INFO: Object 0x000000007ed48057 @offset=3D17736
fp=3D0x00000000b4be3601
Aug 06 22:26:38 T800 kernel: Redzone 00000000f5b164d9: bb bb bb bb bb bb bb=
 bb=20
                        ........
Aug 06 22:26:38 T800 kernel: Object 000000007ed48057: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[...]
Aug 06 22:26:38 T800 kernel: Redzone 00000000bd6d4c8f: bb bb bb bb bb bb bb=
 bb=20
                        ........
Aug 06 22:26:38 T800 kernel: Padding 0000000062cd4309: 00 00 00 00 00 00 00=
 00=20
                        ........
Aug 06 22:26:38 T800 kernel: CPU: 0 PID: 118 Comm: systemd-journal Tainted:=
 G=20=20
 B   W         5.3.0-rc3 #5
Aug 06 22:26:38 T800 kernel: Call Trace:
Aug 06 22:26:38 T800 kernel: [c00000045baa72a0] [c0000000009e1a74]
.dump_stack+0xe0/0x15c (unreliable)
Aug 06 22:26:38 T800 kernel: [c00000045baa7340] [c0000000002d4640]
.print_trailer+0x228/0x250
Aug 06 22:26:38 T800 kernel: [c00000045baa73e0] [c0000000002c81f8]
.check_bytes_and_report+0x118/0x140
Aug 06 22:26:38 T800 kernel: [c00000045baa7490] [c0000000002ca9fc]
.check_object+0xcc/0x3a0
Aug 06 22:26:38 T800 kernel: [c00000045baa7540] [c0000000002cc6b8]
.alloc_debug_processing+0x158/0x210
Aug 06 22:26:38 T800 kernel: [c00000045baa75d0] [c0000000002cce28]
.___slab_alloc+0x6b8/0x860
Aug 06 22:26:38 T800 kernel: [c00000045baa7710] [c0000000002cd024]
.__slab_alloc+0x54/0xc0
Aug 06 22:26:38 T800 kernel: [c00000045baa7790] [c0000000002cd854]
.kmem_cache_alloc_trace+0x3b4/0x410
Aug 06 22:26:38 T800 kernel: [c00000045baa7840] [c0000000004b9928]
.alloc_log_tree+0x38/0x140
Aug 06 22:26:38 T800 kernel: [c00000045baa78d0] [c0000000004b9ad0]
.btrfs_add_log_tree+0x30/0x130
Aug 06 22:26:38 T800 kernel: [c00000045baa7960] [c000000000525624]
.btrfs_log_inode_parent+0x4a4/0xeb0
Aug 06 22:26:38 T800 kernel: [c00000045baa7ae0] [c00000000052737c]
.btrfs_log_dentry_safe+0x6c/0xb0
Aug 06 22:26:38 T800 kernel: [c00000045baa7b80] [c0000000004e1e3c]
.btrfs_sync_file+0x1ec/0x570
Aug 06 22:26:38 T800 kernel: [c00000045baa7c90] [c000000000355ac4]
.vfs_fsync_range+0x64/0xe0
Aug 06 22:26:38 T800 kernel: [c00000045baa7d20] [c000000000355ba8]
.do_fsync+0x48/0xc0
Aug 06 22:26:38 T800 kernel: [c00000045baa7db0] [c000000000356028]
.__se_sys_fsync+0x18/0x30
Aug 06 22:26:38 T800 kernel: [c00000045baa7e20] [c00000000000a324]
system_call+0x5c/0x70
Aug 06 22:26:38 T800 kernel: FIX kmalloc-4k: Restoring
0x0000000062cd4309-0x000000004edab9d1=3D0x5a
[...]

Also I get:

[...]
Aug 06 22:27:53 T800 kernel:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
Aug 06 22:27:53 T800 kernel: BUG bfq_queue (Tainted: G    B   W        ):
Poison overwritten
Aug 06 22:27:53 T800 kernel:
---------------------------------------------------------------------------=
--
Aug 06 22:27:53 T800 kernel: INFO: 0x00000000c2bbc60e-0x00000000710e6222. F=
irst
byte 0x0 instead of 0x6b
Aug 06 22:27:53 T800 kernel: INFO: Allocated in .bfq_get_queue+0x27c/0x600
age=3D22029 cpu=3D1 pid=3D155
Aug 06 22:27:53 T800 kernel:         .__slab_alloc+0x54/0xc0
Aug 06 22:27:53 T800 kernel:         .kmem_cache_alloc_node+0xf8/0x460
Aug 06 22:27:53 T800 kernel:         .bfq_get_queue+0x27c/0x600
Aug 06 22:27:53 T800 kernel:         .bfq_init_rq+0x720/0x940
Aug 06 22:27:53 T800 kernel:         .bfq_insert_requests+0x130/0x1120
Aug 06 22:27:53 T800 kernel:         .blk_mq_sched_insert_requests+0x138/0x=
420
Aug 06 22:27:53 T800 kernel:         .blk_mq_flush_plug_list+0x224/0x4e0
Aug 06 22:27:53 T800 kernel:         .blk_flush_plug_list+0x128/0x170
Aug 06 22:27:53 T800 kernel:         .blk_finish_plug+0x24/0x40
Aug 06 22:27:53 T800 kernel:         .read_pages+0xa0/0x240
Aug 06 22:27:53 T800 kernel:         .__do_page_cache_readahead+0x238/0x2b0
Aug 06 22:27:53 T800 kernel:         .force_page_cache_readahead+0xbc/0x1c0
Aug 06 22:27:53 T800 kernel:         .generic_file_read_iter+0x914/0xd80
Aug 06 22:27:53 T800 kernel:         .blkdev_read_iter+0x40/0x70
Aug 06 22:27:53 T800 kernel:         .new_sync_read+0x140/0x1c0
Aug 06 22:27:53 T800 kernel:         .vfs_read+0xb0/0x1b0
Aug 06 22:27:53 T800 kernel: INFO: Freed in .bfq_put_queue+0xc4/0x100 age=
=3D21892
cpu=3D0 pid=3D143
Aug 06 22:27:53 T800 kernel:         .kmem_cache_free+0x52c/0x530
Aug 06 22:27:53 T800 kernel:         .bfq_put_queue+0xc4/0x100
Aug 06 22:27:53 T800 kernel:         .bfq_put_idle_entity+0x74/0xc0
Aug 06 22:27:53 T800 kernel:         .bfq_bfqq_served+0xc4/0x120
Aug 06 22:27:53 T800 kernel:         .bfq_dispatch_request+0x344/0xbd0
Aug 06 22:27:53 T800 kernel:         .blk_mq_do_dispatch_sched+0x104/0x180
Aug 06 22:27:53 T800 kernel:=20=20=20=20=20=20=20=20
.blk_mq_sched_dispatch_requests+0x144/0x230
Aug 06 22:27:53 T800 kernel:         .__blk_mq_run_hw_queue+0xa4/0x140
Aug 06 22:27:53 T800 kernel:         .__blk_mq_delay_run_hw_queue+0x234/0x2=
40
Aug 06 22:27:53 T800 kernel:         .blk_mq_run_hw_queue+0xac/0x130
Aug 06 22:27:53 T800 kernel:         .blk_mq_sched_insert_requests+0x190/0x=
420
Aug 06 22:27:53 T800 kernel:         .blk_mq_flush_plug_list+0x224/0x4e0
Aug 06 22:27:53 T800 kernel:         .blk_flush_plug_list+0x128/0x170
Aug 06 22:27:53 T800 kernel:         .blk_finish_plug+0x24/0x40
Aug 06 22:27:53 T800 kernel:         .read_pages+0xa0/0x240
Aug 06 22:27:53 T800 kernel:         .__do_page_cache_readahead+0x238/0x2b0
Aug 06 22:27:53 T800 kernel: INFO: Slab 0x00000000559e0a9c objects=3D19 use=
d=3D19
fp=3D0x0000000016708aa5 flags=3D0x7fe00000010200
Aug 06 22:27:53 T800 kernel: INFO: Object 0x00000000d181f14b @offset=3D8
fp=3D0x0000000035f5f997
Aug 06 22:27:53 T800 kernel: Redzone 000000006c7b1db8: bb bb bb bb bb bb bb=
 bb=20
                        ........
Aug 06 22:27:53 T800 kernel: Object 00000000d181f14b: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 00000000f4600676: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 000000009ecde695: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 000000007dfb2519: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 000000004c46d89f: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 00000000b68dc230: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 00000000b6fcf14d: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 00000000f3752aca: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 000000007662c42e: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 0000000086080f07: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 000000003df14b51: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 00000000769dc0ba: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 000000006f036f9c: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 000000005fbbe251: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 000000001c3da628: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 000000003535f2cc: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 000000006c4f0b17: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 00000000aa181422: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 00000000e632967b: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 0000000083919b29: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 00000000ae24557c: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 00000000dc2cc57d: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 00000000995c45ac: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 00000000632e218e: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 00000000c0c20784: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 00000000f48aad9c: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 00000000f5449c05: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 00000000146f6d20: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 00000000e78d4c0d: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 0000000038d3f642: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Aug 06 22:27:53 T800 kernel: Object 00000000c9784ba9: 6b 6b 6b 6b 6b 6b 6b =
6b
00 00 00 00 00 00 00 00  kkkkkkkk........
Aug 06 22:27:53 T800 kernel: Object 00000000d0fb292a: 6b 6b 6b 6b 6b 6b 6b =
6b
6b 6b 6b 6b 6b 6b 6b a5  kkkkkkkkkkkkkkk.
Aug 06 22:27:53 T800 kernel: Redzone 0000000033bfd673: bb bb bb bb bb bb bb=
 bb=20
                        ........
Aug 06 22:27:53 T800 kernel: Padding 00000000833b50bf: 5a 5a 5a 5a 5a 5a 5a=
 5a=20
                        ZZZZZZZZ
Aug 06 22:27:53 T800 kernel: CPU: 0 PID: 284 Comm: (direxec) Tainted: G    =
B=20=20
W         5.3.0-rc3 #5
Aug 06 22:27:53 T800 kernel: Call Trace:
Aug 06 22:27:53 T800 kernel: [c00000045d93ea30] [c0000000009e1a74]
.dump_stack+0xe0/0x15c (unreliable)
Aug 06 22:27:53 T800 kernel: [c00000045d93ead0] [c0000000002d4640]
.print_trailer+0x228/0x250
Aug 06 22:27:53 T800 kernel: [c00000045d93eb70] [c0000000002c81f8]
.check_bytes_and_report+0x118/0x140
Aug 06 22:27:53 T800 kernel: [c00000045d93ec20] [c0000000002cac48]
.check_object+0x318/0x3a0
Aug 06 22:27:53 T800 kernel: [c00000045d93ecd0] [c0000000002cc6b8]
.alloc_debug_processing+0x158/0x210
Aug 06 22:27:53 T800 kernel: [c00000045d93ed60] [c0000000002cce28]
.___slab_alloc+0x6b8/0x860
Aug 06 22:27:53 T800 kernel: [c00000045d93eea0] [c0000000002cd024]
.__slab_alloc+0x54/0xc0
Aug 06 22:27:53 T800 kernel: [c00000045d93ef20] [c0000000002cda98]
.kmem_cache_alloc_node+0xf8/0x460
Aug 06 22:27:53 T800 kernel: [c00000045d93efd0] [c00000000062a53c]
.bfq_get_queue+0x27c/0x600
Aug 06 22:27:53 T800 kernel: [c00000045d93f0a0] [c00000000062d80c]
.bfq_init_rq+0x43c/0x940
Aug 06 22:27:53 T800 kernel: [c00000045d93f180] [c00000000062e0c0]
.bfq_insert_requests+0x130/0x1120
Aug 06 22:27:53 T800 kernel: [c00000045d93f2e0] [c000000000606118]
.blk_mq_sched_insert_requests+0x138/0x420
Aug 06 22:27:53 T800 kernel: [c00000045d93f390] [c0000000005ff2f4]
.blk_mq_flush_plug_list+0x224/0x4e0
Aug 06 22:27:53 T800 kernel: [c00000045d93f490] [c0000000005ef978]
.blk_flush_plug_list+0x128/0x170
Aug 06 22:27:53 T800 kernel: [c00000045d93f550] [c0000000005ef9e4]
.blk_finish_plug+0x24/0x40
Aug 06 22:27:53 T800 kernel: [c00000045d93f5c0] [c000000000234fc0]
.read_pages+0xa0/0x240
Aug 06 22:27:53 T800 kernel: [c00000045d93f6b0] [c000000000235398]
.__do_page_cache_readahead+0x238/0x2b0
Aug 06 22:27:53 T800 kernel: [c00000045d93f7b0] [c0000000002356f8]
.ondemand_readahead+0x2e8/0x640
Aug 06 22:27:53 T800 kernel: [c00000045d93f870] [c000000000224fb4]
.generic_file_read_iter+0x914/0xd80
Aug 06 22:27:53 T800 kernel: [c00000045d93f9f0] [c0000000002fd7a0]
.new_sync_read+0x140/0x1c0
Aug 06 22:27:53 T800 kernel: [c00000045d93fae0] [c000000000300490]
.vfs_read+0xb0/0x1b0
Aug 06 22:27:53 T800 kernel: [c00000045d93fb80] [c0000000003005d8]
.kernel_read+0x48/0x80
Aug 06 22:27:53 T800 kernel: [c00000045d93fc00] [c000000000309bc4]
.prepare_binprm+0x194/0x210
Aug 06 22:27:53 T800 kernel: [c00000045d93fca0] [c00000000030b3d4]
.__do_execve_file.isra.46+0x6c4/0xca0
Aug 06 22:27:53 T800 kernel: [c00000045d93fda0] [c00000000030c948]
.__se_sys_execve+0x48/0x60
Aug 06 22:27:53 T800 kernel: [c00000045d93fe20] [c00000000000a324]
system_call+0x5c/0x70
Aug 06 22:27:53 T800 kernel: FIX bfq_queue: Restoring
0x00000000c2bbc60e-0x00000000710e6222=3D0x6b
Aug 06 22:27:53 T800 kernel: FIX bfq_queue: Marking all objects used
[...]

On the G4 DP I use a SSD with kyber scheduler, on the G5 it's a HDD with bf=
q.

--=20
You are receiving this mail because:
You are on the CC list for the bug.=

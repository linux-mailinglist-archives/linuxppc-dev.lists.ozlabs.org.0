Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D52E963313F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 01:20:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGPzf62Fxz3ccg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 11:20:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t89hEQU1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t89hEQU1;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGPyk1gTpz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 11:19:42 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BCDC1B818BB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 00:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CC54C433D6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 00:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669076376;
	bh=v/zTtrEHPe1NwfmCtSKmDbtUC/x0GNI55CPoOdy1aIg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=t89hEQU1PrpCtLWcbmQ16ixwZk9OVQrt8Rpvu+E8zgJYtU7t5ZO4bAW/aB44gg0A0
	 SxsGSmEM5TfKgCt3ISghj3jlL/clYy5YF3NfEnv28K/QjICukpfXCeZ2U3NOlig9w+
	 XCawJXCCLpshsE7KqvtwiooZ3LQAFp9RXXT4po9ue+st5Dl0dDcu1L09xmplI1OG/W
	 kI21LAzYCYfUR/cob4fGI44XGXsVSQZps/0eizETFqQN/Cb1O2ETjf7zAmMNGZP7iP
	 ZuR6hrBmQEETMAuK/XWwMqikPyc+iP+qyLLJgzY8B8RuMo/B9v2NpY2gcmHZTsShoa
	 gr5inWWcwMGRQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5D23BC433E4; Tue, 22 Nov 2022 00:19:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216715] kernel 6.1-rc5 + KASAN_OUTLINE fails to boot at very
 early stage when DEBUG_PAGEALLOC_ENABLE_DEFAULT is enabled (PowerMac G4 3,6)
Date: Tue, 22 Nov 2022 00:19:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216715-206035-GT79YJhv8q@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216715-206035@https.bugzilla.kernel.org/>
References: <bug-216715-206035@https.bugzilla.kernel.org/>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D216715

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 303256
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303256&action=3Dedit
kernel dmesg (6.1-rc6, PowerMac G4 DP) - BUG: KASAN: slab-out-of-bounds

Rarely but sometimes boot fails due to a KASAN error like this:

[...]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: slab-out-of-bounds in filemap_map_pages+0x2c8/0x5d0
Read of size 4 at addr c336c170 by task systemd/112

CPU: 1 PID: 112 Comm: systemd Tainted: G                TN 6.1.0-rc6-PMacG4=
 #30
Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
Call Trace:
[f1973c60] [c0d3b790] dump_stack_lvl+0x60/0xa4 (unreliable)
[f1973c80] [c033d124] print_report+0x154/0x4f4
[f1973cd0] [c033ce40] kasan_report+0xe8/0x218
[f1973d40] [c0284234] filemap_map_pages+0x2c8/0x5d0
[f1973e00] [c02dfb54] handle_mm_fault+0xb58/0x10bc
[f1973ed0] [c002b994] ___do_page_fault+0x228/0x814
[f1973f10] [c002c1d4] do_page_fault+0x28/0x6c
[f1973f30] [c00044a8] InstructionAccess_virt+0x114/0x118
--- interrupt: 400 at 0xa7452df4
NIP:  a7452df4 LR: a7452974 CTR: 00000000
REGS: f1973f40 TRAP: 0400   Tainted: G                TN  (6.1.0-rc6-PMacG4)
MSR:  4000d032 <EE,PR,ME,IR,DR,RI>  CR: 480042e0  XER: 00000000

GPR00: 00000000 afdd8cf0 a7b4a5a0 00000000 a7452974 480042e0 00000000 a7452=
df4=20
GPR08: 0000d032 400c13f8 400c1509 400c161a 400c12e7 00b2fc1c 00000000 00000=
000=20
GPR16: 00000000 00000000 afdd8f20 afdd8e98 00000000 00000001 00000000 00000=
000=20
GPR24: 00000000 02084ffc 00000000 afdd8f1c 02084b80 02084810 a757fff4 00000=
001=20
NIP [a7452df4] 0xa7452df4
LR [a7452974] 0xa7452974
--- interrupt: 400

Allocated by task 1:
 kasan_set_track+0x44/0x94
 __kasan_slab_alloc+0xa0/0xe8
 kmem_cache_alloc+0x224/0x684
 __kernfs_new_node+0xe8/0x354
 kernfs_new_node+0x84/0xfc
 __kernfs_create_file+0x50/0x204
 sysfs_add_file_mode_ns+0xf4/0x1f0
 internal_create_group+0x1f0/0x620
 sysfs_slab_add+0x23c/0x2dc
 __kmem_cache_create+0x1bc/0x584
 kmem_cache_create_usercopy+0x250/0x39c
 btrfs_init_cachep+0x48/0x1e0
 init_btrfs_fs+0x50/0x2b0
 do_one_initcall+0xc0/0x34c
 kernel_init_freeable+0x2c0/0x400
 kernel_init+0x28/0x178
 ret_from_kernel_thread+0x5c/0x64

The buggy address belongs to the object at c336c118
 which belongs to the cache kernfs_node_cache of size 88
The buggy address is located 0 bytes to the right of
 88-byte region [c336c118, c336c170)

The buggy address belongs to the physical page:
page:eee4bb30 refcount:1 mapcount:0 mapping:00000000 index:0x0 pfn:0x336c
flags: 0x200(slab|zone=3D0)
raw: 00000200 00000100 00000122 c1852720 00000000 001e003c ffffffff 00000001
raw: 00000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 c336c000: fc 00 00 00 00 00 00 00 00 00 00 00 fc fc fc fc
 c336c080: fc fc 00 00 00 00 00 00 00 00 00 00 00 fc fc fc
>c336c100: fc fc fc 00 00 00 00 00 00 00 00 00 00 00 fc fc
                                                     ^
 c336c180: fc fc fc fc 00 00 00 00 00 00 00 00 00 00 00 fc
 c336c200: fc fc fc fc fc 00 00 00 00 00 00 00 00 00 00 00
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Disabling lock debugging due to kernel taint
get_swap_device: Bad swap file entry 00000010
get_swap_device: Bad swap file entry 00000010
get_swap_device: Bad swap file entry 00000010
get_swap_device: Bad swap file entry 00000010
get_swap_device: Bad swap file entry 00000010
get_swap_device: Bad swap file entry 00000010
systemd[1]: Mounting FUSE Control File System...
get_swap_device: Bad swap file entry 00000010
get_swap_device: Bad swap file entry 00000010
get_swap_device: Bad swap file entry 00000010
get_swap_device: Bad swap file entry 00000010
** 257 printk messages dropped **
get_swap_device: Bad swap file entry 00000010
get_swap_device: Bad swap file entry 00000010
get_swap_device: Bad swap file entry 00000010
systemd-journald[106]: /dev/kmsg buffer overrun, some messages lost.
get_swap_device: Bad swap file entry 00000010
[...]


After the 1st time this happened I checked swap to be sure it's not a disk
errors fault. But the swap partition showed no sign of error:

 # swapoff /dev/sdb6 && mkswap -f -L swap --verbose -c /dev/sdb6
0 besch=C3=A4digte Seiten
mkswap: /dev/sdb6: Warnung: Alte swap-Signatur wird gel=C3=B6scht.
Auslagerungsbereich Version 1 wird angelegt, Gr=C3=B6=C3=9Fe =3D 8 GiB (858=
9930496 Bytes)
LABEL=3Dswap, UUID=3Daa150610-5987-492c-b9db-d3ea3f34a6be

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

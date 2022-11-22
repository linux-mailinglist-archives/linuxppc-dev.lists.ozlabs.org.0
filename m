Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A8D633161
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 01:35:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGQK05H7qz3cMN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 11:35:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M5RzBESf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M5RzBESf;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGQJ20ZVVz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 11:34:41 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B4CAD61507
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 00:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F13FC433D6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 00:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669077279;
	bh=cifyMtrxQDoSsedwd55YOqNN4eAXBScDqeiN5SePSno=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=M5RzBESfYo82LsIywbJV8ImtHvmVkd4TUoUgzSxhyrRfyutFVK1Sm7TGwjqGjchph
	 9TRMETfVphSXLrtl3wJAx/f7CljXiLwADV1oLt5M2nRYZ92PWPlH7CeFYp9LnwdpHP
	 q0/1XLAh9kJjjWjgZEP9niKfh5+DJ40dDeTal+dWs3yeNhNZugn8VaIH4TYud3XkRL
	 ZlANWAS7s2Rp8ufOsp/l6+IgK3nIOlIBqVSEOKdMh8C+JMivpexKS6dSrVmX2jhZ/W
	 JXHB5I9kj6WwASriqHv+YPYuHctWVBF31OXdUj78cP71+2Q0vlzpt3PLwWWPCgBMB/
	 HL8mlCal7i7Zw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EB394C433E4; Tue, 22 Nov 2022 00:34:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216715] kernel 6.1-rc5 + KASAN_OUTLINE fails to boot at very
 early stage when DEBUG_PAGEALLOC_ENABLE_DEFAULT is enabled (PowerMac G4 3,6)
Date: Tue, 22 Nov 2022 00:34:38 +0000
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
Message-ID: <bug-216715-206035-E2zi0uFYCD@https.bugzilla.kernel.org/>
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

--- Comment #5 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 303257
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303257&action=3Dedit
303256: kernel dmesg (6.1-rc6, PowerMac G4 DP) - BUG: KASAN:
slab-out-of-bounds, 2nd time

Here a slightly different kernel is used with SMP off. KASAN hit happened
instantly after trying to build glibc:

[...]
BUG: KASAN: slab-out-of-bounds in set_pte_at+0x9c/0x16c
Read of size 4 at addr c322519c by task emerge/296

CPU: 0 PID: 296 Comm: emerge Tainted: G                TN 6.1.0-rc6-PMacG4s=
 #31
Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
Call Trace:
[f2aeb760] [c0ca8ecc] dump_stack_lvl+0x34/0x74 (unreliable)
[f2aeb780] [c02d2800] print_report+0x154/0x4f4
[f2aeb7d0] [c02d2508] kasan_report+0xec/0x230
[f2aeb830] [c002657c] set_pte_at+0x9c/0x16c
[f2aeb860] [c02744a8] copy_page_range+0x4ec/0xee0
[f2aeb990] [c005608c] dup_mm+0x70c/0x8ac
[f2aebab0] [c0057eec] copy_process+0x19b0/0x2c10
[f2aebba0] [c0059424] kernel_clone+0xd0/0x4c4
[f2aebc40] [c0059efc] sys_clone+0xfc/0x154
[f2aebd10] [c0017c60] system_call_exception+0x104/0x1ac
[f2aebf30] [c001f1ac] ret_from_syscall+0x0/0x2c
--- interrupt: c00 at 0xa7572df4
NIP:  a7572df4 LR: a7572974 CTR: a7747ee8
REGS: f2aebf40 TRAP: 0c00   Tainted: G                TN  (6.1.0-rc6-PMacG4=
s)
MSR:  0200f932 <VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 48882244  XER: 00000000

GPR00: 00000078 af879140 a7c2d5a0 01200011 00000000 00000000 00000000 a7c26=
088=20
GPR08: 00000000 00000002 a6e31870 a781c724 48882242 008bfff4 00000000 00a02=
43c=20
GPR16: 00000000 016b591e 016b5910 af879304 31afa123 00000001 00000000 a7c28=
4fc=20
GPR24: 00000000 00000000 a58ddc88 a7ae3128 a7bc1f08 a6ee0118 a769fff4 00000=
001=20
NIP [a7572df4] 0xa7572df4
LR [a7572974] 0xa7572974
--- interrupt: c00

Allocated by task 1:
 kasan_set_track+0x44/0x94
 __kasan_slab_alloc+0xa0/0xe8
 kmem_cache_alloc+0x1e8/0x664
 __kernfs_new_node+0xe8/0x354
 kernfs_new_node+0x84/0xfc
 __kernfs_create_file+0x50/0x204
 sysfs_add_file_mode_ns+0xf4/0x1f0
 internal_create_group+0x1f0/0x620
 sysfs_slab_add+0x23c/0x2dc
 __kmem_cache_create+0x14c/0x510
 kmem_cache_create_usercopy+0x250/0x39c
 btrfs_init_cachep+0x48/0x1e8
 init_btrfs_fs+0x50/0x2b0
 do_one_initcall+0xc0/0x34c
 kernel_init_freeable+0x2a0/0x3e0
 kernel_init+0x28/0x174
 ret_from_kernel_thread+0x5c/0x64

The buggy address belongs to the object at c32251a0
 which belongs to the cache kernfs_node_cache of size 88
The buggy address is located 4 bytes to the left of
 88-byte region [c32251a0, c32251f8)

The buggy address belongs to the physical page:
page:eee50d34 refcount:1 mapcount:0 mapping:00000000 index:0x0 pfn:0x3225
flags: 0x200(slab|zone=3D0)
raw: 00000200 00000100 00000122 c1843d20 00000000 001e003c ffffffff 00000001
raw: 00000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 c3225080: fc fc 00 00 00 00 00 00 00 00 00 00 00 fc fc fc
 c3225100: fc fc fc 00 00 00 00 00 00 00 00 00 00 00 fc fc
>c3225180: fc fc fc fc 00 00 00 00 00 00 00 00 00 00 00 fc
                    ^
 c3225200: fc fc fc fc fc 00 00 00 00 00 00 00 00 00 00 00
 c3225280: fc fc fc fc fc fc 00 00 00 00 00 00 00 00 00 00
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Disabling lock debugging due to kernel taint
_swap_info_get: Bad swap file entry 10005281
BUG: Bad page map in process emerge  pte:00528124 pmd:03225000
addr:af85a000 vm_flags:00100173 anon_vma:c8fb3bd8 mapping:00000000 index:af=
fdf
file:(null) fault:0x0 mmap:0x0 read_folio:0x0
CPU: 0 PID: 300 Comm: emerge Tainted: G    B           TN 6.1.0-rc6-PMacG4s=
 #31
Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
Call Trace:
[f2f838c0] [c0ca8ecc] dump_stack_lvl+0x34/0x74 (unreliable)
[f2f838e0] [c02717e8] print_bad_pte+0x2e8/0x364
[f2f83970] [c027579c] unmap_page_range+0x900/0xa30
[f2f83a30] [c027607c] unmap_vmas+0x1d8/0x2cc
[f2f83b30] [c0283a68] exit_mmap+0x154/0x2f0
[f2f83c50] [c00542e8] mmput+0x98/0x244
[f2f83c80] [c005f784] do_exit+0x434/0xdc0
[f2f83d00] [c0060318] do_group_exit+0x64/0x100
[f2f83d30] [c00603e4] __wake_up_parent+0x0/0x4c
[f2f83d50] [c0017c60] system_call_exception+0x104/0x1ac
[f2f83f30] [c001f1ac] ret_from_syscall+0x0/0x2c
--- interrupt: c00 at 0xa7572ec0
[...]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F48A59EE65
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 23:46:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MC2pt3nqMz3c5p
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 07:45:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UdB4lk1U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UdB4lk1U;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MC2p66JMTz2xGn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 07:45:18 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 894BF615FC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 21:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDF10C433D6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 21:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661291114;
	bh=MvdfDgW/QllGgcTeUTzNnVioQ1858wDf7/mT1vG4Iog=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UdB4lk1UKK2rVT0ajbK1zoupfUmIMM5iPyA4f+nFq3dcbRjkbTkF8gbK41D8Hlew9
	 3BmUtKdQY9ZDKk61JVA2S77fKsCXrQo32yj293dRJtWBrIYQyVWvj5KeoUy00jN5M4
	 TJ24kMJUg22Q4PfMqih7UcisoxDhjVbGyVxt80YFH4zbOipdrOHTBJj86lOkIYheGo
	 TpkBmxToEV6q6eauQ7z2HrvBF5elSr6zmECx5AQkXd2sknovnXI+JGdZuxugINMf5E
	 KS4ppfvGUSI0SAyFh19hjF8s9bqdUeaTiz8gCWeX90PMP4hRe//re9hlPAZeT0iTzn
	 xJP0usRs//78g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CF9FEC433E4; Tue, 23 Aug 2022 21:45:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] pagealloc: memory corruption at building glibc-2.33 and
 running its' testsuite
Date: Tue, 23 Aug 2022 21:45:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-215389-206035-kKkXZql8nn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215389-206035@https.bugzilla.kernel.org/>
References: <bug-215389-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215389

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #301302|0                           |1
        is obsolete|                            |

--- Comment #34 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301639
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301639&action=3Dedit
dmesg (6.0-rc2, outline KASAN, PowerMac G4 DP)

Getting a more interesting backtrace with v6.0.0-rc2 + outline KASAN:

[...]
BUG: KASAN: slab-out-of-bounds in handle_mm_fault+0x27c/0x10f4
Read of size 4 at addr c32edd48 by task cc1plus/1230

CPU: 1 PID: 1230 Comm: cc1plus Tainted: G                T  6.0.0-rc2-PMacG=
4 #5
Call Trace:
[f4d2bd40] [c0864cc4] dump_stack_lvl+0x60/0xa4 (unreliable)
[f4d2bd60] [c032b8d8] print_report+0x30c/0x688
[f4d2bdb0] [c032befc] kasan_report+0xe4/0x214
[f4d2be00] [c02ce4d8] handle_mm_fault+0x27c/0x10f4
[f4d2bed0] [c002cc98] ___do_page_fault+0x25c/0x8d0
[f4d2bf10] [c002d560] do_page_fault+0x28/0x6c
[f4d2bf30] [c000433c] DataAccess_virt+0x124/0x17c
--- interrupt: 300 at 0xfa9c0c0
NIP:  0fa9c0c0 LR: 1066b838 CTR: 0fa9bea4
REGS: f4d2bf40 TRAP: 0300   Tainted: G                T   (6.0.0-rc2-PMacG4)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 24022828  XER: 20000000
DAR: 9a352014 DSISR: 42000000=20
GPR00: 1066b828 af869c10 a7dd1ba0 9a352000 00000000 00000018 9a352018 00000=
000=20
GPR08: 11c30000 0fb89a88 099aec30 0fa9bea4 88022444 11c3d4e0 00000001 af869=
e78=20
GPR16: 9afeeed0 9afedd60 10cef83c 115fdfd0 af869e80 11603030 9afeeed0 00000=
002=20
GPR24: 9afeeed0 9b611f60 115fdfd0 a0c82c30 9afeeed0 00000005 0000006e 9a352=
000=20
NIP [0fa9c0c0] 0xfa9c0c0
LR [1066b838] 0x1066b838
--- interrupt: 300

Allocated by task 1:
 __kasan_slab_alloc+0xd0/0x134
 kmem_cache_alloc+0x21c/0x66c
 __kernfs_new_node+0xe8/0x354
 kernfs_new_node+0x84/0xfc
 __kernfs_create_file+0x50/0x204
 sysfs_add_file_mode_ns+0xf4/0x1f0
 internal_create_group+0x1f0/0x620
 btrfs_init_sysfs+0x264/0x350
 init_btrfs_fs+0x24/0x280
 do_one_initcall+0xc0/0x34c
 kernel_init_freeable+0x2c0/0x400
 kernel_init+0x28/0x178
 ret_from_kernel_thread+0x5c/0x64

The buggy address belongs to the object at c32edd50
 which belongs to the cache kernfs_node_cache of size 88
The buggy address is located 8 bytes to the left of
 88-byte region [c32edd50, c32edda8)

The buggy address belongs to the physical page:
page:eee4a954 refcount:1 mapcount:0 mapping:00000000 index:0x0 pfn:0x32ed
flags: 0x200(slab|zone=3D0)
raw: 00000200 00000100 00000122 c1852520 00000000 001e003c ffffffff 00000001
raw: 00000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 c32edc00: 00 00 fc fc fc fc fc fc 00 00 00 00 00 00 00 00
 c32edc80: 00 00 00 fc fc fc fc fc fc 00 00 00 00 00 00 00
>c32edd00: 00 00 00 00 fc fc fc fc fc fc 00 00 00 00 00 00
                                      ^
 c32edd80: 00 00 00 00 00 fc fc fc fc fc fc 00 00 00 00 00
 c32ede00: 00 00 00 00 00 00 fc fc fc fc fc fc 00 00 00 00
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Disabling lock debugging due to kernel taint
get_swap_device: Bad swap file entry 64cccccc
get_swap_device: Bad swap file entry 64cccccc
get_swap_device: Bad swap file entry 64cccccc
get_swap_device: Bad swap file entry 64cccccc
get_swap_device: Bad swap file entry 64cccccc
get_swap_device: Bad swap file entry 64cccccc
get_swap_device: Bad swap file entry 64cccccc
get_swap_device: Bad swap file entry 64cccccc
get_swap_device: Bad swap file entry 64cccccc
get_swap_device: Bad swap file entry 64cccccc
[...]
get_swap_device: Bad swap file entry 64cccccc
get_swap_device: Bad swap file entry 64cccccc
get_swap_device: Bad swap file entry 64cccccc
get_swap_device: Bad swap file entry 64cccccc
get_swap_device: Bad swap file entry 64cccccc
get_swap_device: Bad swap file entry 64cccccc
get_swap_device: Bad swap file entry 64cccccc
get_swap_device: Bad swap file entry 64cccccc
get_swap_device: Bad swap file entry 64cccccc
get_swap_device: Bad swap file entry 64cccccc
_swap_info_get: Bad swap file entry 64cccccc
BUG: Bad page map in process cc1plus  pte:cccccccc pmd:032ed000
addr:9a352000 vm_flags:00100073 anon_vma:c5933ee8 mapping:00000000 index:9a=
352
file:(null) fault:0x0 mmap:0x0 read_folio:0x0
CPU: 0 PID: 1230 Comm: cc1plus Tainted: G    B   W       T  6.0.0-rc2-PMacG=
4 #5
Call Trace:
[f4d2b9b0] [c0864cc4] dump_stack_lvl+0x60/0xa4 (unreliable)
[f4d2b9d0] [c02c5bc4] print_bad_pte+0x2e8/0x364
[f4d2ba60] [c02c9c3c] unmap_page_range+0x964/0xb78
[f4d2bb20] [c02ca590] unmap_vmas+0x168/0x2d4
[f4d2bbd0] [c02d8af0] exit_mmap+0x11c/0x2dc
[f4d2bca0] [c005e8f4] mmput+0xa0/0x254
[f4d2bcd0] [c006e1b4] do_exit+0x430/0xe08
[f4d2bd50] [c006ed88] do_group_exit+0x68/0x11c
[f4d2bd80] [c0086818] get_signal+0xbfc/0xc50
[f4d2be30] [c000edf8] do_notify_resume+0xf0/0x540
[f4d2bf10] [c0019cfc] interrupt_exit_user_prepare_main+0x7c/0xd0
[f4d2bf30] [c00234ac] interrupt_return+0x14/0x190
--- interrupt: 300 at 0xfa9c0c0
NIP:  0fa9c0c0 LR: 1066b838 CTR: 0fa9bea4
REGS: f4d2bf40 TRAP: 0300   Tainted: G    B   W       T   (6.0.0-rc2-PMacG4)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 24022828  XER: 20000000
DAR: 9a352014 DSISR: 42000000=20
GPR00: 1066b828 af869c10 a7dd1ba0 9a352000 00000000 00000018 9a352018 00000=
000=20
GPR08: 11c30000 0fb89a88 099aec30 0fa9bea4 88022444 11c3d4e0 00000001 af869=
e78=20
GPR16: 9afeeed0 9afedd60 10cef83c 115fdfd0 af869e80 11603030 9afeeed0 00000=
002=20
GPR24: 9afeeed0 9b611f60 115fdfd0 a0c82c30 9afeeed0 00000005 0000006e 9a352=
000=20
NIP [0fa9c0c0] 0xfa9c0c0
LR [1066b838] 0x1066b838
--- interrupt: 300
_swap_info_get: Bad swap file entry 64cccccc
BUG: Bad page map in process cc1plus  pte:cccccccc pmd:032ed000
addr:9a353000 vm_flags:00100073 anon_vma:c5933ee8 mapping:00000000 index:9a=
353
file:(null) fault:0x0 mmap:0x0 read_folio:0x0
CPU: 0 PID: 1230 Comm: cc1plus Tainted: G    B   W       T  6.0.0-rc2-PMacG=
4 #5
Call Trace:
[f4d2b9b0] [c0864cc4] dump_stack_lvl+0x60/0xa4 (unreliable)
[f4d2b9d0] [c02c5bc4] print_bad_pte+0x2e8/0x364
[f4d2ba60] [c02c9c3c] unmap_page_range+0x964/0xb78
[f4d2bb20] [c02ca590] unmap_vmas+0x168/0x2d4
[f4d2bbd0] [c02d8af0] exit_mmap+0x11c/0x2dc
[f4d2bca0] [c005e8f4] mmput+0xa0/0x254
[f4d2bcd0] [c006e1b4] do_exit+0x430/0xe08
[f4d2bd50] [c006ed88] do_group_exit+0x68/0x11c
[f4d2bd80] [c0086818] get_signal+0xbfc/0xc50
[f4d2be30] [c000edf8] do_notify_resume+0xf0/0x540
[f4d2bf10] [c0019cfc] interrupt_exit_user_prepare_main+0x7c/0xd0
[f4d2bf30] [c00234ac] interrupt_return+0x14/0x190
--- interrupt: 300 at 0xfa9c0c0
NIP:  0fa9c0c0 LR: 1066b838 CTR: 0fa9bea4
REGS: f4d2bf40 TRAP: 0300   Tainted: G    B   W       T   (6.0.0-rc2-PMacG4)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 24022828  XER: 20000000
DAR: 9a352014 DSISR: 42000000=20
GPR00: 1066b828 af869c10 a7dd1ba0 9a352000 00000000 00000018 9a352018 00000=
000=20
GPR08: 11c30000 0fb89a88 099aec30 0fa9bea4 88022444 11c3d4e0 00000001 af869=
e78=20
GPR16: 9afeeed0 9afedd60 10cef83c 115fdfd0 af869e80 11603030 9afeeed0 00000=
002=20
GPR24: 9afeeed0 9b611f60 115fdfd0 a0c82c30 9afeeed0 00000005 0000006e 9a352=
000=20
NIP [0fa9c0c0] 0xfa9c0c0
LR [1066b838] 0x1066b838
--- interrupt: 300
BUG: Bad page map in process cc1plus  pte:00000001 pmd:032ed000
page:eedd8000 refcount:1 mapcount:-1 mapping:00000000 index:0x0 pfn:0x0
flags: 0x1000(reserved|zone=3D0)
raw: 00001000 eedd8004 eedd8004 00000000 00000000 00000000 fffffffe 00000001
raw: 00000000
page dumped because: bad pte
addr:9a354000 vm_flags:00100073 anon_vma:c5933ee8 mapping:00000000 index:9a=
354
file:(null) fault:0x0 mmap:0x0 read_folio:0x0
CPU: 0 PID: 1230 Comm: cc1plus Tainted: G    B   W       T  6.0.0-rc2-PMacG=
4 #5
Call Trace:
[f4d2b9b0] [c0864cc4] dump_stack_lvl+0x60/0xa4 (unreliable)
[f4d2b9d0] [c02c5bc4] print_bad_pte+0x2e8/0x364
[f4d2ba60] [c02c9974] unmap_page_range+0x69c/0xb78
[f4d2bb20] [c02ca590] unmap_vmas+0x168/0x2d4
[f4d2bbd0] [c02d8af0] exit_mmap+0x11c/0x2dc
[f4d2bca0] [c005e8f4] mmput+0xa0/0x254
[f4d2bcd0] [c006e1b4] do_exit+0x430/0xe08
[f4d2bd50] [c006ed88] do_group_exit+0x68/0x11c
[f4d2bd80] [c0086818] get_signal+0xbfc/0xc50
[f4d2be30] [c000edf8] do_notify_resume+0xf0/0x540
[f4d2bf10] [c0019cfc] interrupt_exit_user_prepare_main+0x7c/0xd0
[f4d2bf30] [c00234ac] interrupt_return+0x14/0x190
--- interrupt: 300 at 0xfa9c0c0
NIP:  0fa9c0c0 LR: 1066b838 CTR: 0fa9bea4
REGS: f4d2bf40 TRAP: 0300   Tainted: G    B   W       T   (6.0.0-rc2-PMacG4)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 24022828  XER: 20000000
DAR: 9a352014 DSISR: 42000000=20
GPR00: 1066b828 af869c10 a7dd1ba0 9a352000 00000000 00000018 9a352018 00000=
000=20
GPR08: 11c30000 0fb89a88 099aec30 0fa9bea4 88022444 11c3d4e0 00000001 af869=
e78=20
GPR16: 9afeeed0 9afedd60 10cef83c 115fdfd0 af869e80 11603030 9afeeed0 00000=
002=20
GPR24: 9afeeed0 9b611f60 115fdfd0 a0c82c30 9afeeed0 00000005 0000006e 9a352=
000=20
NIP [0fa9c0c0] 0xfa9c0c0
LR [1066b838] 0x1066b838
--- interrupt: 300
_swap_info_get: Bad swap file entry 14c32d92
BUG: Bad page map in process cc1plus  pte:c32d9228 pmd:032ed000
addr:9a356000 vm_flags:00100073 anon_vma:c5933ee8 mapping:00000000 index:9a=
356
file:(null) fault:0x0 mmap:0x0 read_folio:0x0
CPU: 0 PID: 1230 Comm: cc1plus Tainted: G    B   W       T  6.0.0-rc2-PMacG=
4 #5
Call Trace:
[f4d2b9b0] [c0864cc4] dump_stack_lvl+0x60/0xa4 (unreliable)
[f4d2b9d0] [c02c5bc4] print_bad_pte+0x2e8/0x364
[f4d2ba60] [c02c9c3c] unmap_page_range+0x964/0xb78
[f4d2bb20] [c02ca590] unmap_vmas+0x168/0x2d4
[f4d2bbd0] [c02d8af0] exit_mmap+0x11c/0x2dc
[f4d2bca0] [c005e8f4] mmput+0xa0/0x254
[f4d2bcd0] [c006e1b4] do_exit+0x430/0xe08
[f4d2bd50] [c006ed88] do_group_exit+0x68/0x11c
[f4d2bd80] [c0086818] get_signal+0xbfc/0xc50
[f4d2be30] [c000edf8] do_notify_resume+0xf0/0x540
[f4d2bf10] [c0019cfc] interrupt_exit_user_prepare_main+0x7c/0xd0
[f4d2bf30] [c00234ac] interrupt_return+0x14/0x190
--- interrupt: 300 at 0xfa9c0c0
NIP:  0fa9c0c0 LR: 1066b838 CTR: 0fa9bea4
REGS: f4d2bf40 TRAP: 0300   Tainted: G    B   W       T   (6.0.0-rc2-PMacG4)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 24022828  XER: 20000000
DAR: 9a352014 DSISR: 42000000=20
GPR00: 1066b828 af869c10 a7dd1ba0 9a352000 00000000 00000018 9a352018 00000=
000=20
GPR08: 11c30000 0fb89a88 099aec30 0fa9bea4 88022444 11c3d4e0 00000001 af869=
e78=20
GPR16: 9afeeed0 9afedd60 10cef83c 115fdfd0 af869e80 11603030 9afeeed0 00000=
002=20
GPR24: 9afeeed0 9b611f60 115fdfd0 a0c82c30 9afeeed0 00000005 0000006e 9a352=
000=20
NIP [0fa9c0c0] 0xfa9c0c0
LR [1066b838] 0x1066b838
--- interrupt: 300
_swap_info_get: Bad swap file entry 60c0e0fa
BUG: Bad page map in process cc1plus  pte:c0e0fac0 pmd:032ed000
addr:9a357000 vm_flags:00100073 anon_vma:c5933ee8 mapping:00000000 index:9a=
357
file:(null) fault:0x0 mmap:0x0 read_folio:0x0
CPU: 0 PID: 1230 Comm: cc1plus Tainted: G    B   W       T  6.0.0-rc2-PMacG=
4 #5
Call Trace:
[f4d2b9b0] [c0864cc4] dump_stack_lvl+0x60/0xa4 (unreliable)
[f4d2b9d0] [c02c5bc4] print_bad_pte+0x2e8/0x364
[f4d2ba60] [c02c9c3c] unmap_page_range+0x964/0xb78
[f4d2bb20] [c02ca590] unmap_vmas+0x168/0x2d4
[f4d2bbd0] [c02d8af0] exit_mmap+0x11c/0x2dc
[f4d2bca0] [c005e8f4] mmput+0xa0/0x254
[f4d2bcd0] [c006e1b4] do_exit+0x430/0xe08
[f4d2bd50] [c006ed88] do_group_exit+0x68/0x11c
[f4d2bd80] [c0086818] get_signal+0xbfc/0xc50
[f4d2be30] [c000edf8] do_notify_resume+0xf0/0x540
[f4d2bf10] [c0019cfc] interrupt_exit_user_prepare_main+0x7c/0xd0
[f4d2bf30] [c00234ac] interrupt_return+0x14/0x190
--- interrupt: 300 at 0xfa9c0c0
NIP:  0fa9c0c0 LR: 1066b838 CTR: 0fa9bea4
REGS: f4d2bf40 TRAP: 0300   Tainted: G    B   W       T   (6.0.0-rc2-PMacG4)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 24022828  XER: 20000000
DAR: 9a352014 DSISR: 42000000=20
GPR00: 1066b828 af869c10 a7dd1ba0 9a352000 00000000 00000018 9a352018 00000=
000=20
GPR08: 11c30000 0fb89a88 099aec30 0fa9bea4 88022444 11c3d4e0 00000001 af869=
e78=20
GPR16: 9afeeed0 9afedd60 10cef83c 115fdfd0 af869e80 11603030 9afeeed0 00000=
002=20
GPR24: 9afeeed0 9b611f60 115fdfd0 a0c82c30 9afeeed0 00000005 0000006e 9a352=
000=20
NIP [0fa9c0c0] 0xfa9c0c0
LR [1066b838] 0x1066b838
--- interrupt: 300
_swap_info_get: Bad swap file entry 50c32ed0
BUG: Bad page map in process cc1plus  pte:c32ed0a0 pmd:032ed000
addr:9a358000 vm_flags:00100073 anon_vma:c5933ee8 mapping:00000000 index:9a=
358
file:(null) fault:0x0 mmap:0x0 read_folio:0x0
CPU: 0 PID: 1230 Comm: cc1plus Tainted: G    B   W       T  6.0.0-rc2-PMacG=
4 #5
Call Trace:
[f4d2b9b0] [c0864cc4] dump_stack_lvl+0x60/0xa4 (unreliable)
[f4d2b9d0] [c02c5bc4] print_bad_pte+0x2e8/0x364
[f4d2ba60] [c02c9c3c] unmap_page_range+0x964/0xb78
[f4d2bb20] [c02ca590] unmap_vmas+0x168/0x2d4
[f4d2bbd0] [c02d8af0] exit_mmap+0x11c/0x2dc
[f4d2bca0] [c005e8f4] mmput+0xa0/0x254
[f4d2bcd0] [c006e1b4] do_exit+0x430/0xe08
[f4d2bd50] [c006ed88] do_group_exit+0x68/0x11c
[f4d2bd80] [c0086818] get_signal+0xbfc/0xc50
[f4d2be30] [c000edf8] do_notify_resume+0xf0/0x540
[f4d2bf10] [c0019cfc] interrupt_exit_user_prepare_main+0x7c/0xd0
[f4d2bf30] [c00234ac] interrupt_return+0x14/0x190
--- interrupt: 300 at 0xfa9c0c0
NIP:  0fa9c0c0 LR: 1066b838 CTR: 0fa9bea4
REGS: f4d2bf40 TRAP: 0300   Tainted: G    B   W       T   (6.0.0-rc2-PMacG4)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 24022828  XER: 20000000
DAR: 9a352014 DSISR: 42000000=20
GPR00: 1066b828 af869c10 a7dd1ba0 9a352000 00000000 00000018 9a352018 00000=
000=20
GPR08: 11c30000 0fb89a88 099aec30 0fa9bea4 88022444 11c3d4e0 00000001 af869=
e78=20
GPR16: 9afeeed0 9afedd60 10cef83c 115fdfd0 af869e80 11603030 9afeeed0 00000=
002=20
GPR24: 9afeeed0 9b611f60 115fdfd0 a0c82c30 9afeeed0 00000005 0000006e 9a352=
000=20
NIP [0fa9c0c0] 0xfa9c0c0
LR [1066b838] 0x1066b838
--- interrupt: 300
_swap_info_get: Bad swap file entry 4c2a45bd
BUG: Bad page map in process cc1plus  pte:2a45bd98 pmd:032ed000
addr:9a35c000 vm_flags:00100073 anon_vma:c5933ee8 mapping:00000000 index:9a=
35c
file:(null) fault:0x0 mmap:0x0 read_folio:0x0
CPU: 0 PID: 1230 Comm: cc1plus Tainted: G    B   W       T  6.0.0-rc2-PMacG=
4 #5
Call Trace:
[f4d2b9b0] [c0864cc4] dump_stack_lvl+0x60/0xa4 (unreliable)
[f4d2b9d0] [c02c5bc4] print_bad_pte+0x2e8/0x364
[f4d2ba60] [c02c9c3c] unmap_page_range+0x964/0xb78
[f4d2bb20] [c02ca590] unmap_vmas+0x168/0x2d4
[f4d2bbd0] [c02d8af0] exit_mmap+0x11c/0x2dc
[f4d2bca0] [c005e8f4] mmput+0xa0/0x254
[f4d2bcd0] [c006e1b4] do_exit+0x430/0xe08
[f4d2bd50] [c006ed88] do_group_exit+0x68/0x11c
[f4d2bd80] [c0086818] get_signal+0xbfc/0xc50
[f4d2be30] [c000edf8] do_notify_resume+0xf0/0x540
[f4d2bf10] [c0019cfc] interrupt_exit_user_prepare_main+0x7c/0xd0
[f4d2bf30] [c00234ac] interrupt_return+0x14/0x190
--- interrupt: 300 at 0xfa9c0c0
NIP:  0fa9c0c0 LR: 1066b838 CTR: 0fa9bea4
REGS: f4d2bf40 TRAP: 0300   Tainted: G    B   W       T   (6.0.0-rc2-PMacG4)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 24022828  XER: 20000000
DAR: 9a352014 DSISR: 42000000=20
GPR00: 1066b828 af869c10 a7dd1ba0 9a352000 00000000 00000018 9a352018 00000=
000=20
GPR08: 11c30000 0fb89a88 099aec30 0fa9bea4 88022444 11c3d4e0 00000001 af869=
e78=20
GPR16: 9afeeed0 9afedd60 10cef83c 115fdfd0 af869e80 11603030 9afeeed0 00000=
002=20
GPR24: 9afeeed0 9b611f60 115fdfd0 a0c82c30 9afeeed0 00000005 0000006e 9a352=
000=20
NIP [0fa9c0c0] 0xfa9c0c0
LR [1066b838] 0x1066b838
--- interrupt: 300
BUG: Unable to handle kernel data access on read at 0x09fcbaf8
Faulting instruction address: 0xc02c99a8
Oops: Kernel access of bad area, sig: 11 [#1]
BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
Modules linked in: auth_rpcgss nfsv4 dns_resolver nfs lockd grace sunrpc
hid_generic usbhid hid b43legacy mac80211 snd_aoa_codec_tas libarc4
snd_aoa_fabric_layout snd_aoa cfg80211 rfkill evdev mac_hid firewire_ohci
therm_windtunnel firewire_core sr_mod cdrom crc_itu_t snd_aoa_i2sbus
snd_aoa_soundbus snd_pcm snd_timer snd 8250_pci soundcore ssb pcmcia
pcmcia_core 8250 8250_base serial_mctrl_gpio ohci_pci radeon hwmon ohci_hcd
ehci_pci i2c_algo_bit drm_ttm_helper ttm drm_display_helper ehci_hcd
drm_kms_helper syscopyarea sysfillrect usbcore sysimgblt fb_sys_fops usb_co=
mmon
fuse drm drm_panel_orientation_quirks configfs
CPU: 0 PID: 1230 Comm: cc1plus Tainted: G    B   W       T  6.0.0-rc2-PMacG=
4 #5
NIP:  c02c99a8 LR: c02c99a8 CTR: 00000000
REGS: f4d2b9a0 TRAP: 0300   Tainted: G    B   W       T   (6.0.0-rc2-PMacG4)
MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 24d88838  XER: 20000000
DAR: 09fcbaf8 DSISR: 40000000=20
GPR00: 00000000 f4d2ba60 c3ff0020 00000000 00000000 00000000 00000000 00000=
000=20
GPR08: 00000000 00000000 00000000 00000000 00000000 11c3d4e0 f4d2bad0 00000=
000=20
GPR16: c7d11008 fe9a5752 c0de15e0 f4d2bb50 f4d2bab0 c3626ac8 00000000 c16ed=
525=20
GPR24: 9a400000 fffffffd 00000000 f4d2bc10 09fcbaf4 09fcbaf4 9a35f000 c32ed=
d78=20
NIP [c02c99a8] unmap_page_range+0x6d0/0xb78
LR [c02c99a8] unmap_page_range+0x6d0/0xb78
Call Trace:
[f4d2ba60] [c02c99a8] unmap_page_range+0x6d0/0xb78 (unreliable)
[f4d2bb20] [c02ca590] unmap_vmas+0x168/0x2d4
[f4d2bbd0] [c02d8af0] exit_mmap+0x11c/0x2dc
[f4d2bca0] [c005e8f4] mmput+0xa0/0x254
[f4d2bcd0] [c006e1b4] do_exit+0x430/0xe08
[f4d2bd50] [c006ed88] do_group_exit+0x68/0x11c
[f4d2bd80] [c0086818] get_signal+0xbfc/0xc50
[f4d2be30] [c000edf8] do_notify_resume+0xf0/0x540
[f4d2bf10] [c0019cfc] interrupt_exit_user_prepare_main+0x7c/0xd0
[f4d2bf30] [c00234ac] interrupt_return+0x14/0x190
--- interrupt: 300 at 0xfa9c0c0
NIP:  0fa9c0c0 LR: 1066b838 CTR: 0fa9bea4
REGS: f4d2bf40 TRAP: 0300   Tainted: G    B   W       T   (6.0.0-rc2-PMacG4)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 24022828  XER: 20000000
DAR: 9a352014 DSISR: 42000000=20
GPR00: 1066b828 af869c10 a7dd1ba0 9a352000 00000000 00000018 9a352018 00000=
000=20
GPR08: 11c30000 0fb89a88 099aec30 0fa9bea4 88022444 11c3d4e0 00000001 af869=
e78=20
GPR16: 9afeeed0 9afedd60 10cef83c 115fdfd0 af869e80 11603030 9afeeed0 00000=
002=20
GPR24: 9afeeed0 9b611f60 115fdfd0 a0c82c30 9afeeed0 00000005 0000006e 9a352=
000=20
NIP [0fa9c0c0] 0xfa9c0c0
LR [1066b838] 0x1066b838
--- interrupt: 300
Instruction dump:
7ecfb378 82410014 82c10018 4bffff04 3d40c170 578901be 83aa5580 1d290024=20
7fbd4a14 387d0004 7fbceb78 48063245 <813d0004> 712a0001 40820304 7f83e378=20
---[ end trace 0000000000000000 ]---

Fixing recursive fault but reboot is needed!


I deleted about 120.000 lines of "get_swap_device: Bad swap file entry
64cccccc" in the kernel dmesg to make it more compact. swap partition is 81=
92
MiB large at /dev/sdb6.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

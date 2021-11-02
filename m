Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40186442A66
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 10:28:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk4Mq0SGyz2yV7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 20:28:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=raO1IfZ3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=raO1IfZ3; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk4Lz32bMz2xXN
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 20:27:55 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 441E560F24
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 09:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635845269;
 bh=RDVh/nmNQEAqav24pejtgm+pZOzYbS3NG7nzqOKsoa4=;
 h=From:To:Subject:Date:From;
 b=raO1IfZ3KvFeciBL3K3pPJRvtEKArn8IyFEr2p8ws2dPf1lEVKk/vOboe7SkLbvY/
 ozlS1QQbBbm+LYencGMVg1wCb7rUuEkJzAfM9iahq88oUIWkex7SDm28VEp/XlRWHg
 YvS/3GW1nYmzv6QG7YGCZPhfW+y0u688n7EX/0/stx5FnYXQ90BwC5opghTuBMB3I8
 A49XYvsAn7z0X1cmHgZQLfiQRRc1Abl0M59xWmjssBcJ400g1L52zVpxxnyBXYX60Q
 AgGwMfDv+wQS4U/wSPre0udqQjXJcCwo9o9sU8fsdDdCXvpRYmi4WdEc33E/aihELE
 7qXhfvg0PTBEw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3159760F23; Tue,  2 Nov 2021 09:27:49 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 214913] New: [xfstests generic/051] BUG: Kernel NULL pointer
 dereference on read at 0x00000108 NIP [c0000000000372e4]
 tm_cgpr_active+0x14/0x40
Date: Tue, 02 Nov 2021 09:27:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: zlang@redhat.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-214913-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214913

            Bug ID: 214913
           Summary: [xfstests generic/051] BUG: Kernel NULL pointer
                    dereference on read at 0x00000108 NIP
                    [c0000000000372e4] tm_cgpr_active+0x14/0x40
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: mainline linux v5.15
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: zlang@redhat.com
        Regression: No

xfstests generic/051 and some similar test cases always hit a kernel panic =
on
XFS.
From the call trace, it doesn't look like a xfs bug. As I only reproduce it=
 on
ppc64le, so I report this bug to PPC64 at first.

[  740.492561] run fstests generic/051 at 2021-11-01 12:40:42=20
[  742.806962] XFS (sda3): Mounting V5 Filesystem=20
[  742.925825] XFS (sda3): Ending clean mount=20
[  742.955028] XFS (sda3): User initiated shutdown received.=20
[  742.955201] XFS (sda3): Metadata I/O Error (0x4) detected at
xfs_fs_goingdown+0x68/0x160 [xfs] (fs/xfs/xfs_fsops.c:497).  Shutting down
filesystem.=20
[  742.955370] XFS (sda3): Please unmount the filesystem and rectify the
problem(s)=20
[  742.973098] XFS (sda3): Unmounting Filesystem=20
[  744.352066] XFS (sda3): Mounting V5 Filesystem=20
[  744.425758] XFS (sda3): Ending clean mount=20
[  775.192100] XFS (sda3): Unmounting Filesystem=20
[  776.116445] XFS (sda3): Mounting V5 Filesystem=20
[  777.331381] XFS (sda3): Ending clean mount=20
[  800.111560] restraintd[1327]: *** Current Time: Mon Nov 01 12:41:42 2021=
=20
Localwatchdog at: Wed Nov 03 12:31:42 2021=20
[  813.403287] XFS (sda3): User initiated shutdown received.=20
[  813.403380] XFS (sda3): Log I/O Error (0x6) detected at
xfs_fs_goingdown+0xf8/0x160 [xfs] (fs/xfs/xfs_fsops.c:500).  Shutting down
filesystem.=20
[  813.403514] XFS (sda3): Please unmount the filesystem and rectify the
problem(s)=20
[  813.418455] sda3: writeback error on inode 60042, offset 63640576, sector
2306320=20
[  813.418484] sda3: writeback error on inode 81161, offset 13091840, sector
2306496=20
[  813.428831] sda3: writeback error on inode 16878782, offset 30536704, se=
ctor
18080754=20
[  813.429026] Kernel attempted to read user page (108) - exploit attempt?
(uid: 0)=20
[  813.429068] BUG: Kernel NULL pointer dereference on read at 0x00000108=20
[  813.429085] Faulting instruction address: 0xc0000000000372e4=20
[  813.429102] Oops: Kernel access of bad area, sig: 11 [#1]=20
[  813.429117] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pSerie=
s=20
[  813.429133] Modules linked in: bonding rfkill tls sunrpc pseries_rng drm
fuse drm_panel_orientation_quirks xfs libcrc32c sd_mod t10_pi sg ibmvscsi
ibmveth scsi_transport_srp vmx_crypto=20
[  813.429202] CPU: 3 PID: 94001 Comm: fsstress Kdump: loaded Tainted: G=20=
=20=20=20=20=20=20
W         5.15.0 #1=20
[  813.429216] NIP:  c0000000000372e4 LR: c0000000006d9e48 CTR:
c0000000000372d0=20
[  813.429227] REGS: c000000064ba7440 TRAP: 0300   Tainted: G        W=20=
=20=20=20=20=20=20=20=20
(5.15.0)=20
[  813.429238] MSR:  800000010280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE,TM[E=
]>=20
CR: 88004280  XER: 00000000=20
[  813.429272] CFAR: c00000000000cb1c DAR: 0000000000000108 DSISR: 40000000
IRQMASK: 0=20=20
[  813.429272] GPR00: c0000000006d9e48 c000000064ba76e0 c000000002cdc400
0000000000000000=20=20
[  813.429272] GPR04: c000000002c3ac50 0000000000000000 0000000000000000
c00000004d174000=20=20
[  813.429272] GPR08: c0000000013d21d8 0000000000000000 0000000000000012
0000000000000000=20=20
[  813.429272] GPR12: c0000000000372d0 c000000007fccb00 0000000000000000
0000000000000005=20=20
[  813.429272] GPR16: 0000000000000000 c0000000d19fa900 c000000001365bb0
c000000003fc26b4=20=20
[  813.429272] GPR20: c0000000d19fb338 0000000000040100 0000000000000001
0000000000000001=20=20
[  813.429272] GPR24: c00000000135d2e0 00000000ffffffff c000000064ba7968
c000000001091ef8=20=20
[  813.429272] GPR28: 0000000000000108 0000000000000004 c0000000cc456400
c000000002c3ac50=20=20
[  813.429396] NIP [c0000000000372e4] tm_cgpr_active+0x14/0x40=20
[  813.429420] LR [c0000000006d9e48] fill_thread_core_info+0x158/0x250=20
[  813.429435] Call Trace:=20
[  813.429443] [c000000064ba76e0] [c0000000006d9eb8]
fill_thread_core_info+0x1c8/0x250 (unreliable)=20
[  813.429465] [c000000064ba7760] [c0000000006dac70]
fill_note_info.constprop.0+0x240/0x420=20
[  813.429480] [c000000064ba77d0] [c0000000006daf3c] elf_core_dump+0xec/0x5=
e0=20
[  813.429494] [c000000064ba79e0] [c0000000006e1edc] do_coredump+0x32c/0xc1=
0=20
[  813.429507] [c000000064ba7bb0] [c000000000187adc] get_signal+0x52c/0x910=
=20
[  813.429519] [c000000064ba7ca0] [c000000000021b9c] do_signal+0x7c/0x330=20
[  813.429533] [c000000064ba7d40] [c000000000022e00]
do_notify_resume+0xb0/0x140=20
[  813.429548] [c000000064ba7d70] [c000000000031330]
interrupt_exit_user_prepare_main+0x220/0x280=20
[  813.429562] [c000000064ba7de0] [c000000000031804]
syscall_exit_prepare+0xe4/0x1e0=20
[  813.429575] [c000000064ba7e10] [c00000000000c174]
system_call_vectored_common+0xf4/0x278=20
[  813.429589] --- interrupt: 3000 at 0x7fffa9c7667c=20
[  813.429600] NIP:  00007fffa9c7667c LR: 0000000000000000 CTR:
0000000000000000=20
[  813.429610] REGS: c000000064ba7e80 TRAP: 3000   Tainted: G        W=20=
=20=20=20=20=20=20=20=20
(5.15.0)=20
[  813.429621] MSR:  800000000000d033 <SF,EE,PR,ME,IR,DR,RI,LE>  CR: 440044=
02=20
XER: 00000000=20
[  813.429647] IRQMASK: 0=20=20
[  813.429647] GPR00: 00000000000000fa 00007fffefa13e10 00007fffa9e17100
0000000000000000=20=20
[  813.429647] GPR04: 0000000000016f31 0000000000000006 0000000000000008
00000000ffffffff=20=20
[  813.429647] GPR08: 0000000000000000 0000000000000000 0000000000000000
0000000000000000=20=20
[  813.429647] GPR12: 0000000000000000 00007fffa9f2b040 0000000000000000
0000000000000000=20=20
[  813.429647] GPR16: 0000000000000000 0000000000000000 0000000000000000
0000000010030de4=20=20
[  813.429647] GPR20: 00000000100158c8 0000000000000000 0000000000000000
0000000010003d60=20=20
[  813.429647] GPR24: 0000000000000001 0000000010012c60 00000000100137c8
0000000000000006=20=20
[  813.429647] GPR28: 0000000000000005 ffffffffffffffff 00007fffa9f23840
0000000000016f31=20=20
[  813.429776] NIP [00007fffa9c7667c] 0x7fffa9c7667c=20
[  813.429789] LR [0000000000000000] 0x0=20
[  813.429799] --- interrupt: 3000=20
[  813.429808] Instruction dump:=20
[  813.429816] 4bfe8345 60000000 e8010040 38210030 ebe1fff8 7c0803a6 4e8000=
20
7c0802a6=20=20
[  813.429839] 60000000 60000000 e92329c0 38600000 <e9290108> 7929e844 7929=
1f43
4d820020=20=20
[  813.429863] ---[ end trace 8a41ad95f224ad91 ]---=20
[  813.431701]=20=20
[  813.431723] BUG: sleeping function called from invalid context at
kernel/locking/mutex.c:573=20
[  813.431733] in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 94001,
name: fsstress=20
[  813.431744] INFO: lockdep is turned off.=20
[  813.431750] irq event stamp: 1270330=20
[  813.431756] hardirqs last  enabled at (1270329): [<c000000000589680>]
___slab_alloc+0xc40/0xf60=20
[  813.431769] hardirqs last disabled at (1270330): [<c00000000009a4cc>]
interrupt_enter_prepare.constprop.0+0x10c/0x200=20
[  813.431784] softirqs last  enabled at (1269500): [<c008000001dc61dc>]
__rhashtable_insert_fast.constprop.0+0x3d4/0x7c0 [xfs]=20
[  813.431932] softirqs last disabled at (1269498): [<c008000001dc5ef8>]
__rhashtable_insert_fast.constprop.0+0xf0/0x7c0 [xfs]=20
[  813.432045] CPU: 3 PID: 94001 Comm: fsstress Kdump: loaded Tainted: G   =
   D
W         5.15.0 #1=20
[  813.432056] Call Trace:=20
[  813.432060] [c000000064ba6f20] [c00000000093e5d8] dump_stack_lvl+0xac/0x=
108
(unreliable)=20
[  813.432075] [c000000064ba6f60] [c0000000001b991c] ___might_sleep+0x2dc/0=
x300=20
[  813.432087] [c000000064ba6ff0] [c00000000107703c] __mutex_lock+0x6c/0x9e=
0=20
[  813.432098] [c000000064ba7100] [c00000000069f678]
io_uring_del_tctx_node+0x78/0x170=20
[  813.432111] [c000000064ba7140] [c0000000006b4c28]
io_uring_cancel_generic+0x248/0x3e0=20
[  813.432122] [c000000064ba7200] [c00000000016ff70] do_exit+0xf0/0x700=20
[  813.432135] [c000000064ba7290] [c00000000002b060] oops_end+0x1d0/0x200=20
[  813.432148] [c000000064ba7310] [c000000000092ac4]
__bad_page_fault+0x174/0x190=20
[  813.432177] [c000000064ba7380] [c00000000009c508]
__do_hash_fault+0x148/0x1f0=20
[  813.432196] [c000000064ba73b0] [c00000000009c5d8] do_hash_fault+0x28/0x6=
0=20
[  813.432211] [c000000064ba73d0] [c00000000000891c]
data_access_common_virt+0x19c/0x1f0=20
[  813.432226] --- interrupt: 300 at tm_cgpr_active+0x14/0x40=20
[  813.432234] NIP:  c0000000000372e4 LR: c0000000006d9e48 CTR:
c0000000000372d0=20
[  813.432244] REGS: c000000064ba7440 TRAP: 0300   Tainted: G      D W=20=
=20=20=20=20=20=20=20=20
(5.15.0)=20
[  813.432253] MSR:  800000010280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE,TM[E=
]>=20
CR: 88004280  XER: 00000000=20
[  813.432286] CFAR: c00000000000cb1c DAR: 0000000000000108 DSISR: 40000000
IRQMASK: 0=20=20
[  813.432286] GPR00: c0000000006d9e48 c000000064ba76e0 c000000002cdc400
0000000000000000=20=20
[  813.432286] GPR04: c000000002c3ac50 0000000000000000 0000000000000000
c00000004d174000=20=20
[  813.432286] GPR08: c0000000013d21d8 0000000000000000 0000000000000012
0000000000000000=20=20
[  813.432286] GPR12: c0000000000372d0 c000000007fccb00 0000000000000000
0000000000000005=20=20
[  813.432286] GPR16: 0000000000000000 c0000000d19fa900 c000000001365bb0
c000000003fc26b4=20=20
[  813.432286] GPR20: c0000000d19fb338 0000000000040100 0000000000000001
0000000000000001=20=20
[  813.432286] GPR24: c00000000135d2e0 00000000ffffffff c000000064ba7968
c000000001091ef8=20=20
[  813.432286] GPR28: 0000000000000108 0000000000000004 c0000000cc456400
c000000002c3ac50=20=20
[  813.432402] NIP [c0000000000372e4] tm_cgpr_active+0x14/0x40=20
[  813.432412] LR [c0000000006d9e48] fill_thread_core_info+0x158/0x250=20
[  813.432424] --- interrupt: 300=20
[  813.432429] [c000000064ba76e0] [c0000000006d9eb8]
fill_thread_core_info+0x1c8/0x250 (unreliable)=20
[  813.432443] [c000000064ba7760] [c0000000006dac70]
fill_note_info.constprop.0+0x240/0x420=20
[  813.432455] [c000000064ba77d0] [c0000000006daf3c] elf_core_dump+0xec/0x5=
e0=20
[  813.432467] [c000000064ba79e0] [c0000000006e1edc] do_coredump+0x32c/0xc1=
0=20
[  813.432479] [c000000064ba7bb0] [c000000000187adc] get_signal+0x52c/0x910=
=20
[  813.432492] [c000000064ba7ca0] [c000000000021b9c] do_signal+0x7c/0x330=20
[  813.432518] [c000000064ba7d40] [c000000000022e00]
do_notify_resume+0xb0/0x140=20
[  813.432537] [c000000064ba7d70] [c000000000031330]
interrupt_exit_user_prepare_main+0x220/0x280=20
[  813.432556] [c000000064ba7de0] [c000000000031804]
syscall_exit_prepare+0xe4/0x1e0=20
[  813.432571] [c000000064ba7e10] [c00000000000c174]
system_call_vectored_common+0xf4/0x278=20
[  813.432585] --- interrupt: 3000 at 0x7fffa9c7667c=20
[  813.432595] NIP:  00007fffa9c7667c LR: 0000000000000000 CTR:
0000000000000000=20
[  813.432605] REGS: c000000064ba7e80 TRAP: 3000   Tainted: G      D W=20=
=20=20=20=20=20=20=20=20
(5.15.0)=20
[  813.432615] MSR:  800000000000d033 <SF,EE,PR,ME,IR,DR,RI,LE>  CR: 440044=
02=20
XER: 00000000=20
[  813.432641] IRQMASK: 0=20=20
[  813.432641] GPR00: 00000000000000fa 00007fffefa13e10 00007fffa9e17100
0000000000000000=20=20
[  813.432641] GPR04: 0000000000016f31 0000000000000006 0000000000000008
00000000ffffffff=20=20
[  813.432641] GPR08: 0000000000000000 0000000000000000 0000000000000000
0000000000000000=20=20
[  813.432641] GPR12: 0000000000000000 00007fffa9f2b040 0000000000000000
0000000000000000=20=20
[  813.432641] GPR16: 0000000000000000 0000000000000000 0000000000000000
0000000010030de4=20=20
[  813.432641] GPR20: 00000000100158c8 0000000000000000 0000000000000000
0000000010003d60=20=20
[  813.432641] GPR24: 0000000000000001 0000000010012c60 00000000100137c8
0000000000000006=20=20
[  813.432641] GPR28: 0000000000000005 ffffffffffffffff 00007fffa9f23840
0000000000016f31=20=20
[  813.432761] NIP [00007fffa9c7667c] 0x7fffa9c7667c=20
[  813.432770] LR [0000000000000000] 0x0=20
[  813.432777] --- interrupt: 3000=20
[  860.223013] restraintd[1327]: *** Current Time: Mon Nov 01 12:42:42 2021=
=20
Localwatchdog at: Wed Nov 03 12:31:42 2021=20


I reproduced this bug on linux HEAD=3D8bb7eca972ad. The steps to reproduce =
this
bug is:
1) git clone git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
2) build xfstests
3) run generic/051 on ppc64le on xfs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

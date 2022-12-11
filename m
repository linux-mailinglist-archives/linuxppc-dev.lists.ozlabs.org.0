Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6B2649463
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Dec 2022 14:14:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NVQFq3d8kz3bgn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 00:14:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TWEqBAb7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TWEqBAb7;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NVQDt5nNhz2xHF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 00:13:34 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E423760DE4
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Dec 2022 13:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54642C433F1
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Dec 2022 13:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670764410;
	bh=MY4wFEe+qGqExW1VyBPzv+L+XgB5myAuiFm6bAVUCNM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TWEqBAb7QBiXC+e3DTyUJXLjiiU7SZitlMQ9rPNu+JVGv03M0HMC/EtkmiUsYwzkB
	 eQviofNSUdj66bjgV0buIcZB8Tr1FdTsJZlx68wl+Drbc+dR2ct9t9zD2twvRj9Q/s
	 IsO3hCSWnKH894kgfcKHEpiJpthAvDHKkpxrYJlKnFmNEZVKQnzrBL7ivEsmM7NY88
	 MsdtdZVJxUW+IplHPCqjcAJJhSK7RYTiS3xZZdNV5JitPghBX8AnuO1Nf+e2RvYrHG
	 WE6+SfM5cEngK+IkgnKBgJvsXVY9b7aUp1xqnk1reVRi77UMwngh206gjL4FhzPMXP
	 lqbm4ArgeF5aw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 38103C43141; Sun, 11 Dec 2022 13:13:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 214913] [xfstests generic/051] BUG: Kernel NULL pointer
 dereference on read at 0x00000108 NIP [c0000000000372e4]
 tm_cgpr_active+0x14/0x40
Date: Sun, 11 Dec 2022 13:13:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: zlang@redhat.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214913-206035-baXKra7Cll@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214913-206035@https.bugzilla.kernel.org/>
References: <bug-214913-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214913

--- Comment #6 from Zorro Lang (zlang@redhat.com) ---
FYI, still hit this issue on linux 6.1.0-rc8+. And it's nearly 100%
reproducible.

[ 1581.047788] run fstests generic/051 at 2022-12-10 11:28:27=20
[ 1582.574596] XFS (sda3): Mounting V5 Filesystem=20
[ 1582.638653] XFS (sda3): Ending clean mount=20
[ 1582.646329] XFS (sda3): User initiated shutdown received.=20
[ 1582.646397] XFS (sda3): Metadata I/O Error (0x4) detected at
xfs_fs_goingdown+0x68/0x160 [xfs] (fs/xfs/xfs_fsops.c:483).  Shutting down
filesystem.=20
[ 1582.646506] XFS (sda3): Please unmount the filesystem and rectify the
problem(s)=20
[ 1582.692102] XFS (sda3): Unmounting Filesystem=20
[ 1584.011651] XFS (sda3): Mounting V5 Filesystem=20
[ 1584.123764] XFS (sda3): Ending clean mount=20
[ 1605.168286] restraintd[3598]: *** Current Time: Sat Dec 10 11:28:52 2022=
=20
Localwatchdog at: Mon Dec 12 11:03:52 2022=20
[ 1614.846132] XFS (sda3): Unmounting Filesystem=20
[ 1615.569693] XFS (sda3): Mounting V5 Filesystem=20
[ 1615.725272] XFS (sda3): Ending clean mount=20
[ 1650.793064] XFS (sda3): User initiated shutdown received.=20
[ 1650.793108] XFS (sda3): Log I/O Error (0x6) detected at
xfs_fs_goingdown+0xf8/0x160 [xfs] (fs/xfs/xfs_fsops.c:486).  Shutting down
filesystem.=20
[ 1650.793200] XFS (sda3): Please unmount the filesystem and rectify the
problem(s)=20
[ 1650.801605] Kernel attempted to read user page (108) - exploit attempt?
(uid: 0)=20
[ 1650.801625] BUG: Kernel NULL pointer dereference on read at 0x00000108=20
[ 1650.801638] Faulting instruction address: 0xc000000000036154=20
[ 1650.801652] Oops: Kernel access of bad area, sig: 11 [#1]=20
[ 1650.801660] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pSerie=
s=20
[ 1650.801671] Modules linked in: dm_flakey dm_mod bonding tls rfkill sunrpc
pseries_rng drm fuse drm_panel_orientation_quirks xfs libcrc32c sd_mod t10_=
pi
sg ibmvscsi ibmveth scsi_transport_srp vmx_crypto=20
[ 1650.801727] CPU: 0 PID: 382724 Comm: fsstress Kdump: loaded Not tainted
6.1.0-rc8+ #1=20
[ 1650.801739] Hardware name: IBM,8375-42A POWER9 (raw) 0x4e0202 0xf000005
of:IBM,FW940.02 (VL940_041) hv:phyp pSeries=20
[ 1650.801743] Kernel attempted to read user page (108) - exploit attempt?
(uid: 0)=20
[ 1650.801748] NIP:  c000000000036154 LR: c0000000006f67b4 CTR:
c000000000036140=20
[ 1650.801755] BUG: Kernel NULL pointer dereference on read at 0x00000108=20
[ 1650.801759] REGS: c00000004eb7b480 TRAP: 0300   Not tainted  (6.1.0-rc8+=
)=20
[ 1650.801764] Faulting instruction address: 0xc000000000036154=20
[ 1650.801769] MSR:  800000010280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE,TM[E=
]>=20
CR: 88004400  XER: 00000000=20
[ 1650.801809] CFAR: c00000000000c9d4 DAR: 0000000000000108 DSISR: 40000000
IRQMASK: 0=20=20
[ 1650.801809] GPR00: c0000000006f67b4 c00000004eb7b720 c0000000016c0600
0000000000000000=20=20
[ 1650.801809] GPR04: c000000001690ef8 0000000000000000 0000000000000000
c00000004b72a900=20=20
[ 1650.801809] GPR08: c000000001506ee8 0000000000000000 0000000000000009
0000000000000000=20=20
[ 1650.801809] GPR12: c000000000036140 c0000000051e0000 0000000000000000
00007fff96f879b0=20=20
[ 1650.801809] GPR16: 00007fff970941d0 ffffffffffffffff 0000000000000005
c00000004484a400=20=20
[ 1650.801809] GPR20: c00000004484aeb8 0000000000040100 0000000000000001
c000000001489d58=20=20
[ 1650.801809] GPR24: 00000000ffffffff c00000004eb7b8b0 0000000000000004
c0000000011531e8=20=20
[ 1650.801809] GPR28: 0000000000000108 c00000004be38400 0000000000000004
c000000001690ef8=20=20
[ 1650.801927] NIP [c000000000036154] tm_cgpr_active+0x14/0x40=20
[ 1650.801939] LR [c0000000006f67b4] fill_thread_core_info+0x1d4/0x290=20
[ 1650.801951] Call Trace:=20
[ 1650.801955] [c00000004eb7b720] [c0000000006f673c]
fill_thread_core_info+0x15c/0x290 (unreliable)=20
[ 1650.801971] [c00000004eb7b7a0] [c0000000006f6fd4] fill_note_info+0x1f4/0=
x390=20
[ 1650.801984] [c00000004eb7b810] [c0000000006f71fc] elf_core_dump+0x8c/0x5=
80=20
[ 1650.801997] [c00000004eb7ba00] [c0000000006fcc10] do_coredump+0x330/0xca=
0=20
[ 1650.802012] [c00000004eb7bbd0] [c000000000174f94] get_signal+0x7f4/0x8f0=
=20
[ 1650.802024] [c00000004eb7bcb0] [c000000000020d2c] do_signal+0x7c/0x330=20
[ 1650.802036] [c00000004eb7bd50] [c000000000022010]
do_notify_resume+0xb0/0x140=20
[ 1650.802049] [c00000004eb7bd80] [c000000000030550]
interrupt_exit_user_prepare_main+0x1d0/0x290=20
[ 1650.802062] [c00000004eb7bde0] [c0000000000306f4]
syscall_exit_prepare+0xe4/0x1f0=20
[ 1650.802074] [c00000004eb7be10] [c00000000000bffc]
system_call_vectored_common+0xfc/0x280=20
[ 1650.802089] --- interrupt: 3000 at 0x7fff96de315c=20
[ 1650.802099] NIP:  00007fff96de315c LR: 0000000000000000 CTR:
0000000000000000=20
[ 1650.802107] REGS: c00000004eb7be80 TRAP: 3000   Not tainted  (6.1.0-rc8+=
)=20
[ 1650.802115] MSR:  800000000000d033 <SF,EE,PR,ME,IR,DR,RI,LE>  CR: 420044=
04=20
XER: 00000000=20
[ 1650.802141] IRQMASK: 0=20=20
[ 1650.802141] GPR00: 00000000000000fa 00007fffc54a96a0 00007fff96f87200
0000000000000000=20=20
[ 1650.802141] GPR04: 000000000005d704 0000000000000006 0000000000000000
0000000000000000=20=20
[ 1650.802141] GPR08: 00007fff96f81f68 0000000000000000 0000000000000000
0000000000000000=20=20
[ 1650.802141] GPR12: 0000000000000000 00007fff9709b1c0 0000000000000000
00007fff96f879b0=20=20
[ 1650.802141] GPR16: 00007fff970941d0 ffffffffffffffff 0000000010030bec
00000000100152e8=20=20
[ 1650.802141] GPR20: 0000000000000000 0000000000000000 00007fffc54bdfee
0000000000000001=20=20
[ 1650.802141] GPR24: 0000000010009800 00000000100131a8 8f5c28f5c28f5c29
028f5c28f5c28f5c=20=20
[ 1650.802141] GPR28: 0000000000000006 ffffffffffffffff 00007fff97093980
000000000005d704=20=20
[ 1650.802249] NIP [00007fff96de315c] 0x7fff96de315c=20
[ 1650.802258] LR [0000000000000000] 0x0=20
[ 1650.802266] --- interrupt: 3000=20
[ 1650.802272] Instruction dump:=20
[ 1650.802279] 4bfe87d5 60000000 e8010040 38210030 ebe1fff8 7c0803a6 4e8000=
20
7c0802a6=20=20
[ 1650.802305] 60000000 60000000 e9232aa0 38600000 <e9290108> 7929e844 7929=
1f43
41820008=20=20
[ 1650.802330] ---[ end trace 0000000000000000 ]---=20
[ 1650.813469]=20=20
[ 1650.813475] Oops: Kernel access of bad area, sig: 11 [#2]=20
[ 1650.813480] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pSerie=
s=20
[ 1650.813488] Modules linked in: dm_flakey dm_mod bonding tls rfkill sunrpc
pseries_rng drm fuse drm_panel_orientation_quirks xfs libcrc32c sd_mod t10_=
pi
sg ibmvscsi ibmveth scsi_transport_srp vmx_crypto=20
[ 1650.813524] CPU: 4 PID: 382723 Comm: fsstress Kdump: loaded Tainted: G=
=20=20=20=20=20
D            6.1.0-rc8+ #1=20
[ 1650.813532] Hardware name: IBM,8375-42A POWER9 (raw) 0x4e0202 0xf000005
of:IBM,FW940.02 (VL940_041) hv:phyp pSeries=20
[ 1650.813537] NIP:  c000000000036154 LR: c0000000006f67b4 CTR:
c000000000036140=20
[ 1650.813541] REGS: c00000004eb4b480 TRAP: 0300   Tainted: G      D=20=20=
=20=20=20=20=20=20=20=20=20
 (6.1.0-rc8+)=20
[ 1650.813546] MSR:  800000010280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE,TM[E=
]>=20
CR: 88004400  XER: 20040000=20
[ 1650.813562] CFAR: c00000000000c9d4 DAR: 0000000000000108 DSISR: 40000000
IRQMASK: 0=20=20
[ 1650.813562] GPR00: c0000000006f67b4 c00000004eb4b720 c0000000016c0600
0000000000000000=20=20
[ 1650.813562] GPR04: c000000001690ef8 0000000000000000 0000000000000000
c0000000437e4800=20=20
[ 1650.813562] GPR08: c000000001506ee8 0000000000000000 0000000000000009
0000000000000000=20=20
[ 1650.813562] GPR12: c000000000036140 c00000000ffcc480 0000000000000000
00007fff96f879b0=20=20
[ 1650.813562] GPR16: 00007fff970941d0 ffffffffffffffff 0000000000000005
c000000044810e00=20=20
[ 1650.813562] GPR20: c0000000448118b8 0000000000040100 0000000000000001
c000000001489d58=20=20
[ 1650.813562] GPR24: 00000000ffffffff c00000004eb4b8b0 0000000000000004
c0000000011531e8=20=20
[ 1650.813562] GPR28: 0000000000000108 c00000003235f000 0000000000000004
c000000001690ef8=20=20
[ 1650.813619] NIP [c000000000036154] tm_cgpr_active+0x14/0x40=20
[ 1650.813625] LR [c0000000006f67b4] fill_thread_core_info+0x1d4/0x290=20
[ 1650.813632] Call Trace:=20
[ 1650.813634] [c00000004eb4b720] [c0000000006f673c]
fill_thread_core_info+0x15c/0x290 (unreliable)=20
[ 1650.813643] [c00000004eb4b7a0] [c0000000006f6fd4] fill_note_info+0x1f4/0=
x390=20
[ 1650.813650] [c00000004eb4b810] [c0000000006f71fc] elf_core_dump+0x8c/0x5=
80=20
[ 1650.813657] [c00000004eb4ba00] [c0000000006fcc10] do_coredump+0x330/0xca=
0=20
[ 1650.813662] [c00000004eb4bbd0] [c000000000174f94] get_signal+0x7f4/0x8f0=
=20
[ 1650.813668] [c00000004eb4bcb0] [c000000000020d2c] do_signal+0x7c/0x330=20
[ 1650.813674] [c00000004eb4bd50] [c000000000022010]
do_notify_resume+0xb0/0x140=20
[ 1650.813681] [c00000004eb4bd80] [c000000000030550]
interrupt_exit_user_prepare_main+0x1d0/0x290=20
[ 1650.813687] [c00000004eb4bde0] [c0000000000306f4]
syscall_exit_prepare+0xe4/0x1f0=20
[ 1650.813693] [c00000004eb4be10] [c00000000000bffc]
system_call_vectored_common+0xfc/0x280=20
[ 1650.813700] --- interrupt: 3000 at 0x7fff96de315c=20
[ 1650.813705] NIP:  00007fff96de315c LR: 0000000000000000 CTR:
0000000000000000=20
[ 1650.813709] REGS: c00000004eb4be80 TRAP: 3000   Tainted: G      D=20=20=
=20=20=20=20=20=20=20=20=20
 (6.1.0-rc8+)=20
[ 1650.813713] MSR:  800000000000d033 <SF,EE,PR,ME,IR,DR,RI,LE>  CR: 420044=
04=20
XER: 00000000=20
[ 1650.813725] IRQMASK: 0=20=20
[ 1650.813725] GPR00: 00000000000000fa 00007fffc54a9b90 00007fff96f87200
0000000000000000=20=20
[ 1650.813725] GPR04: 000000000005d703 0000000000000006 0000000000000000
0000000000000000=20=20
[ 1650.813725] GPR08: 00007fff96f81f68 0000000000000000 0000000000000000
0000000000000000=20=20
[ 1650.813725] GPR12: 0000000000000000 00007fff9709b1c0 0000000000000000
00007fff96f879b0=20=20
[ 1650.813725] GPR16: 00007fff970941d0 ffffffffffffffff 0000000010030bec
00000000100152e8=20=20
[ 1650.813725] GPR20: 0000000000000000 0000000000000000 00007fffc54bdfee
0000000000000001=20=20
[ 1650.813725] GPR24: 0000000010010460 00000000100131a8 8f5c28f5c28f5c29
028f5c28f5c28f5c=20=20
[ 1650.813725] GPR28: 0000000000000006 0000000000000005 00007fff97093980
000000000005d703=20=20
[ 1650.813778] NIP [00007fff96de315c] 0x7fff96de315c=20
[ 1650.813782] LR [0000000000000000] 0x0=20
[ 1650.813785] --- interrupt: 3000=20
[ 1650.813788] Instruction dump:=20
[ 1650.813791] 4bfe87d5 60000000 e8010040 38210030 ebe1fff8 7c0803a6 4e8000=
20
7c0802a6=20=20
[ 1650.813801] 60000000 60000000 e9232aa0 38600000 <e9290108> 7929e844 7929=
1f43
41820008=20=20
[ 1650.813811] ---[ end trace 0000000000000000 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

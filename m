Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA1225E3A5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 00:21:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjsbV1YyNzDqrC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 08:21:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=jykm=cn=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjsYH12NVzDqPg
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Sep 2020 08:19:46 +1000 (AEST)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 208181] BUG: KASAN: stack-out-of-bounds in strcmp+0x58/0xd8
Date: Fri, 04 Sep 2020 22:19:43 +0000
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
Message-ID: <bug-208181-206035-ZQI12jrEcE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208181-206035@https.bugzilla.kernel.org/>
References: <bug-208181-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D208181

--- Comment #17 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 292337
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D292337&action=3Dedit
dmesg (5.9-rc3, INLINE KASAN, PowerMac G4 DP)

Re-tried with 5.9-rc3 (inline KASAN). The original problem (stack-out-of-bo=
unds
in strcmp+0x58/0xd8) is gone, but still problems with stack usage when doing
larger build jobs:

[...]
[ 1929.683510] do_IRQ: stack overflow: 1696
[ 1929.690727] CPU: 1 PID: 735 Comm: mount.nfs Tainted: G        W=20=20=20=
=20=20=20=20=20
5.9.0-rc3-PowerMacG4 #1
[ 1929.697847] Call Trace:
[ 1929.704633] [d0ca4670] [c0a75518] dump_stack+0xfc/0x130 (unreliable)
[ 1929.711507] [d0ca46a0] [c000b094] do_IRQ+0x128/0x180
[ 1929.717998] [d0ca46d0] [c002e560] ret_from_except+0x0/0x14
[ 1929.724652] --- interrupt: 501 at _raw_spin_unlock_irqrestore+0x3c/0xa4
                   LR =3D _raw_spin_unlock_irqrestore+0x38/0xa4
[ 1929.738722] [d0ca47b8] [c0a6dc90] stack_depot_save+0x20c/0x390
[ 1929.746132] [d0ca4818] [c04d4b70] kasan_save_stack+0x40/0x48
[ 1929.753675] [d0ca4928] [c04d4b9c] kasan_set_track+0x24/0x30
[ 1929.761298] [d0ca4938] [c04d710c] kasan_set_free_info+0x28/0x3c
[ 1929.769073] [d0ca4948] [c04d4f74] __kasan_slab_free+0x104/0x118
[ 1929.776983] [d0ca4968] [c04ce800] slab_free_freelist_hook+0xec/0x17c
[ 1929.785111] [d0ca49a8] [c04d3468] kmem_cache_free+0x58/0x2a0
[ 1929.793391] [d0ca49f8] [c11b251c] packet_rcv+0xb9c/0xbb4
[ 1929.801797] [d0ca4a48] [c0dbfd98] dev_queue_xmit_nit+0x6e4/0x748
[ 1929.810434] [d0ca4ab8] [c0dcaf80] dev_hard_start_xmit+0xec/0x880
[ 1929.819207] [d0ca4b18] [c0ea4814] sch_direct_xmit+0x1f8/0x818
[ 1929.828111] [d0ca4bf8] [c0dcc884] __dev_queue_xmit+0xed4/0x136c
[ 1929.837202] [d0ca4d28] [c0f256dc] ip_finish_output2+0xfcc/0x1028
[ 1929.846472] [d0ca4d88] [c0f2d848] __ip_queue_xmit+0xde0/0x1018
[ 1929.855892] [d0ca4df8] [c0f929d8] __tcp_transmit_skb+0x2550/0x2cb8
[ 1929.865486] [d0ca4ee8] [c0f98470] tcp_write_xmit+0x1d28/0x3498
[ 1929.875216] [d0ca4f78] [c0f99c8c] __tcp_push_pending_frames+0xac/0x1c4
[ 1929.885189] [d0ca4f98] [c0f5a970] tcp_sendmsg_locked+0x1c50/0x2294
[ 1929.895338] [d0ca5098] [c0f5afe4] tcp_sendmsg+0x30/0x48
[ 1929.905564] [d0ca50b8] [c0d598b0] sock_sendmsg_nosec+0xf4/0x10c
[ 1929.916463] [d0ca50d8] [b0a31840] xprt_sock_sendmsg+0x2c0/0x6e8 [sunrpc]
[ 1929.927494] [d0ca51b8] [b0a34ce8] xs_tcp_send_request+0x360/0x580 [sunrp=
c]
[ 1929.938699] [d0ca52e8] [b0a2eae8] xprt_transmit+0x4f8/0xe30 [sunrpc]
[ 1929.950044] [d0ca5368] [b0a1dcd8] call_transmit+0x238/0x25c [sunrpc]
[ 1929.961450] [d0ca5388] [b0a6641c] __rpc_execute+0x35c/0xbf8 [sunrpc]
[ 1929.972996] [d0ca5448] [b0a21d18] rpc_run_task+0x790/0x79c [sunrpc]
[ 1929.984850] [d0ca5498] [b1282e50] nfs4_call_sync_custom+0x14/0x80 [nfsv4]
[ 1929.996821] [d0ca54b8] [b128302c] nfs4_do_call_sync+0x170/0x1a8 [nfsv4]
[ 1930.008922] [d0ca55a8] [b12b3570] nfs4_proc_lookup_common+0x314/0xc54
[nfsv4]
[ 1930.020820] [d0ca5758] [b12b4244] nfs4_proc_lookup+0x158/0x2f0 [nfsv4]
[ 1930.032753] [d0ca57f8] [b0b49544] nfs_lookup+0x2ac/0x9ac [nfs]
[ 1930.044062] [d0ca5838] [c052c984] __lookup_slow+0x278/0x2a8
[ 1930.055461] [d0ca5958] [c05340a0] walk_component+0x288/0x30c
[ 1930.066816] [d0ca5a08] [c0534e5c] path_lookupat.isra.0+0x1b8/0x438
[ 1930.078282] [d0ca5a48] [c05372a0] filename_lookup+0x144/0x1c4
[ 1930.089834] [d0ca5b98] [c05373fc] vfs_path_lookup+0x94/0xc0
[ 1930.101389] [d0ca5c18] [c05714b8] mount_subtree+0x1c4/0x250
[ 1930.113267] [d0ca5ca8] [b12e1b2c] do_nfs4_mount+0x570/0x7fc [nfsv4]
[ 1930.125298] [d0ca5d68] [b12e202c] nfs4_try_get_tree+0xfc/0x16c [nfsv4]
[ 1930.137200] [d0ca5d88] [c050e434] vfs_get_tree+0xf8/0x398
[ 1930.149133] [d0ca5db8] [c056f968] path_mount+0x1074/0x113c
[ 1930.161107] [d0ca5e78] [c056fad8] do_mount+0xa8/0xe4
[ 1930.173109] [d0ca5f08] [c0570054] sys_mount+0xa8/0xb8
[ 1930.185160] [d0ca5f38] [c002e1cc] ret_from_syscall+0x0/0x34
[ 1930.197313] --- interrupt: c01 at 0x8b5754
                   LR =3D 0xac0be0
[ 1930.222896] Kernel panic - not syncing: corrupted stack end detected ins=
ide
scheduler


But feel free to close this bug if appropriate as the original issue is sol=
ved.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=

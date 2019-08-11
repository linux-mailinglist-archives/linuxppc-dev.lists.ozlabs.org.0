Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF30789422
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Aug 2019 23:19:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466BhC06jjzDqgS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 07:19:55 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 466BfJ4j4vzDqVS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 07:18:15 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id ED2F720CCF
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Aug 2019 21:18:12 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id E104727F86; Sun, 11 Aug 2019 21:18:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 204371] BUG kmalloc-4k (Tainted: G        W        ): Object
 padding overwritten
Date: Sun, 11 Aug 2019 21:18:11 +0000
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
Message-ID: <bug-204371-206035-C5jOUcnbhd@https.bugzilla.kernel.org/>
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

--- Comment #13 from Erhard F. (erhard_f@mailbox.org) ---
On Fri, 09 Aug 2019 12:31:26 +0000
bugzilla-daemon@bugzilla.kernel.org wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=3D204371
>=20
[...]
[   22.809365]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
[   22.809700] BUG kmalloc-4096 (Tainted: G        W        ): Redzone
overwritten
[   22.809971]
---------------------------------------------------------------------------=
--

[   22.810286] INFO: 0xbe1a5921-0xfbfc06cd. First byte 0x0 instead of 0xcc
[   22.810866] INFO: Allocated in __load_free_space_cache+0x588/0x780 [btrf=
s]
age=3D22 cpu=3D0 pid=3D224
[   22.811193]  __slab_alloc.constprop.26+0x44/0x70
[   22.811345]  kmem_cache_alloc_trace+0xf0/0x2ec
[   22.811588]  __load_free_space_cache+0x588/0x780 [btrfs]
[   22.811848]  load_free_space_cache+0xf4/0x1b0 [btrfs]
[   22.812090]  cache_block_group+0x1d0/0x3d0 [btrfs]
[   22.812321]  find_free_extent+0x680/0x12a4 [btrfs]
[   22.812549]  btrfs_reserve_extent+0xec/0x220 [btrfs]
[   22.812785]  btrfs_alloc_tree_block+0x178/0x5f4 [btrfs]
[   22.813032]  __btrfs_cow_block+0x150/0x5d4 [btrfs]
[   22.813262]  btrfs_cow_block+0x194/0x298 [btrfs]
[   22.813484]  commit_cowonly_roots+0x44/0x294 [btrfs]
[   22.813718]  btrfs_commit_transaction+0x63c/0xc0c [btrfs]
[   22.813973]  close_ctree+0xf8/0x2a4 [btrfs]
[   22.814107]  generic_shutdown_super+0x80/0x110
[   22.814250]  kill_anon_super+0x18/0x30
[   22.814437]  btrfs_kill_super+0x18/0x90 [btrfs]
[   22.814590] INFO: Freed in proc_cgroup_show+0xc0/0x248 age=3D41 cpu=3D0 =
pid=3D83
[   22.814841]  proc_cgroup_show+0xc0/0x248
[   22.814967]  proc_single_show+0x54/0x98
[   22.815086]  seq_read+0x278/0x45c
[   22.815190]  __vfs_read+0x28/0x17c
[   22.815289]  vfs_read+0xa8/0x14c
[   22.815381]  ksys_read+0x50/0x94
[   22.815475]  ret_from_syscall+0x0/0x38
[   22.815593] INFO: Slab 0x6b5768ec objects=3D7 used=3D7 fp=3D0x  (null)
flags=3D0x8101
[   22.815854] INFO: Object 0x6eefea7d @offset=3D17128 fp=3D0x  (null)

[   22.816063] Redzone be1a5921: 00 00 00 00 00 00 00 00=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  ........
[   22.816354] Object 6eefea7d: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00
 ................
[...]
[   23.715311] Object ea0b92e7: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00
 ................
[   23.718376] Redzone a1d8f890: cc cc cc cc=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  ....
[   23.721607] Padding d4007128: 5a 5a 5a 5a 5a 5a 5a 5a=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  ZZZZZZZZ
[   23.724958] CPU: 0 PID: 224 Comm: umount Tainted: G    B   W         4.1=
9.0
#1
[   23.728433] Call Trace:
[   23.731847] [ec525cc0] [c053ca68] dump_stack+0xa4/0x100 (unreliable)
[   23.735595] [ec525ce0] [c019b21c] check_bytes_and_report+0xc8/0xf0
[   23.739445] [ec525d10] [c019bf44] check_object+0x50/0x278
[   23.743339] [ec525d30] [c019e4c4] free_debug_processing+0x200/0x318
[   23.747341] [ec525d70] [c019e7b4] __slab_free+0x1d8/0x440
[   23.751591] [ec525df0] [f3c34854] free_bitmap+0x24/0x68 [btrfs]
[   23.755906] [ec525e00] [f3c35a28]
__btrfs_remove_free_space_cache_locked+0x68/0x6c [btrfs]
[   23.760481] [ec525e20] [f3c38de8] btrfs_remove_free_space_cache+0x38/0x84
[btrfs]
[   23.765173] [ec525e40] [f3bc7408] btrfs_free_block_groups+0x218/0x2f0
[btrfs]
[   23.769993] [ec525e70] [f3bde164] close_ctree+0x200/0x2a4 [btrfs]
[   23.774824] [ec525eb0] [c01b6534] generic_shutdown_super+0x80/0x110
[   23.779750] [ec525ec0] [c01b678c] kill_anon_super+0x18/0x30
[   23.784852] [ec525ed0] [f3baec88] btrfs_kill_super+0x18/0x90 [btrfs]
[   23.790012] [ec525ee0] [c01b6cd8] deactivate_locked_super+0x54/0xa4
[   23.795258] [ec525ef0] [c01d5db8] cleanup_mnt+0x50/0x78
[   23.800575] [ec525f00] [c0055cac] task_work_run+0xa4/0xc4
[   23.805994] [ec525f30] [c000b658] do_notify_resume+0xcc/0x108
[   23.811478] [ec525f40] [c00146bc] do_user_signal+0x2c/0x34
[   23.817049] --- interrupt: c00 at 0x8d43d4
                   LR =3D 0x8d43b8
[   23.828287] FIX kmalloc-4096: Restoring 0xbe1a5921-0xfbfc06cd=3D0xcc

[   23.840295] FIX kmalloc-4096: Object at 0x6eefea7d not freed
[   23.846788]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
[   23.852638] BUG kmalloc-4096 (Tainted: G    B   W        ): Redzone
overwritten
[   23.858590]
---------------------------------------------------------------------------=
--

[   23.870891] INFO: 0xad3f3ec9-0x8e4e748e. First byte 0x0 instead of 0xcc
[   23.877502] INFO: Allocated in __load_free_space_cache+0x588/0x780 [btrf=
s]
age=3D333 cpu=3D0 pid=3D224
[   23.884297]  __slab_alloc.constprop.26+0x44/0x70
[   23.891119]  kmem_cache_alloc_trace+0xf0/0x2ec
[   23.898100]  __load_free_space_cache+0x588/0x780 [btrfs]
[   23.905235]  load_free_space_cache+0xf4/0x1b0 [btrfs]
[   23.912417]  cache_block_group+0x1d0/0x3d0 [btrfs]
[   23.919721]  find_free_extent+0x680/0x12a4 [btrfs]
[   23.927070]  btrfs_reserve_extent+0xec/0x220 [btrfs]
[   23.934474]  btrfs_alloc_tree_block+0x178/0x5f4 [btrfs]
[   23.942024]  __btrfs_cow_block+0x150/0x5d4 [btrfs]
[   23.949627]  btrfs_cow_block+0x194/0x298 [btrfs]
[   23.957351]  commit_cowonly_roots+0x44/0x294 [btrfs]
[   23.965154]  btrfs_commit_transaction+0x63c/0xc0c [btrfs]
[   23.973073]  close_ctree+0xf8/0x2a4 [btrfs]
[   23.980977]  generic_shutdown_super+0x80/0x110
[   23.988999]  kill_anon_super+0x18/0x30
[   23.997063]  btrfs_kill_super+0x18/0x90 [btrfs]
[   24.005191] INFO: Freed in seq_release+0x1c/0x38 age=3D352 cpu=3D1 pid=
=3D1
[   24.013500]  seq_release+0x1c/0x38
[   24.021894]  kernfs_fop_release+0x74/0x90
[   24.030337]  __fput+0x104/0x1e4
[   24.038822]  task_work_run+0xa4/0xc4
[   24.047320]  do_notify_resume+0xcc/0x108
[   24.055936]  do_user_signal+0x2c/0x34
[   24.064520] INFO: Slab 0x7ec9c2e3 objects=3D7 used=3D6 fp=3D0xbc375e23
flags=3D0x8101
[   24.073478] INFO: Object 0x8564a246 @offset=3D17128 fp=3D0x  (null)

[   24.091483] Redzone ad3f3ec9: 00 00 00 00 00 00 00 00=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  ........
[   24.100772] Object 8564a246: f0 00 00 00 ff ff ff ff 00 00 00 00 00 00 0=
0 00
 ................
[...]
[   25.242900] Object 5560df93: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00
 ................
[   25.245595] Redzone 4cfc344b: cc cc cc cc=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  ....
[   25.248446] Padding 399de3f9: 5a 5a 5a 5a 5a 5a 5a 5a=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  ZZZZZZZZ
[   25.251412] CPU: 0 PID: 224 Comm: umount Tainted: G    B   W         4.1=
9.0
#1
[   25.254501] Call Trace:
[   25.257513] [ec525cc0] [c053ca68] dump_stack+0xa4/0x100 (unreliable)
[   25.260807] [ec525ce0] [c019b21c] check_bytes_and_report+0xc8/0xf0
[   25.264180] [ec525d10] [c019bf44] check_object+0x50/0x278
[   25.267620] [ec525d30] [c019e4c4] free_debug_processing+0x200/0x318
[   25.271174] [ec525d70] [c019e7b4] __slab_free+0x1d8/0x440
[   25.274931] [ec525df0] [f3c34854] free_bitmap+0x24/0x68 [btrfs]
[   25.278720] [ec525e00] [f3c35a28]
__btrfs_remove_free_space_cache_locked+0x68/0x6c [btrfs]
[   25.282776] [ec525e20] [f3c38de8] btrfs_remove_free_space_cache+0x38/0x84
[btrfs]
[   25.286969] [ec525e40] [f3bc7408] btrfs_free_block_groups+0x218/0x2f0
[btrfs]
[   25.291230] [ec525e70] [f3bde164] close_ctree+0x200/0x2a4 [btrfs]
[   25.295473] [ec525eb0] [c01b6534] generic_shutdown_super+0x80/0x110
[   25.299835] [ec525ec0] [c01b678c] kill_anon_super+0x18/0x30
[   25.304360] [ec525ed0] [f3baec88] btrfs_kill_super+0x18/0x90 [btrfs]
[   25.308936] [ec525ee0] [c01b6cd8] deactivate_locked_super+0x54/0xa4
[   25.313590] [ec525ef0] [c01d5db8] cleanup_mnt+0x50/0x78
[   25.318277] [ec525f00] [c0055cac] task_work_run+0xa4/0xc4
[   25.323064] [ec525f30] [c000b658] do_notify_resume+0xcc/0x108
[   25.327903] [ec525f40] [c00146bc] do_user_signal+0x2c/0x34
[   25.332836] --- interrupt: c00 at 0x8d43d4
                   LR =3D 0x8d43b8
[   25.342792] FIX kmalloc-4096: Restoring 0xad3f3ec9-0x8e4e748e=3D0xcc

[   25.353647] FIX kmalloc-4096: Object at 0x8564a246 not freed

--=20
You are receiving this mail because:
You are on the CC list for the bug.=

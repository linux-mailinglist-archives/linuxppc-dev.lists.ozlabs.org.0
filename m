Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7EE8DC6B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 19:55:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467y0Q4T8mzDqX0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 03:55:02 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 467xyG75WgzDqGB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 03:53:10 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 89652285FB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 17:53:08 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 7D439288BF; Wed, 14 Aug 2019 17:53:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 204371] BUG kmalloc-4k (Tainted: G        W        ): Object
 padding overwritten
Date: Wed, 14 Aug 2019 17:53:06 +0000
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
Message-ID: <bug-204371-206035-q5BnOZB1T5@https.bugzilla.kernel.org/>
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

--- Comment #23 from Erhard F. (erhard_f@mailbox.org) ---
On Wed, 14 Aug 2019 16:10:53 +0000
bugzilla-daemon@bugzilla.kernel.org wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=3D204371
>=20
> --- Comment #19 from Christophe Leroy (christophe.leroy@c-s.fr) ---
> Created attachment 284389
>   --> https://bugzilla.kernel.org/attachment.cgi?id=3D284389&action=3Dedi=
t=20=20
> Patch to trace misaligned destination in copy_page() in asm on PPC32
>=20
> Oops.
>=20
> Can you test with this new patch which implements the warning directly in
> assembly.? This time it only modifies misc_32.S and It builds ok.
Please find the full dmesg attatched at the kernel bugtracker.

[...]
Aug 14 19:32:52 T600 kernel: WARNING: CPU: 1 PID: 252 at
arch/powerpc/kernel/misc_32.S:457 copy_page+0x4/0x98
Aug 14 19:32:52 T600 kernel: Modules linked in: b43legacy input_leds led_cl=
ass
mac80211 joydev hid_generic usbhid hid cfg80211 snd_aoa_codec_tas
snd_aoa_fabric_layout snd_aoa rfkill libarc4 evdev ohci_pci btrfs xor
zstd_decompress zstd_compress zlib_deflate radeon raid6_pq zlib_inflate
ehci_pci ohci_hcd therm_windtunnel ehci_hcd hwmon i2c_algo_bit firewire_ohci
backlight firewire_core sr_mod sungem crc_itu_t drm_kms_helper cdrom sungem=
_phy
usbcore syscopyarea sysfillrect usb_common sysimgblt fb_sys_fops ttm
snd_aoa_i2sbus drm snd_aoa_soundbus snd_pcm snd_timer
drm_panel_orientation_quirks ssb snd uninorth_agp soundcore agpgart lzo
lzo_compress lzo_decompress zram zsmalloc
Aug 14 19:32:52 T600 kernel: CPU: 1 PID: 252 Comm: umount Tainted: G       =
 W=20=20
      5.3.0-rc4+ #1
Aug 14 19:32:52 T600 kernel: NIP:  c0011524 LR: f1a563f8 CTR: c0011520
Aug 14 19:32:52 T600 kernel: REGS: ed22b810 TRAP: 0700   Tainted: G        =
W=20=20=20
      (5.3.0-rc4+)
Aug 14 19:32:52 T600 kernel: MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 22048222=
=20
XER: 20000000
Aug 14 19:32:52 T600 kernel:=20
                             GPR00: f1a563e0 ed22b8c8 e7348020 e6b442e8
dae3e000 00000008 c0596c20 dae3effc=20
                             GPR08: 00000000 b2209525 00000000 ed22b8c8
c0011520 00745ff4 00000000 e8dec1fc=20
                             GPR16: 00000001 00000000 c07fe5f8 00000001
00000000 00000000 f1af07f0 c06fd6fc=20
                             GPR24: e8dec178 00000000 ed22b8d8 f1af0000
ec13f1e8 00000000 ec13f1e8 e8a945e8=20
Aug 14 19:32:52 T600 kernel: NIP [c0011524] copy_page+0x4/0x98
Aug 14 19:32:52 T600 kernel: LR [f1a563f8] __load_free_space_cache+0x540/0x=
61c
[btrfs]
Aug 14 19:32:52 T600 kernel: Call Trace:
Aug 14 19:32:52 T600 kernel: [ed22b8c8] [f1a563e0]
__load_free_space_cache+0x528/0x61c [btrfs] (unreliable)
Aug 14 19:32:52 T600 kernel: [ed22b958] [f1a565bc]
load_free_space_cache+0xe8/0x1bc [btrfs]
Aug 14 19:32:52 T600 kernel: [ed22b998] [f19e83f4]
cache_block_group+0x1cc/0x3b4 [btrfs]
Aug 14 19:32:52 T600 kernel: [ed22b9f8] [f19f04c8] find_free_extent+0x56c/0=
xe70
[btrfs]
Aug 14 19:32:52 T600 kernel: [ed22bad8] [f19f0eb8]
btrfs_reserve_extent+0xec/0x220 [btrfs]
Aug 14 19:32:52 T600 kernel: [ed22bb48] [f19f1130]
btrfs_alloc_tree_block+0x144/0x35c [btrfs]
Aug 14 19:32:52 T600 kernel: [ed22bc38] [f19dc9c0]
alloc_tree_block_no_bg_flush+0x88/0x98 [btrfs]
Aug 14 19:32:52 T600 kernel: [ed22bc78] [f19dfce0]
__btrfs_cow_block+0x140/0x4d0 [btrfs]
Aug 14 19:32:52 T600 kernel: [ed22bce8] [f19e021c] btrfs_cow_block+0x144/0x=
23c
[btrfs]
Aug 14 19:32:52 T600 kernel: [ed22bd18] [f1a039e4]
commit_cowonly_roots+0x50/0x294 [btrfs]
Aug 14 19:32:52 T600 kernel: [ed22bd68] [f1a062c4]
btrfs_commit_transaction+0x5e4/0x994 [btrfs]
Aug 14 19:32:52 T600 kernel: [ed22bdb8] [f1a01800] close_ctree+0xf4/0x2c4
[btrfs]
Aug 14 19:32:52 T600 kernel: [ed22bdf8] [c01ab508]
generic_shutdown_super+0x80/0x110
Aug 14 19:32:52 T600 kernel: [ed22be18] [c01ab718] kill_anon_super+0x18/0x30
Aug 14 19:32:53 T600 kernel: [ed22be38] [f19d88b4] btrfs_kill_super+0x18/0x=
30
[btrfs]
Aug 14 19:32:53 T600 kernel: [ed22be58] [c01abdbc]
deactivate_locked_super+0x54/0xa4
Aug 14 19:32:53 T600 kernel: [ed22be78] [c01cbcb4] cleanup_mnt+0x6c/0xe4
Aug 14 19:32:53 T600 kernel: [ed22bea8] [c0054f50] task_work_run+0xa0/0xc0
Aug 14 19:32:53 T600 kernel: [ed22bed8] [c000bc44] do_notify_resume+0x160/0=
x2c8
Aug 14 19:32:53 T600 kernel: [ed22bf38] [c0014800] do_user_signal+0x2c/0x34
Aug 14 19:32:53 T600 kernel: --- interrupt: c00 at 0x5a93d4
                                 LR =3D 0x5a93b8
Aug 14 19:32:53 T600 kernel: Instruction dump:
Aug 14 19:32:53 T600 kernel: 38630020 4200fff8 7c0004ac 7c8903a6 7c0037ac
38c60020 4200fff8 7c0004ac=20
Aug 14 19:32:53 T600 kernel: 7d400124 4c00012c 4e800020 546506fe <0f050000>
3863fffc 3884fffc 38a00004=20
Aug 14 19:32:53 T600 kernel: irq event stamp: 0
Aug 14 19:32:53 T600 kernel: hardirqs last  enabled at (0): [<00000000>] 0x0
Aug 14 19:32:53 T600 kernel: hardirqs last disabled at (0): [<c0032f0c>]
copy_process+0x474/0x1368
Aug 14 19:32:53 T600 kernel: softirqs last  enabled at (0): [<c0032f0c>]
copy_process+0x474/0x1368
Aug 14 19:32:53 T600 kernel: softirqs last disabled at (0): [<00000000>] 0x0
Aug 14 19:32:53 T600 kernel: ---[ end trace 419c4df4c0ad0128 ]---
Aug 14 19:32:53 T600 kernel: WARNING: CPU: 1 PID: 252 at
arch/powerpc/kernel/misc_32.S:457 copy_page+0x4/0x98
Aug 14 19:32:53 T600 kernel: Modules linked in: b43legacy input_leds led_cl=
ass
mac80211 joydev hid_generic usbhid hid cfg80211 snd_aoa_codec_tas
snd_aoa_fabric_layout snd_aoa rfkill libarc4 evdev ohci_pci btrfs xor
zstd_decompress zstd_compress zlib_deflate radeon raid6_pq zlib_inflate
ehci_pci ohci_hcd therm_windtunnel ehci_hcd hwmon i2c_algo_bit firewire_ohci
backlight firewire_core sr_mod sungem crc_itu_t drm_kms_helper cdrom sungem=
_phy
usbcore syscopyarea sysfillrect usb_common sysimgblt fb_sys_fops ttm
snd_aoa_i2sbus drm snd_aoa_soundbus snd_pcm snd_timer
drm_panel_orientation_quirks ssb snd uninorth_agp soundcore agpgart lzo
lzo_compress lzo_decompress zram zsmalloc
Aug 14 19:32:53 T600 kernel: CPU: 1 PID: 252 Comm: umount Tainted: P       =
 W=20=20
      5.3.0-rc4+ #1
Aug 14 19:32:53 T600 kernel: NIP:  c0011524 LR: f1a563f8 CTR: c0011520
Aug 14 19:32:53 T600 kernel: REGS: ed22b810 TRAP: 0700   Tainted: P        =
W=20=20=20
      (5.3.0-rc4+)
Aug 14 19:32:53 T600 kernel: MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 22048222=
=20
XER: 20000000
Aug 14 19:32:53 T600 kernel:=20
                             GPR00: f1a563e0 ed22b8c8 e7348020 de3eb230
dae3f000 00000010 c0596c20 dae3fffc=20
                             GPR08: 00000000 c9dc33ec 00000000 ed22b8c8
c0011520 00745ff4 00000000 e8dec1fc=20
                             GPR16: 00000001 00000000 c07fe5f8 00000001
00000000 00000000 f1af07f0 c06fd6fc=20
                             GPR24: e8dec178 00000000 ed22b8d8 f1af0000
ec13fb48 00000000 ec13fb48 e8a945e8=20
Aug 14 19:32:53 T600 kernel: NIP [c0011524] copy_page+0x4/0x98
Aug 14 19:32:53 T600 kernel: LR [f1a563f8] __load_free_space_cache+0x540/0x=
61c
[btrfs]
Aug 14 19:32:53 T600 kernel: Call Trace:
Aug 14 19:32:53 T600 kernel: [ed22b8c8] [f1a563e0]
__load_free_space_cache+0x528/0x61c [btrfs] (unreliable)
Aug 14 19:32:53 T600 kernel: [ed22b958] [f1a565bc]
load_free_space_cache+0xe8/0x1bc [btrfs]
Aug 14 19:32:53 T600 kernel: [ed22b998] [f19e83f4]
cache_block_group+0x1cc/0x3b4 [btrfs]
Aug 14 19:32:53 T600 kernel: [ed22b9f8] [f19f04c8] find_free_extent+0x56c/0=
xe70
[btrfs]
Aug 14 19:32:53 T600 kernel: [ed22bad8] [f19f0eb8]
btrfs_reserve_extent+0xec/0x220 [btrfs]
Aug 14 19:32:53 T600 kernel: [ed22bb48] [f19f1130]
btrfs_alloc_tree_block+0x144/0x35c [btrfs]
Aug 14 19:32:53 T600 kernel: [ed22bc38] [f19dc9c0]
alloc_tree_block_no_bg_flush+0x88/0x98 [btrfs]
Aug 14 19:32:53 T600 kernel: [ed22bc78] [f19dfce0]
__btrfs_cow_block+0x140/0x4d0 [btrfs]
Aug 14 19:32:53 T600 kernel: [ed22bce8] [f19e021c] btrfs_cow_block+0x144/0x=
23c
[btrfs]
Aug 14 19:32:53 T600 kernel: [ed22bd18] [f1a039e4]
commit_cowonly_roots+0x50/0x294 [btrfs]
Aug 14 19:32:53 T600 kernel: [ed22bd68] [f1a062c4]
btrfs_commit_transaction+0x5e4/0x994 [btrfs]
Aug 14 19:32:53 T600 kernel: [ed22bdb8] [f1a01800] close_ctree+0xf4/0x2c4
[btrfs]
Aug 14 19:32:53 T600 kernel: [ed22bdf8] [c01ab508]
generic_shutdown_super+0x80/0x110
Aug 14 19:32:53 T600 kernel: [ed22be18] [c01ab718] kill_anon_super+0x18/0x30
Aug 14 19:32:53 T600 kernel: [ed22be38] [f19d88b4] btrfs_kill_super+0x18/0x=
30
[btrfs]
Aug 14 19:32:53 T600 kernel: [ed22be58] [c01abdbc]
deactivate_locked_super+0x54/0xa4
Aug 14 19:32:53 T600 kernel: [ed22be78] [c01cbcb4] cleanup_mnt+0x6c/0xe4
Aug 14 19:32:53 T600 kernel: [ed22bea8] [c0054f50] task_work_run+0xa0/0xc0
Aug 14 19:32:53 T600 kernel: [ed22bed8] [c000bc44] do_notify_resume+0x160/0=
x2c8
Aug 14 19:32:53 T600 kernel: [ed22bf38] [c0014800] do_user_signal+0x2c/0x34
Aug 14 19:32:53 T600 kernel: --- interrupt: c00 at 0x5a93d4
                                 LR =3D 0x5a93b8
Aug 14 19:32:53 T600 kernel: Instruction dump:
Aug 14 19:32:53 T600 kernel: 38630020 4200fff8 7c0004ac 7c8903a6 7c0037ac
38c60020 4200fff8 7c0004ac=20
Aug 14 19:32:53 T600 kernel: 7d400124 4c00012c 4e800020 546506fe <0f050000>
3863fffc 3884fffc 38a00004=20
Aug 14 19:32:53 T600 kernel: irq event stamp: 0
Aug 14 19:32:53 T600 kernel: hardirqs last  enabled at (0): [<00000000>] 0x0
Aug 14 19:32:53 T600 kernel: hardirqs last disabled at (0): [<c0032f0c>]
copy_process+0x474/0x1368
Aug 14 19:32:53 T600 kernel: softirqs last  enabled at (0): [<c0032f0c>]
copy_process+0x474/0x1368
Aug 14 19:32:53 T600 kernel: softirqs last disabled at (0): [<00000000>] 0x0
Aug 14 19:32:53 T600 kernel: ---[ end trace 419c4df4c0ad0129 ]---
Aug 14 19:32:55 T600 kernel:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
Aug 14 19:32:55 T600 kernel: BUG kmalloc-4k (Tainted: P        W        ):
Redzone overwritten
Aug 14 19:32:55 T600 kernel:
---------------------------------------------------------------------------=
--
Aug 14 19:32:55 T600 kernel: INFO: 0xb1102a74-0x308f4f85. First byte 0x0
instead of 0xcc
Aug 14 19:32:55 T600 kernel: INFO: Allocated in
__load_free_space_cache+0x420/0x61c [btrfs] age=3D264 cpu=3D1 pid=3D252
Aug 14 19:32:55 T600 kernel:         __slab_alloc.constprop.74+0x40/0x6c
Aug 14 19:32:55 T600 kernel:         kmem_cache_alloc_trace+0x7c/0x1a0
Aug 14 19:32:55 T600 kernel:         __load_free_space_cache+0x420/0x61c
[btrfs]
Aug 14 19:32:55 T600 kernel:         load_free_space_cache+0xe8/0x1bc [btrf=
s]
Aug 14 19:32:55 T600 kernel:         cache_block_group+0x1cc/0x3b4 [btrfs]
Aug 14 19:32:55 T600 kernel:         find_free_extent+0x56c/0xe70 [btrfs]
Aug 14 19:32:55 T600 kernel:         btrfs_reserve_extent+0xec/0x220 [btrfs]
Aug 14 19:32:55 T600 kernel:         btrfs_alloc_tree_block+0x144/0x35c [bt=
rfs]
Aug 14 19:32:55 T600 kernel:         alloc_tree_block_no_bg_flush+0x88/0x98
[btrfs]
Aug 14 19:32:55 T600 kernel:         __btrfs_cow_block+0x140/0x4d0 [btrfs]
Aug 14 19:32:55 T600 kernel:         btrfs_cow_block+0x144/0x23c [btrfs]
Aug 14 19:32:55 T600 kernel:         commit_cowonly_roots+0x50/0x294 [btrfs]
Aug 14 19:32:55 T600 kernel:         btrfs_commit_transaction+0x5e4/0x994
[btrfs]
Aug 14 19:32:55 T600 kernel:         close_ctree+0xf4/0x2c4 [btrfs]
Aug 14 19:32:55 T600 kernel:         generic_shutdown_super+0x80/0x110
Aug 14 19:32:55 T600 kernel:         kill_anon_super+0x18/0x30
Aug 14 19:32:55 T600 kernel: INFO: Freed in proc_cgroup_show+0xbc/0x24c age=
=3D381
cpu=3D0 pid=3D95
Aug 14 19:32:55 T600 kernel:         kfree+0x264/0x29c
Aug 14 19:32:55 T600 kernel:         proc_cgroup_show+0xbc/0x24c
Aug 14 19:32:55 T600 kernel:         proc_single_show+0x54/0x74
Aug 14 19:32:55 T600 kernel:         seq_read+0x27c/0x460
Aug 14 19:32:55 T600 kernel:         __vfs_read+0x3c/0x10c
Aug 14 19:32:55 T600 kernel:         vfs_read+0xa8/0xf8
Aug 14 19:32:55 T600 kernel:         ksys_read+0x7c/0xd0
Aug 14 19:32:55 T600 kernel:         ret_from_syscall+0x0/0x34
Aug 14 19:32:55 T600 kernel: INFO: Slab 0x5d010511 objects=3D7 used=3D7
fp=3D0xcc30daf2 flags=3D0x10201
Aug 14 19:32:55 T600 kernel: INFO: Object 0x6ef21f55 @offset=3D12848
fp=3D0xcc30daf2
Aug 14 19:32:55 T600 kernel: Redzone b1102a74: 00 00 00 00 00 00 00 00=20=
=20=20=20=20=20=20=20=20
                ........
[...]
Aug 14 19:32:56 T600 kernel: Redzone de5eb20d: cc cc cc cc=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                ....
Aug 14 19:32:56 T600 kernel: Padding 2d50102a: 5a 5a 5a 5a 5a 5a 5a 5a=20=
=20=20=20=20=20=20=20=20
                ZZZZZZZZ
Aug 14 19:32:56 T600 kernel: CPU: 1 PID: 252 Comm: umount Tainted: P    B  =
 W=20=20
      5.3.0-rc4+ #1
Aug 14 19:32:56 T600 kernel: Call Trace:
Aug 14 19:32:56 T600 kernel: [ed22bb68] [c0532654] dump_stack+0xa0/0xfc
(unreliable)
Aug 14 19:32:56 T600 kernel: [ed22bb98] [c0195540]
check_bytes_and_report+0xc8/0xf0
Aug 14 19:32:56 T600 kernel: [ed22bbc8] [c0195f80] check_object+0x50/0x224
Aug 14 19:32:56 T600 kernel: [ed22bbf8] [c0197d6c]
free_debug_processing+0x17c/0x27c
Aug 14 19:32:56 T600 kernel: [ed22bc48] [c0197ff4] __slab_free+0x188/0x338
Aug 14 19:32:56 T600 kernel: [ed22bcc8] [c0198408] kfree+0x264/0x29c
Aug 14 19:32:56 T600 kernel: [ed22bd18] [f1a53444] free_bitmap+0x24/0x68
[btrfs]
Aug 14 19:32:56 T600 kernel: [ed22bd38] [f1a534f0]
__btrfs_remove_free_space_cache_locked+0x68/0x6c [btrfs]
Aug 14 19:32:56 T600 kernel: [ed22bd58] [f1a566c8]
btrfs_remove_free_space_cache+0x38/0x84 [btrfs]
Aug 14 19:32:56 T600 kernel: [ed22bd78] [f19ef7a4]
btrfs_free_block_groups+0x164/0x24c [btrfs]
Aug 14 19:32:56 T600 kernel: [ed22bdb8] [f1a0193c] close_ctree+0x230/0x2c4
[btrfs]
Aug 14 19:32:56 T600 kernel: [ed22bdf8] [c01ab508]
generic_shutdown_super+0x80/0x110
Aug 14 19:32:56 T600 kernel: [ed22be18] [c01ab718] kill_anon_super+0x18/0x30
Aug 14 19:32:56 T600 kernel: [ed22be38] [f19d88b4] btrfs_kill_super+0x18/0x=
30
[btrfs]
Aug 14 19:32:56 T600 kernel: [ed22be58] [c01abdbc]
deactivate_locked_super+0x54/0xa4
Aug 14 19:32:56 T600 kernel: [ed22be78] [c01cbcb4] cleanup_mnt+0x6c/0xe4
Aug 14 19:32:56 T600 kernel: [ed22bea8] [c0054f50] task_work_run+0xa0/0xc0
Aug 14 19:32:56 T600 kernel: [ed22bed8] [c000bc44] do_notify_resume+0x160/0=
x2c8
Aug 14 19:32:56 T600 kernel: [ed22bf38] [c0014800] do_user_signal+0x2c/0x34
Aug 14 19:32:56 T600 kernel: --- interrupt: c00 at 0x5a93d4
                                 LR =3D 0x5a93b8
Aug 14 19:32:56 T600 kernel: FIX kmalloc-4k: Restoring
0xb1102a74-0x308f4f85=3D0xcc
Aug 14 19:32:56 T600 kernel: FIX kmalloc-4k: Object at 0x6ef21f55 not freed
Aug 14 19:32:56 T600 kernel:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
Aug 14 19:32:56 T600 kernel: BUG kmalloc-4k (Tainted: P    B   W        ):
Redzone overwritten
Aug 14 19:32:56 T600 kernel:
---------------------------------------------------------------------------=
--
Aug 14 19:32:56 T600 kernel: INFO: 0xddb8467c-0xf2d9726e. First byte 0x0
instead of 0xcc
Aug 14 19:32:56 T600 kernel: INFO: Allocated in
__load_free_space_cache+0x420/0x61c [btrfs] age=3D900 cpu=3D1 pid=3D252
Aug 14 19:32:56 T600 kernel:         __slab_alloc.constprop.74+0x40/0x6c
Aug 14 19:32:56 T600 kernel:         kmem_cache_alloc_trace+0x7c/0x1a0
Aug 14 19:32:57 T600 kernel:         __load_free_space_cache+0x420/0x61c
[btrfs]
Aug 14 19:32:57 T600 kernel:         load_free_space_cache+0xe8/0x1bc [btrf=
s]
Aug 14 19:32:57 T600 kernel:         cache_block_group+0x1cc/0x3b4 [btrfs]
Aug 14 19:32:57 T600 kernel:         find_free_extent+0x56c/0xe70 [btrfs]
Aug 14 19:32:57 T600 kernel:         btrfs_reserve_extent+0xec/0x220 [btrfs]
Aug 14 19:32:57 T600 kernel:         btrfs_alloc_tree_block+0x144/0x35c [bt=
rfs]
Aug 14 19:32:57 T600 kernel:         alloc_tree_block_no_bg_flush+0x88/0x98
[btrfs]
Aug 14 19:32:57 T600 kernel:         __btrfs_cow_block+0x140/0x4d0 [btrfs]
Aug 14 19:32:57 T600 kernel:         btrfs_cow_block+0x144/0x23c [btrfs]
Aug 14 19:32:57 T600 kernel:         commit_cowonly_roots+0x50/0x294 [btrfs]
Aug 14 19:32:57 T600 kernel:         btrfs_commit_transaction+0x5e4/0x994
[btrfs]
Aug 14 19:32:57 T600 kernel:         close_ctree+0xf4/0x2c4 [btrfs]
Aug 14 19:32:57 T600 kernel:         generic_shutdown_super+0x80/0x110
Aug 14 19:32:57 T600 kernel:         kill_anon_super+0x18/0x30
Aug 14 19:32:57 T600 kernel: INFO: Freed in proc_cgroup_show+0xbc/0x24c
age=3D1018 cpu=3D0 pid=3D95
Aug 14 19:32:57 T600 kernel:         kfree+0x264/0x29c
Aug 14 19:32:57 T600 kernel:         proc_cgroup_show+0xbc/0x24c
Aug 14 19:32:57 T600 kernel:         proc_single_show+0x54/0x74
Aug 14 19:32:57 T600 kernel:         seq_read+0x27c/0x460
Aug 14 19:32:57 T600 kernel:         __vfs_read+0x3c/0x10c
Aug 14 19:32:57 T600 kernel:         vfs_read+0xa8/0xf8
Aug 14 19:32:57 T600 kernel:         ksys_read+0x7c/0xd0
Aug 14 19:32:57 T600 kernel:         ret_from_syscall+0x0/0x34
Aug 14 19:32:57 T600 kernel: INFO: Slab 0x5fe33d40 objects=3D7 used=3D7
fp=3D0xcc30daf2 flags=3D0x10201
Aug 14 19:32:57 T600 kernel: INFO: Object 0xf510daf3 @offset=3D17128
fp=3D0xcc30daf2
Aug 14 19:32:57 T600 kernel: Redzone ddb8467c: 00 00 00 00 00 00 00 00=20=
=20=20=20=20=20=20=20=20
                ........
[...]
Aug 14 19:32:57 T600 kernel: Redzone 2ef2f036: cc cc cc cc=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                ....
Aug 14 19:32:57 T600 kernel: Padding 6004979e: 5a 5a 5a 5a 5a 5a 5a 5a=20=
=20=20=20=20=20=20=20=20
                ZZZZZZZZ
Aug 14 19:32:57 T600 kernel: CPU: 1 PID: 252 Comm: umount Tainted: P    B  =
 W=20=20
      5.3.0-rc4+ #1
Aug 14 19:32:57 T600 kernel: Call Trace:
Aug 14 19:32:57 T600 kernel: [ed22bb68] [c0532654] dump_stack+0xa0/0xfc
(unreliable)
Aug 14 19:32:57 T600 kernel: [ed22bb98] [c0195540]
check_bytes_and_report+0xc8/0xf0
Aug 14 19:32:57 T600 kernel: [ed22bbc8] [c0195f80] check_object+0x50/0x224
Aug 14 19:32:57 T600 kernel: [ed22bbf8] [c0197d6c]
free_debug_processing+0x17c/0x27c
Aug 14 19:32:57 T600 kernel: [ed22bc48] [c0197ff4] __slab_free+0x188/0x338
Aug 14 19:32:57 T600 kernel: [ed22bcc8] [c0198408] kfree+0x264/0x29c
Aug 14 19:32:57 T600 kernel: [ed22bd18] [f1a53444] free_bitmap+0x24/0x68
[btrfs]
Aug 14 19:32:57 T600 kernel: [ed22bd38] [f1a534f0]
__btrfs_remove_free_space_cache_locked+0x68/0x6c [btrfs]
Aug 14 19:32:57 T600 kernel: [ed22bd58] [f1a566c8]
btrfs_remove_free_space_cache+0x38/0x84 [btrfs]
Aug 14 19:32:57 T600 kernel: [ed22bd78] [f19ef7a4]
btrfs_free_block_groups+0x164/0x24c [btrfs]
Aug 14 19:32:57 T600 kernel: [ed22bdb8] [f1a0193c] close_ctree+0x230/0x2c4
[btrfs]
Aug 14 19:32:57 T600 kernel: [ed22bdf8] [c01ab508]
generic_shutdown_super+0x80/0x110
Aug 14 19:32:57 T600 kernel: [ed22be18] [c01ab718] kill_anon_super+0x18/0x30
Aug 14 19:32:57 T600 kernel: [ed22be38] [f19d88b4] btrfs_kill_super+0x18/0x=
30
[btrfs]
Aug 14 19:32:57 T600 kernel: [ed22be58] [c01abdbc]
deactivate_locked_super+0x54/0xa4
Aug 14 19:32:57 T600 kernel: [ed22be78] [c01cbcb4] cleanup_mnt+0x6c/0xe4
Aug 14 19:32:57 T600 kernel: [ed22bea8] [c0054f50] task_work_run+0xa0/0xc0
Aug 14 19:32:57 T600 kernel: [ed22bed8] [c000bc44] do_notify_resume+0x160/0=
x2c8
Aug 14 19:32:57 T600 kernel: [ed22bf38] [c0014800] do_user_signal+0x2c/0x34
Aug 14 19:32:57 T600 kernel: --- interrupt: c00 at 0x5a93d4
                                 LR =3D 0x5a93b8
Aug 14 19:32:57 T600 kernel: FIX kmalloc-4k: Restoring
0xddb8467c-0xf2d9726e=3D0xcc
Aug 14 19:32:57 T600 kernel: FIX kmalloc-4k: Object at 0xf510daf3 not freed

--=20
You are receiving this mail because:
You are on the CC list for the bug.=

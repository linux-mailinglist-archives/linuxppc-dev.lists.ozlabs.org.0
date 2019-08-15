Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2FE8EE87
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 16:43:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468Thm2fLgzDqyB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 00:43:20 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 468Tbg6ytvzDr5g
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 00:38:54 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 4992528931
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 14:38:52 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 3E13F286B3; Thu, 15 Aug 2019 14:38:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 204371] BUG kmalloc-4k (Tainted: G        W        ): Object
 padding overwritten
Date: Thu, 15 Aug 2019 14:38:50 +0000
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
Message-ID: <bug-204371-206035-lujGcLTj5J@https.bugzilla.kernel.org/>
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

--- Comment #26 from Erhard F. (erhard_f@mailbox.org) ---
On Wed, 14 Aug 2019 20:33:51 +0000
bugzilla-daemon@bugzilla.kernel.org wrote:


> https://bugzilla.kernel.org/show_bug.cgi?id=3D204371
>
>--- Comment #24 from Christophe Leroy (christophe.leroy@c-s.fr) ---
>It confirms what I suspected: due to some debug options, kzalloc() doesn't
>provide aligned areas.
>
>In __load_free_space_cache() can you replace=20
>e->bitmap =3D kzalloc(PAGE_SIZE, GFP_NOFS);
>By
>e->bitmap =3D (void *)__get_free_page(GFP_NOFS | __GFP_ZERO);
>
>And same in insert_into_bitmap()
>
>Then replace the three kfree() which free bitmaps by something like
>free_page((unsigned long)entry->bitmap)
>=20
> --- Comment #25 from Christophe Leroy (christophe.leroy@c-s.fr) ---
> You can use get_zeroed_page(GFP_NOFS) instead of __get_free_page(GFP_NOFS=
 |
> __GFP_ZERO)
Think I got everything right after a bit of searching...

Now I get this nice compact output:
[..]
[   46.579181] ------------[ cut here ]------------
[   46.579378] kernel BUG at mm/slub.c:3952!
[   46.579513] Oops: Exception in kernel mode, sig: 5 [#1]
[   46.579699] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
[   46.579898] Modules linked in: b43legacy led_class mac80211 cfg80211
snd_aoa_codec_tas snd_aoa_fabric_layout snd_aoa rfkill libarc4 evdev btrfs
therm_windtunnel ohci_pci xor zstd_decompress zstd_compress zlib_deflate
raid6_pq zlib_inflate radeon sr_mod firewire_ohci sungem hwmon snd_aoa_i2sb=
us
i2c_algo_bit backlight cdrom firewire_core sungem_phy crc_itu_t
snd_aoa_soundbus snd_pcm drm_kms_helper ohci_hcd syscopyarea ehci_pci snd_t=
imer
sysfillrect snd sysimgblt fb_sys_fops ttm ehci_hcd soundcore drm
drm_panel_orientation_quirks usbcore uninorth_agp usb_common agpgart ssb lzo
lzo_compress lzo_decompress zram zsmalloc
[   46.582252] CPU: 0 PID: 261 Comm: umount Tainted: G        W=20=20=20=20=
=20=20=20=20
5.3.0-rc4+ #2
[   46.582533] NIP:  c0198228 LR: c0198204 CTR: c01981a4
[   46.582708] REGS: dbbc1c10 TRAP: 0700   Tainted: G        W=20=20=20=20=
=20=20=20=20=20
(5.3.0-rc4+)
[   46.582990] MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 22008824  XER: 00000000
[   46.583243]=20
               GPR00: f110b444 dbbc1cc8 ec2944a0 ef4329f4 c07fe5f8 8950b76e
00001032 00000000=20
               GPR08: 2854c000 00000001 00000000 dbbc1d18 c01981a4 008f5ff4
00000000 00000000=20
               GPR16: 00000000 00000000 bff5d9dc bff5d9c4 00000001 00000000
00000000 00000000=20
               GPR24: 00000000 f110b444 00000100 dba800b8 f11b0000 c07fe5f8
ed3d5000 ef4329f4=20
[   46.584505] NIP [c0198228] kfree+0x84/0x29c
[   46.584642] LR [c0198204] kfree+0x60/0x29c
[   46.584774] Call Trace:
[   46.585254] [dbbc1cc8] [f110b4e0]
__btrfs_remove_free_space_cache_locked+0x58/0x6c [btrfs] (unreliable)
[   46.585717] [dbbc1d18] [f110b444] free_bitmap+0x24/0x68 [btrfs]
[   46.586008] [dbbc1d38] [f110b4f0]
__btrfs_remove_free_space_cache_locked+0x68/0x6c [btrfs]
[   46.586388] [dbbc1d58] [f110e6ac] btrfs_remove_free_space_cache+0x38/0x84
[btrfs]
[   46.586732] [dbbc1d78] [f10a77a4] btrfs_free_block_groups+0x164/0x24c
[btrfs]
[   46.587073] [dbbc1db8] [f10b993c] close_ctree+0x230/0x2c4 [btrfs]
[   46.587303] [dbbc1df8] [c01ab508] generic_shutdown_super+0x80/0x110
[   46.587531] [dbbc1e18] [c01ab718] kill_anon_super+0x18/0x30
[   46.587802] [dbbc1e38] [f10908b4] btrfs_kill_super+0x18/0x30 [btrfs]
[   46.588039] [dbbc1e58] [c01abdbc] deactivate_locked_super+0x54/0xa4
[   46.588269] [dbbc1e78] [c01cbcb4] cleanup_mnt+0x6c/0xe4
[   46.588456] [dbbc1ea8] [c0054f50] task_work_run+0xa0/0xc0
[   46.588645] [dbbc1ed8] [c000bc44] do_notify_resume+0x160/0x2c8
[   46.588857] [dbbc1f38] [c0014800] do_user_signal+0x2c/0x34
[   46.589052] --- interrupt: c00 at 0x7593d4
                   LR =3D 0x7593b8
[   46.589252] Instruction dump:
[   46.589340] 4bffade1 7c7f1b78 4bffadbd 81230000 71290200 40a200f8 813f00=
00
552987ff=20
[   46.589644] 4082000c 813f0004 552907fe 69290001 <0f090000> 7fe3fb78 4bff=
adcd
7c641b78=20
[   46.589961] ---[ end trace 0164244520bfd23a ]---

--=20
You are receiving this mail because:
You are on the CC list for the bug.=

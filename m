Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCBB8F2A3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 19:58:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468Z205MHqzDr96
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 03:58:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 468Yzr6219zDqRC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 03:56:39 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id A977228736
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 17:56:37 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 9DFF62899D; Thu, 15 Aug 2019 17:56:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 204371] BUG kmalloc-4k (Tainted: G        W        ): Object
 padding overwritten
Date: Thu, 15 Aug 2019 17:56:35 +0000
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
Message-ID: <bug-204371-206035-zdzPjBksX2@https.bugzilla.kernel.org/>
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

--- Comment #30 from Erhard F. (erhard_f@mailbox.org) ---
On Thu, 15 Aug 2019 17:11:36 +0000
bugzilla-daemon@bugzilla.kernel.org wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=3D204371
>=20
> --- Comment #29 from Christophe Leroy (christophe.leroy@c-s.fr) ---
> Looks good. Does it work better ?
Had some trouble getting the dmesg. With these modifications the btrfs modu=
le
hiccups as soon as it gets loaded, during btrfs selftests:

[...]
[  167.258266] Btrfs loaded, crc32c=3Dcrc32c-generic, debug=3Don
[  167.259388] BTRFS: selftest: sectorsize: 4096  nodesize: 4096
[  167.259602] BTRFS: selftest: running btrfs free space cache tests
[  167.259943] BTRFS: selftest: running extent only tests
[  167.260201] BTRFS: selftest: running bitmap only tests
[  167.260501] BTRFS: selftest: running bitmap and extent tests
[  167.260963] WARNING: CPU: 0 PID: 266 at mm/slub.c:1846
___slab_alloc.constprop.75+0x2ac/0x380
[  167.261277] Modules linked in: btrfs(+) auth_rpcgss nfsv4 dns_resolver n=
fs
lockd grace sunrpc input_leds joydev b43legacy led_class hid_generic mac802=
11
usbhid hid snd_aoa_codec_tas snd_aoa_fabric_layout snd_aoa cfg80211 rfkill
libarc4 evdev ohci_pci xor zstd_decompress zstd_compress zlib_deflate radeon
raid6_pq zlib_inflate therm_windtunnel ehci_pci ohci_hcd hwmon i2c_algo_bit
ehci_hcd backlight drm_kms_helper sungem firewire_ohci syscopyarea sungem_p=
hy
sysfillrect sr_mod firewire_core sysimgblt fb_sys_fops cdrom crc_itu_t
snd_aoa_i2sbus snd_aoa_soundbus ttm snd_pcm usbcore snd_timer drm usb_common
snd soundcore ssb uninorth_agp drm_panel_orientation_quirks agpgart lzo
lzo_compress lzo_decompress zram zsmalloc
[  167.263795] CPU: 0 PID: 266 Comm: modprobe Tainted: G        W=20=20=20=
=20=20=20=20=20
5.3.0-rc4+ #3
[  167.264074] NIP:  c0196ddc LR: c0196dd4 CTR: c019711c
[  167.264236] REGS: ecde9a70 TRAP: 0700   Tainted: G        W=20=20=20=20=
=20=20=20=20=20
(5.3.0-rc4+)
[  167.264488] MSR:  00021032 <ME,IR,DR,RI>  CR: 28224222  XER: 00000000
[  167.264709]=20
               GPR00: c0196dd4 ecde9b28 eb353380 00000000 ef3d3600 0003000e
00000000 0007000f=20
               GPR08: 00000001 00000001 ef42488c ecde9b28 48244222 00a9eff4
00a64e74 00000004=20
               GPR16: 00000000 ee800810 00000000 c0800000 00000000 ee800824
f203de58 c07fea34=20
               GPR24: 00210d00 ef424888 00000d40 ee800800 ef3d3600 ee8032e0
00000000 eedb1af8=20
[  167.265857] NIP [c0196ddc] ___slab_alloc.constprop.75+0x2ac/0x380
[  167.266052] LR [c0196dd4] ___slab_alloc.constprop.75+0x2a4/0x380
[  167.266248] Call Trace:
[  167.266308] [ecde9b28] [c0196dd4] ___slab_alloc.constprop.75+0x2a4/0x380
(unreliable)
[  167.266567] [ecde9bb8] [c0196ef0] __slab_alloc.constprop.74+0x40/0x6c
[  167.266776] [ecde9be8] [c0197198] kmem_cache_alloc_trace+0x7c/0x1a0
[  167.267321] [ecde9c28] [f203de58] test_add_free_space_entry+0xf0/0x214
[btrfs]
[  167.267672] [ecde9c78] [f207e238] btrfs_test_free_space_cache+0x918/0x13=
08
[btrfs]
[  167.268012] [ecde9cd8] [f207ad3c] btrfs_run_sanity_tests+0x8c/0x144 [btr=
fs]
[  167.268327] [ecde9d08] [f1678cd0] init_btrfs_fs+0xd4/0x12c [btrfs]
[  167.268536] [ecde9d28] [c00052cc] do_one_initcall+0x54/0x288
[  167.282204] [ecde9d98] [c00bebf8] do_init_module+0x60/0x1dc
[  167.295710] [ecde9dc8] [c00c0ad4] load_module+0x1ca4/0x1e18
[  167.308943] [ecde9ea8] [c00c0df4] sys_finit_module+0x98/0xb8
[  167.322086] [ecde9f38] [c0014274] ret_from_syscall+0x0/0x34
[  167.335151] --- interrupt: c01 at 0x8ed2c4
                   LR =3D 0xa757c4
[  167.361356] Instruction dump:
[  167.374279] 7e048378 7f83e378 60e70001 90e10030 4bffda0d 2f830000 41beff=
20
7f84e378=20
[  167.387497] 7f63db78 4bffdd35 7e090034 5529d97e <0f090000> 2f900000 41be=
ff00
7e527a14=20
[  167.400820] irq event stamp: 0
[  167.414008] hardirqs last  enabled at (0): [<00000000>] 0x0
[  167.427196] hardirqs last disabled at (0): [<c0032f0c>]
copy_process+0x474/0x1368
[  167.440311] softirqs last  enabled at (0): [<c0032f0c>]
copy_process+0x474/0x1368
[  167.453198] softirqs last disabled at (0): [<00000000>] 0x0
[  167.465906] ---[ end trace 74450a6aa18e595d ]---
[  167.481091] BTRFS: selftest: running space stealing from bitmap to extent
tests
[  167.496220] BTRFS: selftest: running extent buffer operation tests
[  167.510905] BTRFS: selftest: running btrfs_split_item tests
[  167.525961] BTRFS: selftest: running extent I/O tests
[  167.540569] BTRFS: selftest: running find delalloc tests
[  168.104731] BTRFS: selftest: running find_first_clear_extent_bit test
[  168.119119] BTRFS: selftest: running extent buffer bitmap tests
[  168.463591] BTRFS: selftest: running inode tests
[  168.477316] BTRFS: selftest: running btrfs_get_extent tests
[  168.491784] BTRFS: selftest: running hole first btrfs_get_extent test
[  168.506234] BTRFS: selftest: running outstanding_extents tests
[  168.520925] BTRFS: selftest: running qgroup tests
[  168.535039] BTRFS: selftest: running qgroup add/remove tests
[  168.549344] BTRFS: selftest: running qgroup multiple refs test
[  168.563713] BTRFS: selftest: running free space tree tests
[  168.706099] BTRFS: selftest: sectorsize: 4096  nodesize: 8192
[  168.718674] BTRFS: selftest: running btrfs free space cache tests
[  168.731349] BTRFS: selftest: running extent only tests
[  168.744380] BTRFS: selftest: running bitmap only tests
[  168.757505] BTRFS: selftest: running bitmap and extent tests
[  168.770615] WARNING: CPU: 0 PID: 266 at mm/slub.c:1846
___slab_alloc.constprop.75+0x2ac/0x380
[  168.783738] Modules linked in: btrfs(+) auth_rpcgss nfsv4 dns_resolver n=
fs
lockd grace sunrpc input_leds joydev b43legacy led_class hid_generic mac802=
11
usbhid hid snd_aoa_codec_tas snd_aoa_fabric_layout snd_aoa cfg80211 rfkill
libarc4 evdev ohci_pci xor zstd_decompress zstd_compress zlib_deflate radeon
raid6_pq zlib_inflate therm_windtunnel ehci_pci ohci_hcd hwmon i2c_algo_bit
ehci_hcd backlight drm_kms_helper sungem firewire_ohci syscopyarea sungem_p=
hy
sysfillrect sr_mod firewire_core sysimgblt fb_sys_fops cdrom crc_itu_t
snd_aoa_i2sbus snd_aoa_soundbus ttm snd_pcm usbcore snd_timer drm usb_common
snd soundcore ssb uninorth_agp drm_panel_orientation_quirks agpgart lzo
lzo_compress lzo_decompress zram zsmalloc
[  168.828086] CPU: 0 PID: 266 Comm: modprobe Tainted: G        W=20=20=20=
=20=20=20=20=20
5.3.0-rc4+ #3
[  168.843577] NIP:  c0196ddc LR: c0196dd4 CTR: c019711c
[  168.859054] REGS: ecde9a70 TRAP: 0700   Tainted: G        W=20=20=20=20=
=20=20=20=20=20
(5.3.0-rc4+)
[  168.874772] MSR:  00021032 <ME,IR,DR,RI>  CR: 28224242  XER: 00000000
[  168.890402]=20
               GPR00: c0196dd4 ecde9b28 eb353380 00000000 ef3d3960 0001000e
00000000 0007000f=20
               GPR08: 00000001 00000001 ef432578 ecde9b28 48244242 00a9eff4
00a64e74 00000006=20
               GPR16: 00000000 ee800810 00000000 c0800000 00000000 ee800824
f203de58 c07fea34=20
               GPR24: 00210d00 ef432574 00000d40 ee800800 ef3d3960 ee8032e0
00000000 eedb1af8=20
[  168.960711] NIP [c0196ddc] ___slab_alloc.constprop.75+0x2ac/0x380
[  168.974148] LR [c0196dd4] ___slab_alloc.constprop.75+0x2a4/0x380
[  168.987536] Call Trace:
[  169.000772] [ecde9b28] [c0196dd4] ___slab_alloc.constprop.75+0x2a4/0x380
(unreliable)
[  169.014236] [ecde9bb8] [c0196ef0] __slab_alloc.constprop.74+0x40/0x6c
[  169.027634] [ecde9be8] [c0197198] kmem_cache_alloc_trace+0x7c/0x1a0
[  169.041326] [ecde9c28] [f203de58] test_add_free_space_entry+0xf0/0x214
[btrfs]
[  169.054891] [ecde9c78] [f207dee4] btrfs_test_free_space_cache+0x5c4/0x13=
08
[btrfs]
[  169.068328] [ecde9cd8] [f207ad3c] btrfs_run_sanity_tests+0x8c/0x144 [btr=
fs]
[  169.081776] [ecde9d08] [f1678cd0] init_btrfs_fs+0xd4/0x12c [btrfs]
[  169.095039] [ecde9d28] [c00052cc] do_one_initcall+0x54/0x288
[  169.108161] [ecde9d98] [c00bebf8] do_init_module+0x60/0x1dc
[  169.121179] [ecde9dc8] [c00c0ad4] load_module+0x1ca4/0x1e18
[  169.134179] [ecde9ea8] [c00c0df4] sys_finit_module+0x98/0xb8
[  169.147133] [ecde9f38] [c0014274] ret_from_syscall+0x0/0x34
[  169.159933] --- interrupt: c01 at 0x8ed2c4
                   LR =3D 0xa757c4
[  169.185350] Instruction dump:
[  169.197936] 7e048378 7f83e378 60e70001 90e10030 4bffda0d 2f830000 41beff=
20
7f84e378=20
[  169.210814] 7f63db78 4bffdd35 7e090034 5529d97e <0f090000> 2f900000 41be=
ff00
7e527a14=20
[  169.223824] irq event stamp: 0
[  169.236770] hardirqs last  enabled at (0): [<00000000>] 0x0
[  169.249906] hardirqs last disabled at (0): [<c0032f0c>]
copy_process+0x474/0x1368
[  169.263077] softirqs last  enabled at (0): [<c0032f0c>]
copy_process+0x474/0x1368
[  169.276147] softirqs last disabled at (0): [<00000000>] 0x0
[  169.289173] ---[ end trace 74450a6aa18e595e ]---
[  169.305352] WARNING: CPU: 0 PID: 266 at mm/slub.c:1846
___slab_alloc.constprop.75+0x2ac/0x380
[  169.318278] Modules linked in: btrfs(+) auth_rpcgss nfsv4 dns_resolver n=
fs
lockd grace sunrpc input_leds joydev b43legacy led_class hid_generic mac802=
11
usbhid hid snd_aoa_codec_tas snd_aoa_fabric_layout snd_aoa cfg80211 rfkill
libarc4 evdev ohci_pci xor zstd_decompress zstd_compress zlib_deflate radeon
raid6_pq zlib_inflate therm_windtunnel ehci_pci ohci_hcd hwmon i2c_algo_bit
ehci_hcd backlight drm_kms_helper sungem firewire_ohci syscopyarea sungem_p=
hy
sysfillrect sr_mod firewire_core sysimgblt fb_sys_fops cdrom crc_itu_t
snd_aoa_i2sbus snd_aoa_soundbus ttm snd_pcm usbcore snd_timer drm usb_common
snd soundcore ssb uninorth_agp drm_panel_orientation_quirks agpgart lzo
lzo_compress lzo_decompress zram zsmalloc
[  169.363085] CPU: 0 PID: 266 Comm: modprobe Tainted: G        W=20=20=20=
=20=20=20=20=20
5.3.0-rc4+ #3
[  169.378753] NIP:  c0196ddc LR: c0196dd4 CTR: c019711c
[  169.394382] REGS: ecde9a70 TRAP: 0700   Tainted: G        W=20=20=20=20=
=20=20=20=20=20
(5.3.0-rc4+)
[  169.410156] MSR:  00021032 <ME,IR,DR,RI>  CR: 28224222  XER: 00000000
[  169.425900]=20
               GPR00: c0196dd4 ecde9b28 eb353380 00000000 ef3d3ba0 0001000e
00000000 0007000f=20
               GPR08: 00000001 00000001 ef188f3c ecde9b28 48244222 00a9eff4
00a64e74 00000006=20
               GPR16: 00000000 ee800810 00000000 c0800000 00000000 ee800824
f203de58 c07fea34=20
               GPR24: 00210d00 ef188f38 00000d40 ee800800 ef3d3ba0 ee8032e0
00000000 eedb1af8=20
[  169.506070] NIP [c0196ddc] ___slab_alloc.constprop.75+0x2ac/0x380
[  169.522457] LR [c0196dd4] ___slab_alloc.constprop.75+0x2a4/0x380
[  169.538919] Call Trace:
[  169.555301] [ecde9b28] [c0196dd4] ___slab_alloc.constprop.75+0x2a4/0x380
(unreliable)
[  169.572079] [ecde9bb8] [c0196ef0] __slab_alloc.constprop.74+0x40/0x6c
[  169.588847] [ecde9be8] [c0197198] kmem_cache_alloc_trace+0x7c/0x1a0
[  169.605861] [ecde9c28] [f203de58] test_add_free_space_entry+0xf0/0x214
[btrfs]
[  169.623013] [ecde9c78] [f207e08c] btrfs_test_free_space_cache+0x76c/0x13=
08
[btrfs]
[  169.640288] [ecde9cd8] [f207ad3c] btrfs_run_sanity_tests+0x8c/0x144 [btr=
fs]
[  169.657589] [ecde9d08] [f1678cd0] init_btrfs_fs+0xd4/0x12c [btrfs]
[  169.674812] [ecde9d28] [c00052cc] do_one_initcall+0x54/0x288
[  169.692019] [ecde9d98] [c00bebf8] do_init_module+0x60/0x1dc
[  169.709242] [ecde9dc8] [c00c0ad4] load_module+0x1ca4/0x1e18
[  169.726533] [ecde9ea8] [c00c0df4] sys_finit_module+0x98/0xb8
[  169.743904] [ecde9f38] [c0014274] ret_from_syscall+0x0/0x34
[  169.761110] --- interrupt: c01 at 0x8ed2c4
                   LR =3D 0xa757c4
[  169.793422] Instruction dump:
[  169.808483] 7e048378 7f83e378 60e70001 90e10030 4bffda0d 2f830000 41beff=
20
7f84e378=20
[  169.823241] 7f63db78 4bffdd35 7e090034 5529d97e <0f090000> 2f900000 41be=
ff00
7e527a14=20
[  169.838004] irq event stamp: 0
[  169.852643] hardirqs last  enabled at (0): [<00000000>] 0x0
[  169.867316] hardirqs last disabled at (0): [<c0032f0c>]
copy_process+0x474/0x1368
[  169.882061] softirqs last  enabled at (0): [<c0032f0c>]
copy_process+0x474/0x1368
[  169.896525] softirqs last disabled at (0): [<00000000>] 0x0
[  169.910840] ---[ end trace 74450a6aa18e595f ]---
[  169.928722] BTRFS: selftest: running space stealing from bitmap to extent
tests
[  169.943052] WARNING: CPU: 1 PID: 266 at mm/slub.c:1846
___slab_alloc.constprop.75+0x2ac/0x380
[  169.957190] Modules linked in: btrfs(+) auth_rpcgss nfsv4 dns_resolver n=
fs
lockd grace sunrpc input_leds joydev b43legacy led_class hid_generic mac802=
11
usbhid hid snd_aoa_codec_tas snd_aoa_fabric_layout snd_aoa cfg80211 rfkill
libarc4 evdev ohci_pci xor zstd_decompress zstd_compress zlib_deflate radeon
raid6_pq zlib_inflate therm_windtunnel ehci_pci ohci_hcd hwmon i2c_algo_bit
ehci_hcd backlight drm_kms_helper sungem firewire_ohci syscopyarea sungem_p=
hy
sysfillrect sr_mod firewire_core sysimgblt fb_sys_fops cdrom crc_itu_t
snd_aoa_i2sbus snd_aoa_soundbus ttm snd_pcm usbcore snd_timer drm usb_common
snd soundcore ssb uninorth_agp drm_panel_orientation_quirks agpgart lzo
lzo_compress lzo_decompress zram zsmalloc
[  170.003934] CPU: 1 PID: 266 Comm: modprobe Tainted: G        W=20=20=20=
=20=20=20=20=20
5.3.0-rc4+ #3
[  170.019968] NIP:  c0196ddc LR: c0196dd4 CTR: c019711c
[  170.035984] REGS: ecde9a70 TRAP: 0700   Tainted: G        W=20=20=20=20=
=20=20=20=20=20
(5.3.0-rc4+)
[  170.052020] MSR:  00021032 <ME,IR,DR,RI>  CR: 28224242  XER: 00000000
[  170.068087]=20
               GPR00: c0196dd4 ecde9b28 eb353380 00000000 ef3d3cc0 0004000e
00000000 0007000f=20
               GPR08: 00000001 00000001 ef188eac ecde9b28 48244242 00a9eff4
00a64e74 00000003=20
               GPR16: 00000000 ee800810 00000000 c0800000 00000000 ee800824
f203de58 c07fea34=20
               GPR24: 00210d00 ef188ea8 00000d40 ee800800 ef3d3cc0 ee8032e0
00000000 eedceaf8=20
[  170.149103] NIP [c0196ddc] ___slab_alloc.constprop.75+0x2ac/0x380
[  170.165571] LR [c0196dd4] ___slab_alloc.constprop.75+0x2a4/0x380
[  170.182082] Call Trace:
[  170.198482] [ecde9b28] [c0196dd4] ___slab_alloc.constprop.75+0x2a4/0x380
(unreliable)
[  170.215245] [ecde9bb8] [c0196ef0] __slab_alloc.constprop.74+0x40/0x6c
[  170.232091] [ecde9be8] [c0197198] kmem_cache_alloc_trace+0x7c/0x1a0
[  170.249175] [ecde9c28] [f203de58] test_add_free_space_entry+0xf0/0x214
[btrfs]
[  170.266059] [ecde9c78] [f207e44c] btrfs_test_free_space_cache+0xb2c/0x13=
08
[btrfs]
[  170.282918] [ecde9cd8] [f207ad3c] btrfs_run_sanity_tests+0x8c/0x144 [btr=
fs]
[  170.299700] [ecde9d08] [f1678cd0] init_btrfs_fs+0xd4/0x12c [btrfs]
[  170.316388] [ecde9d28] [c00052cc] do_one_initcall+0x54/0x288
[  170.333159] [ecde9d98] [c00bebf8] do_init_module+0x60/0x1dc
[  170.349916] [ecde9dc8] [c00c0ad4] load_module+0x1ca4/0x1e18
[  170.366610] [ecde9ea8] [c00c0df4] sys_finit_module+0x98/0xb8
[  170.383179] [ecde9f38] [c0014274] ret_from_syscall+0x0/0x34
[  170.399101] --- interrupt: c01 at 0x8ed2c4
                   LR =3D 0xa757c4
[  170.428916] Instruction dump:
[  170.442826] 7e048378 7f83e378 60e70001 90e10030 4bffda0d 2f830000 41beff=
20
7f84e378=20
[  170.456986] 7f63db78 4bffdd35 7e090034 5529d97e <0f090000> 2f900000 41be=
ff00
7e527a14=20
[  170.471190] irq event stamp: 0
[  170.485188] hardirqs last  enabled at (0): [<00000000>] 0x0
[  170.499283] hardirqs last disabled at (0): [<c0032f0c>]
copy_process+0x474/0x1368
[  170.513322] softirqs last  enabled at (0): [<c0032f0c>]
copy_process+0x474/0x1368
[  170.527207] softirqs last disabled at (0): [<00000000>] 0x0
[  170.540920] ---[ end trace 74450a6aa18e5960 ]---
[  170.558438] ------------[ cut here ]------------
[  170.572459] kernel BUG at mm/slub.c:3952!
[  170.586496] Oops: Exception in kernel mode, sig: 5 [#1]
[  170.600564] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
[  170.614556] Modules linked in: btrfs(+) auth_rpcgss nfsv4 dns_resolver n=
fs
lockd grace sunrpc input_leds joydev b43legacy led_class hid_generic mac802=
11
usbhid hid snd_aoa_codec_tas snd_aoa_fabric_layout snd_aoa cfg80211 rfkill
libarc4 evdev ohci_pci xor zstd_decompress zstd_compress zlib_deflate radeon
raid6_pq zlib_inflate therm_windtunnel ehci_pci ohci_hcd hwmon i2c_algo_bit
ehci_hcd backlight drm_kms_helper sungem firewire_ohci syscopyarea sungem_p=
hy
sysfillrect sr_mod firewire_core sysimgblt fb_sys_fops cdrom crc_itu_t
snd_aoa_i2sbus snd_aoa_soundbus ttm snd_pcm usbcore snd_timer drm usb_common
snd soundcore ssb uninorth_agp drm_panel_orientation_quirks agpgart lzo
lzo_compress lzo_decompress zram zsmalloc
[  170.662386] CPU: 0 PID: 266 Comm: modprobe Tainted: G        W=20=20=20=
=20=20=20=20=20
5.3.0-rc4+ #3
[  170.678893] NIP:  c0198228 LR: c0198204 CTR: c01981a4
[  170.695309] REGS: ecde9b10 TRAP: 0700   Tainted: G        W=20=20=20=20=
=20=20=20=20=20
(5.3.0-rc4+)
[  170.711791] MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 28242424  XER: 00000000
[  170.728343]=20
               GPR00: f207aa60 ecde9bc8 eb353380 ef3d3a80 c07fe5f8 c01600dc
00003c40 00000000=20
               GPR08: 00001032 00000001 00000000 ecde9c18 c01981a4 00a9eff4
00a64e74 c0710cd4=20
               GPR16: f16a1fac 000011ad 00000001 00000124 c00bbeac c0e7e55c
00000001 ea8ed15c=20
               GPR24: ea8ed16c f207aa60 f209a370 f209a343 00002000 c07fe5f8
ea9a6458 ef3d3a80=20
[  170.812601] NIP [c0198228] kfree+0x84/0x29c
[  170.829631] LR [c0198204] kfree+0x60/0x29c
[  170.846753] Call Trace:
[  170.863878] [ecde9bc8] [f20d0000] test_error+0xd44/0xfffba69c [btrfs]
(unreliable)
[  170.881178] [ecde9c18] [f207aa60] btrfs_free_dummy_fs_info+0x168/0x1e0
[btrfs]
[  170.898408] [ecde9c78] [f207da3c] btrfs_test_free_space_cache+0x11c/0x13=
08
[btrfs]
[  170.915026] [ecde9cd8] [f207ad3c] btrfs_run_sanity_tests+0x8c/0x144 [btr=
fs]
[  170.931323] [ecde9d08] [f1678cd0] init_btrfs_fs+0xd4/0x12c [btrfs]
[  170.948575] [ecde9d28] [c00052cc] do_one_initcall+0x54/0x288
[  170.965784] [ecde9d98] [c00bebf8] do_init_module+0x60/0x1dc
[  170.982897] [ecde9dc8] [c00c0ad4] load_module+0x1ca4/0x1e18
[  170.999911] [ecde9ea8] [c00c0df4] sys_finit_module+0x98/0xb8
[  171.016767] [ecde9f38] [c0014274] ret_from_syscall+0x0/0x34
[  171.032967] --- interrupt: c01 at 0x8ed2c4
                   LR =3D 0xa757c4
[  171.063206] Instruction dump:
[  171.077290] 4bffade1 7c7f1b78 4bffadbd 81230000 71290200 40a200f8 813f00=
00
552987ff=20
[  171.091622] 4082000c 813f0004 552907fe 69290001 <0f090000> 7fe3fb78 4bff=
adcd
7c641b78=20
[  171.106020] ---[ end trace 74450a6aa18e5961 ]---

--=20
You are receiving this mail because:
You are on the CC list for the bug.=

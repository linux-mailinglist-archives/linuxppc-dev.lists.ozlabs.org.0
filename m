Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1FE536C9E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 13:43:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9KZB2ktGz3c7h
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 21:43:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E4Z+T4Iz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E4Z+T4Iz;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9KYT051Kz3bhm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 21:43:08 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 794B060DDD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 11:43:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE2D5C34100
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 11:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653738184;
	bh=UplC8tR3Uid1xxzaJ4ILe57EVrmG+88VGrvYWxl0P4k=;
	h=From:To:Subject:Date:From;
	b=E4Z+T4IzmuoprHOS0EHN0UiVNn5yWWIdWYp0V2k8b16SzRTefL6AjVn8E/qrmdFiS
	 1l2pCwdLjkjfo9fcom44Yyf7uvEyOYHNWAtjAdMH1KVVNrbyqa3YYdA+o1EXrqKk7o
	 pJZJQZT7QxM4e/yHh9SaxNLSmB7ZRsGPCSSW9xyNFGodiBy/JDClCs/d9vLuJIfuPU
	 M9r6wy4ai8m2U4e5IGOMBHfULRtAEQrMzIoFM19K4THN2AcaOKl2PehBQ2VQQ1Vct8
	 5sdFFWCw1HFm+Qib77CqVZ6p9ljw0rsVxJCQx+b1szhKXDQq+Q0DwFj8Sph/BIqtrd
	 6psRSbWcHqZcQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C009DC05FD2; Sat, 28 May 2022 11:43:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216041] New: Stack overflow at boot (do_IRQ: stack overflow:
 1984) on a PowerMac G4 DP, KASAN debug build
Date: Sat, 28 May 2022 11:43:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216041-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216041

            Bug ID: 216041
           Summary: Stack overflow at boot (do_IRQ: stack overflow: 1984)
                    on a PowerMac G4 DP, KASAN debug build
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.18.0
          Hardware: PPC-32
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-32
          Assignee: platform_ppc-32@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: No

Created attachment 301065
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301065&action=3Dedit
dmesg (5.18.0, PowerMac G4 DP), case 1

The attached v5.18 kernel .config triggers this stack overflow pretty easy =
on
my G4 DP. It does not show up on every boot but very often. The overflow
usually happens after the radeon drm gets loaded.

Don't know whether it's the same issue as bug #207129 but here the KASAN +
debug output looks more useful.

[...]
[drm] radeon: irq initialized.
[drm] Loading R300 Microcode
Loading firmware: radeon/R300_cp.bin
do_IRQ: stack overflow: 1984
CPU: 0 PID: 126 Comm: systemd-udevd Not tainted 5.18.0-gentoo-PMacG4 #1
Call Trace:
Oops: Kernel stack overflow, sig: 11 [#1]
BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
Modules linked in: sr_mod cdrom radeon(+) ohci_pci(+) hwmon i2c_algo_bit
drm_ttm_helper ttm drm_dp_helper snd_aoa_i2sbus snd_aoa_soundbus snd_pcm
ehci_pci snd_timer ohci_hcd snd ssb ehci_hcd 8250_pci soundcore drm_kms_hel=
per
pcmcia 8250 pcmcia_core syscopyarea usbcore sysfillrect 8250_base sysimgblt
serial_mctrl_gpio fb_sys_fops usb_common pkcs8_key_parser fuse drm
drm_panel_orientation_quirks configfs
CPU: 0 PID: 126 Comm: systemd-udevd Not tainted 5.18.0-gentoo-PMacG4 #1
NIP:  c02e5558 LR: c07eb3bc CTR: c07f46a8
REGS: e7fe9f50 TRAP: 0000   Not tainted  (5.18.0-gentoo-PMacG4)
MSR:  00001032 <ME,IR,DR,RI>  CR: 44a14824  XER: 20000000

GPR00: c07eb3bc eaa1c000 c26baea0 eaa1c0a0 00000008 00000000 c07eb3bc eaa1c=
010=20
GPR08: eaa1c0a8 04f3f3f3 f1f1f1f1 c07f4c84 44a14824 0080f7e4 00000005 00000=
010=20
GPR16: 00000025 eaa1c154 eaa1c158 c0dbad64 00000020 fd543810 eaa1c0a0 eaa1c=
29e=20
GPR24: c0dbad44 c0db8740 05ffffff fd543802 eaa1c150 c0c9a3c0 eaa1c0a0 c0c9a=
3c0=20
NIP [c02e5558] kasan_check_range+0xc/0x2b4
LR [c07eb3bc] format_decode+0x80/0x604
Call Trace:
[eaa1c000] [c07eb3bc] format_decode+0x80/0x604 (unreliable)
[eaa1c070] [c07f4dac] vsnprintf+0x128/0x938
[eaa1c110] [c07f5788] sprintf+0xa0/0xc0
[eaa1c180] [c0154c1c] __sprint_symbol.constprop.0+0x170/0x198
[eaa1c230] [c07ee71c] symbol_string+0xf8/0x260
[eaa1c430] [c07f46d0] pointer+0x15c/0x710
[eaa1c4b0] [c07f4fbc] vsnprintf+0x338/0x938
[eaa1c550] [c00e8fa0] vprintk_store+0x2a8/0x678
[eaa1c690] [c00e94e4] vprintk_emit+0x174/0x378
[eaa1c6d0] [c00ea008] _printk+0x9c/0xc0
[eaa1c750] [c000ca94] show_stack+0x21c/0x260
[eaa1c7a0] [c07d0bd4] dump_stack_lvl+0x60/0x90
[eaa1c7c0] [c0009234] __do_IRQ+0x170/0x174
[eaa1c800] [c0009258] do_IRQ+0x20/0x34
[eaa1c820] [c00045b4] HardwareInterrupt_virt+0x108/0x10c
--- interrupt: 500 at finish_task_switch.isra.0+0x130/0x3a8
NIP:  c00a3c9c LR: c00a3c88 CTR: c036560c
REGS: eaa1c830 TRAP: 0500   Not tainted  (5.18.0-gentoo-PMacG4)
MSR:  0220b032 <VEC,EE,FP,ME,IR,DR,RI>  CR: 22882848  XER: 20000000

GPR00: c00a3c88 eaa1c8e0 c26baea0 e6dcf2a0 c0c59b28 ea18df50 c002a268 c2fd1=
470=20
GPR08: 00000003 0200b032 00000000 00000001 22004868 0080f7e4 92e60efc c8883=
3b4=20
GPR16: 00000000 c88833c0 00000003 25c84000 00000006 e6dcf82c d82c68a0 00000=
000=20
GPR24: 25c84000 00000000 c2fd0bc0 c0c59b2c c114b2a0 e6dcf2a0 00000000 00000=
000=20
NIP [c00a3c9c] finish_task_switch.isra.0+0x130/0x3a8
LR [c00a3c88] finish_task_switch.isra.0+0x11c/0x3a8
--- interrupt: 500
[eaa1c920] [c0c59b2c] __schedule+0x3f0/0x9dc
[eaa1c9b0] [c0c5a18c] schedule+0x74/0x13c
[eaa1c9d0] [c0c5a2e4] io_schedule+0x54/0x8c
[eaa1c9f0] [c0c5af0c] bit_wait_io+0x18/0x94
[eaa1ca10] [c0c5a8a0] __wait_on_bit+0x100/0x28c
[eaa1ca60] [c0c5aaf4] out_of_line_wait_on_bit+0xc8/0xf0
[eaa1cae0] [c0494d38] ext4_read_bh+0x184/0x1a8
[eaa1cb10] [c0428bd4] __read_extent_tree_block+0x1a4/0x2d0
[eaa1cb50] [c042ade4] ext4_find_extent+0x270/0x5a4
[eaa1cbb0] [c04302b8] ext4_ext_map_blocks+0x11c/0x1d8c
[eaa1cdd0] [c0452f14] ext4_map_blocks+0x3f0/0x950
[eaa1ce90] [c0454890] ext4_getblk+0x2e8/0x3cc
[eaa1cf30] [c0454988] ext4_bread+0x14/0x110
[eaa1cf50] [c047d538] __ext4_read_dirblock+0x4c/0x52c
[eaa1cf90] [c047da8c] dx_probe+0x74/0x95c
[eaa1cff0] [c0480ed0] __ext4_find_entry+0x6c0/0x9b4
[eaa1d120] [c04812d4] ext4_lookup+0x110/0x3c0
[eaa1d1d0] [c0326524] __lookup_slow+0x10c/0x25c
[eaa1d240] [c032d1f8] walk_component+0x220/0x30c
[eaa1d2d0] [c032d6a0] link_path_walk.part.0.constprop.0+0x3bc/0x608
usb usb6: New USB device found, idVendor=3D1d6b, idProduct=3D0001, bcdDevic=
e=3D 5.18

[eaa1d380] [c032e384] path_openat+0x1b4/0x1648
usb usb6: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
[eaa1d490] [c03310e8] do_file_open_root+0x168/0x288
[eaa1d5c0] [c03095f8] file_open_root+0x150/0x234
usb usb6: Product: OHCI PCI host controller

usb usb6: Manufacturer: Linux 5.18.0-gentoo-PMacG4 ohci_hcd
[eaa1d640] [c037e688] kernel_read_file_from_path_initns+0x140/0x204
[eaa1d6d0] [c08f7614] _request_firmware+0x970/0xae8
usb usb6: SerialNumber: 0001:10:1b.1

[eaa1d7c0] [c08f77d8] request_firmware+0x4c/0x78
[eaa1d7e0] [befd63e0] r100_cp_init+0x590/0x608 [radeon]
[eaa1d810] [befe0310] r300_startup.constprop.0+0x3b0/0x458 [radeon]
[eaa1d840] [befe0854] r300_init+0x19c/0x368 [radeon]
[eaa1d860] [bef79e3c] radeon_device_init+0x930/0x10ac [radeon]
[eaa1d8c0] [bef7c0b0] radeon_driver_load_kms+0xf4/0x2b8 [radeon]
[eaa1d900] [bec82498] drm_dev_register+0x15c/0x3ac [drm]
[eaa1d940] [bef77620] radeon_pci_probe+0x13c/0x178 [radeon]
[eaa1d970] [c0829080] pci_device_probe+0x100/0x238
[eaa1d9a0] [c08da164] really_probe.part.0+0x108/0x428
[eaa1d9d0] [c08da578] __driver_probe_device+0xf4/0x1ac
[eaa1d9f0] [c08da69c] driver_probe_device+0x6c/0x150
[eaa1da20] [c08db100] __driver_attach+0xec/0x200
[eaa1da50] [c08d63e8] bus_for_each_dev+0xf8/0x164
[eaa1dac0] [c08d8dec] bus_add_driver+0x274/0x31c
[eaa1db00] [c08dbee4] driver_register+0x114/0x258
[eaa1db30] [c0007b84] do_one_initcall+0xb0/0x318
[eaa1dc00] [c014eff4] do_init_module+0xfc/0x3e0
[eaa1dc30] [c0152aec] load_module+0x36d8/0x3d1c
[eaa1de60] [c01534bc] sys_finit_module+0x114/0x170
[eaa1df40] [c001f1a8] ret_from_syscall+0x0/0x2c
--- interrupt: c00 at 0xa7e17acc
NIP:  a7e17acc LR: 003d8538 CTR: a7d9dac0
REGS: eaa1df50 TRAP: 0c00   Not tainted  (5.18.0-gentoo-PMacG4)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 24222448  XER: 00000000

GPR00: 00000161 afd91980 a7f5a560 00000018 003e41a8 00000000 00000018 00000=
000=20
GPR08: 00000000 00000008 00000000 a7e8a44c a7d209ec 0080f7e4 00000000 00000=
000=20
GPR16: 009cea00 00000000 0aba9500 009cea00 00000000 afd91b3c 00968570 00000=
000=20
GPR24: 009cea00 00000007 009cf6c0 003e41a8 00020000 00000000 00404cb8 009ce=
a00=20
NIP [a7e17acc] 0xa7e17acc
LR [003d8538] 0x3d8538
--- interrupt: c00
Instruction dump:
80010024 8361000c 83c10018 83810010 7c0803a6 83a10014 83e1001c 38210020=20
4e800020 2c040000 41820260 7d032214 <9421fff0> 7c034040 41810154 3d40b000=20
---[ end trace 0000000000000000 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

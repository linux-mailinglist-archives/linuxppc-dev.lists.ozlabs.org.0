Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5333047C6FC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 19:51:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJQXv17vDz30RK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 05:51:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BK6PpHFf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BK6PpHFf; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJQX52b23z2xKJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 05:51:01 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D53C461760
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 18:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A176C36AE8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 18:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640112658;
 bh=Wv9wKA+lk2fh94lwkhHnA7jD/+u0gfXqdjzp8gY2k30=;
 h=From:To:Subject:Date:From;
 b=BK6PpHFftCAcBvWrv9Kl/bOc8cn/ktw5tkO1CaUTczsjqPbHy4UyxDabGwz6Un4i1
 HyLkG252lvnw9tO7rLcEzNaCCpg5o9qk03OjuAy2OQCJSh7Cv/93taYzowNMqqIVZH
 KviJ29bmFDpvAyEa2ltHHz+nIbscBoYTnZ+SVBO60AexF3JaKXEXyL1jXra2tktgXS
 Z/zfxwZeb+004kopkszSkK8RO2XqngRlWTYwwMjgqCp34CnL67I8bNCD2crlimiPQG
 URDo5jXlpBnlxgtvtW2C8reL+rtr5nT5FXSvOkrB7Gw88ZNDTZJ2FwdFWepRRHZgXN
 Cv1Njb7FBLKqw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 20F2B610E5; Tue, 21 Dec 2021 18:50:58 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215381] New: BUG: Unable to handle kernel data access on read
 at 0x6600cc00000004
Date: Tue, 21 Dec 2021 18:50:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215381-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215381

            Bug ID: 215381
           Summary: BUG: Unable to handle kernel data access on read at
                    0x6600cc00000004
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.15.10
          Hardware: PPC-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: No

Created attachment 300105
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300105&action=3Dedit
dmesg (kernel 5.15.10, Talos II)

Happened not during boot but shortly afterwards compiling some stuff via ss=
h.

[...]
BUG: Unable to handle kernel data access on read at 0x6600cc00000004
Faulting instruction address: 0xc0000000001398c4
Oops: Kernel access of bad area, sig: 11 [#1]
BE PAGE_SIZE=3D4K MMU=3DRadix SMP NR_CPUS=3D192 NUMA PowerNV
Modules linked in: auth_rpcgss nfsv4 dns_resolver nfs lockd grace sunrpc rf=
kill
evdev ecb xts snd_hda_codec_hdmi radeon xhci_pci snd_hda_intel ctr
snd_intel_dspcfg xhci_hcd snd_hda_codec snd_hwdep ofpart cbc snd_hda_core
drm_ttm_helper ttm snd_pcm powernv_flash i2c_algo_bit aes_generic ibmpowernv
libaes usbcore drm_kms_helper mtd at24 vmx_crypto snd_timer gf128mul opal_p=
rd
hwmon regmap_i2c snd sysimgblt syscopyarea sysfillrect fb_sys_fops usb_comm=
on
soundcore lz4 lz4_compress lz4_decompress zram zsmalloc powernv_cpufreq drm
fuse drm_panel_orientation_quirks backlight configfs
CPU: 22 PID: 55708 Comm: clang Not tainted 5.15.10-gentoo-TalosII #1
NIP:  c0000000001398c4 LR: c000000000a9b6c0 CTR: 0000000000000000
REGS: c000200009dcef10 TRAP: 0380   Not tainted  (5.15.10-gentoo-TalosII)
MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 28228244  XER: 000000ae
CFAR: c000000000a9b6bc IRQMASK: 0=20
GPR00: c000000000315d88 c000200009dcf1b0 c000000001256d00 006600cc00000000=
=20
GPR04: c00000000d966370 00003fff8dc00000 0000000000000000 0000000000000000=
=20
GPR08: 0000000000000009 ffffffffdead4ead c00c000000000000 0000000000000000=
=20
GPR12: 0000000088228244 c0002007ff7f6500 c000200009dcf710 c00020000595e660=
=20
GPR16: c0000000012a5bc0 00003fff8dc3e000 c000200005436080 00003fff8dc5e000=
=20
GPR20: 0000400000000000 0000000000000000 c0002000097de4a0 006600cc00000000=
=20
GPR24: c000000001260985 0000000000000000 c0000000012a5b28 0000000000000000=
=20
GPR28: c000200009dcf710 c0000000012a5bc0 c00000000d966370 006600cc00000000=
=20
NIP [c0000000001398c4] .do_raw_spin_lock+0x14/0x1d0
LR [c000000000a9b6c0] ._raw_spin_lock+0x10/0x30
Call Trace:
[c000200009dcf1b0] [00000000000000c8] 0xc8 (unreliable)
[c000200009dcf230] [c00000000029d9d4] .finish_fault+0x3e4/0x4f0
[c000200009dcf2a0] [c000000000315d88] .__split_huge_pmd+0xe8/0x1190
[c000200009dcf430] [c00000000029a5bc] .unmap_page_range+0x43c/0xfe0
[c000200009dcf5c0] [c00000000029b618] .unmap_vmas+0xd8/0x200
[c000200009dcf6a0] [c0000000002a8324] .unmap_region+0xc4/0x160
[c000200009dcf7c0] [c0000000002ab5fc] .__do_munmap+0x1fc/0x5f0
[c000200009dcf880] [c0000000002aba70] .__vm_munmap+0x80/0x110
[c000200009dcf940] [c0000000003ef160] .elf_map+0xa0/0x120
[c000200009dcf9d0] [c0000000003f1168] .load_elf_binary+0xbf8/0x1fa0
[c000200009dcfb40] [c00000000034ecc8] .bprm_execve+0x2a8/0x700
[c000200009dcfc10] [c00000000034fcc8] .do_execveat_common.isra.0+0x188/0x230
[c000200009dcfcd0] [c000000000350dfc] .__se_sys_execve+0x3c/0x50
[c000200009dcfd40] [c00000000002de48] .system_call_exception+0x1c8/0x530
[c000200009dcfe10] [c00000000000c068] system_call_vectored_common+0xe8/0x278
--- interrupt: 3000 at 0x3fffbd817c0c
NIP:  00003fffbd817c0c LR: 0000000000000000 CTR: 0000000000000000
REGS: c000200009dcfe80 TRAP: 3000   Not tainted  (5.15.10-gentoo-TalosII)
MSR:  900000000000f032 <SF,HV,EE,PR,FP,ME,IR,DR,RI>  CR: 42220442  XER:
00000000
IRQMASK: 0=20
GPR00: 000000000000000b 00003fffbd12dd20 00003fffbd935300 000000002cbe3700=
=20
GPR04: 000000002cc377e0 000000002cbe2cc0 0000000000000008 0000000000000001=
=20
GPR08: 0000000000000001 0000000000000000 0000000000000000 0000000000000000=
=20
GPR12: 0000000000000000 00003fffbda03810 0000000000000000 0000000000000020=
=20
GPR16: 00000000100514a0 000000000000005c 0000000000000000 00000000100348d4=
=20
GPR20: 0000000000000000 00003fffbd125000 00003fffea78ba68 0000000000000000=
=20
GPR24: 00003fffbd12de10 0000000000000000 00003fffea78b638 00003fffea78ba18=
=20
GPR28: 000000002cc182c0 00003fffea78ba68 0000000000000001 0000000000100000=
=20
NIP [00003fffbd817c0c] 0x3fffbd817c0c
LR [0000000000000000] 0x0
--- interrupt: 3000
Instruction dump:
f9430010 792907c6 6529ffff 6129ffff f9230004 4e800020 60000000 fbe1fff8=20
f821ff81 3d20dead 7c7f1b78 61294ead <81430004> 7c0a4800 408200d4 e95f0010=20
---[ end trace 063d70c8fce39c11 ]---

# inxi -bZ
System:    Host: T1000 Kernel: 5.15.10-TalosII ppc64 bits: 64 Console: tty 2
Distro: Gentoo Base System release 2.7=20
Machine:   Type: PowerPC Device System: T2P9D01 REV 1.01 details: PowerNV
T2P9D01 REV 1.01 rev: 2.2 (pvr 004e 1202)=20
CPU:       Info: 32-Core POWER9 altivec supported [MCP] speed: 2154 MHz
min/max: 2154/3800 MHz=20
Graphics:  Device-1: Advanced Micro Devices [AMD/ATI] Turks XT [Radeon HD
6670/7670] driver: radeon v: kernel=20
           Device-2: ASPEED Graphics Family driver: N/A=20
           Display: server: X.org 1.20.14 driver: radeon tty: 211x57=20
           Message: Advanced graphics data unavailable in console for root.=
=20
Network:   Device-1: Broadcom and subsidiaries NetXtreme BCM5719 Gigabit
Ethernet PCIe driver: tg3=20
           Device-2: Broadcom and subsidiaries NetXtreme BCM5719 Gigabit
Ethernet PCIe driver: tg3=20
Drives:    Local Storage: total: 447.13 GiB used: 18.79 GiB (4.2%)=20
Info:      Processes: 370 Uptime: 1h 10m Memory: 62.75 GiB used: 1.74 GiB
(2.8%) Init: systemd Shell: Bash inxi: 3.1.06=20

# lspci=20
0000:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0000:01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/A=
TI]
Turks XT [Radeon HD 6670/7670]
0000:01:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Turks HDMI
Audio [Radeon HD 6500/6600 / 6700M Series]
0001:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0001:01:00.0 Non-Volatile memory controller: Phison Electronics Corporation
Device 5008 (rev 01)
0002:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0003:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0003:01:00.0 USB controller: Texas Instruments TUSB73x0 SuperSpeed USB 3.0 =
xHCI
Host Controller (rev 02)
0004:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0004:01:00.0 Ethernet controller: Broadcom Inc. and subsidiaries NetXtreme
BCM5719 Gigabit Ethernet PCIe (rev 01)
0004:01:00.1 Ethernet controller: Broadcom Inc. and subsidiaries NetXtreme
BCM5719 Gigabit Ethernet PCIe (rev 01)
0005:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0005:01:00.0 PCI bridge: ASPEED Technology, Inc. AST1150 PCI-to-PCI Bridge =
(rev
04)
0005:02:00.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED Grap=
hics
Family (rev 41)
0030:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0031:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0032:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0033:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

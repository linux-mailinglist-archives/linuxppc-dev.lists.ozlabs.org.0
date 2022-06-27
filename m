Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F78855BC63
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 00:55:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LX32p2PxTz3cf1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 08:54:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RvQNOjfj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RvQNOjfj;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LX32568f3z3bkv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 08:54:21 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AE8FBB81BE9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 22:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74B72C34115
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 22:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656370456;
	bh=gSFE9wSsR1g8rZqGafM06/9dLgIsRZ/7D8MGGOibU1s=;
	h=From:To:Subject:Date:From;
	b=RvQNOjfjUKwdLWjJ56mX3Nplpd+82enjgYpm1uYxAHdSm/dUgYCCwejLm6xiSXA37
	 7AAKiaQe20CxxYZuluyYyb2PHgzeG9isYNQJu/x+x9dmOzTfOmfa9PZmRt6gMoiBM9
	 wVilXOZrcuEiS/KJxceBkK17MNwkVrTJSjHabKfQdTJJnWzI5iLPH/UfbGzn1QQVAc
	 BPwd3gAyyoRAhPtQcgkzzdPky3XEp19HO6WQKi64KV1drLbLne3hfXgSVjUqEGYsdj
	 ohPDUKxnUUSZ8ANDW+Cut3jwV6UnnAPaUrxRA2vVzAZpQZtzWVk8upqpgsPQ6trK2d
	 1/HsXrmNV79mw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4A783C05FD2; Mon, 27 Jun 2022 22:54:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216183] New: Kernel 5.19-rc4 boots ok with
 CONFIG_PPC_RADIX_MMU=y but fails to boot with CONFIG_PPC_HASH_MMU_NATIVE=y
Date: Mon, 27 Jun 2022 22:54:15 +0000
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
Message-ID: <bug-216183-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216183

            Bug ID: 216183
           Summary: Kernel 5.19-rc4 boots ok with CONFIG_PPC_RADIX_MMU=3Dy
                    but fails to boot with CONFIG_PPC_HASH_MMU_NATIVE=3Dy
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.19-rc4
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

Created attachment 301289
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301289&action=3Dedit
kernel dmesg (kernel 5.19-rc4, Talos II)

5.19-rc4 boots ok when
CONFIG_PPC_RADIX_MMU=3Dy
CONFIG_PPC_RADIX_MMU_DEFAULT=3Dy

is enabled in the .config but fails to boot when MMU is changed to

# CONFIG_PPC_RADIX_MMU is not set
CONFIG_PPC_HASH_MMU_NATIVE=3Dy

in the same .config.

[...]
Disabling lock debugging due to kernel taint
Oops: Machine check, sig: 7 [#1]
BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D32 NUMA PowerNV
Modules linked in: cbc aes_generic snd_hda_codec_hdmi libaes snd_hda_intel
snd_intel_dspcfg xhci_pci snd_hda_codec snd_hwdep xhci_hcd snd_hda_core
cfg80211 drm_ttm_helper ghash_generic rfkill ofpart ttm i2c_algo_bit snd_pcm
powernv_flash vmx_crypto(+) ibmpowernv at24(+) usbcore drm_display_helper m=
td
gf128mul snd_timer hwmon opal_prd regmap_i2c usb_common drm_kms_helper
sysimgblt syscopyarea snd sysfillrect fb_sys_fops soundcore zram
pkcs8_key_parser zsmalloc powernv_cpufreq drm fuse drm_panel_orientation_qu=
irks
backlight configfs
CPU: 9 PID: 0 Comm: swapper/9 Tainted: G   M              5.19.0-rc4-P9 #4
NIP:  0000000000000000 LR: 0000000000000000 CTR: 00ac408f3f6b677d
REGS: c0000007ffe7e900 TRAP: c000000000008354   Tainted: G   M=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(5.19.0-rc4-P9)
MSR:  0301010000000000 <>  CR: c0000007ffe7ed40  XER: c0003d000007e680
CFAR: 0000000000000003 IRQMASK: 3=20
GPR00: 0000000000000000 c0000007ffe7eaa0 c0000007ffe7e990 0000000000000000=
=20
GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR12: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR16: 0000000000000000 c0000007ffe7eaa0 c0000007ffe7ea30 0000000000000000=
=20
GPR20: c00000000004a3b4 0000000000000000 0000000000000000 c000000001237e00=
=20
GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR28: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
NIP [0000000000000000] 0x0
LR [0000000000000000] 0x0
Call Trace:
[c0000007ffe7eaa0] [c000000001237e00] 0xc000000001237e00 (unreliable)
Instruction dump:
XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX=20
XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX=20
---[ end trace 0000000000000000 ]---
input: HDA ATI HDMI HDMI/DP,pcm=3D3 as
/devices/pci0000:00/0000:00:00.0/0000:01:00.1/sound/card0/input0
Adding 16777212k swap on /dev/nvme0n1p4.  Priority:-2 extents:1
across:16777212k SSFS
at24 7-0050: 256 byte spd EEPROM, read-only
at24 7-0052: 256 byte spd EEPROM, read-only
at24 8-0054: 256 byte spd EEPROM, read-only
at24 8-0056: 256 byte spd EEPROM, read-only
EXT4-fs (nvme0n1p2): mounting ext2 file system using the ext4 subsystem
[drm] radeon kernel modesetting enabled.
EXT4-fs (nvme0n1p2): mounted filesystem without journal. Quota mode: disabl=
ed.
EXT4-fs (zram1): mounting ext2 file system using the ext4 subsystem
EXT4-fs (zram1): mounted filesystem without journal. Quota mode: disabled.

Oops: Machine check, sig: 7 [#2]
BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D32 NUMA PowerNV
Modules linked in: xts ecb ctr evdev cbc aes_generic snd_hda_codec_hdmi lib=
aes
snd_hda_intel snd_intel_dspcfg xhci_pci snd_hda_codec snd_hwdep radeon(+)
xhci_hcd snd_hda_core cfg80211 drm_ttm_helper ghash_generic rfkill ofpart t=
tm
i2c_algo_bit snd_pcm powernv_flash vmx_crypto ibmpowernv at24 usbcore
drm_display_helper mtd gf128mul snd_timer hwmon opal_prd regmap_i2c usb_com=
mon
drm_kms_helper sysimgblt syscopyarea snd sysfillrect fb_sys_fops soundcore =
zram
pkcs8_key_parser zsmalloc powernv_cpufreq drm fuse drm_panel_orientation_qu=
irks
backlight configfs
CPU: 1 PID: 0 Comm: swapper/1 Tainted: G   M  D           5.19.0-rc4-P9 #4
NIP:  0000000000000000 LR: 0000000000000000 CTR: 0063d2a43fc97e45
REGS: c0000007ffede900 TRAP: c000000000008354   Tainted: G   M  D=20=20=20=
=20=20=20=20=20=20=20=20
(5.19.0-rc4-P9)
MSR:  0301010000000000 <>  CR: c0000007ffeded40  XER: c0003d0000016680
CFAR: 0000000000000003 IRQMASK: 3=20
GPR00: 0000000000000000 c0000007ffedeaa0 c0000007ffede990 0000000000000000=
=20
GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR12: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR16: 0000000000000000 c0000007ffedeaa0 c0000007ffedea30 0000000000000000=
=20
GPR20: c00000000004a3b4 0000000000000000 0000000000000000 c000000001237e00=
=20
GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR28: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
NIP [0000000000000000] 0x0
LR [0000000000000000] 0x0
Call Trace:
[c0000007ffedeaa0] [c000000001237e00] 0xc000000001237e00 (unreliable)
Instruction dump:
XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX=20
XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX=20
---[ end trace 0000000000000000 ]---
Kernel panic - not syncing: Aiee, killing interrupt handler!

Oops: Machine check, sig: 7 [#3]
BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D32 NUMA PowerNV
Modules linked in: xts ecb ctr evdev cbc aes_generic snd_hda_codec_hdmi lib=
aes
snd_hda_intel snd_intel_dspcfg xhci_pci snd_hda_codec snd_hwdep radeon(+)
xhci_hcd snd_hda_core cfg80211 drm_ttm_helper ghash_generic rfkill ofpart t=
tm
i2c_algo_bit snd_pcm powernv_flash vmx_crypto ibmpowernv at24 usbcore
drm_display_helper mtd gf128mul snd_timer hwmon opal_prd regmap_i2c usb_com=
mon
drm_kms_helper sysimgblt syscopyarea snd sysfillrect fb_sys_fops soundcore =
zram
pkcs8_key_parser zsmalloc powernv_cpufreq drm fuse drm_panel_orientation_qu=
irks
backlight configfs
CPU: 0 PID: 0 Comm: swapper/0 Tainted: G   M  D           5.19.0-rc4-P9 #4
NIP:  0000000000000000 LR: 0000000000000000 CTR: 007652c6b5124d60
REGS: c0000007ffeea900 TRAP: c000000000008354   Tainted: G   M  D=20=20=20=
=20=20=20=20=20=20=20=20
(5.19.0-rc4-P9)
MSR:  0301010000000000 <>  CR: c0000007ffeead40  XER: c0003d0000009680
CFAR: 0000000000000003 IRQMASK: 3=20
GPR00: 0000000000000000 c0000007ffeeaaa0 c0000007ffeea990 0000000000000000=
=20
GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR12: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR16: 0000000000000000 c0000007ffeeaaa0 c0000007ffeeaa30 0000000000000000=
=20
GPR20: c00000000004a3b4 0000000000000000 0000000000000000 c000000001237e00=
=20
GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR28: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
NIP [0000000000000000] 0x0
LR [0000000000000000] 0x0
Call Trace:
[c0000007ffeeaaa0] [c000000001237e00] 0xc000000001237e00 (unreliable)
Instruction dump:
XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX=20
XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX=20
---[ end trace 0000000000000000 ]---


Machine is a 2 X 4-core POWER9 Talos II:
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

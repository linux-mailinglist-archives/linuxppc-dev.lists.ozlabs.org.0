Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 820C06615AB
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 15:01:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nqdz72XSbz3c9K
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 01:01:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jNti32RH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jNti32RH;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nqdy82lYSz30QD
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 01:00:32 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 17785B80B27
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 14:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBF06C433F0
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 14:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673186426;
	bh=n++TjAtzAjTjc7wpHEpD+kSgSgFnrg9YI4M7rGTwygA=;
	h=From:To:Subject:Date:From;
	b=jNti32RHgsfxw/YP7CW+3kFnzz1Q3/gJOti/Y4jMCyDEIpIl6541PNzMNYevZCV1u
	 5vIsAWMbtIcwoZz+9q3Dy8LvXgVhw89xz+HRpiVazpkLYIiZ68xDTyM/S03y5nlDLD
	 DneXk+wcrkW/7/wMvRsYdg5Y14UKjg8XAfSsV8ZBNbHUYYUUm8u5iskdfmu7ar0G0N
	 bkgMuTyO09LLEPme7StKlOJ0JtQBPbA9NQDcDFNK0RajB1XdPYZPAtVRAWXAPsYQ6e
	 8i3iNIfPQGpxjEMaGOCgL2mzoxV9/73AMgdYyGAs1kdPzDqm1AK8x965qjHAcue21A
	 O2vsujMa1Nb+g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A2AEEC43141; Sun,  8 Jan 2023 14:00:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216902] New: WARNING: CPU: 0 PID: 70 at
 kernel/locking/irqflag-debug.c:10 at kallsyms_selftest
Date: Sun, 08 Jan 2023 14:00:26 +0000
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
Message-ID: <bug-216902-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216902

            Bug ID: 216902
           Summary: WARNING: CPU: 0 PID: 70 at
                    kernel/locking/irqflag-debug.c:10 at kallsyms_selftest
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 6.2-rc2
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

Created attachment 303551
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303551&action=3Dedit
dmesg (6.2-rc2, PowerMac G5 11,2)

Get this every time at boot at running kallsyms_selftest:

[...]
kallsyms_selftest:  -------------------------------------------------------=
--
kallsyms_selftest: | nr_symbols | compressed size | original size | ratio(%=
) |
kallsyms_selftest: |-------------------------------------------------------=
--|
kallsyms_selftest: |      83106 |        942087   |      1665058  |  56.57 =
  |
kallsyms_selftest:  -------------------------------------------------------=
--
kallsyms_selftest: kallsyms_lookup_name() looked up 83106 symbols
kallsyms_selftest: The time spent on each symbol is (ns): min=3D3136, max=
=3D120960,
avg=3D17043
------------[ cut here ]------------
raw_local_irq_restore() called with IRQs enabled
WARNING: CPU: 0 PID: 70 at kernel/locking/irqflag-debug.c:10
.warn_bogus_irq_restore+0x48/0x70
Modules linked in: windfarm_cpufreq_clamp windfarm_smu_sensors
windfarm_smu_controls windfarm_pm112 nouveau windfarm_pid snd_aoa_codec_onyx
snd_aoa_fabric_layout snd_aoa windfarm_max6690_sensor firewire_ohci
windfarm_lm75_sensor windfarm_smu_sat windfarm_core sr_mod firewire_core
pmac_zilog cdrom crc_itu_t serial_core snd_aoa_i2sbus led_class drm_ttm_hel=
per
ttm snd_aoa_soundbus i2c_algo_bit drm_display_helper ohci_pci drm_kms_helper
ehci_pci snd_pcm ohci_hcd ehci_hcd snd_timer snd soundcore rack_meter usbco=
re
cfbfillrect usb_common cfbcopyarea cfbimgblt sysimgblt tg3 syscopyarea hwmon
sysfillrect cfg80211 rfkill zram zsmalloc drm fuse drm_panel_orientation_qu=
irks
backlight configfs
CPU: 0 PID: 70 Comm: kallsyms_test Tainted: G                TN
6.2.0-rc2-PMacG5 #2
Hardware name: PowerMac11,2 PPC970MP 0x440101 PowerMac
NIP:  c000000000bb9f28 LR: c000000000bb9f24 CTR: 0000000000000000
REGS: c000000003e576f0 TRAP: 0700   Tainted: G                TN=20
(6.2.0-rc2-PMacG5)
MSR:  900000000202b032 <SF,HV,VEC,EE,FP,ME,IR,DR,RI>  CR: 44000842  XER:
00000000
IRQMASK: 0=20
GPR00: 0000000000000000 c000000003e57990 c000000000f19900 0000000000000000=
=20
GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR12: 0000000000000000 c0000000017e8000 c0000000000bc380 c000000003f65880=
=20
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR24: 0000000000000000 0000000000000000 0000000000000000 00000000000144a2=
=20
GPR28: c000000000e03bc0 0000000000000000 0000000996d34700 0000000995b30d60=
=20
NIP [c000000000bb9f28] .warn_bogus_irq_restore+0x48/0x70
LR [c000000000bb9f24] .warn_bogus_irq_restore+0x44/0x70
Call Trace:
[c000000003e57990] [c000000000bb9f24] .warn_bogus_irq_restore+0x44/0x70
(unreliable)
[c000000003e57a00] [c000000000164df4]
.test_perf_kallsyms_on_each_symbol+0x90/0xfc
[c000000003e57cc0] [c00000000016456c] .test_entry+0x23c/0x260
[c000000003e57d70] [c0000000000bc498] .kthread+0x118/0x120
[c000000003e57e10] [c00000000000bd58] .ret_from_kernel_thread+0x58/0x60
--- interrupt: 0 at 0x0
NIP:  0000000000000000 LR: 0000000000000000 CTR: 0000000000000000
REGS: c000000003e57e80 TRAP: 0000   Tainted: G                TN=20
(6.2.0-rc2-PMacG5)
MSR:  0000000000000000 <>  CR: 00000000  XER: 00000000
IRQMASK: 0=20
GPR00: 0000000000000000 c000000003e58000 0000000000000000 0000000000000000=
=20
GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR12: 0000000000000000 0000000000000000 c0000000000bc380 c000000003f65880=
=20
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR28: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
NIP [0000000000000000] 0x0
LR [0000000000000000] 0x0
--- interrupt: 0
Code: 39400000 4c820020 7c0802a6 3c62ffee 39200001 3d42004b 386343e0 f80100=
10
f821ff91 992ae5af 4b4ca171 60000000 <0fe00000> 60000000 38210070 e8010010=20
---[ end trace 0000000000000000 ]---
kallsyms_selftest: kallsyms_on_each_symbol() traverse all: 18889120 ns
kallsyms_selftest: kallsyms_on_each_match_symbol() traverse all: 30464 ns
kallsyms_selftest: finish

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

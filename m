Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E6E4827C0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jan 2022 15:36:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JR4Mf1xCbz3bnP
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jan 2022 01:36:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p4MQfmQQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=145.40.68.75;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p4MQfmQQ; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JR4Ln6LN8z2xMw
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Jan 2022 01:36:01 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AC2B1B8072F
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jan 2022 14:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C678C36AEA
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jan 2022 14:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641047756;
 bh=V9hfXPfe8TtNsBxTtyeyZiMBjERUowrLxBrOW9QZiJM=;
 h=From:To:Subject:Date:From;
 b=p4MQfmQQOBlyp3WeF75m7QcaiPMHGSmrDw2wf2K964OR14Kwz8NBMus89yrjm7BoS
 N8JVkvm5g52g74nuR3KY7oNBntrrLy7XPzTa0v/hU3kd/TBV1WJNZZTBKifto/szim
 WtFLCPv1zSTnN0Ig6Gtbn/hvWXA+vS56+dGZMOLejl61UkKbgSrqkYHRypI/bnq1+j
 zSCLOmaDFIrjeJVRdK0W8/BkzRxvmnVNywc1U23rvIXeJsbowkteajr1qNRC2PbCI4
 zak9Rc1rVodkukKoweaC0HwburZsLgtQBbRjbxrN3zUqNIHO95Ksn5M01cqYVDGVtE
 WGtwF5YElKtEA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 35E93C05FCC; Sat,  1 Jan 2022 14:35:56 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215443] New: [radeon] BUG: Unable to handle kernel data access
 on read at 0xc007ffffffff9130, Oops: Kernel access of bad area, sig: 11 [#1]
Date: Sat, 01 Jan 2022 14:35:55 +0000
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
 priority component assigned_to reporter cc cf_regression attachments.created
Message-ID: <bug-215443-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215443

            Bug ID: 215443
           Summary: [radeon] BUG: Unable to handle kernel data access on
                    read at 0xc007ffffffff9130, Oops: Kernel access of bad
                    area, sig: 11 [#1]
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.16-rc7
          Hardware: PPC-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
                CC: dri-devel@lists.freedesktop.org
        Regression: No

Created attachment 300196
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300196&action=3Dedit
kernel dmesg (kernel 5.16-rc7, Talos II)

[...]
BUG: Unable to handle kernel data access on read at 0xc007ffffffff9130
Faulting instruction address: 0xc0080000076a1bb4
Oops: Kernel access of bad area, sig: 11 [#1]
BE PAGE_SIZE=3D4K MMU=3DRadix SMP NR_CPUS=3D192 DEBUG_PAGEALLOC NUMA PowerNV
Modules linked in: rfkill evdev ecb radeon(+) snd_hda_codec_hdmi xts
drm_ttm_helper ttm snd_hda_intel snd_intel_dspcfg ctr i2c_algo_bit
snd_hda_codec snd_hwdep xhci_pci cbc ofpart snd_hda_core powernv_flash
aes_generic xhci_hcd libaes mtd ibmpowernv snd_pcm vmx_crypto gf128mul opal=
_prd
hwmon snd_timer drm_kms_helper usbcore at24 regmap_i2c sysimgblt usb_common
syscopyarea snd sysfillrect fb_sys_fops soundcore lz4 lz4_compress
lz4_decompress zram zsmalloc powernv_cpufreq drm fuse
drm_panel_orientation_quirks backlight configfs
CPU: 0 PID: 281 Comm: kworker/0:3 Not tainted 5.16.0-rc7-TalosII+ #1
Workqueue: events .work_for_cpu_fn
NIP:  c0080000076a1bb4 LR: c008000008994dd8 CTR: c0080000076a1b80
REGS: c000000011ede950 TRAP: 0300   Not tainted  (5.16.0-rc7-TalosII+)
MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 84048242  XER: 00000006
CFAR: c0080000089bffe8 DAR: c007ffffffff9130 DSISR: 40000000 IRQMASK: 0=20
GPR00: c008000008994dd8 c000000011edebf0 c008000000000000 0000000000000001=
=20
GPR04: c0080000076dfe28 0000000000000038 0000000000000002 0000000000024414=
=20
GPR08: 0000000000000001 c008000000000000 c00000002f3e9878 c0080000089bffd0=
=20
GPR12: c0080000076a1b80 c0000000033e1000 c000000000132940 0000000000000000=
=20
GPR16: 0000000000000000 c00000002f406918 c00800001d9968e0 0000000000000000=
=20
GPR20: 0000000000000043 0000000000000000 0000000000000001 c00000002f406800=
=20
GPR24: 0000000000000001 c00000000efac000 c000000021a6f2c0 c00000000efac848=
=20
GPR28: c000000021a6f980 0000000000000000 0000000000000001 c0000000167a9050=
=20
NIP [c0080000076a1bb4] .drm_mode_object_get+0x34/0xc0 [drm]
LR [c008000008994dd8] .drm_crtc_helper_set_config+0x378/0xc00 [drm_kms_help=
er]
Call Trace:
[c000000011edebf0] [0000000000000898] 0x898 (unreliable)
[c000000011edec70] [c008000008994dd8] .drm_crtc_helper_set_config+0x378/0xc=
00
[drm_kms_helper]
[c000000011ededb0] [c00800001d7d29c8] .radeon_crtc_set_config+0x68/0x220
[radeon]
[c000000011edee60] [c008000007680ee0]
.__drm_mode_set_config_internal+0xc0/0x190 [drm]
[c000000011edef00] [c0080000076ba1f8]
.drm_client_modeset_commit_locked+0x178/0x270 [drm]
[c000000011edefa0] [c0080000076ba328] .drm_client_modeset_commit+0x38/0x80
[drm]
[c000000011edf020] [c0080000089bb344]
.__drm_fb_helper_restore_fbdev_mode_unlocked+0x114/0x1c0 [drm_kms_helper]
[c000000011edf0c0] [c0080000089bb484] .drm_fb_helper_set_par+0x44/0x90
[drm_kms_helper]
[c000000011edf140] [c0000000009ac4a4] .fbcon_init+0x594/0x800
[c000000011edf230] [c0000000009eecb8] .visual_init+0x108/0x1c0
[c000000011edf2d0] [c0000000009f25f4] .do_bind_con_driver.isra.0+0x2c4/0x550
[c000000011edf3a0] [c0000000009f2a50] .do_take_over_console+0x1d0/0x300
[c000000011edf480] [c0000000009a8ac4] .do_fbcon_takeover+0xb4/0x1b0
[c000000011edf530] [c00000000099fd9c] .register_framebuffer+0x2ac/0x480
[c000000011edf630] [c0080000089babd4]
.__drm_fb_helper_initial_config_and_unlock+0x444/0x830 [drm_kms_helper]
[c000000011edf740] [c00800001d7e0278] .radeon_fbdev_init+0xf8/0x180 [radeon]
[c000000011edf7d0] [c00800001d7d6560] .radeon_modeset_init+0x8b0/0xe20 [rad=
eon]
[c000000011edf8b0] [c00800001d79cce4] .radeon_driver_load_kms+0xc4/0x230
[radeon]
[c000000011edf950] [c00800000767c308] .drm_dev_register+0x128/0x2d0 [drm]
[c000000011edf9f0] [c00800001d798644] .radeon_pci_probe+0x124/0x1a0 [radeon]
[c000000011edfa80] [c0000000009732e0] .local_pci_probe+0x60/0x100
[c000000011edfb10] [c00000000011e260] .work_for_cpu_fn+0x30/0x50
[c000000011edfb90] [c0000000001240b0] .process_one_work+0x2f0/0x830
[c000000011edfc70] [c000000000124840] .worker_thread+0x250/0x4f0
[c000000011edfd50] [c000000000132b00] .kthread+0x1c0/0x1d0
[c000000011edfe10] [c00000000000cdf0] .ret_from_kernel_thread+0x58/0x60
Instruction dump:
2c290000 4d820020 7c0802a6 fbe1fff8 3be30010 f8010010 f821ff81 80c30010=20
3d220000 80a30000 78c60020 38600001 <e8899130> 48008429 60000000 39200001=20
---[ end trace 1bbd44c839d96aca ]---

BUG: workqueue lockup - pool cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 stuck f=
or 39s!
Showing busy workqueues and worker pools:
workqueue events: flags=3D0x0
  pwq 0: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D7/256 refcnt=3D9
    in-flight: 1802201963:.work_for_cpu_fn BAR(409)
    pending: .dbs_work_handler, .vmstat_shepherd, .once_deferred,
.once_deferred, .once_deferred, .kfree_rcu_monitor
workqueue events_power_efficient: flags=3D0x80
  pwq 0: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
    pending: .fb_flashcursor
workqueue mm_percpu_wq: flags=3D0x8
  pwq 0: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
    pending: .vmstat_update
workqueue pm: flags=3D0x4
  pwq 0: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=3D2
    pending: .pm_runtime_work
[...]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

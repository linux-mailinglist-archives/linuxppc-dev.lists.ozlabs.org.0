Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 097943C895F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jul 2021 19:08:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQ3r66rxbz3bY8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 03:08:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mHBOIiM/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mHBOIiM/; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQ3qb4JSWz2yxF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jul 2021 03:08:27 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id B9CE260698
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jul 2021 17:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626282503;
 bh=jX1U2B545KHfnydhR4Ns/OqPpC7K0a24UUOBZVwkinI=;
 h=From:To:Subject:Date:From;
 b=mHBOIiM/T81of/mEIRoW+3BYmHCkvvsulClmXkbLuv/nwt2V/+/WeNSQjcBkTFUlm
 3aXh1lQgvuKqfdhto9Qz9T1k8GZCKCDKAXFk1PFtqifLdEaB4z3OmTJ38KzyqH6sIw
 or3v1YEMSo33uJY1gpwgfSvgIOy250wCZECpuCKAyeNLoGyKgN0WSzzfTeGgYiHlRi
 J5FcmP4On4vzsX1FQy+6yCP3wyKa8qnfk3Ak8gMZtSeijGFbIn+NKaZZVCZdG1GPqb
 mL3hveOEtGS1kZP5kd/1t35S44eRD7Q5ZQCBwlIO9K4cNuBSDLupVxhLhqPGsk5cra
 qFAD+syv4Sekw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A12E161287; Wed, 14 Jul 2021 17:08:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213733] New: Kernel NULL pointer dereference on read (Oops:
 Kernel access of bad area, sig: 7 [#1]) at systemctl poweroff
Date: Wed, 14 Jul 2021 17:08:23 +0000
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
Message-ID: <bug-213733-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213733

            Bug ID: 213733
           Summary: Kernel NULL pointer dereference on read (Oops: Kernel
                    access of bad area, sig: 7 [#1]) at systemctl poweroff
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.14-rc1
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

Created attachment 297857
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297857&action=3Dedit
dmesg (kernel 5.14-rc1, Talos II)

My Talos II run fine for a few hours building stuff but at system shutdown
(systemctl poweroff) I got this:

[...]
BUG: Kernel NULL pointer dereference on read at 0x00000000
Faulting instruction address: 0xc00000000034396c
Oops: Kernel access of bad area, sig: 7 [#1]
BE PAGE_SIZE=3D4K MMU=3DRadix SMP NR_CPUS=3D192 DEBUG_PAGEALLOC NUMA PowerNV
Modules linked in: auth_rpcgss nfsv4 dns_resolver nfs lockd grace sunrpc rf=
kill
ecb xts ctr cbc aes_generic libaes ibmpowernv evdev radeon snd_hda_codec_hd=
mi
snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep ghash_generic
snd_hda_core drm_ttm_helper xhci_pci ofpart snd_pcm vmx_crypto ttm gf128mul
powernv_flash xhci_hcd mtd i2c_algo_bit snd_timer opal_prd hwmon drm_kms_he=
lper
usbcore cfbfillrect cfbcopyarea cfbimgblt sysimgblt snd syscopyarea sysfill=
rect
fb_sys_fops usb_common soundcore at24 regmap_i2c zram zsmalloc powernv_cpuf=
req
drm fuse drm_panel_orientation_quirks backlight configfs
CPU: 26 PID: 345930 Comm: kworker/u66:5 Not tainted 5.14.0-rc1-TalosII #2
Workqueue: events_unbound .cleanup_offline_cgwbs_workfn
NIP:  c00000000034396c LR: c000000000343850 CTR: 0000000000000000
REGS: c00020016bf9f7d0 TRAP: 0300   Not tainted  (5.14.0-rc1-TalosII)
MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 44002228  XER: 00000004
CFAR: c000000000343864 DAR: 0000000000000000 DSISR: 00080000 IRQMASK: 1=20
GPR00: c000000000343848 c00020016bf9fa70 c0000000012d6100 0000000000000001=
=20
GPR04: c000200183630ac0 00000000ffffffff 0000000090163e29 0040900000000000=
=20
GPR08: 0000000000000000 0000000000000003 0000000000000000 c00000000168c488=
=20
GPR12: 0000000044002228 c0002007ff7f4c00 c000000000115e20 c000200002950340=
=20
GPR16: 0000000000000000 0000000000000001 c00000000112ef30 c000000000ea2db8=
=20
GPR20: c000000000ea2d68 c000000000ea2d98 0000000000000001 c0000000011c6352=
=20
GPR24: 0000000000000001 c000200183630080 c00000000114cf28 c00000000114ced8=
=20
GPR28: c00020016bf9faf8 c00000000114cde8 c00020000229a000 c00020000229a510=
=20
NIP [c00000000034396c] .cleanup_offline_cgwbs_workfn+0x3ac/0x410
LR [c000000000343850] .cleanup_offline_cgwbs_workfn+0x290/0x410
Call Trace:
[c00020016bf9fa70] [c000000000343848] .cleanup_offline_cgwbs_workfn+0x288/0=
x410
(unreliable)
[c00020016bf9fb90] [c00000000010871c] .process_one_work+0x2dc/0x7d0
[c00020016bf9fc70] [c000000000108ca8] .worker_thread+0x98/0x500
[c00020016bf9fd50] [c000000000115fa8] .kthread+0x188/0x190
[c00020016bf9fe10] [c00000000000cef8] .ret_from_kernel_thread+0x58/0x60
Instruction dump:
7e85a378 388002b0 7ea3ab78 9ad70002 4be3ff21 60000000 e93fff08 712a0003=20
4182ff0c e95fff10 39000000 7c0004ac <7d2050a8> 7c294000 41820018 7d384a14=20
---[ end trace d475291d44c4d324 ]---

note: kworker/u66:5[345930] exited with preempt_count 2
watchdog: CPU 16 self-detected hard LOCKUP @ .do_raw_spin_lock+0x90/0x1d0
watchdog: CPU 16 TB:5873709870913, last heartbeat TB:5867694041597 (11749ms
ago)
Modules linked in: auth_rpcgss nfsv4 dns_resolver nfs lockd grace sunrpc rf=
kill
ecb xts ctr cbc aes_generic libaes ibmpowernv evdev radeon snd_hda_codec_hd=
mi
snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep ghash_generic
snd_hda_core drm_ttm_helper xhci_pci ofpart snd_pcm vmx_crypto ttm gf128mul
powernv_flash xhci_hcd mtd i2c_algo_bit snd_timer opal_prd hwmon drm_kms_he=
lper
usbcore cfbfillrect cfbcopyarea cfbimgblt sysimgblt snd syscopyarea sysfill=
rect
fb_sys_fops usb_common soundcore at24 regmap_i2c zram zsmalloc powernv_cpuf=
req
drm fuse drm_panel_orientation_quirks backlight configfs
irq event stamp: 3697758
hardirqs last  enabled at (3697757): [<c0000000003d8d84>]
.__slab_free+0x3b4/0x5f0
hardirqs last disabled at (3697758): [<c000000000c7e228>]
._raw_spin_lock_irq+0x88/0xa0
softirqs last  enabled at (3697726): [<c000000000342d1c>]
.wb_shutdown+0x5c/0x140
softirqs last disabled at (3697724): [<c000000000342ce0>]
.wb_shutdown+0x20/0x140
CPU: 16 PID: 292187 Comm: kworker/16:0 Tainted: G      D=20=20=20=20=20=20=
=20=20=20=20
5.14.0-rc1-TalosII #2
Workqueue: cgwb_release .cgwb_release_workfn
NIP:  c000000000185e90 LR: c000000000c7e204 CTR: 0000000000000000
REGS: c0002007ff667d60 TRAP: 0900   Tainted: G      D=20=20=20=20=20=20=20=
=20=20=20=20
(5.14.0-rc1-TalosII)
MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 44002228  XER: 20040000
CFAR: c000000000185e9c IRQMASK: 1=20
GPR00: c000000000c7e1f8 c0002000e15cf9f0 c0000000012d6100 c00000000114ced8=
=20
GPR04: c0002000067b8a98 00000000ffffffff 00000000d7d91060 0e98300000000000=
=20
GPR08: ffffffff62ff980e 000000008000001a 0000000080000010 c00000000168c488=
=20
GPR12: 0000000044002222 c0002007ff7ffc00 c000000000115e20 c000200002950640=
=20
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR20: 0000000000000000 0000000000000000 c00000000133fa08 c0000000010f0840=
=20
GPR24: c0002000022d52d4 0000000000000000 c0000000012e8ce0 0000000000000000=
=20
GPR28: c00020000229a000 0000000000000001 c00020000229a520 c00000000114ced8=
=20
NIP [c000000000185e90] .do_raw_spin_lock+0x90/0x1d0
LR [c000000000c7e204] ._raw_spin_lock_irq+0x64/0xa0
Call Trace:
[c0002000e15cf9f0] [c000000000c7d994] ._raw_spin_unlock_irqrestore+0x84/0xd0
(unreliable)
[c0002000e15cfa70] [c000000000c7e1f8] ._raw_spin_lock_irq+0x58/0xa0
[c0002000e15cfb00] [c000000000344c14] .cgwb_release_workfn+0xd4/0x200
[c0002000e15cfb90] [c00000000010871c] .process_one_work+0x2dc/0x7d0
[c0002000e15cfc70] [c000000000108ca8] .worker_thread+0x98/0x500
[c0002000e15cfd50] [c000000000115fa8] .kthread+0x188/0x190
[c0002000e15cfe10] [c00000000000cef8] .ret_from_kernel_thread+0x58/0x60
Instruction dump:
40820030 a14d0378 a0ed0002 38210080 e90d0128 394a0001 b14d0378 90ff0008=20
f91f0010 ebe1fff8 4e800020 60000000 <7c210b78> 813f0000 2c290000 4082fff4=20
Kernel panic - not syncing: Hard LOCKUP
watchdog: CPU 28 self-detected hard LOCKUP @ .do_raw_spin_lock+0x90/0x1d0
watchdog: CPU 28 TB:5873733764122, last heartbeat TB:5867705991531 (11772ms
ago)
Modules linked in: auth_rpcgss nfsv4 dns_resolver nfs lockd grace sunrpc rf=
kill
ecb xts ctr cbc aes_generic libaes ibmpowernv evdev radeon snd_hda_codec_hd=
mi
snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep ghash_generic
snd_hda_core drm_ttm_helper xhci_pci ofpart snd_pcm vmx_crypto ttm gf128mul
powernv_flash xhci_hcd mtd i2c_algo_bit snd_timer opal_prd hwmon drm_kms_he=
lper
usbcore cfbfillrect cfbcopyarea cfbimgblt sysimgblt snd syscopyarea sysfill=
rect
fb_sys_fops usb_common soundcore at24 regmap_i2c zram zsmalloc powernv_cpuf=
req
drm fuse drm_panel_orientation_quirks backlight configfs
irq event stamp: 0
hardirqs last  enabled at (0): [<0000000000000000>] 0x0
hardirqs last disabled at (0): [<c0000000000ce3c4>] .copy_process+0x1134/0x=
3fd0
softirqs last  enabled at (0): [<c0000000000ce3c4>] .copy_process+0x1134/0x=
3fd0
softirqs last disabled at (0): [<0000000000000000>] 0x0
CPU: 28 PID: 425922 Comm: systemd-update- Tainted: G      D=20=20=20=20=20=
=20=20=20=20=20
5.14.0-rc1-TalosII #2
NIP:  c000000000185e90 LR: c000000000c7e3f8 CTR: 0000000000000000
REGS: c0002007ff5d7d60 TRAP: 0900   Tainted: G      D=20=20=20=20=20=20=20=
=20=20=20=20
(5.14.0-rc1-TalosII)
MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 44002482  XER: 2004008c
CFAR: c000000000185e9c IRQMASK: 1=20
GPR00: c000000000c7e3ec c00020006d5ef610 c0000000012d6100 c00000000114ced8=
=20
GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000001=
=20
GPR08: 0000000000000000 000000008000001a 000000008000001c fffffffffffffffd=
=20
GPR12: 0000000024002482 c0002007ff7f4400 0000000000000000 0000000000000000=
=20
GPR16: 0000000000000000 0000000000000180 00000000003e0100 c000000010f78000=
=20
GPR20: c00020000265c380 0000000000000000 c0000000020a37b8 0000000000000000=
=20
GPR24: c000200002ba15d8 c00000000114ced8 0000000000000cc0 c000200002ba1000=
=20
GPR28: 0000000000000000 c00020000265c380 0000000000000000 c00000000114ced8=
=20
NIP [c000000000185e90] .do_raw_spin_lock+0x90/0x1d0
LR [c000000000c7e3f8] ._raw_spin_lock_irqsave+0x68/0xb0
Call Trace:
[c00020006d5ef610] [c00000000112ef30] rcu_lock_map+0x0/0x28 (unreliable)
[c00020006d5ef690] [c000000000c7e3ec] ._raw_spin_lock_irqsave+0x5c/0xb0
[c00020006d5ef720] [c000000000344e2c] .wb_get_create+0xec/0x8d0
[c00020006d5ef820] [c00000000031848c]
.balance_dirty_pages_ratelimited+0x2ec/0x880
[c00020006d5ef8e0] [c00000000064c798] .btrfs_buffered_write+0x548/0x740
[c00020006d5efa40] [c00000000064cb9c] .btrfs_file_write_iter+0x20c/0x4f0
[c00020006d5efb10] [c000000000419254] .new_sync_write+0x124/0x1c0
[c00020006d5efc00] [c00000000041b7e4] .vfs_write+0x1c4/0x230
[c00020006d5efca0] [c00000000041ba04] .ksys_write+0x74/0x130
[c00020006d5efd40] [c000000000033ea0] .system_call_exception+0x1c0/0x420
[c00020006d5efe10] [c00000000000c070] system_call_vectored_common+0xf0/0x280
--- interrupt: 3000 at 0x3fff9ea5a73c
NIP:  00003fff9ea5a73c LR: 0000000000000000 CTR: 0000000000000000
REGS: c00020006d5efe80 TRAP: 3000   Tainted: G      D=20=20=20=20=20=20=20=
=20=20=20=20
(5.14.0-rc1-TalosII)
MSR:  900000000280f032 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI>  CR: 44000482  =
XER:
00000000
IRQMASK: 0=20
GPR00: 0000000000000004 00003fffedcba9a0 00003fff9eb44300 0000000000000005=
=20
GPR04: 00003fffedcbac68 0000000000000180 00003fffedcba990 0000000000000002=
=20
GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR12: 0000000000000000 00003fff9ef78810 00003ffff543cda8 0000000000000000=
=20
GPR16: 0000000000000000 0000000000000000 00003ffff543ca00 00000001525b4260=
=20
GPR20: 00003ffff543ca18 0000000000000001 0000000000000000 0000000000000001=
=20
GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000002=
=20
GPR28: 0000000000000000 00003fffedcbac68 00000000003e0100 0000000000000005=
=20
NIP [00003fff9ea5a73c] 0x3fff9ea5a73c
LR [0000000000000000] 0x0
--- interrupt: 3000
Instruction dump:
40820030 a14d0378 a0ed0002 38210080 e90d0128 394a0001 b14d0378 90ff0008=20
f91f0010 ebe1fff8 4e800020 60000000 <7c210b78> 813f0000 2c290000 4082fff4

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

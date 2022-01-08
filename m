Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E57488051
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jan 2022 02:08:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JW25D69KMz3bV0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jan 2022 12:08:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eWPKI5o4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=145.40.68.75;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eWPKI5o4; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JW24Q2N5Tz2xDY
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jan 2022 12:07:18 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9C84AB8276E
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jan 2022 01:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6184DC36AEB
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jan 2022 01:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641604032;
 bh=FrH/lglAQlAQNq23NerfB7Db4hyAwL7g1t+xRmgAqy4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=eWPKI5o49zObucxqIUXmd7n6Hrbnsxt79QAIR4dVEgTAC4WDUPmvgF0hVncGh0WaM
 Nj/5GQmwp5UQj4jIK3fdf3ZK0Z+F4u4Qu6G5K6XB9yOaKUsyBnB90J5OgmDwKOQGJN
 Lqo9vYpwMLJHCXESOeQamNeG/2uMtKRSZ3c6mZdiWhcO6DRa/j7zN9DZzzwM6ojTOc
 429WabeX4AtQl58KwQaaiIR2Bn4BQu+nDrSi/qPgfNlzxRh10r6IWQ+jQrVbQE/Gjj
 gRYVlnvi5wUzNsb1kk4sqTPRAymS3avoHN2/+vZ/lgqub14YtqHzwDIwIzu9seNoG5
 IG1Df1I13o8lA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 42AD0C05FE1; Sat,  8 Jan 2022 01:07:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] pagealloc: memory corruption at building glibc-2.33 and
 running its' testsuite
Date: Sat, 08 Jan 2022 01:07:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215389-206035-r2YnPVvsm0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215389-206035@https.bugzilla.kernel.org/>
References: <bug-215389-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215389

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
I was able to easily reproduce this on 5.15.13, however not on 5.16-rc8.

But on 5.16-rc8 I got this the 3rd time I ran the glibc testsuite:

[...]
watchdog: BUG: soft lockup - CPU#1 stuck for 26s! [kworker/u4:7:32566]
Modules linked in: auth_rpcgss nfsv4 dns_resolver nfs lockd grace sunrpc
ghash_generic gf128mul gcm ccm algif_aead des_generic libdes ctr cbc ecb
algif_skcipher aes_generic libaes cmac sha512_generic sha1_generic sha1_pow=
erpc
md5 md5_ppc md4 b43legacy mac80211 libarc4 snd_aoa_codec_tas
snd_aoa_fabric_layout snd_aoa cfg80211 rfkill evdev mac_hid therm_windtunnel
firewire_ohci firewire_core crc_itu_t sr_mod cdrom snd_aoa_i2sbus
snd_aoa_soundbus snd_pcm snd_timer snd ohci_pci soundcore radeon ohci_hcd
ehci_pci ehci_hcd hwmon i2c_algo_bit drm_ttm_helper ttm ssb drm_kms_helper
pcmcia pcmcia_core usbcore 8250_pci syscopyarea sysfillrect sysimgblt
usb_common 8250 8250_base serial_mctrl_gpio fb_sys_fops pkcs8_key_parser fu=
se
drm drm_panel_orientation_quirks configfs
CPU: 1 PID: 32566 Comm: kworker/u4:7 Not tainted 5.16.0-rc8-PowerMacG4 #1
Workqueue: zswap1 compact_page_work
NIP:  c0078730 LR: c0078724 CTR: 00000000
REGS: f698dd40 TRAP: 0900   Not tainted  (5.16.0-rc8-PowerMacG4)
MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 44008242  XER: 20000000

GPR00: c01856c8 f698de00 ca20b540 00000001 d4c73ffc 00000000 de0bd0bc aaaaa=
aaa=20
GPR08: aaaaaaaa 00000000 ffffffff 00000004 84002242 00000000 c00553fc 00000=
001=20
GPR16: 00000002 d4c73fc0 c0980000 002ec02c 00000040 d4c7300c d4c7302e c19c4=
bc0=20
GPR24: c19c4bc0 c0185d74 ef0d0040 d4c73008 d4c74a4c 0000007f de0bd000 d4c74=
a54=20
NIP [c0078730] arch_write_lock+0x28/0x3c
LR [c0078724] arch_write_lock+0x1c/0x3c
Call Trace:
[f698de00] [c0185d74] release_z3fold_page_locked+0x0/0x44 (unreliable)
[f698de20] [c01856c8] do_compact_page+0x334/0x508
[f698de80] [c004f354] process_one_work+0x1d4/0x288
[f698dec0] [c004f814] worker_thread+0x1b8/0x260
[f698df00] [c0055514] kthread+0x118/0x11c
[f698df30] [c0016268] ret_from_kernel_thread+0x5c/0x64
Instruction dump:
39610020 4bfa7668 9421ffe0 7c0802a6 90010024 93e1001c 7c7f1b78 7fe3fb78=20
4bffff0d 2c030000 41a20014 813f0000 <2c090000> 4182ffe8 4bfffff4 39610020=20
Kernel panic - not syncing: softlockup: hung tasks
CPU: 1 PID: 32566 Comm: kworker/u4:7 Tainted: G             L=20=20=20
5.16.0-rc8-PowerMacG4 #1
Workqueue: zswap1 compact_page_work
Call Trace:
[f698dbb0] [c03e7f04] dump_stack_lvl+0x60/0x80 (unreliable)
[f698dbd0] [c0037734] panic+0x128/0x30c
[f698dc30] [c00c6334] watchdog_nmi_enable+0x0/0x10
[f698dc70] [c0097fc8] __hrtimer_run_queues+0xf0/0x154
[f698dcb0] [c0098b7c] hrtimer_interrupt+0xf8/0x25c
[f698dcf0] [c000d70c] timer_interrupt+0x20c/0x294
[f698dd30] [c0004a50] Decrementer_virt+0x100/0x104
--- interrupt: 900 at arch_write_lock+0x28/0x3c
NIP:  c0078730 LR: c0078724 CTR: 00000000
REGS: f698dd40 TRAP: 0900   Tainted: G             L=20=20=20=20
(5.16.0-rc8-PowerMacG4)
MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 44008242  XER: 20000000

GPR00: c01856c8 f698de00 ca20b540 00000001 d4c73ffc 00000000 de0bd0bc aaaaa=
aaa=20
GPR08: aaaaaaaa 00000000 ffffffff 00000004 84002242 00000000 c00553fc 00000=
001=20
GPR16: 00000002 d4c73fc0 c0980000 002ec02c 00000040 d4c7300c d4c7302e c19c4=
bc0=20
GPR24: c19c4bc0 c0185d74 ef0d0040 d4c73008 d4c74a4c 0000007f de0bd000 d4c74=
a54=20
NIP [c0078730] arch_write_lock+0x28/0x3c
LR [c0078724] arch_write_lock+0x1c/0x3c
--- interrupt: 900
[f698de00] [c0185d74] release_z3fold_page_locked+0x0/0x44 (unreliable)
[f698de20] [c01856c8] do_compact_page+0x334/0x508
[f698de80] [c004f354] process_one_work+0x1d4/0x288
[f698dec0] [c004f814] worker_thread+0x1b8/0x260
[f698df00] [c0055514] kthread+0x118/0x11c
[f698df30] [c0016268] ret_from_kernel_thread+0x5c/0x64
Rebooting in 40 seconds..


Which is interesting because on bug #213837 my not yet finished bisect is a=
lso
giving hints z3fold may be the problem...

I'll check out next whether the issue is reproduceable on 5.15.x when I use
zbud or zmalloc for zswap instead of z3fold.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

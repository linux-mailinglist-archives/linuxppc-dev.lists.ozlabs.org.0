Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7134F2219
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 06:37:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KXZd606CZz2ywF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 14:37:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lhB7hyRX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lhB7hyRX; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KXZcM2Kwrz2xfN
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Apr 2022 14:37:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DF6DB6143A
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Apr 2022 04:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B77AC340F0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Apr 2022 04:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649133423;
 bh=SLsKtQeZsqWCNILaKwlu2uQkdcYGm77RsEFY5vB2aYs=;
 h=From:To:Subject:Date:From;
 b=lhB7hyRXW4C9r1fOgAoouHKBE5HWtn4l3U63LEeJMWY/ZR5EDFkOICSBD21UzFnwl
 M+ltJX40exH2meUjkvAJkVaNmugvCQ1pexwple6gOAQPOBLlcLO8+1jjBt9EBowmU+
 LEj7xgoEcxBe9VayCYrgEB3/38YIP51mZ3N21Pkd/e4bKeUhynFjwuk81RAXPSnhrq
 vuDbEOknzt63hpW68hM3j8UpwbPo0atKyKf9Bh1iWzRx4aaJIc6fZvW/NMOy+IBth+
 cuSiFHlIMkcCvxwn5+CtfUSvAytkgP+A7X0zglTSt+h2ibwx0VmI2IDkGNg0o8b/m0
 0zoUZ9qi0+oUQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 28D09C05FD2; Tue,  5 Apr 2022 04:37:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215803] New: ppc64le(P9): BUG: Kernel NULL pointer dereference
 on read at 0x00000060 NIP:
 do_remove_conflicting_framebuffers+0x184/0x1d0
Date: Tue, 05 Apr 2022 04:37:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: zlang@redhat.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215803-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215803

            Bug ID: 215803
           Summary: ppc64le(P9):  BUG: Kernel NULL pointer dereference on
                    read at 0x00000060  NIP:
                    do_remove_conflicting_framebuffers+0x184/0x1d0
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.18-rc1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: zlang@redhat.com
        Regression: No

When I test latest linux kernel, it panic[1] directly when I  just tried to
boot it on ppc64le. I hit it several times on different ppc64le machines, s=
ame
call trace. Due to I only hit this panic on ppc64le, so I report this bug to
ppc64 to get more review.

The linux kernel HEAD is (nearly 5.18-rc1):

commit be2d3ecedd9911fbfd7e55cc9ceac5f8b79ae4cf
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Apr 2 12:57:17 2022 -0700

    Merge tag 'perf-tools-for-v5.18-2022-04-02' of
git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux


[1]
[   18.785170] RPC: Registered named UNIX socket transport module.=20
[   18.785214] RPC: Registered udp transport module.=20
[   18.785235] RPC: Registered tcp transport module.=20
[   18.785256] RPC: Registered tcp NFSv4.1 backchannel transport module.=20
[=20=20=20=20=20=20
  OK=20=20=20=20=20
] Mounted=20=20=20=20=20=20=20=20=20
RPC Pipe File System=20=20=20
.=20
[=20=20=20=20=20=20
  OK=20=20=20=20=20
] Reached target=20=20=20=20=20=20=20=20=20
rpc_pipefs.target=20=20=20
.=20
[   18.830598] fb0: switching to ast from OFfb vga=20
[   18.830646] BUG: Kernel NULL pointer dereference on read at 0x00000060=20
[   18.830669] Faulting instruction address: 0xc0000000009fd974=20
[   18.830692] Oops: Kernel access of bad area, sig: 7 [#1]=20
[   18.830712] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA Power=
NV=20
[   18.830734] Modules linked in: ast(+) i2c_algo_bit sunrpc drm_vram_helper
drm_ttm_helper ttm drm_kms_helper fb_sys_fops syscopyarea sysfillrect ofpart
sysimgblt ses enclosure powernv_flash ipmi_powernv at24 ipmi_devintf ext4
opal_prd mtd scsi_transport_sas ibmpowernv regmap_i2c ipmi_msghandler mbcac=
he
jbd2 drm fuse drm_panel_orientation_quirks xfs libcrc32c sd_mod t10_pi
crc64_rocksoft_generic crc64_rocksoft crc64 sg i40e vmx_crypto aacraid=20
[   18.830875] CPU: 0 PID: 963 Comm: kworker/0:2 Not tainted 5.17.0+ #1=20
[   18.830906] Workqueue: events work_for_cpu_fn=20
[   18.830930] NIP:  c0000000009fd974 LR: c0000000009fd96c CTR:
0000000000000000=20
[   18.830961] REGS: c0000001156db740 TRAP: 0300   Not tainted  (5.17.0+)=20
[   18.830981] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 480282=
22=20
XER: 00000000=20
[   18.831022] CFAR: c00000000022a9ec DAR: 0000000000000060 DSISR: 00080000
IRQMASK: 0=20=20
[   18.831022] GPR00: c0000000009fd96c c0000001156db9e0 c000000002d06200
0000000000000023=20=20
[   18.831022] GPR04: 0000000000000000 c0000001156db730 c0000001156db728
0000000000000000=20=20
[   18.831022] GPR08: 0000000000000027 c000000002be6200 c000000115751000
0000000000000001=20=20
[   18.831022] GPR12: 0000001ff1900000 c000000005120000 c000000000194608
c00020001119b000=20=20
[   18.831022] GPR16: 0000000000000000 0000000000000000 0000000000000000
0000000000000000=20=20
[   18.831022] GPR20: 0000000000000000 0000000000000000 c00000000144c560
c00000000144c588=20=20
[   18.831022] GPR24: 0000000000000001 00000000000a0000 c0080000166c1200
c00000010f0dbf60=20=20
[   18.831022] GPR28: c000000002d65038 c00020001ecc0380 0000000000000000
c000000002d64f40=20=20
[   18.831234] NIP [c0000000009fd974]
do_remove_conflicting_framebuffers+0x184/0x1d0=20
[   18.831267] LR [c0000000009fd96c]
do_remove_conflicting_framebuffers+0x17c/0x1d0=20
[   18.831299] Call Trace:=20
[   18.831314] [c0000001156db9e0] [c0000000009fd96c]
do_remove_conflicting_framebuffers+0x17c/0x1d0 (unreliable)=20
[   18.831351] [c0000001156dbab0] [c0000000009fdf34]
remove_conflicting_framebuffers+0x64/0x160=20
[   18.831385] [c0000001156dbb00] [c008000014ed05a8]
drm_aperture_remove_conflicting_framebuffers+0x80/0xf0 [drm]=20
[   18.831439] [c0000001156dbb50] [c0080000166b0238] ast_pci_probe+0x60/0x1=
30
[ast]=20
[   18.831474] [c0000001156dbb90] [c0000000009b39c8] local_pci_probe+0x68/0=
x110=20
[   18.831508] [c0000001156dbc10] [c00000000017f038] work_for_cpu_fn+0x38/0=
x60=20
[   18.831540] [c0000001156dbc40] [c000000000185608]
process_one_work+0x348/0x850=20
[   18.831574] [c0000001156dbd30] [c000000000185d70] worker_thread+0x260/0x=
500=20
[   18.831605] [c0000001156dbdc0] [c000000000194748] kthread+0x148/0x150=20
[   18.831627] [c0000001156dbe10] [c00000000000cbf4]
ret_from_kernel_thread+0x5c/0x64=20
[   18.831661] Instruction dump:=20
[   18.831679] 7d710120 7d708120 4e800020 e8df0000 7fc407b4 7f45d378 7ec3b3=
78
f8810068=20=20
[   18.831716] 38c601f0 4b82d03d 60000000 3d22ffee <e9550060> 3929ee90 e881=
0068
7c2a4800=20=20
[   18.831755] ---[ end trace 0000000000000000 ]---=20
[   18.958634]=20=20
[   18.958701] kworker/0:2 (963) used greatest stack depth: 7056 bytes left=
=20
[=20=20=20=20=20=20
  OK=20=20=20=20=20
] Started=20=20=20=20=20=20=20=20=20
Security Auditing Service=20=20=20
.=20
         Starting=20=20=20=20=20=20=20=20=20
Record System Boot/Shutdown in UTMP

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

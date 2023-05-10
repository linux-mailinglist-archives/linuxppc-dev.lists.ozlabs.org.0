Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0EE6FDEB2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 15:37:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGbgB3MdYz3fY9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 23:37:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U+M1RC0G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U+M1RC0G;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGbfK48Kfz3cj8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 23:36:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D36996130A
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 13:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47A77C4339B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 13:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683725798;
	bh=H5c9lSFYvTWxvEoRrB3thxE/C6SUNADpr/c3mKfneW8=;
	h=From:To:Subject:Date:From;
	b=U+M1RC0Gr5Rz28xrmmmA9PyEHCdy0e/N1sidBiTiRSfTRFnbhjNqyqIqpjpaRIn6+
	 7ApkOLN21zT/kCHAWEMgvvgd4HWs3FjU+rk8QZblz21ZWh+4JPIk60dlXyI4u25VOv
	 5FAP4GjB+sK3+UjDwsE16QkpyLxyY4RN6tyL070B/VOw829gmKBZslfsHggEQbcTB6
	 X3isZ/cvyHQKF3HawnVeAAd5sN0GFIGdOeQIipp3h4ESyMrSvtBYn39q0gPl//qemc
	 aCSztAdNtMf13OxyP9MjS2cGndSBb5tEbIZdeYgXyfFXOlmcoYTgaxcOFxb3K2I/W7
	 u+ah2O4hq2Jfg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2CFF1C43142; Wed, 10 May 2023 13:36:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 217427] New: Linux 6.3.1 + AMD RX 570 on ppc64le 4K: Kernel
 attempted to read user page (1128) - exploit attempt? (uid: 0)
Date: Wed, 10 May 2023 13:36:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: darkbasic@linuxsystems.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217427-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217427

            Bug ID: 217427
           Summary: Linux 6.3.1 + AMD RX 570 on ppc64le 4K: Kernel
                    attempted to read user page (1128) - exploit attempt?
                    (uid: 0)
           Product: Platform Specific/Hardware
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: darkbasic@linuxsystems.it
        Regression: No

I'm using Gentoo Linux on a Raptor CS Talos 2 ppc64le, GPU is an AMD RX 570=
. So
far the past dozen of kernels (up to 6.2.14) worked flawlessly, but with 6.=
3.1
I don't get any video output and I get the following in journalctl:

May 10 15:09:01 talos2 kernel: Kernel attempted to read user page (1128) -
exploit attempt? (uid: 0)
May 10 15:09:01 talos2 kernel: BUG: Unable to handle kernel data access on =
read
at 0x00001128
May 10 15:09:01 talos2 kernel: Faulting instruction address: 0xc00800000d1a=
805c
May 10 15:09:01 talos2 kernel: Oops: Kernel access of bad area, sig: 11 [#1]
May 10 15:09:01 talos2 kernel: LE PAGE_SIZE=3D4K MMU=3DRadix SMP NR_CPUS=3D=
512 NUMA
PowerNV
May 10 15:09:01 talos2 kernel: Modules linked in: rfkill(+) 8021q garp mrp =
stp
llc binfmt_misc amdgpu uvcvideo uvc videobuf2_vmalloc videobuf2_memops
gpu_sched snd_hda_codec_hdmi i2c_algo_bit at24(+) videobuf2_v4l2 drm_ttm_he=
lper
regmap_i2c videobuf2_common ttm snd_usb_audio drm_di>
May 10 15:09:01 talos2 kernel: CPU: 0 PID: 188 Comm: kworker/0:3 Not tainted
6.3.1-gentoo-dist #1
May 10 15:09:01 talos2 kernel: Hardware name: T2P9S01 REV 1.01 POWER9 0x4e1=
202
opal:skiboot-9858186 PowerNV
May 10 15:09:01 talos2 kernel: Workqueue: events_long
drm_dp_check_and_send_link_address [drm_display_helper]
May 10 15:09:01 talos2 kernel: NIP:  c00800000d1a805c LR: c00800000d1a8018 =
CTR:
c000000000c87900
May 10 15:09:01 talos2 kernel: REGS: c00000000beb3370 TRAP: 0300   Not tain=
ted=20
(6.3.1-gentoo-dist)
May 10 15:09:01 talos2 kernel: MSR:  900000000280b033
<SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 88048223  XER: 0000005a
May 10 15:09:01 talos2 kernel: CFAR: c000000000c87980 DAR: 0000000000001128
DSISR: 40000000 IRQMASK: 0=20
                               GPR00: c00800000d1a8018 c00000000beb3610
c00800000d690f00 0000000000000000=20
                               GPR04: 0000000000000002 c00800000d6297c0
0000000000000000 c00000002a00b740=20
                               GPR08: 0000000000000000 0000000000001124
0000000000000000 c00800000d431560=20
                               GPR12: c000000000c87900 c000000002a6b000
c000000000170ad8 c00000001a460310=20
                               GPR16: 0000000000000045 c000000022858388
c000000026000340 0000000000000001=20
                               GPR20: 0000000000000000 0000000000000001
c0000000260001a0 0000000000004000=20
                               GPR24: 0000000000004000 c000000026000010
c0000000228580b8 fffffffffffffffd=20
                               GPR28: 0000000000000000 c0000000228580a0
c000000022856000 c000000022858000=20
May 10 15:09:01 talos2 kernel: NIP [c00800000d1a805c]
is_synaptics_cascaded_panamera+0x244/0x600 [amdgpu]
May 10 15:09:01 talos2 kernel: LR [c00800000d1a8018]
is_synaptics_cascaded_panamera+0x200/0x600 [amdgpu]
May 10 15:09:01 talos2 kernel: Call Trace:
May 10 15:09:01 talos2 kernel: [c00000000beb3610] [c00800000d1a8018]
is_synaptics_cascaded_panamera+0x200/0x600 [amdgpu] (unreliable)
May 10 15:09:01 talos2 kernel: [c00000000beb36d0] [c00800000b7c2b18]
drm_helper_probe_single_connector_modes+0x230/0x698 [drm_kms_helper]
May 10 15:09:01 talos2 kernel: [c00000000beb3810] [c000000000c57174]
drm_client_modeset_probe+0x2b4/0x16c0
May 10 15:09:01 talos2 kernel: [c00000000beb3a10] [c00800000b7c7a30]
__drm_fb_helper_initial_config_and_unlock+0x68/0x640 [drm_kms_helper]
May 10 15:09:01 talos2 kernel: [c00000000beb3af0] [c00800000b7c5b08]
drm_fbdev_client_hotplug+0x40/0x1d0 [drm_kms_helper]
May 10 15:09:01 talos2 kernel: [c00000000beb3b70] [c000000000c55480]
drm_client_dev_hotplug+0x120/0x1b0
May 10 15:09:01 talos2 kernel: [c00000000beb3c00] [c00800000b7c1130]
drm_kms_helper_hotplug_event+0x58/0x80 [drm_kms_helper]
May 10 15:09:01 talos2 kernel: [c00000000beb3c30] [c00800000b80b298]
drm_dp_check_and_send_link_address+0x330/0x3a0 [drm_display_helper]
May 10 15:09:01 talos2 kernel: [c00000000beb3cd0] [c000000000162d84]
process_one_work+0x2f4/0x580
May 10 15:09:01 talos2 kernel: [c00000000beb3d70] [c0000000001630b8]
worker_thread+0xa8/0x600
May 10 15:09:01 talos2 kernel: [c00000000beb3e00] [c000000000170bf4]
kthread+0x124/0x130
May 10 15:09:01 talos2 kernel: [c00000000beb3e50] [c00000000000dd14]
ret_from_kernel_thread+0x5c/0x64
May 10 15:09:01 talos2 kernel: --- interrupt: 0 at 0x0
May 10 15:09:01 talos2 kernel: NIP:  0000000000000000 LR: 0000000000000000 =
CTR:
0000000000000000
May 10 15:09:01 talos2 kernel: REGS: c00000000beb3e80 TRAP: 0000   Not tain=
ted=20
(6.3.1-gentoo-dist)
May 10 15:09:01 talos2 kernel: MSR:  0000000000000000 <>  CR: 00000000  XER:
00000000
May 10 15:09:01 talos2 kernel: CFAR: 0000000000000000 IRQMASK: 0=20
                               GPR00: 0000000000000000 c00000000beb4000
0000000000000000 0000000000000000=20
                               GPR04: 0000000000000000 0000000000000000
0000000000000000 0000000000000000=20
                               GPR08: 0000000000000000 0000000000000000
0000000000000000 0000000000000000=20
                               GPR12: 0000000000000000 0000000000000000
c000000000170ad8 c00000000a8fb240=20
                               GPR16: 0000000000000000 0000000000000000
0000000000000000 0000000000000000=20
                               GPR20: 0000000000000000 0000000000000000
0000000000000000 0000000000000000=20
                               GPR24: 0000000000000000 0000000000000000
0000000000000000 0000000000000000=20
                               GPR28: 0000000000000000 0000000000000000
0000000000000000 0000000000000000=20
May 10 15:09:01 talos2 kernel: NIP [0000000000000000] 0x0
May 10 15:09:01 talos2 kernel: LR [0000000000000000] 0x0
May 10 15:09:01 talos2 kernel: --- interrupt: 0
May 10 15:09:01 talos2 kernel: Code: 41820094 e91f0568 e95f0000 813f0088
81080030 3d4a0001 39290444 e94a7ca0 79291764 1d0811f0 7d4a4214 7d2a4a14
<81290004> 91270074 813f0088 39290424=20
May 10 15:09:01 talos2 kernel: ---[ end trace 0000000000000000 ]---
May 10 15:09:01 talos2 kernel: at24 4-0054: supply vcc not found, using dum=
my
regulator

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

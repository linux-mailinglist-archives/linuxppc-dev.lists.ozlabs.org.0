Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC78F2A54
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 10:13:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477yPg36fgzF3S0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 20:13:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=wsnh=y7=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477yMP5wqGzF3KM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 20:11:45 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 205201] Booting halts if Dawicontrol DC-2976 UW SCSI board
 installed, unless RAM size limited to 3500M
Date: Thu, 07 Nov 2019 09:11:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chzigotzky@xenosoft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205201-206035-j96HC6nFte@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205201-206035@https.bugzilla.kernel.org/>
References: <bug-205201-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205201

--- Comment #8 from Christian Zigotzky (chzigotzky@xenosoft.de) ---
Trace:

[  462.783184] Call Trace:
[  462.783187] [c0000001c6c67420] [c0000000000b3358] .report_addr+0xb8/0xc0
(unreliable)
[  462.783192] [c0000001c6c67490] [c0000000000b351c]
.dma_direct_map_page+0xf0/0x128
[  462.783195] [c0000001c6c67530] [c0000000000b35b0]
.dma_direct_map_sg+0x5c/0xac
[  462.783205] [c0000001c6c675e0] [8000000000862e88]
.__videobuf_iolock+0x660/0x6d8 [videobuf_dma_sg]
[  462.783220] [c0000001c6c676b0] [8000000000854274] .videobuf_iolock+0x98/=
0xb4
[videobuf_core]
[  462.783271] [c0000001c6c67720] [80000000008686e8]
.buffer_prepare+0x150/0x268 [bttv]
[  462.783276] [c0000001c6c677c0] [8000000000854afc] .videobuf_qbuf+0x2b8/0=
x428
[videobuf_core]
[  462.783288] [c0000001c6c67860] [8000000000868f6c] .bttv_qbuf+0x50/0x64
[bttv]
[  462.783383] [c0000001c6c678e0] [80000000007bf208] .v4l_qbuf+0x54/0x60
[videodev]
[  462.783402] [c0000001c6c67970] [80000000007c1eac]
.__video_do_ioctl+0x30c/0x3f8 [videodev]
[  462.783421] [c0000001c6c67a80] [80000000007c3c08]
.video_usercopy+0x18c/0x3dc [videodev]
[  462.783440] [c0000001c6c67c00] [80000000007bb14c] .v4l2_ioctl+0x60/0x78
[videodev]
[  462.783460] [c0000001c6c67c90] [80000000007d3c48]
.v4l2_compat_ioctl32+0x9b4/0x1850 [videodev]
[  462.783468] [c0000001c6c67d70] [c0000000001ad9cc]
.__se_compat_sys_ioctl+0x284/0x127c
[  462.783473] [c0000001c6c67e20] [c00000000000067c] system_call+0x60/0x6c
[  462.783475] Instruction dump:
[  462.783477] 40fe0044 60000000 892255d0 2f890000 40fe0020 3c82ffc5 392000=
01
60000000=20
[  462.783483] 38842029 992255d0 485ad0d9 60000000 <0fe00000> 38210070 e801=
0010
7c0803a6=20
[  462.783490] ---[ end trace b677d4a00458e277 ]---

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=

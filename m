Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CEFCD6F3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Oct 2019 19:52:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46mWQl2k8bzDqND
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Oct 2019 04:52:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=26xn=x7=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46mWMB2WdDzDqMx
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Oct 2019 04:49:10 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 205099] New: KASAN hit at raid6_pq: BUG: Unable to handle
 kernel data access at 0x00f0fd0d
Date: Sun, 06 Oct 2019 17:49:07 +0000
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
Message-ID: <bug-205099-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205099

            Bug ID: 205099
           Summary: KASAN hit at raid6_pq: BUG: Unable to handle kernel
                    data access at 0x00f0fd0d
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.4-rc1
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

Created attachment 285367
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D285367&action=3Dedit
dmesg (kernel 5.4-rc1, PowerMac G4 DP)

With lots of KASAN ppc fixes included in kernel 5.4-rc1 now, I am revisiting
the issues of bug #204479.

raid6 pq still reliably oopses:

[...]
[   19.186966] BUG: Unable to handle kernel data access at 0x00f0fd0d
[   19.196913] Faulting instruction address: 0xf1692560
[   19.235490] ohci-pci: OHCI PCI platform driver
[   19.236988] Oops: Kernel access of bad area, sig: 11 [#1]
[   19.255518] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
[   19.265311] Modules linked in: ohci_pci(+) raid6_pq(+) zlib_inflate sung=
em
hwmon sungem_phy i2c_algo_bit sr_mod drm_kms_helper cdrom syscopyarea
sysfillrect firewire_ohci sysimgblt ohci_hcd ehci_pci fb_sys_fops ttm
firewire_core snd_aoa_i2sbus ehci_hcd crc_itu_t snd_aoa_soundbus snd_pcm
snd_timer drm snd soundcore usbcore ssb uninorth_agp
drm_panel_orientation_quirks pcmcia usb_common pcmcia_core agpgart
[   19.287432] CPU: 0 PID: 127 Comm: modprobe Tainted: G        W=20=20=20=
=20=20=20=20=20
5.4.0-rc1 #10
[   19.298613] NIP:  f1692560 LR: f16924e8 CTR: c023bcf4
[   19.309692] REGS: e8d13730 TRAP: 0300   Tainted: G        W=20=20=20=20=
=20=20=20=20=20
(5.4.0-rc1)
[   19.320847] MSR:  02009032 <VEC,EE,ME,IR,DR,RI>  CR: 28228822  XER: 0000=
0000
[   19.332102] DAR: 00f0fd0d DSISR: 40000000=20
               GPR00: e8d13988 e8d137e8 ee01b4a0 f16a5070 00000010 00000000
f16924e8 00000000=20
               GPR08: f16a5070 00f0fd0d e7171aea e8d13a70 c023bcf4 0050fff4
00000060 00000050=20
               GPR16: 00000040 f16a5000 00000012 eb28d000 eb28c000 00000070
00000060 00000050=20
               GPR24: 00000040 00000030 00000020 00000010 e8d13a38 eb28d010
eb28c010 00000000=20
[   19.388060] NIP [f1692560] raid6_altivec8_gen_syndrome_real+0x3c8/0x488
[raid6_pq]
[   19.399417] LR [f16924e8] raid6_altivec8_gen_syndrome_real+0x350/0x488
[raid6_pq]
[   19.405058] usb 1-1: new high-speed USB device number 2 using ehci-pci
[   19.410774] Call Trace:
[   19.410786] [e8d137e8] [00001032] 0x1032 (unreliable)
[   19.410824] [e8d139d8] [f1692654] raid6_altivec8_gen_syndrome+0x34/0x58
[raid6_pq]
[   19.410857] [e8d13a08] [f15c83c0] init_module+0x3c0/0x518 [raid6_pq]
[   19.460942] Apple USB OHCI 0001:10:18.0 disabled by firmware
[   19.468239] [e8d13af8] [c0005820] do_one_initcall+0xb8/0x36c
[   19.468264] [e8d13bc8] [c0109480] do_init_module+0xa8/0x2c4
[   19.502777] [e8d13bf8] [c010c2e4] load_module+0x2b68/0x2d24
[   19.514192] [e8d13df8] [c010c704] sys_finit_module+0x100/0x140
[   19.525556] [e8d13f38] [c001a274] ret_from_syscall+0x0/0x34
[   19.536910] --- interrupt: c01 at 0x35e2c4
                   LR =3D 0x4e67c4
[   19.559299] Instruction dump:
[   19.570504] 1304c4c4 7d2048ce 39210090 1325ccc4 7d6048ce 1346d4c4 812100=
88
1367dcc4=20
[   19.581997] 7d11a8ce 115f5b06 116b5800 8141008c <7c0048ce> 392100a0 7d80=
48ce
392100b0=20
[   19.593571] ---[ end trace 5e7216580d039a39 ]---

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=

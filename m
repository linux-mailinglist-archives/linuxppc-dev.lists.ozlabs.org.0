Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE66B05C0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 00:49:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46THBk3ZcfzF3xd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 08:49:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=6mxq=xg=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TH972DvwzF3xc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 08:47:39 +1000 (AEST)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 204819] New: KASAN still got problems loading some modules at
 boot
Date: Wed, 11 Sep 2019 22:47:36 +0000
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
Message-ID: <bug-204819-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204819

            Bug ID: 204819
           Summary: KASAN still got problems loading some modules at boot
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.3-rc8
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

Created attachment 284931
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D284931&action=3Dedit
dmesg (5.3-rc8, PowerMac G4 DP)

I tried finding a minimal kernel .config for bug #204479 to rule out other
influences.

What I found was, that KASAN shows different BUG: Unable to handle kernel d=
ata
access at 0x.......", depending on which module gets loaded/used first, lik=
e:

[...]
Sep 12 00:12:09 T600 kernel: BUG: Unable to handle kernel data access at
0xfe205150
Sep 12 00:12:09 T600 kernel: Faulting instruction address: 0xc00261d8
Sep 12 00:12:09 T600 kernel: Oops: Kernel access of bad area, sig: 11 [#1]
Sep 12 00:12:09 T600 kernel: BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 P=
owerMac
Sep 12 00:12:09 T600 kernel: Modules linked in: sungem_phy(+) usb_common
Sep 12 00:12:09 T600 kernel: CPU: 0 PID: 117 Comm: systemd-udevd Tainted: G=
=20=20=20=20
   W         5.3.0-rc8 #3
Sep 12 00:12:09 T600 kernel: NIP:  c00261d8 LR: c02355c4 CTR: c0236c6c
Sep 12 00:12:09 T600 kernel: REGS: eb7d5ae0 TRAP: 0300   Tainted: G        =
W=20=20=20
      (5.3.0-rc8)
Sep 12 00:12:09 T600 kernel: MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 48228828=
=20
XER: 20000000
Sep 12 00:12:09 T600 kernel: DAR: fe205150 DSISR: 0a000000=20
                             GPR00: c0236cb0 eb7d5b98 ebbd2320 fe205150
00000000 00000007 c01083dc 00000003=20
                             GPR08: e991025c 1e205150 00000000 f1013000
c0236c6c 007d6980 eb7d5eb8 eb7d5eb0=20
                             GPR16: f10504c0 00000124 f102a880 f103d000
c010426c c144c480 00000011 eb9ef9a0=20
                             GPR24: f102a8dc f102a8e0 f1013000 f102a810
0000002d 00000001 0000003c f1028a80=20
Sep 12 00:12:09 T600 kernel: NIP [c00261d8] __memset+0x10/0xc0
Sep 12 00:12:09 T600 kernel: LR [c02355c4] kasan_unpoison_shadow+0x20/0x40
Sep 12 00:12:09 T600 kernel: Call Trace:
Sep 12 00:12:09 T600 kernel: [eb7d5b98] [ee802420] 0xee802420 (unreliable)
Sep 12 00:12:09 T600 kernel: [eb7d5ba8] [c0236cb0]
__asan_register_globals+0x44/0x68
Sep 12 00:12:09 T600 kernel: [eb7d5bc8] [c01083e8] do_init_module+0x134/0x2=
c4
Sep 12 00:12:09 T600 kernel: [eb7d5bf8] [c010b1b8] load_module+0x2b60/0x2d1c
Sep 12 00:12:09 T600 kernel: [eb7d5df8] [c010b5d8] sys_finit_module+0x100/0=
x140
Sep 12 00:12:09 T600 kernel: [eb7d5f38] [c001a274] ret_from_syscall+0x0/0x34
Sep 12 00:12:09 T600 kernel: --- interrupt: c00 at 0x24f2c4
                                 LR =3D 0x43e35c
Sep 12 00:12:09 T600 kernel: Instruction dump:
Sep 12 00:12:09 T600 kernel: 7c062396 7d4021d6 7d080214 7cca3050 90e30000
91030004 7cc33378 4e800020=20
Sep 12 00:12:09 T600 kernel: 28050004 418000a0 5084442e 5084801e <90830000>
4d820020 70600003 7ca02a14=20
Sep 12 00:12:09 T600 kernel: ---[ end trace 00769ab21374844d ]---
[...]
This changes depending on which modules I build for the kernel. So I suspect
KASAN to still not get the module loading quite right for all modules. At l=
east
on my system (PowerMac G4 DP).

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=

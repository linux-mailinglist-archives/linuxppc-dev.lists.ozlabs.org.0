Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC0815CBB5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 21:09:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JSKN2d95zDqW0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 07:09:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=xohv=4b=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JSH963FDzDqS4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 07:07:49 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 206525] New: BUG: KASAN: stack-out-of-bounds in
 test_bit+0x30/0x44 (kernel 5.6-rc1)
Date: Thu, 13 Feb 2020 20:07:46 +0000
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
Message-ID: <bug-206525-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206525

            Bug ID: 206525
           Summary: BUG: KASAN: stack-out-of-bounds in test_bit+0x30/0x44
                    (kernel 5.6-rc1)
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.6.0-rc1
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

Created attachment 287357
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D287357&action=3Dedit
dmesg (5.6.0-rc1 + v2 Fix DSI and ISI... patch, PowerMac G4 DP)

[...]
Feb 13 20:18:53 T600 kernel:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Feb 13 20:18:53 T600 kernel: BUG: KASAN: stack-out-of-bounds in
test_bit+0x30/0x44
Feb 13 20:18:53 T600 kernel: Read of size 4 at addr ee8bddac by task system=
d/1
Feb 13 20:18:53 T600 kernel:=20
Feb 13 20:18:53 T600 kernel: CPU: 0 PID: 1 Comm: systemd Tainted: G        =
W=20=20=20
     5.6.0-rc1-PowerMacG4+ #20
Feb 13 20:18:53 T600 kernel: Call Trace:
Feb 13 20:18:53 T600 kernel: [ee8bdc38] [c078cf18] dump_stack+0xbc/0x118
(unreliable)
Feb 13 20:18:53 T600 kernel: [ee8bdc68] [c0249f94]
print_address_description.isra.0+0x3c/0x420
Feb 13 20:18:53 T600 kernel: [ee8bdcf8] [c024a554] __kasan_report+0x138/0x1=
80
Feb 13 20:18:53 T600 kernel: [ee8bdd38] [c0249718] kasan_report+0x7c/0x104
Feb 13 20:18:53 T600 kernel: [ee8bdd58] [c06526b4] test_bit+0x30/0x44
Feb 13 20:18:53 T600 kernel: [ee8bdd78] [c0657c6c] netlink_bind+0x24c/0x33c
Feb 13 20:18:53 T600 kernel: [ee8bde18] [c05c0c3c] __sys_bind+0xd4/0x120
Feb 13 20:18:53 T600 kernel: [ee8bdf38] [c001a278] ret_from_syscall+0x0/0x34
Feb 13 20:18:53 T600 kernel: --- interrupt: c01 at 0x4f3ea8
                                 LR =3D 0x8f5b80
Feb 13 20:18:53 T600 kernel:=20
Feb 13 20:18:53 T600 kernel: The buggy address belongs to the page:
Feb 13 20:18:53 T600 kernel: page:ef460a94 refcount:0 mapcount:0
mapping:00000000 index:0x0
Feb 13 20:18:53 T600 kernel: flags: 0x0()
Feb 13 20:18:53 T600 kernel: raw: 00000000 ef460a98 ef460a98 00000000 00000=
000
00000000 ffffffff 00000000
Feb 13 20:18:53 T600 kernel: raw: 00000000
Feb 13 20:18:53 T600 kernel: page dumped because: kasan: bad access detected
Feb 13 20:18:53 T600 kernel:=20
Feb 13 20:18:53 T600 kernel: addr ee8bddac is located in stack of task
systemd/1 at offset 36 in frame:
Feb 13 20:18:53 T600 kernel:  netlink_bind+0x0/0x33c
Feb 13 20:18:53 T600 kernel:=20
Feb 13 20:18:53 T600 kernel: this frame has 1 object:
Feb 13 20:18:53 T600 kernel:  [32, 36) 'groups'
Feb 13 20:18:53 T600 kernel:=20
Feb 13 20:18:53 T600 kernel: Memory state around the buggy address:
Feb 13 20:18:53 T600 kernel:  ee8bdc80: 00 00 00 00 00 00 00 00 00 00 00 00=
 00
00 00 00
Feb 13 20:18:53 T600 kernel:  ee8bdd00: 00 00 00 00 00 00 00 00 00 00 00 00=
 00
00 00 00
Feb 13 20:18:53 T600 kernel: >ee8bdd80: 00 f1 f1 f1 f1 04 f3 f3 f3 00 00 00=
 00
00 00 00
Feb 13 20:18:53 T600 kernel:                           ^
Feb 13 20:18:53 T600 kernel:  ee8bde00: 00 00 00 00 00 f1 f1 f1 f1 04 f2 04=
 f2
00 00 00
Feb 13 20:18:53 T600 kernel:  ee8bde80: 00 00 00 00 00 00 00 00 00 00 00 00=
 00
f3 f3 f3
Feb 13 20:18:53 T600 kernel:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Happens on my G4 DP with kernel 5.6.0-rc1 and KASAN enabled (outline) during
boot. kernel is patched with Christophe's '[v2] powerpc/32s: Fix DSI and ISI
exceptions for CONFIG_VMAP_STACK' (https://patchwork.ozlabs.org/patch/12373=
87/)
but CONFIG_VMAP_STACK was not used here.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=

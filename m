Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E8D121FD7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 01:35:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cK1X24cPzDqX9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 11:35:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=uhai=2h=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cJzL1V4DzDqWn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 11:33:49 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 205885] New: BUG: KASAN: null-ptr-deref in strncpy+0x3c/0x60
Date: Tue, 17 Dec 2019 00:33:46 +0000
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
Message-ID: <bug-205885-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205885

            Bug ID: 205885
           Summary: BUG: KASAN: null-ptr-deref in strncpy+0x3c/0x60
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.5-rc2
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

Created attachment 286331
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D286331&action=3Dedit
screenshot (5.5-rc2, PowerMac G4 DP)

I get this hit at booting kernel 5.5-rc2 on my G4 DP:

[...]
BUG: KASAN: null-ptr-deref in strncpy+0x3c/0x60
Read of size 1 at addr 00000000 by task swapper/0/1

CPU: 1 PID: 1 Comm: swapper/0 Tainted: G        W        5.5.0-rc2-PowerMac=
G4
Call Trace:
[ee8edd78] [c07819e0] dump_stack+0xbc/0x118 (unreliable)
[ee8edda8] [c0244b48] __kasan_report+0x174/0x180
[ee8edde8] [c07949dc] strncpy+0x3c/0x60
[ee8ede18] [c0b6979c] mount_block_root+0x200/0x3e0
[ee8edef8] [c0b69b74] prepare_namespace+0x164/0x174
[ee8edf18] [c0005f3c] kernel_init+0x14/0xf0
[ee8edf38] [c001a348] ret_from_kernel_thread+0x14/0x1c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: Kernel NULL pointer dereference on read at 0x0000000
Faulting instruction address: 0xc07949dc
Oops: Kernel access of bad area sig: 11 (#1]
[...]

For details see screenshot (I appled a median filter but tesseract still was
not able to make much text out of it).

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=

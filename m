Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 487A4E5F3B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 21:32:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 470rhm2jKmzDqnv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Oct 2019 06:32:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=k4pu=yt=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 470rfb3mtgzDqnn
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Oct 2019 06:30:14 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 205327] New: kmemleak reports various leaks in "swapper/0"
Date: Sat, 26 Oct 2019 19:30:11 +0000
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
Message-ID: <bug-205327-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205327

            Bug ID: 205327
           Summary: kmemleak reports various leaks in "swapper/0"
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.4-rc4
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

Created attachment 285655
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D285655&action=3Dedit
kmemleak output

kmemleak reported various leaks in "swapper/0" while I was building some st=
uff
via distcc:

unreferenced object 0xc00000027eea64e0 (size 32):
  comm "swapper/0", pid 1, jiffies 4294877673 (age 1568.254s)
  hex dump (first 32 bytes):
    2f 5f 5f 6c 6f 63 61 6c 5f 66 69 78 75 70 73 5f  /__local_fixups_
    5f 00 00 00 00 ca ad c8 00 00 00 00 00 00 00 00  _...............
  backtrace:
    [<00000000e9188659>] .kvasprintf+0x64/0xe0
    [<00000000dc0cdc16>] .kasprintf+0x2c/0x50
    [<0000000000808425>] .attach_node_and_children+0x2c/0x270
    [<00000000a50a500b>] .of_unittest+0x1f4/0x379c
    [<00000000e51cf048>] .do_one_initcall+0x7c/0x430
    [<00000000e6d8e44a>] .kernel_init_freeable+0x2d0/0x3cc
    [<000000005adf1660>] .kernel_init+0x1c/0x138
    [<000000006adcb060>] .ret_from_kernel_thread+0x58/0x64
[...]

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=

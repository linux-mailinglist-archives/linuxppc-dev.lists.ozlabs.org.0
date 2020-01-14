Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D423513AE0C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 16:53:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xw3J1hWyzDqQf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 02:53:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=pbva=3d=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xw1J3gnyzDqP6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 02:51:31 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 206203] New: kmemleak reports various leaks in
 drivers/of/unittest.c
Date: Tue, 14 Jan 2020 15:51:29 +0000
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
Message-ID: <bug-206203-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206203

            Bug ID: 206203
           Summary: kmemleak reports various leaks in
                    drivers/of/unittest.c
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.4.11
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

Created attachment 286801
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D286801&action=3Dedit
kmemleak output

kmemleak reported various leaks in "swapper/0" while I was building a kerne=
l on
my Talos II:

[...]
unreferenced object 0xc0002007f833c780 (size 8):
  comm "swapper/0", pid 1, jiffies 4294878487 (age 1637.240s)
  hex dump (first 8 bytes):
    6e 61 6d 65 00 00 03 18                          name....
  backtrace:
    [<00000000d64d7001>] .kstrdup+0x44/0xb0
    [<00000000d7cb5018>] .__of_prop_dup+0x60/0x130
    [<000000003a4c11d9>] .of_unittest_changeset+0x3c0/0xa20
    [<00000000f6cf112e>] .of_unittest+0x1e9c/0x3808
    [<0000000018a2e72e>] .do_one_initcall+0x7c/0x420
    [<00000000de53cd05>] .kernel_init_freeable+0x2d8/0x3d4
    [<00000000e79ea455>] .kernel_init+0x14/0x158
    [<0000000099bc20e8>] .ret_from_kernel_thread+0x58/0x68
unreferenced object 0xc0002007f833c498 (size 8):
  comm "swapper/0", pid 1, jiffies 4294878487 (age 1637.240s)
  hex dump (first 8 bytes):
    6e 32 31 00 00 00 0e f8                          n21.....
  backtrace:
    [<00000000a8bde092>] .kmemdup+0x30/0x70
    [<00000000a5916f40>] .__of_prop_dup+0x7c/0x130
    [<000000003a4c11d9>] .of_unittest_changeset+0x3c0/0xa20
    [<00000000f6cf112e>] .of_unittest+0x1e9c/0x3808
    [<0000000018a2e72e>] .do_one_initcall+0x7c/0x420
    [<00000000de53cd05>] .kernel_init_freeable+0x2d8/0x3d4
    [<00000000e79ea455>] .kernel_init+0x14/0x158
    [<0000000099bc20e8>] .ret_from_kernel_thread+0x58/0x68
unreferenced object 0xc0002007f833c818 (size 8):
  comm "swapper/0", pid 1, jiffies 4294878487 (age 1637.240s)
  hex dump (first 8 bytes):
    6e 31 00 00 00 00 06 b8                          n1......
  backtrace:
    [<00000000d64d7001>] .kstrdup+0x44/0xb0
    [<0000000059dd59eb>] .kvasprintf_const+0x74/0xf0
    [<00000000d729a1b8>] .kobject_set_name_vargs+0x34/0xf0
    [<00000000e8b8c22b>] .kobject_add+0x50/0xe0
    [<00000000223588e9>] .__of_attach_node_sysfs+0xa8/0x160
    [<0000000085cbb668>] .__of_changeset_entry_apply+0x32c/0x390
    [<00000000f1d284ee>] .__of_changeset_apply_entries+0x48/0x110
    [<00000000b7434f45>] .of_changeset_apply+0x54/0xc0
    [<0000000022b41feb>] .of_unittest_changeset+0x8a4/0xa20
    [<00000000f6cf112e>] .of_unittest+0x1e9c/0x3808
    [<0000000018a2e72e>] .do_one_initcall+0x7c/0x420
    [<00000000de53cd05>] .kernel_init_freeable+0x2d8/0x3d4
    [<00000000e79ea455>] .kernel_init+0x14/0x158
    [<0000000099bc20e8>] .ret_from_kernel_thread+0x58/0x68
[...]

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=

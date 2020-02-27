Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9693172C7A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 00:46:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T8Sr4GTDzDr6S
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 10:46:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=ovus=4p=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T8Qw6nW7zDr4Q
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 10:44:40 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 206695] New: kmemleak reports leaks in drivers/macintosh/windfarm
Date: Thu, 27 Feb 2020 23:44:37 +0000
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
Message-ID: <bug-206695-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206695

            Bug ID: 206695
           Summary: kmemleak reports leaks in drivers/macintosh/windfarm
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.6-rc3
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

Created attachment 287687
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D287687&action=3Dedit
kmemleak output (kernel 5.6-rc3, PowerMac G5 11,2)

kmemleak reports leaks from the windfarm module of my PowerMac G5 11,2:

[...]
unreferenced object 0xc00000047081f840 (size 32):
  comm "kwindfarm", pid 203, jiffies 4294880630 (age 5552.877s)
  hex dump (first 32 bytes):
    c8 06 02 7f ff 02 ff 01 fb bf 00 41 00 20 00 00  ...........A. ..
    00 07 89 37 00 a0 00 00 00 00 00 00 00 00 00 00  ...7............
  backtrace:
    [<0000000083f0a65c>] .smu_sat_get_sdb_partition+0xc4/0x2d0
[windfarm_smu_sat]
    [<000000003010fcb7>] .pm112_wf_notify+0x104c/0x13bc [windfarm_pm112]
    [<00000000b958b2dd>] .notifier_call_chain+0xa8/0x180
    [<0000000070490868>] .blocking_notifier_call_chain+0x64/0x90
    [<00000000131d8149>] .wf_thread_func+0x114/0x1a0
    [<000000000d54838d>] .kthread+0x13c/0x190
    [<00000000669b72bc>] .ret_from_kernel_thread+0x58/0x64
unreferenced object 0xc0000004737089f0 (size 16):
  comm "kwindfarm", pid 203, jiffies 4294880879 (age 5552.050s)
  hex dump (first 16 bytes):
    c4 04 01 7f 22 11 e0 e6 ff 55 7b 12 ec 11 00 00  ...."....U{.....
  backtrace:
    [<0000000083f0a65c>] .smu_sat_get_sdb_partition+0xc4/0x2d0
[windfarm_smu_sat]
    [<00000000b94ef7e1>] .pm112_wf_notify+0x1294/0x13bc [windfarm_pm112]
    [<00000000b958b2dd>] .notifier_call_chain+0xa8/0x180
    [<0000000070490868>] .blocking_notifier_call_chain+0x64/0x90
    [<00000000131d8149>] .wf_thread_func+0x114/0x1a0
    [<000000000d54838d>] .kthread+0x13c/0x190
    [<00000000669b72bc>] .ret_from_kernel_thread+0x58/0x64
unreferenced object 0xc00000047081fdc0 (size 32):
  comm "kwindfarm", pid 203, jiffies 4294881067 (age 5551.427s)
  hex dump (first 32 bytes):
    c9 06 02 7f ff 02 ff 01 fb bf 00 41 00 20 00 00  ...........A. ..
    00 07 89 37 00 a0 00 00 00 00 00 00 00 00 00 00  ...7............
  backtrace:
    [<0000000083f0a65c>] .smu_sat_get_sdb_partition+0xc4/0x2d0
[windfarm_smu_sat]
    [<000000003010fcb7>] .pm112_wf_notify+0x104c/0x13bc [windfarm_pm112]
    [<00000000b958b2dd>] .notifier_call_chain+0xa8/0x180
    [<0000000070490868>] .blocking_notifier_call_chain+0x64/0x90
    [<00000000131d8149>] .wf_thread_func+0x114/0x1a0
    [<000000000d54838d>] .kthread+0x13c/0x190
    [<00000000669b72bc>] .ret_from_kernel_thread+0x58/0x64
unreferenced object 0xc000000473708b60 (size 16):
  comm "kwindfarm", pid 203, jiffies 4294881320 (age 5550.587s)
  hex dump (first 16 bytes):
    c5 04 01 7f 22 11 e0 e6 ff 55 7b 12 ec 11 00 00  ...."....U{.....
  backtrace:
    [<0000000083f0a65c>] .smu_sat_get_sdb_partition+0xc4/0x2d0
[windfarm_smu_sat]
    [<00000000b94ef7e1>] .pm112_wf_notify+0x1294/0x13bc [windfarm_pm112]
    [<00000000b958b2dd>] .notifier_call_chain+0xa8/0x180
    [<0000000070490868>] .blocking_notifier_call_chain+0x64/0x90
    [<00000000131d8149>] .wf_thread_func+0x114/0x1a0
    [<000000000d54838d>] .kthread+0x13c/0x190
    [<00000000669b72bc>] .ret_from_kernel_thread+0x58/0x64

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=

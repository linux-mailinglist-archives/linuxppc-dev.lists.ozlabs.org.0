Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8C622893
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 May 2019 21:36:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456XMy5xjfzDqHJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 05:36:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=bugzilla.kernel.org
 (client-ip=198.145.29.98; helo=mail.wl.linuxfoundation.org;
 envelope-from=bugzilla-daemon@bugzilla.kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456XKl1y6wzDqFh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 05:34:50 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 63514285AF
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 May 2019 19:34:48 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 56D3B285C6; Sun, 19 May 2019 19:34:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 203647] New: Locking API testsuite fails "mixed
 read-lock/lock-write ABBA" rlock on kernels >=4.14.x
Date: Sun, 19 May 2019 19:34:47 +0000
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
Message-ID: <bug-203647-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D203647

            Bug ID: 203647
           Summary: Locking API testsuite fails "mixed
                    read-lock/lock-write ABBA" rlock on kernels >=3D4.14.x
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.1.3
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: No

Created attachment 282831
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D282831&action=3Dedit
dmesg (5.1.3, G5 11,2)

Probably this test fails on ppc64 since it is around. Kernel 4.9.x passes a=
ll
tests, since it does not seem to contain "mixed read-lock/lock-write ABBA".

Machine is a PowerMac G5 11,2 running Gentoo Linux ppc64, Big Endian, 4 KiB
pagesize.

[    0.002051] ------------------------
[    0.002065] | Locking API testsuite:
[    0.002079]
----------------------------------------------------------------------------
[    0.002111]                                  | spin |wlock |rlock |mutex=
 |
wsem | rsem |
[    0.002142]=20=20
--------------------------------------------------------------------------
[    0.002179]                      A-A deadlock:  ok  |  ok  |  ok  |  ok =
 |=20
ok  |  ok  |  ok  |
[    0.007366]                  A-B-B-A deadlock:  ok  |  ok  |  ok  |  ok =
 |=20
ok  |  ok  |  ok  |
[    0.012471]              A-B-B-C-C-A deadlock:  ok  |  ok  |  ok  |  ok =
 |=20
ok  |  ok  |  ok  |
[    0.017598]              A-B-C-A-B-C deadlock:  ok  |  ok  |  ok  |  ok =
 |=20
ok  |  ok  |  ok  |
[    0.022740]          A-B-B-C-C-D-D-A deadlock:  ok  |  ok  |  ok  |  ok =
 |=20
ok  |  ok  |  ok  |
[    0.027912]          A-B-C-D-B-D-D-A deadlock:  ok  |  ok  |  ok  |  ok =
 |=20
ok  |  ok  |  ok  |
[    0.033083]          A-B-C-D-B-C-D-A deadlock:  ok  |  ok  |  ok  |  ok =
 |=20
ok  |  ok  |  ok  |
[    0.038269]                     double unlock:  ok  |  ok  |  ok  |  ok =
 |=20
ok  |  ok  |  ok  |
[    0.043319]                   initialize held:  ok  |  ok  |  ok  |  ok =
 |=20
ok  |  ok  |  ok  |
[    0.048379]=20=20
--------------------------------------------------------------------------
[    0.048411]               recursive read-lock:             |  ok  |=20=
=20=20=20=20=20=20=20=20
   |  ok  |
[    0.049894]            recursive read-lock #2:             |  ok  |=20=
=20=20=20=20=20=20=20=20
   |  ok  |
[    0.051375]             mixed read-write-lock:             |  ok  |=20=
=20=20=20=20=20=20=20=20
   |  ok  |
[    0.052859]             mixed write-read-lock:             |  ok  |=20=
=20=20=20=20=20=20=20=20
   |  ok  |
[    0.054333]   mixed read-lock/lock-write ABBA:             |FAILED|=20=
=20=20=20=20=20=20=20=20
   |  ok  |
[    0.055802]    mixed read-lock/lock-read ABBA:             |  ok  |=20=
=20=20=20=20=20=20=20=20
   |  ok  |
[    0.057290]  mixed write-lock/lock-write ABBA:             |  ok  |=20=
=20=20=20=20=20=20=20=20
   |  ok  |
[    0.058771]=20=20
--------------------------------------------------------------------------

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=

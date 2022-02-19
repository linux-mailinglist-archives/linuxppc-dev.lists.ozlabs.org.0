Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7D54BC418
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 02:05:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0r2R6RRsz3cbx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 12:05:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h2mGDPh7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=h2mGDPh7; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0r1f5ztHz30hR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 12:04:22 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AC4F7B82677
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 01:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E10DC340E9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 01:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645232657;
 bh=wkI/pBuswK/mBdxQk+aVpQRWRi8qB3xGK9kNsB+Pigs=;
 h=From:To:Subject:Date:From;
 b=h2mGDPh7bAYi+tusf3W4WHeMvNbyI+ijHQSTTHvUtDP9jVI6oWRhiOiB16gNrzqXF
 WbEljWLlQVV3tsgDqq1VcAhpMWpLSCwKWgJl73V5mEpAy2UPXSdv5gVQWXCLcBseAS
 vI8lmwWFTLxmmdfsb761RQMS+Y2uoZuQyk4EW2H9MaScwRgvgjJh3WgYXWhsvMfFEZ
 XG8SQwBjvXZdEoyCukpselvcYm0tVZ57JUG5JzWS+H4Lu+wu1plT2rYCI+6Sdyscby
 by24UJLnDtXXykaQyHr2RHaqOzUWjwqoYMXPmU5wUrTuuQazZRdTFkTvVXJSeSxHA8
 s6mhHj79LtB4w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 33223C05FCE; Sat, 19 Feb 2022 01:04:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215621] New: Warning: Unable to mark rodata read only on this
 CPU. (PPC970MP)
Date: Sat, 19 Feb 2022 01:04:16 +0000
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
Message-ID: <bug-215621-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215621

            Bug ID: 215621
           Summary: Warning: Unable to mark rodata read only on this CPU.
                    (PPC970MP)
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.17-rc4
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

Created attachment 300482
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300482&action=3Dedit
dmesg (5.17-rc4, PowerMac G5 11,2)

STRICT_MODULE_RWX is enabled in kernel but it does not seem to work on my
PowerMac G5 11,2.

Kernel dmesg says:
[...]
Freeing unused kernel image (initmem) memory: 3968K
Warning: Unable to mark rodata read only on this CPU.
rodata_test: test data was not read only
[...]


 # lscpu=20
Architecture:          ppc64
  CPU op-mode(s):      32-bit, 64-bit
  Byte Order:          Big Endian
CPU(s):                2
  On-line CPU(s) list: 0,1
Model name:            PPC970MP, altivec supported
  Model:               1.1 (pvr 0044 0101)
  Thread(s) per core:  1
  Core(s) per socket:  2
  Socket(s):           1
  CPU max MHz:         2300.0000
  CPU min MHz:         1150.0000
Caches (sum of all):=20=20=20
  L1d:                 64 KiB (2 instances)
  L1i:                 128 KiB (2 instances)
  L2:                  2 MiB (2 instances)
NUMA:=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  NUMA node(s):        1
  NUMA node0 CPU(s):   0,1
Vulnerabilities:=20=20=20=20=20=20=20
  Itlb multihit:       Not affected
  L1tf:                Vulnerable
  Mds:                 Not affected
  Meltdown:            Vulnerable
  Spec store bypass:   Vulnerable
  Spectre v1:          Mitigation; __user pointer sanitization
  Spectre v2:          Vulnerable
  Srbds:               Not affected
  Tsx async abort:     Not affected

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

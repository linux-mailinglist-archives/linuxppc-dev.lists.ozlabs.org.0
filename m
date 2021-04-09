Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B530B35A219
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 17:34:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FH2Ht3vNMz3c16
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 01:34:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fL1CubXD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fL1CubXD; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FH2HR580tz2yYZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Apr 2021 01:34:27 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id CF52261028
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 15:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617982464;
 bh=f4TkVWHuivk8mFbzPr2ht1owFI1UWtlCGEOLOe/8IT0=;
 h=From:To:Subject:Date:From;
 b=fL1CubXDxVTFF/GXjHSJpHCYq30KFIRizNr8f4EQuj1JQHhzUOyqsPt6mS8M34eOO
 f51Q6tX5jbcqoz7KFk1Doy4qLDEk+oPE9B/29AgrF1N9HWHW2fWWjoIhrkxNgheFZ4
 0gJH54SFdVzTMcx1emQZWjT3iYYnWrKxTAHuSiO4K8qtJzfHWPf3fLVAcGveU4w+gi
 HzetaUwQ1/T6irovGzqTzkoyhOXDb06kpoE5h4XgROOKAyt7oklMQ8Q32TyZiz28zr
 xGRR5J5hHSnRccHFkd2RMn/+OzOyx6kNW18ChYqhmYWaKxDTLoBFmchkBdTu2/3QjJ
 LmwtVe5G+eelA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id BB4366113A; Fri,  9 Apr 2021 15:34:24 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 212631] New: Misaligned floating point loads and store
 occasionally fail
Date: Fri, 09 Apr 2021 15:34:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: trevor_davenport@selinc.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-212631-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212631

            Bug ID: 212631
           Summary: Misaligned floating point loads and store occasionally
                    fail
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.4.110
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-32
          Assignee: platform_ppc-32@kernel-bugs.osdl.org
          Reporter: trevor_davenport@selinc.com
        Regression: No

Created attachment 296311
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296311&action=3Dedit
Floating point load test program

On a 32-bit PPC, e300c1 CPU, I am occasionally seeing misaligned floating p=
oint
loads/store occasionally fail.  It appears to happen when a process is
preempted.  Reducing preemption cause the issue to be fare less likely to
occur.=20

When it fails(in the load case), I've traced it down to do_fp_load.  It fai=
ls
when it takes the false branch while it works when taking the true branch (=
see
https://elixir.bootlin.com/linux/v5.4.110/source/arch/powerpc/lib/sstep.c#L=
492).

The issue was originally seen on a preempt-rt kernel, but it can be reprodu=
ced
on a regular kernel compiled for low latency desktop as well.

The issue can be reproduced with the attached program which just performs an
unaligned FP load.  Eventually it will produce a zero and exit.=20=20

Example output:
 11326b98
 22453191
 3357f78a
 446abd71
 557d70b6
 11326b98
 22453191
 3357f78a
 446abd71
 557d70b6
 11326b98
 22453191
 3357f78a
 00000000
 float-bug: float-bug.c:14: main: Assertion `b[0] !=3D 00' failed.

This has been compiled with gcc 9.3.0.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

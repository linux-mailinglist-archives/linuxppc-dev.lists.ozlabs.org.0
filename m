Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF721505909
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 16:13:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KhpnK62Bkz3bdM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 00:13:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FjTMu4u8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FjTMu4u8; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KhpmY6D7lz2xD3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 00:12:45 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CA6EAB80EC4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 14:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 755CCC385A7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 14:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650291159;
 bh=RjMtEVpPDeXUQgA8W1PRFpSRYYm6BHmqog10zI2g0og=;
 h=From:To:Subject:Date:From;
 b=FjTMu4u8MpIF8cpw6BA1+H2q9UR0m7ceyaL3oXUhg7l9D6rpsqvUfy0dMYeUltM37
 nFTApcgvuxn0gzaMUXPPK9vfhUCPoYTOo9r6AFW6wdoD4D/YWW2ENYePq5iZM5UclQ
 q5uNNw2c3wNmka4rL8xaIse+yixrQ2Aja2bbi0C392/rceRh5z7b9EfGdbpr35ykja
 I2t+qrGfq+eKss9ARv3iHbdBwX6IPOb/LVI2ZJoBPMlL9fE2Au9h5LGe6UCjRoYfdK
 TvPJPObfKotXMPOPQLv4zgTPVAh1m882HgekrSup1P4y4hVbLTHMF6+7BuzpzeB7Cc
 XZe26Cjku5wfA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 53406C05F98; Mon, 18 Apr 2022 14:12:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215862] New: clang-14 fails 5.18-rc3 ppc64 BE kernel build -
 <unknown>:0: error: expected relocatable expression
Date: Mon, 18 Apr 2022 14:12:39 +0000
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
Message-ID: <bug-215862-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215862

            Bug ID: 215862
           Summary: clang-14 fails 5.18-rc3 ppc64 BE kernel build -
                    <unknown>:0: error: expected relocatable expression
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.18-rc3
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

Created attachment 300776
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300776&action=3Dedit
kernel .config (kernel 5.18-rc3, Talos II)

# make LLVM=3D1
[...]
  AR      usr/built-in.a
  CC      arch/powerpc/kernel/ptrace/ptrace.o
  CC      arch/powerpc/kernel/ptrace/ptrace-view.o
  CC      arch/powerpc/kernel/ptrace/ptrace-fpu.o
  CC      arch/powerpc/kernel/ptrace/ptrace32.o
  CC      arch/powerpc/kernel/ptrace/ptrace-vsx.o
  CC      arch/powerpc/kernel/ptrace/ptrace-altivec.o
  CC      arch/powerpc/kernel/ptrace/ptrace-tm.o
  CC      arch/powerpc/kernel/ptrace/ptrace-noadv.o
  AR      arch/powerpc/kernel/ptrace/built-in.a
  AR      arch/powerpc/kernel/trace/built-in.a
  AS      arch/powerpc/kernel/head_64.o
<unknown>:0: error: expected relocatable expression
make[2]: *** [scripts/Makefile.build:389: arch/powerpc/kernel/head_64.o] Fe=
hler
1
make[1]: *** [scripts/Makefile.build:550: arch/powerpc/kernel] Fehler 2
make: *** [Makefile:1834: arch/powerpc] Fehler 2

Toolchain used was llvm/clang/lld-14.0.1. Same kernel builds fine with
gcc-11.2, binutils-2.37.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

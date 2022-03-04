Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 640D54CCFA1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 09:08:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K90qD2vHhz30Lq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 19:08:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MrMHWJPR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MrMHWJPR; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K90pT4KnXz2yQG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Mar 2022 19:08:01 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9BC5DB827A1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Mar 2022 08:07:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BE0AC340E9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Mar 2022 08:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646381277;
 bh=tDxjfz0d/UmZhSPdI83e8uUpNdNqKTeW28G/dr+dz4c=;
 h=From:To:Subject:Date:From;
 b=MrMHWJPRHfZDKP83N3C4fO+4GVrX7maT1Fn6aYtV8cQz1jkSN47jmDc0xAfyFKBzz
 3NwM5MBL/A71EyMiAKb4bDo1SqSIxHXugfl0vd7+y5dP1u+Asmu3322YRsoXj9yOKh
 i/enMxyfhcNIQBcsE3CF9bRqfTHt0CiHAo/IOJ6RZ1unl6SOSXlLO3JhqDKj4IW9PF
 z1GX3FAm7QJRgd2zkdKhvF+T8VLVht4U28A7uOVMARrbZ9meHIKunYOFC509tPcXD4
 4we9jHJfHkQcXZcAyNgWPjagX8lh6Q5L573jgVcIYgcYP6OFIOAICH4emZjqtekZ7e
 vGzD/nTC6i3Tg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3BAB3C05F98; Fri,  4 Mar 2022 08:07:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215658] New: arch/powerpc/mm/mmu_context.o Assembler messages:
 Error: unrecognized opcode: `dssall' (PowerMac G4)
Date: Fri, 04 Mar 2022 08:07:56 +0000
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
Message-ID: <bug-215658-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215658

            Bug ID: 215658
           Summary: arch/powerpc/mm/mmu_context.o Assembler messages:
                    Error: unrecognized opcode: `dssall' (PowerMac G4)
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.16.12
          Hardware: PPC-32
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-32
          Assignee: platform_ppc-32@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: Yes

Created attachment 300528
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300528&action=3Dedit
kernel .config (5.16.12, PowerMac G4 DP)

5.16.12 kernel build for my G4 DP on my Talos II fails with:

[...]
  CC      arch/powerpc/mm/init_32.o
  CC      arch/powerpc/mm/pgtable_32.o
  CC      arch/powerpc/mm/pgtable-frag.o
  CC      arch/powerpc/mm/ioremap.o
  CC      arch/powerpc/mm/ioremap_32.o
  CC      arch/powerpc/mm/init-common.o
  CC      arch/powerpc/mm/mmu_context.o
{standard input}: Assembler messages:
{standard input}:30: Error: unrecognized opcode: `dssall'
make[2]: *** [scripts/Makefile.build:287: arch/powerpc/mm/mmu_context.o] Fe=
hler
1
make[1]: *** [scripts/Makefile.build:549: arch/powerpc/mm] Fehler 2
make: *** [Makefile:1846: arch/powerpc] Error 2


This seems to have been introduced by commit
d51f86cfd8e378d4907958db77da3074f6dce3ba "powerpc/mm: Switch obsolete dssal=
l to
.long"

Reverting this commit fixes the build for my G4.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

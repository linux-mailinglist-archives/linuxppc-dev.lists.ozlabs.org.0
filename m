Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A274A9999
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 14:01:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jqwdn2gfZz3bY0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Feb 2022 00:01:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p2CnAmaE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p2CnAmaE; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jqwd453Vbz3bSq
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Feb 2022 00:00:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id EEFD8CE2299
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 13:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6887DC004E1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 13:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643979635;
 bh=292Tsf43R3QSLQjn47FG5nhdhcgNROV2bmigDC8qvsA=;
 h=From:To:Subject:Date:From;
 b=p2CnAmaEKKMhAZTqrBJI0GXeaSpMYe1QFiNLBYlWY2WkdU+QVH+nET8H2kXhO3SpY
 h4i69/Vcvga1MF9CxXh6FFH3CTUuBRE626DKgvTGo6HlsDz8S6dsRoMFqAxw+xfy18
 ioq+Wh6g9BJWF7L+Xu8hQ8kN4qPZHA8vMQSMhD0+K/axhaBAYHZZYCLczhFGe+NwpX
 PoWf5UZYNkRW0iwVInU6PaWqGtKDYZJzx93MaKVYhwSmDJI5uHsoDVrAsY0vKB5yZ4
 qZSydOFYpvk2mL7yyFY8l/sWdE4mxCc6T4g89G+k60pU/JXs2oygtRL8Jl7jmYWN5r
 hVvtIt6ZJjPqg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4C28EC05F98; Fri,  4 Feb 2022 13:00:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215567] New: build failure when PPC_64S_HASH_MMU=n is selected
 in kernel .config
Date: Fri, 04 Feb 2022 13:00:35 +0000
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
Message-ID: <bug-215567-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215567

            Bug ID: 215567
           Summary: build failure when PPC_64S_HASH_MMU=3Dn is selected in
                    kernel .config
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.17-rc2
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

Created attachment 300391
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300391&action=3Dedit
kernel .config (kernel 5.17-rc2, Talos II)

[...]
  CC      arch/powerpc/kernel/stacktrace.o
  CC      arch/powerpc/kernel/setup_64.o
arch/powerpc/kernel/setup_64.c: In function 'setup_per_cpu_areas':
arch/powerpc/kernel/setup_64.c:811:21: error: 'mmu_linear_psize' undeclared
(first use in this function); did you mean 'mmu_virtual_psize'?
  811 |                 if (mmu_linear_psize =3D=3D MMU_PAGE_4K)
      |                     ^~~~~~~~~~~~~~~~
      |                     mmu_virtual_psize
arch/powerpc/kernel/setup_64.c:811:21: note: each undeclared identifier is
reported only once for each function it appears in
make[2]: *** [scripts/Makefile.build:288: arch/powerpc/kernel/setup_64.o]
Fehler 1

Got this with PPC_64S_HASH_MMU=3Dn on my Talos II. When PPC_64S_HASH_MMU is
enabled the kernel builds ok.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

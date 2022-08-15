Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2BC5946EC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 01:16:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M69Bp0Vc5z3bcv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 09:16:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PkibFydS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PkibFydS;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M69B52s5Dz2y2B
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 09:15:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BC9DE60F18
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 23:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D4CFC433D7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 23:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660605336;
	bh=B5bKWHOAxWl6XroxCbuqorJ5ltCPBeQo1AtVdqYRCpc=;
	h=From:To:Subject:Date:From;
	b=PkibFydSw/0FCc81OeqhyvRTpW0HzgSJkatrqjajhQRw4eVgvu86I/fEfdyfsK/cU
	 FGWMTLGnmptLNzAwlBXUXpfff+3+dZ0AeNBwhiUGN+2hc3yAQ0L8Yz1ZU6hBxauRaD
	 +eQz8m6cKafIiq9uJIalI84R5CEhj3yHLFeBgUJrIAZRPNxRsbsPgaCxk/R3uvrhdx
	 +40toP+GhlE54aJl+i+yAW9b8dLXmzEiAuyiW1699Vm6LTizGqcA3eRQ8kocWbJkE1
	 UVXPOfoFx8sJZQ8T66flZKjnZwjVuWOuxC8UkywYghBiEPRMdkws90j/cFW70j12gZ
	 6kJbzmJFKyfQw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0C7D8C433E4; Mon, 15 Aug 2022 23:15:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216367] New: Kernel 6.0-rc1 fails to build with
 GCC_PLUGIN_LATENT_ENTROPY=y (PowerMac G5 11,2)
Date: Mon, 15 Aug 2022 23:15:35 +0000
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
Message-ID: <bug-216367-206035@https.bugzilla.kernel.org/>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D216367

            Bug ID: 216367
           Summary: Kernel 6.0-rc1 fails to build with
                    GCC_PLUGIN_LATENT_ENTROPY=3Dy (PowerMac G5 11,2)
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 6.0-rc1
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

Created attachment 301575
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301575&action=3Dedit
kernel .config (kernel 6.0-rc1, PowerMac G5 11,2)

[...]
  LDS     arch/powerpc/kernel/vmlinux.lds
  AS      arch/powerpc/kernel/fpu.o
  AS      arch/powerpc/kernel/vector.o
  AS      arch/powerpc/kernel/entry_64.o
  CC      arch/powerpc/kernel/prom_init.o
In file included from ./include/linux/nodemask.h:97,
                 from ./include/linux/mmzone.h:17,
                 from ./include/linux/gfp.h:7,
                 from ./include/linux/xarray.h:15,
                 from ./include/linux/radix-tree.h:21,
                 from ./include/linux/idr.h:15,
                 from ./include/linux/kernfs.h:12,
                 from ./include/linux/sysfs.h:16,
                 from ./include/linux/kobject.h:20,
                 from ./include/linux/pci.h:35,
                 from arch/powerpc/kernel/prom_init.c:24:
./include/linux/random.h: In function 'add_latent_entropy':
./include/linux/random.h:25:46: error: 'latent_entropy' undeclared (first u=
se
in this function); did you mean 'add_latent_entropy'?
   25 |         add_device_randomness((const void *)&latent_entropy,
sizeof(latent_entropy));
      |                                              ^~~~~~~~~~~~~~
      |                                              add_latent_entropy
./include/linux/random.h:25:46: note: each undeclared identifier is reported
only once for each function it appears in
make[2]: *** [scripts/Makefile.build:249: arch/powerpc/kernel/prom_init.o]
Fehler 1
make[1]: *** [scripts/Makefile.build:465: arch/powerpc/kernel] Fehler 2
make: *** [Makefile:1855: arch/powerpc] Error 2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

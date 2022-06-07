Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB0053F3E7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 04:27:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHDlH2R8vz3blc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 12:27:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ee5rqWXO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ee5rqWXO;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHDkY3G1Jz2yg5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jun 2022 12:26:29 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1D68B61252
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jun 2022 02:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E8FFC385A9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jun 2022 02:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654568784;
	bh=rOD9UdTvMykJ2UexcoJU5CxUACkPInCVVQE0ukR8OrQ=;
	h=From:To:Subject:Date:From;
	b=Ee5rqWXO2TpQmC0OrOjGFpaHAWgKQdY3BnnBbs6Z3PjmHklxFrLw1o9+s0V/qfm3p
	 QoUG/GzajqKLqsj4LwTczPv9j6KTXl3HQgRPS2rDmHFIcpKlY6G5AvDxKZjCNGdklm
	 1lV8TJA8UnZlK3oH0SvmH3upHyeitOArxY3laAujiswe4BD6nZLxFKU5FLNL/rKd7f
	 776GLPZUa63sXniPfddOJ2x7t7IM3Icy6wBWRzd9eP2TKlc9g+fnvriADD2/3YPrNF
	 6214pzd8vxRtNP4IziM1WqsRsHY4tVx3ESEDcVqFWUpIiXwgZHnaUckKMVmt+uqLkQ
	 gJ05lLk6B7Mhg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5BF76C05FD4; Tue,  7 Jun 2022 02:26:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216090] New: GCC12: printk.h:446:44: error: using a dangling
 pointer to '__str'
Date: Tue, 07 Jun 2022 02:26:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vt@altlinux.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216090-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216090

            Bug ID: 216090
           Summary: GCC12: printk.h:446:44: error: using a dangling
                    pointer to '__str'
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.17.13
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: vt@altlinux.org
        Regression: Yes

There is build error on GCC 12:


  [00:00:26]   CC      arch/powerpc/kernel/trace/ftrace.o
  [00:00:26] In file included from ./include/asm-generic/bug.h:22,
  [00:00:26]                  from ./arch/powerpc/include/asm/bug.h:149,
  [00:00:26]                  from ./include/linux/bug.h:5,
  [00:00:26]                  from ./include/linux/thread_info.h:13,
  [00:00:26]                  from ./include/asm-generic/preempt.h:5,
  [00:00:26]                  from
./arch/powerpc/include/generated/asm/preempt.h:1,
  [00:00:26]                  from ./include/linux/preempt.h:78,
  [00:00:26]                  from ./include/linux/spinlock.h:55,
  [00:00:26]                  from arch/powerpc/kernel/trace/ftrace.c:16:
  [00:00:26] arch/powerpc/kernel/trace/ftrace.c: In function
'ftrace_modify_code':
  [00:00:26] ./include/linux/printk.h:446:44: error: using a dangling point=
er
to '__str' [-Werror=3Ddangling-pointer=3D]
  [00:00:26]   446 | #define printk(fmt, ...) printk_index_wrap(_printk, fm=
t,
##__VA_ARGS__)
  [00:00:26]       |                                            ^
  [00:00:26] ./include/linux/printk.h:418:17: note: in definition of macro
'printk_index_wrap'
  [00:00:26]   418 |                 _p_func(_fmt, ##__VA_ARGS__);=20=20=20=
=20=20=20=20=20=20=20=20=20=20
             \
  [00:00:26]       |                 ^~~~~~~
  [00:00:26] ./include/linux/printk.h:489:9: note: in expansion of macro
'printk'
  [00:00:26]   489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
  [00:00:26]       |         ^~~~~~
  [00:00:26] arch/powerpc/kernel/trace/ftrace.c:76:17: note: in expansion of
macro 'pr_err'
  [00:00:26]    76 |                 pr_err("%p: replaced (%s) !=3D old (%s=
)",
  [00:00:26]       |                 ^~~~~~
  [00:00:26] In file included from
./arch/powerpc/include/asm/code-patching.h:14,
  [00:00:26]                  from arch/powerpc/kernel/trace/ftrace.c:27:
  [00:00:26] ./arch/powerpc/include/asm/inst.h:156:14: note: '__str' declar=
ed
here
  [00:00:26]   156 |         char __str[PPC_INST_STR_LEN];   \
  [00:00:26]       |              ^~~~~
  [00:00:26] ./include/linux/printk.h:418:33: note: in expansion of macro
'ppc_inst_as_str'
  [00:00:26]   418 |                 _p_func(_fmt, ##__VA_ARGS__);=20=20=20=
=20=20=20=20=20=20=20=20=20=20
             \
  [00:00:26]       |                                 ^~~~~~~~~~~
  [00:00:26] ./include/linux/printk.h:446:26: note: in expansion of macro
'printk_index_wrap'
  [00:00:26]   446 | #define printk(fmt, ...) printk_index_wrap(_printk, fm=
t,
##__VA_ARGS__)


This may be related discussion:
https://lore.kernel.org/all/20220601162023.GW25951@gate.crashing.org/T/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

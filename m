Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9864F488C95
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jan 2022 22:42:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JX9Qx3Xjqz3bZL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 08:42:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=crn1wi2n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=crn1wi2n; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JX9Q82CGdz2xYK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 08:41:36 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2441760EAA
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jan 2022 21:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FB78C36AE3
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jan 2022 21:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641764491;
 bh=lIsfRiz3I7d3l5JIXVhiQDK7YTrN/FPRC5rtSjNC260=;
 h=From:To:Subject:Date:From;
 b=crn1wi2nX4gUrpB5ge8QN9YO1FV+aESB0/09wpT5wqk0yDj4DXdwCg9oZVJu610ZG
 +dIn3uTyI+YzPSqjB4QrEgadn3mHNFQMKcYgJi3kbD6TOrVW0qERu4uSUbzI0GFqpH
 s4F7fDSNoIu6J55jR0hHevJe69nCMQKN58EVjRuoab9JZ99wF8zO/TZcTmBsDrzQOt
 ryyKLUFYnYTbcb65mv3VwLnAAtymgsMz2fngoneDSdYTcuB0Cb+jTGvMOlXI9Qrxt0
 9r+QeuX/ZHLxedgJIeKNDQOB2twPJha9jYdRbL0S8zYooWlWzSmZsAAKazaTIBSJ6D
 hjQGae3HtnrWQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 40D69C05FCE; Sun,  9 Jan 2022 21:41:31 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215470] New: Unable to boot NXP P2020 processor (freeze before
 any print to stdout)
Date: Sun, 09 Jan 2022 21:41:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paweldembicki@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215470-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215470

            Bug ID: 215470
           Summary: Unable to boot NXP P2020 processor (freeze before any
                    print to stdout)
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: >=3Dv5.15-rc1
          Hardware: PPC-32
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-32
          Assignee: platform_ppc-32@kernel-bugs.osdl.org
          Reporter: paweldembicki@gmail.com
        Regression: No

Created attachment 300248
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300248&action=3Dedit
my .config file

Hello,

I'm unable to boot kernel on NXP P2020 powerpc processor, image built from
mainline tree after commit:
https://lore.kernel.org/all/1fc81f07cabebb875b963e295408cc3dd38c8d85.161467=
4882.git.christophe.leroy@csgroup.eu/

Workaround:
After revert 1fc81f07cabe, it's start work again.=20

My compiler: powerpc-openwrt-linux-gcc (OpenWrt GCC 11.2.0 r18180-95697901c=
8)
11.2.0, GNU ld (GNU Binutils) 2.37

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

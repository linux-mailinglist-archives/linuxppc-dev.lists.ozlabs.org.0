Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB3A391A4E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 16:34:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqtkB1cC2z30B3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 00:34:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HykoxAdS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HykoxAdS; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fqtjh2GD7z2xvB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 May 2021 00:33:44 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 904B4611CD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 14:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622039621;
 bh=VBL/ctGvMWzbD909sEDSUxz/S8LNJpBYFv2+gD5dUhA=;
 h=From:To:Subject:Date:From;
 b=HykoxAdSmxjfxpcp1m+bxklpyNCHABL9E4iI4rFLmjcEUT8Ek3+7onehop/vLCor1
 8+FxFvua6bhvgnuZMHMHAgNj0cV5P9g+7ghWHXxcjUoHQLCA3+37N9xQnpJtRlDgB/
 dE/LwHMh8uVKBC755YAISa+CuH65dh2FWklgFoIvV6I62eySJ3YYp336kcsmAejoXv
 qb92w8jfQCqHy1gtZIzm/yULCbYPx0XMJHm2DRbyeXW3kO6CaXDXtSdul81V14jjSE
 5vsiaontz+BSfLmcUFafoztTCZDjT4S3QWdmr5tDOfJAiQaApW9zaTppQJwlpkbOwF
 WckGPg+rMs0sw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7BD3961159; Wed, 26 May 2021 14:33:41 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213221] New: Lockdep self tests failing on e6500 system
Date: Wed, 26 May 2021 14:33:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mail@jakemoroni.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-213221-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213221

            Bug ID: 213221
           Summary: Lockdep self tests failing on e6500 system
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.12.6
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: mail@jakemoroni.com
        Regression: No

Created attachment 296989
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296989&action=3Dedit
lcokdep self test failures

Hello,

I noticed that some of the lockdep self tests are failing on my device. The
system is based on an NXP T2080 SoC, which has four 64-bit Power PC e6500 c=
ores
(2 threads each).=20

See attached log.

I'm running kernel 5.12.6 straight from kernel dot org. No modifications.

For what it's worth, I have been experiencing random instability issues, wh=
ich
is what prompted me to enable lock debugging in the first place.

Thanks,
- Jake

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

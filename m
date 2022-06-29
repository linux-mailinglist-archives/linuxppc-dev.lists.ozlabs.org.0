Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DFF560ADD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 22:05:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYC9s4wDxz3drF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 06:05:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=beNK3KfT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=beNK3KfT;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYC982L6wz3bdy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 06:04:28 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 75AE8B826F8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 20:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41193C34114
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 20:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656533063;
	bh=tbYHJd58Wufccl4w8IjHjbrVZVAJHDFm5WdYt8uMVWM=;
	h=From:To:Subject:Date:From;
	b=beNK3KfTevt09V+IGecgP0N+In+IY61Wa+DbN5BQs9cGE8A1U6pip3c/pPnaNUsa6
	 H7B2Y/ZvmunxKlXKtmiWGXXX0PvoU9ymCs+ZQHk7T30GmARQSogmz1Vu7skgc2quya
	 szJPrLXw+dTOtUVaX9RchlfRVxFoEa/qgEoUA2emuOCxGMZBd3izR1vfgDDy5bRstV
	 Fbrkx83fI166GA/FV9hvEdKojqMxWPlWulCQSyxVf6Nlf3HNd+2Ag2iPDxLQxE2dDZ
	 cjcX+mcKqjiYRqlSydWGXmLbx6g5arOXRW1OKHxHAoVB3fdUCeELz9NrWC/uKpQZ0U
	 oWk5eMY/zHL6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 25EBEC05FD6; Wed, 29 Jun 2022 20:04:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216190] New: 5.19-rc4 kernel + KASAN fails to boot at very
 early stage when CONFIG_SMP=y is selected (PowerMac G4 3,6)
Date: Wed, 29 Jun 2022 20:04:22 +0000
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
 priority component assigned_to reporter cc cf_regression attachments.created
Message-ID: <bug-216190-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216190

            Bug ID: 216190
           Summary: 5.19-rc4 kernel + KASAN fails to boot at very early
                    stage when CONFIG_SMP=3Dy is selected (PowerMac G4 3,6)
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.19-rc4
          Hardware: PPC-32
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-32
          Assignee: platform_ppc-32@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
                CC: christophe.leroy@csgroup.eu
        Regression: No

Created attachment 301307
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301307&action=3Dedit
kernel .config (5.19-rc4, outline KASAN, CONFIG_SMP=3Dy, PowerMac G4 DP)

Revisiting bug #215389 and bug #216041 I fiddled around with KASAN builds a=
gain
and finally may have found a clue.

Kernel 5.19-rc4 runs fine with outline KASAN as long as '# CONFIG_SMP is not
set'. It runs perfetly well without any advanced options needed, also setti=
ng
THREAD_SHIFT manually to 14 is not needed.

As soon as I set CONFIG_SMP=3Dy in the attached .config I get a non-working
kernel. It boots but gets stuck very early on a white screen reading
"done
found display: /pci@f0000000/ATY,AlteracParent@10/ATY,Alterac_B@1, opening.=
.."

Interesting thing is that without SMP I also didn't get memory corruption a=
s in
bug #215389 nor stack overflows as in bug #216041 after hours of building so
far.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

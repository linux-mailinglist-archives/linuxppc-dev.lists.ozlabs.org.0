Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D390C5BC4CF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 10:55:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWJR13QJWz3bXG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 18:55:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=plF3f5Fx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=plF3f5Fx;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWJQK06X7z2xDN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 18:54:32 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B2BA560C8E
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 08:54:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 234FDC433C1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 08:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663577669;
	bh=z3OpI/c0u+CbBSFH6pKVwswadrWMR1UFgvhsmAlsO24=;
	h=From:To:Subject:Date:From;
	b=plF3f5FxkPGE+lTeOrp/9pXx7XtX7xF1b252Nji7J4LPV0sUVBIZiCJ4rHKonkCzd
	 OhLMQVNDUYVoOoF3kqthu0lRO6pzy7K6RTgUUwOFhUzjQWHWXd8prSYFDXixJtveFv
	 1cmXSLn9SYJeas7pVR6f+1TB4nGCg5SU94RgcqPhDf0rwIRhRLkwXjGN9SQ/9gzSxO
	 GJljmc13XV2cMlTbBpKwf4dhE7m4++vbr0FC06Y4W6ZiRUh9AMy9QUNT6R2PmDwm7c
	 8k6yMWJFR/fRABtKH+W9saNHUYXIofRdd6G25Ijt6qJgjynVD4V7ZKIbfFZ67Gba2k
	 ZttXncVYPGtsA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0BAE2C433E4; Mon, 19 Sep 2022 08:54:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216504] New: no audio on iBook G4 (powerbook6,5)
Date: Mon, 19 Sep 2022 08:54:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thieson08@me.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216504-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216504

            Bug ID: 216504
           Summary: no audio on iBook G4 (powerbook6,5)
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.19
          Hardware: PPC-32
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-32
          Assignee: platform_ppc-32@kernel-bugs.osdl.org
          Reporter: thieson08@me.com
        Regression: No

Created attachment 301831
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301831&action=3Dedit
Patch to fix audio issue

The audio on my iBook G4 (powerbook65) has not been working. After some tim=
e of
googling I have found out that there has been a patch posted to the debian
mailing lists here:
https://lists.debian.org/debian-powerpc/2013/09/msg00031.html
Unfortunately, this has never made it upstream.
I have adapted the patch in the link to the current state of the kernel and=
 can
confirm that audio now works (even though I had to play with alsamixer a fe=
w).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

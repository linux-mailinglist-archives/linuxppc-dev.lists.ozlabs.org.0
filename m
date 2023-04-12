Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B916DE885
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 02:34:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Px3ct2q99z3cd6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 10:34:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a/gmLT97;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a/gmLT97;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Px3c20NlBz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 10:33:53 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AF7AE62993
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 00:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19C78C433D2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 00:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681259627;
	bh=BwNkWJmqrq2dOQngjXkCx4gnfmiPeR3jrAyF2CXqsTM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=a/gmLT97MjAZk3LYeLgGhRn1NcfHE4isj9v/RsAo8qKdsl3Ol+CVCzXVsZwsmTX1a
	 /6nBQ1/m6fqxt9Iw2JUUwN3iaohyNeJfZCnVibAC5xGTGtpgFiG5wc86OODHT6+W7O
	 tF4W65PYd2W8Goxanpr6KItd79w9oVMUbESEhgUI+B31n2d1hepnUDpkHjRWpRBJqB
	 0SLA/qBG7rWplxm+33DCxlx2r/Fxx6Bi+JwfIyUIMLOeM/JvFs7wNGZTTvU4NnouFG
	 ECsiCnA3D7dZCzoAA+OvlMMPnmt2zBz9Cq1sZlkR2dChqYGNoZN6xkRAS6hKlbl7C5
	 tQR231zVyivWw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F390CC43143; Wed, 12 Apr 2023 00:33:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216095] sysfs: cannot create duplicate filename
 '/devices/platform/of-display'
Date: Wed, 12 Apr 2023 00:33:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michael@ellerman.id.au
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-216095-206035-70NTbFHodA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216095-206035@https.bugzilla.kernel.org/>
References: <bug-216095-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216095

Michael Ellerman (michael@ellerman.id.au) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |CLOSED
                 CC|                            |michael@ellerman.id.au
         Resolution|OBSOLETE                    |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

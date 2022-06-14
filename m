Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3152D54A782
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 05:21:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMYcP13FKz303k
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 13:21:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bVQerjGJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bVQerjGJ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMYbd5wcTz303k
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 13:20:29 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 126C0615BD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 03:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79FE9C3411B
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 03:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655176826;
	bh=ux+b6vefVy0L1zPe9/XKHo9Yu4T2T2h6oe6+sIkfZfw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bVQerjGJAAsA1dzerRNTnO9K2efK0A/KZb9bZT/jzNGTX3cVHgoVWpzlcbZrW1fiE
	 9F/FXSnAJYFx7TUdonNsl3+OWZlvD8vg38OscM6khiQ/WtSxFcQ7krG0n5iR0FgvT/
	 2UxeFGJ9S2/pf7h1A2THFWGp31FFMDzGZtZ5UeTtMyGTDcsmXejJCxCvjIxPm5arSD
	 0FgYXuElVZgK777E12cGM0l1T1J5nU+Tt2yYrX2HmSy7imrbMYRaGcqguJsM7cvr86
	 C3t9Bij8C4o721GKpqfpkhPjPDT5EE/+SR1J8ezCOzU3ipw5dKs8UoRRjzPIKqmE2P
	 KBesr7Vy6oHbA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5673EC05FF5; Tue, 14 Jun 2022 03:20:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 203699] Kernel 5.2-rc1 fails to boot on a Mac Mini G4:
 dt_headr_start=0x01501000
Date: Tue, 14 Jun 2022 03:20:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: michael@ellerman.id.au
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-203699-206035-6Lty9bG8nt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203699-206035@https.bugzilla.kernel.org/>
References: <bug-203699-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D203699

Michael Ellerman (michael@ellerman.id.au) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |CLOSED
         Resolution|---                         |CODE_FIX

--- Comment #3 from Michael Ellerman (michael@ellerman.id.au) ---
v5.19-rc2 is booting on my mac mini with KASAN enabled, so I'm going to clo=
se
this as fixed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

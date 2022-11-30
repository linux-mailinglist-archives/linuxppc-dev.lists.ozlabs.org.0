Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9BD63E2EF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 22:50:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMtD16jzSz3bfN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 08:50:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ll/wmhqg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ll/wmhqg;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMtC16m9Sz30Ky
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 08:49:17 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 22F93B81A76
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 21:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C558CC433D6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 21:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669844951;
	bh=OLaIvuuhSNaebKcdaQ1NjPGDvMeCluRQ8fQL6owGyWw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ll/wmhqg+4Qz5nvl2gXR+XZmFqJPzcDMiBDIT2vMdGZT4nWL0hq9Ezo7avnHR0jjC
	 mF1te2atKFQOl70lwh1b9CbyCazkZjwjPDYVaqocENfV0cqFTkt1LWhlmLgI837OhG
	 soDTNX1sQTy8R3kqT2cb71RJSIyroeBU8Dcr59nLN6RDny0y2/q2Nf5qq2mmEoUSCT
	 zVRjwuo3MLTmRoj+Ofv9jXxGNhXLTddWuCJ8LwID9uTCXiQR6aQmDjgpr45nLdSweU
	 PWzbxGXC+ZiWCN9+n10RkfPjce7baUrzxsOrz3kY9nkNpmY0amiKKCv/WREWmMtwow
	 8Kpu76AcfJ0lA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AD66CC433E4; Wed, 30 Nov 2022 21:49:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216713] BUG: Bad page map in process init  pte:c0ab684c
 pmd:01182000 (on a PowerMac G4 DP)
Date: Wed, 30 Nov 2022 21:49:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: MOVED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216713-206035-n2PE2avlOG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216713-206035@https.bugzilla.kernel.org/>
References: <bug-216713-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216713

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |MOVED

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Moved to linux-mm.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

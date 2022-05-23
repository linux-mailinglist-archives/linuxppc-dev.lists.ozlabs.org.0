Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09030531F6C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 01:53:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6Z0w70zlz308V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 09:53:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UesfZqxB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UesfZqxB; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6Z075bv2z2ypf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 09:53:11 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 975FCB80187
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 May 2022 23:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3ACE0C34100
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 May 2022 23:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653349985;
 bh=hYbMhAd4i7IftSoEVQL6tzJwWG5ir+zwMbb8E/AyS2Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UesfZqxBmXYxC3DEPYmDJ0EGqEH6ygt7L/bldfgUhZQQmyyD/TH+XyQ0sfmnNdBX9
 SSIOIAvzuan4l8UjCtY83eoxQ+227fJD7AdwsZc7a3j10/euPqq2a3wRz6NSUiWFXT
 iY18gIX6tKJiuu/zQpCXmIbWYkMGb6TDBquKQJap530Dd9BL5cIQvWvKxY5FrT3gvU
 OqMocF7VUnBHc88zu1N9Y77UzBv/N9o4k8VT6ToOr6Rkf35gDXwM+xrjIb0ikU9YGl
 mUSH4IavRozAp+IaCSdShdKdOaPLDqm0BE9ZjnmuBixkiAFAn0GkUrmn7jlj439HZ7
 cmhwsQWybuYZg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1D9D0C05FD2; Mon, 23 May 2022 23:53:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215803] ppc64le(P9):  BUG: Kernel NULL pointer dereference on
 read at 0x00000060  NIP: do_remove_conflicting_framebuffers+0x184/0x1d0
Date: Mon, 23 May 2022 23:53:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michael@ellerman.id.au
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-215803-206035-HeNhjd33xS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215803-206035@https.bugzilla.kernel.org/>
References: <bug-215803-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215803

Michael Ellerman (michael@ellerman.id.au) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |CLOSED

--- Comment #6 from Michael Ellerman (michael@ellerman.id.au) ---
The fix was merged into v5.18-rc2 as:

https://git.kernel.org/torvalds/c/0f525289ff0ddeb380813bd81e0f9bdaaa1c9078

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

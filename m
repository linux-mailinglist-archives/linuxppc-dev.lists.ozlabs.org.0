Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDA15A0FAE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 13:58:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MD1gS6nvGz3c4w
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 21:57:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u2jIGSxi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u2jIGSxi;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MD1fl1HHmz3bYS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 21:57:18 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BA9D9B828F4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 11:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60C52C433D7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 11:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661428634;
	bh=aGTBmXijFZiIAgdejUurQU9gEq9PfVNXzL/cAElgEbI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=u2jIGSxiSydvNrXaYCliJlSS0RDg9snnFpq41m1bBt6q3BXwWayXIkiZs163OeQfW
	 ts33jW/y8vRRCyuTxmP1ONRXvAUNKtKJuVRcu4oAJ5UBwYV591ZQVCs6P62uPmBAcX
	 3Wsj9ZeKdRacCJ4toyo5/S6sBhhB0PEUFqv+DOJHNiaM4D+dyKimcn5aSXLsJS1PaP
	 f3XrN7y4lzVjQFAhyZBhAN1I3WRQBhzbE//i/J9am1OL6A06/tJb6rdNy2UvnjqmfK
	 xFSHWpEP4huomCWhJHSRbuWRCeyyxmLMg8LCmmsEar25QSrvdhONn/qHknin0ldr8k
	 cC+0en4ja/mgQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 48DE8C433E7; Thu, 25 Aug 2022 11:57:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216368] do_IRQ: stack overflow at boot during btrfs handling on
 a PowerMac G5 11,2
Date: Thu, 25 Aug 2022 11:57:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216368-206035-p6NcWS7gxZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216368-206035@https.bugzilla.kernel.org/>
References: <bug-216368-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216368

--- Comment #5 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to The Linux kernel's regression tracker (Thorsten Leemhuis) from
comment #4)
> Did anyone forward this to the Btrfs team? if so: where? If not I guess I
> can do that.
I added David Sterba (dsterba@suse.com) to the CC list, who is a maintainer.
Don't know whether that's enough.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE96C820C9D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Dec 2023 19:48:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QG66mJVj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T37Rz4mYnz3cTs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jan 2024 05:48:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QG66mJVj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T37R92ySLz2ytN
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jan 2024 05:48:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6FA4160EA9
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Dec 2023 18:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DAFBFC433C7
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Dec 2023 18:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704048481;
	bh=1LaAnvkM8XafKCVLNg3b4hXjaZCCROqr27AaRjaKO5c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QG66mJVjNP4rQ2/4occIwqd3M7XDYgaYL4ozAjMyAZNfPS4AX0TGyllPQw0wxVF2d
	 P7zZAPpomnbDcALeT/SgIE7rj9s8ri5Q4njIWPK438tKyQAo5cDIjL4p3ZoUQsux5e
	 MacG4I5liELcYdqY11ho7locLhpaXK+rkK6fy4q4IUV1F2yGozs6k/ZaCv1JEbbYxj
	 ShD4+IVXA1X4ZQSw+cgR6x/d4vvxDkjk/KQki8z+s+rRHSv8CdSkH3eCB54/ZoR3F/
	 te9TwozQOwiizrVEP6CbC97r4CzKLZLh542qhgDBo51ZDoPMUNG8ViW91bvkdxLWN5
	 +VJLGpfaJJ5Jw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C622DC53BD0; Sun, 31 Dec 2023 18:48:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216368] do_IRQ: stack overflow at boot during btrfs handling on
 a PowerMac G5 11,2
Date: Sun, 31 Dec 2023 18:48:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216368-206035-Pypb0Vmlhn@https.bugzilla.kernel.org/>
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

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #9 from Erhard F. (erhard_f@mailbox.org) ---
Have not seen this on my G5 and the Talos II since some kernel releases.

Closing as obsolete.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

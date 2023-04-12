Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F746DE88F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 02:48:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Px3wc17Hjz3cht
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 10:48:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N48o5+RH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N48o5+RH;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Px3vn3NHQz3bVc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 10:47:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 564FF62C77
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 00:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8DD6C433D2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 00:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681260450;
	bh=KPli3LYWT4KOSAAWm97PzrhWbArt//zsnTkWw/NV9FM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=N48o5+RHIc0SkkuYmPVdT/Hu2cr3yoYOFQ+xJGeuKppwYTmrXZxDbuyCt7wD+PDR6
	 SUD8iB8MsGtqUaYXKzfLK9zDBsNhNDe3MqbVEahesu+qKHlSyINR1x43MERtdu8uB6
	 6MoumTftAvuRGoyEDioaTdVR5WQ87zXTL+5XkUUxfbxz2lW8v5qGa73umLNzJWtiW9
	 oFVRgQjs2asDIdH2TEs3hrMzU8Tz9ASVKrdH9Du1MitX1wfR7lOSA7gqeYvZvgKVH0
	 AOAeO3m7kmcBEmLglm6kTOByeuPtVeCLlj/uV7y1WuGmlrNRm2u/q6Ghm918VUAcSE
	 SFGoauNn5O79Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 97EC5C43141; Wed, 12 Apr 2023 00:47:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216041] Stack overflow at boot (do_IRQ: stack overflow: 1984)
 on a PowerMac G4 DP, KASAN debug build
Date: Wed, 12 Apr 2023 00:47:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michael@ellerman.id.au
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-216041-206035-u9lkB2DOfM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216041-206035@https.bugzilla.kernel.org/>
References: <bug-216041-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216041

Michael Ellerman (michael@ellerman.id.au) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |michael@ellerman.id.au
         Resolution|---                         |CODE_FIX

--- Comment #9 from Michael Ellerman (michael@ellerman.id.au) ---
The two patches mentioned in comment #7 were merged as:

3e8635fb2e07 ("powerpc/kasan: Force thread size increase with KASAN")

https://git.kernel.org/torvalds/c/3e8635fb2e072672cbc650989ffedf8300ad67fb

41f20d6db2b6 ("powerpc/irq: Increase stack_overflow detection limit when KA=
SAN
is enabled")

https://git.kernel.org/torvalds/c/41f20d6db2b64677225bb0b97df956241c353ef8


The boot failure with v5.19-rc1 might have been some other issue?

I'll close this for now, please reopen if you see this again.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

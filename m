Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC10496887
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 01:15:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgcFf3pj0z3cDy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 11:15:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qfn7cj1d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qfn7cj1d; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgcDx1khVz2xB1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 11:14:25 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B8314B82139
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 00:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74B4EC340E7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 00:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642810458;
 bh=AzgSz7dTTZRCEBWzQbP442fsYz6IGaQr9YAcf9Mt/1Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qfn7cj1dUWfylSwgxzHzmchYQnGLNVy5j8DC/v26J0+bQATH4ZYeYdHLh+1IKCy9G
 xynbUgiY6ATqVodt59OCR/EQO/ZiK9FCKum8I20oCZisLZnQe/MPNNg95Q8Z67mFIX
 j9cFA7bFrX08QKaweIvxr1Uo6r6g4bb/LAVtFlfKtw4NbBMPJlQpJczC6OU/YJx80J
 UA9N8j2KBkkqdq4o7UQDQiApD7evXR7lxAGu9JIh7bRpz7xj2t3/a4W9bijzUCZ8RQ
 Zhxphx048Bg095nOLKRhGqny1aIZBLDhUYsFxnXpH/HweClIWS/2H46Yv5jIMlusG6
 OxQ/w0eSEVOhQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 52B9DCC13A6; Sat, 22 Jan 2022 00:14:18 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213837] [bisected] "Kernel panic - not syncing: corrupted stack
 end detected inside scheduler" at building via distcc on a G5
Date: Sat, 22 Jan 2022 00:14:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo CC platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-213837-206035-huZuIYXyui@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213837-206035@https.bugzilla.kernel.org/>
References: <bug-213837-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213837

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|"Kernel panic - not         |[bisected] "Kernel panic -
                   |syncing: corrupted stack    |not syncing: corrupted
                   |end detected inside         |stack end detected inside
                   |scheduler" at building via  |scheduler" at building via
                   |distcc on a G5              |distcc on a G5

--- Comment #15 from Erhard F. (erhard_f@mailbox.org) ---
This may look a bit odd at first to cause memory corruption while building
stuff, but as I do the builds via distcc on another host (sources are fetch=
ed
via nfs from this host too) it seems possible.

Problem is the 'bad' commit is a merge and reverting it on v5.16.2 for a te=
st
via git revert -m1 c2c11289021dfacec1658b2019faab10e12f383a  gets me some m=
erge
conflicts which I don't know to resolve properly..

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
You are watching someone on the CC list of the bug.=

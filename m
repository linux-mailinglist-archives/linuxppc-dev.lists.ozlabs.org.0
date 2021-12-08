Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E896546D614
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 15:50:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8KpD6Hdwz3bYW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 01:50:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c9K+Maxf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=c9K+Maxf; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8KnW1q1Kz2xYK
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 01:49:35 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 43BC8B81CF1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 14:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F24D4C00446
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 14:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638974970;
 bh=MGSt9y0Lrqy51dc0wAjdvRkKkme1VLunla7B/IRyWNk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=c9K+MaxfgISugzbTc7jlADz6vgMHfcUcK+ARwe78TXls9g3LTdn6dBZWN1ih+qX9A
 MZFTgnDPUzls00B7C28+F+D3jgSbobjhe7z2EXmA2530r7ux+0mQgYdezgWMHwstgN
 iQui6oGKbvOvA8Ezazgkt64rCeRn+rm0LB+5jVMGYR7zz0usaFGkqFiBrFT7NUHht5
 5sG0ZKvnGhjfldjZXI4XIIrUpbdQt8GwjlFMQIajEuYXTDuPBNWG7Q4B7//T9gch23
 RYQnyUehBaTDnTl+40/Pg7z2WbCLYvyLU//vA9iLCUtBDU3J4hFyFC2QIvGC6NMvDW
 CkP3iLDJbRnJg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C591D60F22; Wed,  8 Dec 2021 14:49:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215217] Kernel fails to boot at an early stage when built with
 GCC_PLUGIN_LATENT_ENTROPY=y (PowerMac G4 3,6)
Date: Wed, 08 Dec 2021 14:49:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215217-206035-eKUgQXaXSU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215217-206035@https.bugzilla.kernel.org/>
References: <bug-215217-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215217

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 299935
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299935&action=3Dedit
kernel .config (4.18.20, PowerMac G4 DP)

Hmm, strange...

I tried to bisect but found out that this issue goes back to kernel v4.18.2=
0 at
least. This one is the earliest I am able to build with
GCC_PLUGIN_LATENT_ENTROPY=3Dy, kernels before error out with:

make: ngcc: No such file or directory
Cannot use CONFIG_GCC_PLUGINS: plugin support on gcc <=3D 5.1 is buggy on
powerpc, please upgrade to gcc 5.2 or newer

I used gcc 9.4.0 and reduced the kernel .config a lot but it's still the sa=
me.
v4.18.20 with GCC_PLUGIN_LATENT_ENTROPY=3Dy freezes at this early boot stag=
e,
without GCC_PLUGIN_LATENT_ENTROPY booting continues.

Also GCC_PLUGIN_LATENT_ENTROPY=3Dy makes no problem on my G5 either. So it'=
s only
the G4 which is affected. Wildly guessing this may be a 32bit PowerPC gcc
specific thing?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

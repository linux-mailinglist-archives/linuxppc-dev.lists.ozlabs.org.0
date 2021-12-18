Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3505479827
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Dec 2021 03:20:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JG8h66JZNz30R6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Dec 2021 13:20:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=otf26BUe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=145.40.68.75;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=otf26BUe; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JG8gP6zQwz2ynK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Dec 2021 13:19:29 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 54939B829BF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Dec 2021 02:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19083C36AE7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Dec 2021 02:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639793965;
 bh=xnzWQdkyRwf2X6XKwsX87ERpHsqzYDD1psXegys9sls=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=otf26BUelBZOBXsKkEcLW9aK/P48rGgVNfdqxPyvkiyit6UD/MGFXt3v/ZduijuMR
 2VKm1eJWMmXJo+awzHv/JILogEm9q5r0Xy2UyLNEUHUk4aRslFRkER2LBSDL172ztu
 7VoR78b8waN5pDXDVvNULadQoxkGvbGpQpQTRdOWhLmtRTSpFPraRedd0Uoevsl8Ew
 lEIaLZB4jObSYP2wjK41bzaCaYTe90Hit8Ih1kyW+AIsK9xVmH+hB1U0n76KL/DhcP
 W40PlnTzcqsR1TYyPEtn72brFN0OL3DgXfNdCvfcCxAOmDQTYc8VDQxiS9fptmFvST
 tW+rkV2EPY2XA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E668160F54; Sat, 18 Dec 2021 02:19:24 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215217] Kernel fails to boot at an early stage when built with
 GCC_PLUGIN_LATENT_ENTROPY=y (PowerMac G4 3,6)
Date: Sat, 18 Dec 2021 02:19:24 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215217-206035-Jb3UdAwqM2@https.bugzilla.kernel.org/>
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

--- Comment #14 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Christophe Leroy from comment #13)
> arch/powerpc/lib/feature-fixups.o also need DISABLE_LATENT_ENTROPY_PLUGIN,
> see extract from you vmlinux below
I can confirm this works, thanks!

I need

arch/powerpc/kernel/Makefile:=20
CFLAGS_early_32.o +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN)
arch/powerpc/lib/Makefile:
CFLAGS_feature-fixups.o +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN)

to make it going on my G4 with GCC_PLUGIN_LATENT_ENTROPY=3Dy. Modifying
setup_32.o is not needed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

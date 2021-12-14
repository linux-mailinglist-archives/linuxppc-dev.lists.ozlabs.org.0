Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 709764739B9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 01:45:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCfnH34YJz2yxV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 11:45:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eKh9r4AL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eKh9r4AL; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCfmY53n4z2xsG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 11:45:17 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0D69D612C6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 00:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 736CDC34603
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 00:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639442713;
 bh=xx1brTUdX/hppIxlt1a53qTuY1VhG48JsF0r7g4uduc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=eKh9r4ALqDqfnJ7OOCtzVnM6ozouie8ImOrQ6uve+IaZy2AUIqSGCM4YeCUpR3qRY
 dpoybj21RsUiVH7Q5ds7pxogiQmXFhb9/SoBScY/5jXm61+lGVgPmC1ssgRserGB1D
 T0hc2HVRJ7qkjQF5k/RyTkJ5aJX8QdcgGqYeO3jr15qTMInvj3mQYP3/Km+4wFNjY/
 0/sXg+zprXVuG24ebCM6aaPhYySQ6dj4hcb1sGDmPWJ4Ps3JTljlIQrejTsgv9Kg7O
 DxaUnldanWo1lJb1lcdkRDs766wqUXWDkZN9fabuVtOXKb/xJaP8+0pdIWKgWjWVBN
 Hmbb5Cohfb6+g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5084C60F59; Tue, 14 Dec 2021 00:45:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215217] Kernel fails to boot at an early stage when built with
 GCC_PLUGIN_LATENT_ENTROPY=y (PowerMac G4 3,6)
Date: Tue, 14 Dec 2021 00:45:12 +0000
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
Message-ID: <bug-215217-206035-AHsAwhT0P2@https.bugzilla.kernel.org/>
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

--- Comment #10 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300015
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300015&action=3Dedit
kernel zImage (5.16-rc5 + CFLAGS_setup_32.o/early_32.o +=3D... , PowerMac G=
4 DP)

Unfortunately still no success.

Relevant section in the Makefile now looks like this:
CFLAGS_early_32.o +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN)
CFLAGS_setup_32.o +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN)
CFLAGS_cputable.o +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN)
CFLAGS_prom_init.o +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN)
CFLAGS_btext.o +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN)
CFLAGS_prom.o +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN)

I'll attach the generated zImage, maybe you can make something out of it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

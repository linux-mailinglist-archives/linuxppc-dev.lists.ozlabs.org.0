Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D77346E778
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 12:19:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8s4y18Bhz3cCS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 22:19:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qImgaJ3L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qImgaJ3L; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8s4C6Hqjz2yX8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 22:19:07 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 548AFCE2559
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 11:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86F1BC004DD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 11:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639048741;
 bh=rKEmlW1wk5aWIqvH9KTw+iY9+1AsVt6Ku1lhoA2uDFc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qImgaJ3LpOtXkWRIDxV9INT6vUoLb0WPAiJDvGJC2FtRQ5P0mVdd87LdYe4wxLHcD
 KmYrOaaWPO1nNAu6lqOSB19a2eafF2FgeIC96Jgg6hiKF/+obxTX53ryRRzgSS0v13
 rPLC9vc95oy8cbmU5wDYWvLtoYLRuigwYQOSzpgsx7gZ2m3RBO64sW6wqcw7zWEF+0
 qE+q7j/buYOGz1sQ9yglzWKxmfXkZ7XtNEj4+wOsf4SQWK30Ek4JCOijP7xzuV4N80
 zy/0IbVViGvGHmtSh92++NzeRaNLP6T/V761W1DrgO3js61qBIS3X7ULoXnISRuxHH
 kFQcMbXNnuWEw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5E15A60F48; Thu,  9 Dec 2021 11:19:01 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215217] Kernel fails to boot at an early stage when built with
 GCC_PLUGIN_LATENT_ENTROPY=y (PowerMac G4 3,6)
Date: Thu, 09 Dec 2021 11:19:01 +0000
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
Message-ID: <bug-215217-206035-C4uffkcc8I@https.bugzilla.kernel.org/>
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

--- Comment #6 from Erhard F. (erhard_f@mailbox.org) ---
Ok I cheked that out. There are already some in the Makefile:

CFLAGS_cputable.o +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN)
CFLAGS_prom_init.o +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN)
CFLAGS_btext.o +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN)
CFLAGS_prom.o +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN)

I added CFLAGS_setup_32.o +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN) on top of t=
hat,
rebuilt the kernel after a make clean. No success so far, the kernel still =
does
not boot.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

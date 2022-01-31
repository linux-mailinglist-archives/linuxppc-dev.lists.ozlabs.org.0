Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9334A3E4B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 08:42:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnKlK4lsjz30RT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 18:42:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XdLqwDg+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XdLqwDg+; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnKkY4fqVz30LP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 18:41:25 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8EEA9CE100E
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 07:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0518EC340E8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 07:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643614880;
 bh=TPyulXwwazzCccJNQC1/X9oGruN6YxGit9uUrDv3xHA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XdLqwDg+RpHj5t2nGlUOKtZY9ADQVl7d4Tkdt4L/vT6I5yVc3GeARb/6F2Uh9g4S8
 FSOm2cmPwLLeKUpk5M+uXPsibHShSWz7d5urEH3AdnvKalrs9/meZGkOHt8oejTT5r
 HIwEjEoGC0yxG6v/BIrPgFhUmFAqzyApDaRGeU9fkb0Uq870qbrFAqOSUDI/XTDfAI
 P9FJckW2ZLOjR66+NJnmvBPgGFfYm4vamokaHopE0H5N0j/j71QwnKLcNn7ZcoL+BJ
 XJ/W14wD/+eARccWhPmNmCitU+LrTINQDeAW4MScTDIIEnwdRpp0kjA7kOzp7rJVR+
 hSe5hyQ+5ukog==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DB005C05FCB; Mon, 31 Jan 2022 07:41:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] pagealloc: memory corruption at building glibc-2.33 and
 running its' testsuite
Date: Mon, 31 Jan 2022 07:41:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christophe.leroy@csgroup.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215389-206035-cRMd2ONEmD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215389-206035@https.bugzilla.kernel.org/>
References: <bug-215389-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215389

--- Comment #10 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
Thanks for the tests.

I'm not surprised that the system doesn't poweroff or reboot without ADB_PMU
because the PMU manages power.

The "neverending build" is maybe because the PMU also manages RTC clock and
without it you get inconsistent time ?

Anyway, it looks like there is indeed something linked to VMAP_STACK.

I'm wondering whether you could be running out of vmalloc space. I initially
thought you were using KASAN, but it seems not according to your .config.

Could you try reducing CONFIG_LOWMEM_SIZE to 0x28000000 for instance and se=
e if
the memory corruption still happens ?

To do this you'll need CONFIG_ADVANCED_OPTIONS and CONFIG_LOWMEM_SIZE_BOOL.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

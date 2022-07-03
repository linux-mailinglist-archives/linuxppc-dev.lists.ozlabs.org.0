Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EA65649EC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Jul 2022 23:25:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lbhmh03hyz3c15
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 07:25:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tpEk31p9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tpEk31p9;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lbhlv47Pxz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 07:24:43 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 35795611D0
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Jul 2022 21:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8129FC341C6
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Jul 2022 21:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656883479;
	bh=WLyqRtbI+VYZPb1jjLztmnmMkwQwPzY1kmon1EVbfcw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tpEk31p9VMeJUeeT6KjPsFG9jYtr02CeXapidhFF8gznWuEcdkL0CWhczsRP3slHC
	 kv5ygC/di9mpcZa6/LqZSi7os3C/2RJyAX3T3TFBGT2WrtnD9pC13svaRdWVZ5hUQS
	 ai35a3A9BbmuDUy76BwVhmOTBgweFTfEetUyYemqTzhKY/dJwnUa49pfTf4Hx0v7SU
	 NyGRsdqNLXPSs8QO7kGLevlT6pKqgqHZipIviH5g+PZ/2hpKk7VtoZCtX7dz9dB/d9
	 WKLjMVfSMsXOHVoJBAokmpW73n/TVqO0XJEpipeaWP4oCLXOuNhlpaf9xZh6WKJvt7
	 5adbv/W5P/6hA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 662BCC05FD6; Sun,  3 Jul 2022 21:24:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216190] 5.19-rc4 kernel + KASAN fails to boot at very early
 stage when CONFIG_SMP=y is selected (PowerMac G4 3,6)
Date: Sun, 03 Jul 2022 21:24:39 +0000
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
Message-ID: <bug-216190-206035-JVZ7ym8CZG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216190-206035@https.bugzilla.kernel.org/>
References: <bug-216190-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216190

--- Comment #3 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Christophe Leroy from comment #2)
> Problem is likely due to commit 4291d085b0b0 ("powerpc/32s: Make
> pte_update() non atomic on 603 core")
>=20
> kasan_early_init() calls __set_pte_at(), which calls pte_update() if
> CONFIG_SMP, and pte_update() calls mmu_has_feature() since above commit, =
but
> that's too early for calling mmu_has_feature() so mmu_has_feature() tries=
 to
> warn using printk(), but that cannot work because the KASAN shadow is not
> set.
>=20
> Can you try with the change below ?
Applied your patch on top of 5.19-rc4 and can confirm it works. Thanks!

I'll close here as soon it is in the -rcs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EBC585A8F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jul 2022 15:16:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lw4df5fwkz3bhK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jul 2022 23:16:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iN3qWUWk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iN3qWUWk;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lw4cw0XVjz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jul 2022 23:15:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0785260CFA
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jul 2022 13:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64871C433D7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jul 2022 13:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659186923;
	bh=JXwdKfcqQqXToaqCp/kZjzT549N3VWHXfg31UeV1FpQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iN3qWUWkdlhhxd4M+ONb7UsL82SFNQqSZUlYZZ9VKlpz0XnnDVfogZhC7bM++fGUl
	 HULJ1fwKEC6ba4LPUZN+M8ReTOOL8p0Ia3rdKL5MVpdan2M6kGoOHuiwUjuK31J471
	 ULr7krRSoKE+57Gik/+JKp6k2Eu9YBU60+pK8SFJufOGuyKImqjd+RLfRSgzIWSpiV
	 buW2Mvz2a9uPt9WWWYxdlLYW8/tUHyhTgdHI6nL/iViCYdcnD3c+KbhtEAJawrs7Ic
	 fQTI6WEaM3Fef5IkeBRmV1fHKAwJKihypLz/L/FA4+8y4QFfyyRqKDgOgVRmV+dfYn
	 Z32uBT2xEV3iQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 443FCC433E6; Sat, 30 Jul 2022 13:15:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216183] [bisected] Kernel 5.19-rc4 boots ok with
 CONFIG_PPC_RADIX_MMU=y but fails to boot with CONFIG_PPC_HASH_MMU_NATIVE=y
Date: Sat, 30 Jul 2022 13:15:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216183-206035-is5Hx8vEes@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216183-206035@https.bugzilla.kernel.org/>
References: <bug-216183-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216183

--- Comment #10 from Erhard F. (erhard_f@mailbox.org) ---
For verifying I tried to revert a008f8f9fd67ffb13d906ef4ea6235a3d62dfdb6 on
current -rc and 5.15 LTS but reverting was not possible easily. Seems the
kernel meanwhile diverted too much.

Anything else I could do to help debuggin this issue?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEAD53710C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 May 2022 15:08:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9zPq2H9Bz3blC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 May 2022 23:08:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KRlwMX/O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KRlwMX/O;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9zP43FF5z2yJ5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 May 2022 23:08:08 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C6D660DEC
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 May 2022 13:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A193C385A9
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 May 2022 13:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653829683;
	bh=R+8KecyJXvo0JVjfT9hQVu7ZExpmN8YUULo3AbgTS4I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KRlwMX/OIBGOPrmYtieLn7cJ9vbdg1hcbER9md0bzB9h2eGJRiSxWdOyZYab8uLOS
	 o0nEQWBB17Zt9FLMLhhJ/HgcvmKiTfFHvPjWbNKMaIFnOOZUJFExPIkVPotwMJD/7f
	 88LacMwA1SJ3Vl/p8BZldii73nTqlKQYn1lvYJUjLOtbBU1je9HS4wNZTch+VOcUyv
	 FZNDG7IZXzFFHJH7kqUW4qqyyLFgyeAOmum3fTHpdm9pBx7Ji0VkQ/Clo+evitKQLk
	 sRApqeQTQlFssi2trcf2FpT9MwZ1gZrT6dXaR9E5CZVkKq10wuqokNoZsV3PiESdoG
	 XqC5/M4BIz1Ig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7E2D7C05FD5; Sun, 29 May 2022 13:08:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216041] Stack overflow at boot (do_IRQ: stack overflow: 1984)
 on a PowerMac G4 DP, KASAN debug build
Date: Sun, 29 May 2022 13:08:03 +0000
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
Message-ID: <bug-216041-206035-xwwj095XHA@https.bugzilla.kernel.org/>
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

--- Comment #6 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Christophe Leroy from comment #3)
> I can't see any issue, other than your CONFIG_THREAD_SHIFT is set to 13.
>=20
> It should be 14 by default, see
> https://elixir.bootlin.com/linux/v5.18/source/arch/powerpc/Kconfig#L769
>=20
> Is there any reason why you set it to 13 ?
I was not aware setting it to a custom value. I thought 13 is the default on
ppc32 which gets overriden to 14 if I select KASAN?

But I'll make sure I'll double check this on future builds. Only advanced
option I did set is CONFIG_LOWMEM_SIZE=3D0x28000000 (see bug #215389).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C02536E03
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 20:00:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9Tx43KxTz3byT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 May 2022 04:00:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qajevGr0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qajevGr0;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9TwM1ZMQz3bkG
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 May 2022 04:00:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4519F60A3C
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 18:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5481C34113
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 17:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653760799;
	bh=384i0G6StZ52ihgkd4pLC6/F5VdWa9pm3iaArCn3giw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qajevGr0WqKueUaChBZTA0A6Qt66TMEkJLzgvHdDeSgfYFie963uSZlLGCQCtwyX7
	 QlW5WH06dJ0SBzRJRYKW9nPxSJ68PPqgx9HV6ZRxPdX0Vv8vPP0UfPRCabJxoy/Rp9
	 /k6M0g2Kpe3ACvA2F8Agq+JWGRxxYyXxHNOfuGxLlPk/n3F/suOhB70bkjWB9KxAjD
	 8t5nzhrmQA0LqxzgwpRYfZqSet9FxVQnddVOQMeIb1A1AwUqez0uJVZwC+EaB4yct/
	 fulRk78+bjPNusNkJ76BVT7EV6eIpRnvCqcG05b960zWO6Gg2hpLQU4fQ12VBjQeXJ
	 PB1AQnkyRrFYQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8B8F2C05FD2; Sat, 28 May 2022 17:59:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216041] Stack overflow at boot (do_IRQ: stack overflow: 1984)
 on a PowerMac G4 DP, KASAN debug build
Date: Sat, 28 May 2022 17:59:59 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216041-206035-kzx69vWV7M@https.bugzilla.kernel.org/>
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

Christophe Leroy (christophe.leroy@csgroup.eu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |christophe.leroy@csgroup.eu

--- Comment #3 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
I can't see any issue, other than your CONFIG_THREAD_SHIFT is set to 13.

It should be 14 by default, see
https://elixir.bootlin.com/linux/v5.18/source/arch/powerpc/Kconfig#L769

Is there any reason why you set it to 13 ?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

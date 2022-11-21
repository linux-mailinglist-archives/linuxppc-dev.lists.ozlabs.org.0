Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAA0631B27
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 09:20:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NG0gq1Jj2z3dvW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 19:20:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NlIoFVNo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NlIoFVNo;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NG0fp6lJHz2yph
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 19:19:30 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0ED4860EF3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 08:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4F61C433D7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 08:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669018766;
	bh=NK5UHQlFig8jicsa3shGe0q/oy2kT+1/4/YK0aQMaOs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NlIoFVNolO2hI2Jk9eK/G7nvJ/TK5E31rcWDpp2pExrWpwD+KgxukA8xCRw4aKNoq
	 JefpMooBWoXqQIGA3d0ScAaGZROqNYC6TRLOMRrc5dVP5424ns9qpglRoWGqzzRM1f
	 wVs2nwOXZHvH6gezlqSGCuRLnJWQNhHDW21N7oOwNbpXLx8ztckJ9hmelPSgeeLCtg
	 cT1a+z+Htvjqyu2zgmLV12eu8Gb2rh9AK25xgqK/SpB6IjZwj5a597ZAT7PeVVwjt3
	 UKNK18CI7W5LBbsRUW5j1CjkImF17SKtTa8/YjbZXIiLUPIyTH05Pqhr5iu1zXxBib
	 fr9ID5KvJPOcA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C22EAC433E7; Mon, 21 Nov 2022 08:19:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216715] kernel 6.1-rc5 + KASAN_OUTLINE fails to boot at very
 early stage when DEBUG_PAGEALLOC_ENABLE_DEFAULT is enabled (PowerMac G4 3,6)
Date: Mon, 21 Nov 2022 08:19:26 +0000
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
Message-ID: <bug-216715-206035-1h681KFz8R@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216715-206035@https.bugzilla.kernel.org/>
References: <bug-216715-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216715

--- Comment #1 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
I have no problem booting 6.1-rc5 on QEMU with your config.

What happens if you remove CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT and instead
pass debug_pagealloc=3Don as parameter to the kernel ?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

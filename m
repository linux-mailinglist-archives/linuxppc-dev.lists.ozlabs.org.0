Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A82EC536C9F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 13:44:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9Kb03T9Cz3brJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 21:44:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fg/Ibc5J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fg/Ibc5J;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9KYy08Gfz3blZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 21:43:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1881360E07
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 11:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8158CC34100
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 11:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653738211;
	bh=jqanm0FE8sFLWARv4mXZYoGUOEQpMe/J1tnBYOCATes=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fg/Ibc5Jt/pQVuYdFkXGWTlENfJ8JpI/E1/mpkCAV9aUgY7u0/xQupi96xfODpReh
	 ZH5TAvm5MNe23P39JhZU+GHUIPqRMr3sT0HABAHR8x7dikMiyBaH4vdT2RUwx2BWv4
	 aZsbHxYTxvba022I1FeXYf88zCigXzKk1cYXCx5/rsnyPo5jCJNM1plqEA0vMVHecv
	 RRQXYg3aqp4S7c15+xj7xndFPFvPw+rZraX3/vfC8Hp0ycNO3NyzIaxQ6G1nDth7bV
	 0nI4aW9pS+jS7buVfLb64SgXPoWa4efCKglGj1e8jBEENKurw/4pfLhnirz7TDgSCY
	 W9Nym9yBVrfpw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 71CB5C05FD4; Sat, 28 May 2022 11:43:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216041] Stack overflow at boot (do_IRQ: stack overflow: 1984)
 on a PowerMac G4 DP, KASAN debug build
Date: Sat, 28 May 2022 11:43:31 +0000
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
Message-ID: <bug-216041-206035-otHwkLh4IF@https.bugzilla.kernel.org/>
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

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301066
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301066&action=3Dedit
dmesg (5.18.0, PowerMac G4 DP), case 2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

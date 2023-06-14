Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 104A570E923
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 00:36:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQq176tF6z3fGw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 08:36:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aFvOw2gw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aFvOw2gw;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQq033ZRVz3f90
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 08:35:31 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 910E461B56
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 22:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC25BC433D2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 22:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684881329;
	bh=pNL+af/6FwQaFpV/zxw0Lrou2pBfoajt2ThnKhKMWLs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aFvOw2gwBanlaEGvp4YicY5U0iwwsYwiFb5oucb+Vs2YlhRYajtlpob4CYhYYWNbw
	 p2ghufXlLZDP54r4GxZv1Wsh0bVEgnWY3pStmOJ+ARdmiI0+yAtZgdEqeyr40ynPiq
	 GEwUc89jDeM6j/BBOAk74hX7UDLDN2tScYbExepyIelNTiCAOgbWMxIT9ESmGBka6G
	 GgvWuq9kSk/dlgC9WRvpCh2PrCrKd5rnv/Fjry8HH6VoCUPv7sNIbH7gnxBWe1PtZ8
	 6/xjRHgUq7O100H9vKfM+QbcawlubZC3C2HJGoOPXkzDBodg8AuqMILFo8ISp7NaIa
	 kpP0KD5//LG6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DE103C43142; Tue, 23 May 2023 22:35:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216715] kernel 6.1-rc5 + KASAN_OUTLINE fails to boot at very
 early stage when DEBUG_PAGEALLOC_ENABLE_DEFAULT is enabled (PowerMac G4 3,6)
Date: Tue, 23 May 2023 22:35:28 +0000
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
Message-ID: <bug-216715-206035-zi6fO4U0RL@https.bugzilla.kernel.org/>
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

--- Comment #8 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 304311
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304311&action=3Dedit
kernel .config (6.4-rc3, PowerMac G4 DP)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

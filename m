Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B49596615AE
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 15:02:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nqf0h3nklz3c9g
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 01:02:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GhI/Usux;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GhI/Usux;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nqdzm2Ynhz2xvL
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 01:01:56 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 07E6460C81
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 14:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D31EC433D2
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 14:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673186513;
	bh=qLSvjXLZyS2p17UOE/rl6AUsVWLoSCF3NP7Y2gdrlwo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GhI/UsuxgkgehDt5jRaQD4K4nFuOR+e7j0ZwV2VdzEhUFbkuQr39k07zSTx3zF156
	 OOgXwxEhuIrShKntT49tI+2XSEqjUAaPXq4kzFmyBa4JaltoKA/rJUtMFKHHTIiso4
	 LF0R8rtn8znEx4vXBKZsy3s4IPEdZTdSjEwE+0yjrHbF6p+DHy28J1XRhluzSTZgso
	 LXKkALINw4GwvzMjv1Bji2Nz835acFFztBoliemehqHvsZpzejKrDFDUeWw2p2JG5l
	 7rf7yvozazceZcE7FrkIC5GXr99IFf5gcyoeTGq5AzfepJ9LNFwGVKl8BFrdB2Ryfp
	 iPufTN2s73iwA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5B104C43142; Sun,  8 Jan 2023 14:01:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216902] WARNING: CPU: 0 PID: 70 at
 kernel/locking/irqflag-debug.c:10 at kallsyms_selftest
Date: Sun, 08 Jan 2023 14:01:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216902-206035-SM4jYi4yZ5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216902-206035@https.bugzilla.kernel.org/>
References: <bug-216902-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216902

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 303552
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303552&action=3Dedit
kernel .config (6.2-rc2, PowerMac G5 11,2)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D80F163165E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Nov 2022 21:38:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFj5Z4qWqz3dvf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 07:38:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pi4qAPM/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pi4qAPM/;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFj4c2H9nz300l
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 07:37:20 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id A4D88CE0E0E
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Nov 2022 20:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA75FC433D6
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Nov 2022 20:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668976633;
	bh=RZXgv6OiZ0jA2AY+w6qckTVje1FRL96Dt/Xm7O4GgW0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pi4qAPM/qqhPYbHEDjjVc1SsuKV7H6/ZhbklXFPXOdcerTYwWwS9JlqkPKOD80BY/
	 FKSClxVwQ/zuStfOKHNONHONEWZ744hrfVkQTUe9sXUm/h6WOQUWQV1U76TgAUcIPE
	 Dn6/iT4s14EsBvBTZstD8KWkYoR5+hQhDy9+cDa+mZsyT/oD0XxvNg0Q+Rr9LsmM4w
	 41KLF8Bg3AYL6IuXsHfmkq6mFBadQBegwUxCUgNlsG1Z8MF0vPNTe0Qu3H/Hx+X5Q5
	 YmdY0QhmUHs8nbnyuerHjO1ZFp5wH3aY/4Mm16c6g9g9esynupsLxQNtTxD9Suzouz
	 FK5Ev7/MrhblQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AE2D0C433E4; Sun, 20 Nov 2022 20:37:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216713] BUG: Bad page map in process init  pte:c0ab684c
 pmd:01182000 (on a PowerMac G4 DP)
Date: Sun, 20 Nov 2022 20:37:13 +0000
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
Message-ID: <bug-216713-206035-mA6vYPxlpE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216713-206035@https.bugzilla.kernel.org/>
References: <bug-216713-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216713

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 303244
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303244&action=3Dedit
kernel .config (6.0.9, PowerMac G4 DP)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

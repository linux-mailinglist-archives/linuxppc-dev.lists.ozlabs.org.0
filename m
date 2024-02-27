Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC78868517
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 01:43:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UVzC5YNc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkJcp2vNJz3dVZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 11:43:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UVzC5YNc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkJc46CKmz2yps
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 11:42:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7918BCE1000
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 00:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6F0CC433C7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 00:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708994562;
	bh=sqZkQQa4LWChJ/SjTmgTjSKjNrIa+gHT1heCoCQvJHg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UVzC5YNcpR5dOVE5WwgFWo1sccs+1EjCoEvTZF79TQn+JGtw7pNbFxYzxoqE1fiES
	 D8O2Z09SxCjy2NqLicrp5w9Jkv909K8UXCqCX1wkXIj2HfeNlWkvS8Kpn7VEGArNfG
	 1sZmIIsh6kLEancUsbdFRwx4eP9xzHtuXuovlpc6PGeLLrJdXmiGDMSMOOzRCjOjtM
	 PJEGQQ92jtf+gbbF4RpbKF8cgZ4PXqA7wqbA0hgX641NP/yRw4w5yyEegopUOfv1wf
	 OoY51ZIU+RP1+7N5mj23IFg8UNkWSsob7f6xmIt0K0uiLJb9WwT7y4Sioq9qNkgrTJ
	 kZjL01GqZVFEg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 929A4C4332E; Tue, 27 Feb 2024 00:42:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 207129] PowerMac G4 DP (5.6.2 debug kernel + inline KASAN)
 freezes shortly after booting with "do_IRQ: stack overflow: 1760"
Date: Tue, 27 Feb 2024 00:42:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-207129-206035-o1fQCIkNdL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207129-206035@https.bugzilla.kernel.org/>
References: <bug-207129-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D207129

--- Comment #9 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 305910
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305910&action=3Dedit
kernel .config (6.8-rc6, KASAN_INLINE=3Dy, PowerMac G4 DP)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

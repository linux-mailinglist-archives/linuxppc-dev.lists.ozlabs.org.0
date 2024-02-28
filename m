Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE4A86BA25
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 22:45:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Eg55CQf2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlSZf6Brpz3dWw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 08:45:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Eg55CQf2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlSYx43qmz30fp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 08:44:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 288C2CE1BB2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 21:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 651D6C433F1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 21:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709156690;
	bh=9btjwjDXQdzK9y/kYmZxO7THmAaeTwf9mBu08Kaot1Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Eg55CQf2DKidt139wzmlk2tH3B7Mkt4CJymHKpfF5qkAUBLiBvXXxf+uwT3IF3HKi
	 EWMmwuJgxANXQtXzz/pXZeoh6snDE4jfVGwUSQh5Rw1/xiXMBL3SAEeSBgZVrBFCFy
	 uYMxEQcUzlY88hocNBRBFEFNBOadwyDlB/rIFfKHSip7tHVt2v8wzExMoofeBvuR/R
	 pX2Pkacrrc8CgZS/pe+UOeGDwipiAzU1cvOIYZLPGQ16ztMTGwwaqCZGdja/ufLsOx
	 +8dySlKeiIqH+eFIxe/gHhCMu7q3+81fgWPTV7VruGb41EI0iwMzrx5+8ZDUrnyZAv
	 koYgaiChBbn+g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 48666C4332E; Wed, 28 Feb 2024 21:44:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 207129] PowerMac G4 DP (5.6.2 debug kernel + inline KASAN)
 freezes shortly after booting with "do_IRQ: stack overflow: 1760"
Date: Wed, 28 Feb 2024 21:44:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-207129-206035-GsfDsOnAGU@https.bugzilla.kernel.org/>
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

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #11 from Erhard F. (erhard_f@mailbox.org) ---
You were correct! I forgot about that...

I shrunk the size by using -Os and disabling some debugging stuff and chang=
ing
some statically built-in stuff to 'M' without sacrificing debugging
capabilities too much until it fit < 32 MiB:

KASAN_OUTLINE vs.
 # size vmlinux-6.8.0-rc6-PMacG4=20
   text    data     bss     dec     hex filename
12367737 6652440 426336 19446513 128baf1 vmlinux-6.8.0-rc6-PMacG4

KASAN_INLINE
 # size vmlinux-6.8.0-rc6-PMacG4=20
   text    data     bss     dec     hex filename
24660169 6652440  426336 31738945 1e44c41 vmlinux-6.8.0-rc6-PMacG4


Apart from that I can confirm inline KASAN runs fine now and I really no lo=
nger
get this stack overflow when using it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

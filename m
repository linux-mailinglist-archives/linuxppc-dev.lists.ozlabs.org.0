Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C62E2867214
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:52:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fhn14t9y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjyBW43vkz3vj6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:52:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fhn14t9y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tjy9m3x7kz3bT8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:52:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EFF8260FFC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 10:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A72E7C43390
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 10:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708944728;
	bh=MAvGCIcGYX+uF4iYeHglrmwmRW4O3tXlJTqGTph1Sgg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fhn14t9ySCpl7hRIW/rQ8txYt1zhGmzXdDzx0gCNY4kGSY3NdJ8qI3HGh5TOdmS7k
	 g1wNokQV24UTmvpX22EHhdusouCruHxPB9QRgMnM7NkPaU92j8I0eMY0jGDDaNsLAO
	 UTNimgjQVwuMEPaYdmEONEOrI6QruhEm7+VCHjRBfRu+2QX/hjwYpz1G3HXf9XgKYq
	 Y6f7gk/5HS+TZsI/e2wL6tq75Ip974xszaKjhXQEcYtplweWstADZOhotNE2845lh0
	 VjuXjM23aCsGjCkixhQ0BYOyiy5BfEWJ869wXHC7yNoW09E7lBc95Rs1ApyQh9mFOz
	 /CF8au8s0lMIw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8FF2EC4332E; Mon, 26 Feb 2024 10:52:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 155231] powerpc : native aslr vdso randomization is not working
 in powerpc platform
Date: Mon, 26 Feb 2024 10:52:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michael@ellerman.id.au
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-155231-206035-SCafzbd2qP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-155231-206035@https.bugzilla.kernel.org/>
References: <bug-155231-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D155231

Michael Ellerman (michael@ellerman.id.au) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #3 from Michael Ellerman (michael@ellerman.id.au) ---
This was fixed in v6.1, see:

https://github.com/torvalds/linux/commit/8a8f7866663588b162031a5348c24e4216=
1461cd

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

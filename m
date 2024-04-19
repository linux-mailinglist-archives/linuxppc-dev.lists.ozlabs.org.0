Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ED78AAACA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 10:46:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ndAVER8I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLSsz2PM1z3d2n
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 18:46:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ndAVER8I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLSsG7386z3bv3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 18:45:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AAEDFCE19C2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 08:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA9DAC072AA
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 08:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713516334;
	bh=Aa8/Y2OTUW2TIKd8yUsBDarCit/kI3dYjMf1CUxY7z8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ndAVER8IHRvzf4RLiCeeDrQn930MsDYiW9ii5xhF92Q6iUssRcSASDSGZAOuWfHOQ
	 agwr+fwCPWsvLAd+2+OAB7X77EsBFQsNrMqac1eOURuiP3J5ansMngcqWcvehg8lFL
	 3R8u8gCiA1o83ux6yMbXeTVFPPef+FDW82vJZWyQ1GGX60rrb24NFciF2wG7p5UjGS
	 89hKw2zi6p2tUd04YAn1HdqA1SacKuCjVynsrb2nSnvJRuws2nEObYzSfp7+1+AqMx
	 unlKAZLa2aApZAUFVM+fVZZYFFbxebR6euTKf1AUZAs8/DIaVvhB8WJUw1jOV4WOUD
	 16Yn/JD9k+/OQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BFA2DC433DE; Fri, 19 Apr 2024 08:45:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216715] kernel 6.1-rc5 + KASAN_OUTLINE fails to boot at very
 early stage when DEBUG_PAGEALLOC_ENABLE_DEFAULT is enabled (PowerMac G4 3,6)
Date: Fri, 19 Apr 2024 08:45:34 +0000
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
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216715-206035-Tl82vKMDI9@https.bugzilla.kernel.org/>
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

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #9 from Erhard F. (erhard_f@mailbox.org) ---
Cannot reproduce on kernels v6.8.x and current v6.9-rc4, outline + inline K=
ASAN
work as intended.

So closing here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 936AD3D388B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 12:21:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWQNL3vTGz30JX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 20:21:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mL3p3JsB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mL3p3JsB; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWQMs1dBcz2yLl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jul 2021 20:21:29 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id DA00260EB6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jul 2021 10:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627035685;
 bh=Xzx1OQzvdwUSmisCDl22GcEvDkGLuntawd3HSIGQN+E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mL3p3JsBUHlSWcK7cWv5dxORUE1TSJgEJwLuLINY29zdt9MdiLdLoNGLoG32kcZd4
 9DE9ZxHWavDUuwlVNRW6COMjgKjgBKim7YrmoILzPCKkrMgQ4XrNzGJZEo/YBZTZ3q
 4aXs/7LpKSMaz38sxKzX29GAX+ib8cUD6B6Ij/Yi86ho+2dovqhW+vPWOWVj8D1Aay
 QfHWm2XJoGTUhQawb6jVAHCo/4Q01BIW3a/Cr/znmr1E3bOrhn2iX8crKaNIPuA+yp
 JVbLwlgLN5gtf6ahmMd4Ws5Zm45Xvg7EbEx3afCm4qg1edsaEry6655bIA8flW9wO6
 dHD4pqA2sQjew==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C11B5603A7; Fri, 23 Jul 2021 10:21:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 205303] Compilation for PPC64 fails on warning in watchdog.o
Date: Fri, 23 Jul 2021 10:21:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: michael@ellerman.id.au
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-205303-206035-ncYmu6g96Z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205303-206035@https.bugzilla.kernel.org/>
References: <bug-205303-206035@https.bugzilla.kernel.org/>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D205303

Michael Ellerman (michael@ellerman.id.au) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |michael@ellerman.id.au
         Resolution|---                         |CODE_FIX

--- Comment #3 from Michael Ellerman (michael@ellerman.id.au) ---
This was fixed by:

4fe529449d85 ("powerpc: Fix HAVE_HARDLOCKUP_DETECTOR_ARCH build configurati=
on")

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E85408797
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 10:53:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7KyT4qkSz2yQ3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 18:53:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kDcz0DZl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kDcz0DZl; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7Kxk4xd8z2xg5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 18:52:58 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id AC04560F6D
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 08:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631523175;
 bh=N85t6wybuY1vs01UQ+dbi18CijmFyxoSLwQR8wvM6og=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kDcz0DZlQ/Nqk/xUQuEO5c73vTZHU+x+b+sSVJwZl15sfW1urfcOrkxP/CgM0Xjc0
 Mop6HC9Jy0WRDPC1BAceLBBTDRHC+81Sza2TUdioRuDJs+adacUMJodIBDryGEuiTg
 Jak82IyhMCk4etNjl2nGs6Q/aQ9B1d4PCIYckfdEkIC4NE2EnlSut8ug1oVPg3Qwx3
 tOji8ZVA4+HBII810KKa0FLURsd03G8adrHjf9WvZmRG5FhfeaE7Yp32d1K4WbMk/c
 584iW5lXk5X/sHyUp435jriZWDLDqvwQN4h0e5T/IdGeVwXHfviVQ/ECtq3wKFdNTV
 9S4EN8My23mVA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A380F60F5D; Mon, 13 Sep 2021 08:52:55 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 206669] Little-endian kernel crashing on POWER8 on heavy
 big-endian PowerKVM load
Date: Mon, 13 Sep 2021 08:52:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michael@ellerman.id.au
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc
Message-ID: <bug-206669-206035-B2ZEGB6ZP1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206669-206035@https.bugzilla.kernel.org/>
References: <bug-206669-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206669

Michael Ellerman (michael@ellerman.id.au) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
                 CC|                            |michael@ellerman.id.au

--- Comment #15 from Michael Ellerman (michael@ellerman.id.au) ---
After a day and a half I have managed to get BE debian installed in a VM :}

You said "running the glibc testsuite" was enough to trigger it. Do you mean
from the glibc git tree? I can't get upstream, or the debian packaged glibc
sources to build.

Both fail building with:

../include/setjmp.h:42:3: error: static assertion failed: "size of jmp_buf =
!=3D
656"
   42 |   _Static_assert (sizeof (type) =3D=3D size, \
      |   ^~~~~~~~~~~~~~

I guess I'm doing something wrong.

Any pointers on what your setup is?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

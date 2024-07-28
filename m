Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 181EF93E4C1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jul 2024 13:25:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qu8bCcXR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WWzgY1sPnz3cb0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jul 2024 21:25:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qu8bCcXR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WWzfr4pzzz3cM7
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jul 2024 21:24:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 06AA760E9D
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jul 2024 11:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A60E5C116B1
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jul 2024 11:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722165888;
	bh=lR+Un20tL3I/Xczia/XMACCJJFlewqJax0+MSax+pck=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Qu8bCcXRZNZejDOGRgQ8gdJq7zx/XM2rbiwxQ4A2Mpt9XH/Gv/s1d/ijiGJE2MHxl
	 QH7fPGbPvq548FvgHnevQKqHcVgMAAgicDjwYJRs8WtrtUg8hcbHyumfvELY8mUepB
	 aMSoMmIew3IY3iMqFTVaeFhwRxuUxfMZs3K+7anFmEzHTClKub9gE2vAPAVPGgYWGX
	 EiQVgQLoH3eM8VSUAEC+9oADPOuF3xmr+kWQyw7vklCJkxpfTUCr9FZiOb0YS47kbx
	 GU7+EyxrqMJ2rUd2KMOhLW6KbEyUpfySN/qsSwLhDUKY/2U0cYvMpZT4Z3+Tvaxp6q
	 +c6eNfsldnBqw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 97FA2C53B7E; Sun, 28 Jul 2024 11:24:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: =?UTF-8?B?W0J1ZyAyMTM4MDNdIEc1IGtlcm5lbCBidWlsZCAodjUuMTQtcmMy?=
 =?UTF-8?B?KSBmYWlscyBhdCBsaW5raW5nIHN0YWdlIC0gbGQ6IGFyY2gvcG93ZXJwYy9t?=
 =?UTF-8?B?bS9wZ3RhYmxlLm86IGluIGZ1bmN0aW9uIGAuX19wdGVwX3NldF9hY2Nlc3Nf?=
 =?UTF-8?B?ZmxhZ3MnOiAvdXNyL3NyYy9saW51eC1zdGFibGUvLi9hcmNoL3Bvd2VycGMv?=
 =?UTF-8?B?aW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaDo4MjQ6IHVuZGVmaW5l?=
 =?UTF-8?B?ZCByZWZlcmVuY2UgdG8gYC5yYWRpeF9fcHRlcF9zZXRfYWNjZXNzX2ZsYWdz?=
 =?UTF-8?B?Jw==?=
Date: Sun, 28 Jul 2024 11:24:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: linux353@alice.it
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213803-206035-ssQ3hs2wNv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213803-206035@https.bugzilla.kernel.org/>
References: <bug-213803-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213803

papirosa (linux353@alice.it) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |linux353@alice.it

--- Comment #3 from papirosa (linux353@alice.it) ---
Still present in linux-5.4.281 on Debian ppc (BE port)

 LD [M]  drivers/net/wireless/realtek/rtw88/rtw88.o
  AR      drivers/net/wireless/built-in.a
  AR      drivers/net/built-in.a
  AR      drivers/built-in.a
  GEN     .version
  CHK     include/generated/compile.h
  LD      vmlinux.o
  MODPOST vmlinux.o
  MODINFO modules.builtin.modinfo
  LD      .tmp_vmlinux.kallsyms1
ld: arch/powerpc/platforms/pseries/lpar.o:(.toc+0x0): undefined reference to
`mmu_pid_bits'
make[3]: *** [Makefile:1116: vmlinux] Errore 1
make[2]: *** [debian/rules:6: build] Errore 2
dpkg-buildpackage: error: debian/rules build subprocess returned exit statu=
s 2
make[1]: *** [scripts/Makefile.package:83: bindeb-pkg] Errore 2
make: *** [Makefile:1485: bindeb-pkg] Errore 2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 629593E0322
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 16:26:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfvF41vs3z3cLp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 00:26:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WkVUFVfq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WkVUFVfq; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfvDb1t3jz30G2
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 00:26:07 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id A704B60C41
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 14:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628087164;
 bh=SFgI/dmZS1WmR7FHc67hf7UsR+VtZLXEYXt3aRZIIpU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WkVUFVfqXtZ5qh0cQSjvkplzhT5Vv8GlqDp677gwBJchXsbDSg/NrCxV8iK1WYPQG
 Rj0RB2Tj3oCLfyif9T41gbBUeiZvLIfIcjb9B9IPAuc2oI+2oAvZ9C0ZdbsomP7Tbd
 xxgk+6xpqrLJUrtNNA+a2xsWLy4cts/yvsXcpE8WTziXl0HkvxAJtPO0KC06IJDE+t
 TSitWUFxcgFWFpbqiwqCj1CTTLQhRdrt7h/bSm/YuzvwbgjY7X6SEdb/4LRoNupoLp
 CSBT6R8QXpVrQ7vTww5VHBgHFMT4PLCrme+PbWqLy39ra7qdRaLGthvWWLRfbepg++
 FI2tMwxpoYJDw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 93182603BE; Wed,  4 Aug 2021 14:26:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213961] Oops while loading radeon driver
Date: Wed, 04 Aug 2021 14:26:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christophe.leroy@csgroup.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213961-206035-LtCGTQQIHi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213961-206035@https.bugzilla.kernel.org/>
References: <bug-213961-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213961

--- Comment #4 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
Thanks, unfortunately the info is still not usable because we don't have
function names in the dump:

[   15.810083] Call Trace:
[   15.810090] [f2b6dc30] [c1022318] 0xc1022318 (unreliable)
[   15.810102] [f2b6dc50] [be987860] 0xbe987860
[   15.810112] [f2b6dc80] [be85074c] 0xbe85074c
[   15.810121] [f2b6dcb0] [be984484] 0xbe984484
[   15.810130] [f2b6dcd0] [c037fd8c] 0xc037fd8c
[   15.810140] [f2b6dd00] [c03e1460] 0xc03e1460
[   15.810149] [f2b6dd20] [c03e17f0] 0xc03e17f0
[   15.810158] [f2b6dd40] [c03e18f4] 0xc03e18f4
[   15.810168] [f2b6dd70] [c03e21f4] 0xc03e21f4
[   15.810177] [f2b6dd90] [c03deaf4] 0xc03deaf4
[   15.810187] [f2b6ddc0] [c03e04d8] 0xc03e04d8
[   15.810196] [f2b6ddf0] [c03e2d6c] 0xc03e2d6c
[   15.810205] [f2b6de10] [c0006c34] 0xc0006c34
[   15.810215] [f2b6de80] [c00cb0d4] 0xc00cb0d4
[   15.810224] [f2b6deb0] [c00cc2d4] 0xc00cc2d4
[   15.810233] [f2b6df30] [c0017098] 0xc0017098


Looking at the .config, it seems like CONFIG_KALLSYMS is missing.

Can you retry with CONFIG_KALLSYMS ?

Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

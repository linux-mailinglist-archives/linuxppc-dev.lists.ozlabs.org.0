Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C504D459E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 12:24:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDmtS1yW5z3bb3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 22:24:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Pu1cHo7u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Pu1cHo7u; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDmsj5zNmz2yP9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 22:23:53 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 360EBB82489
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 11:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0501C340E8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 11:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646911428;
 bh=8Z4s01ZRE/aJLFGT0BfKBuWC49tV3EG8Tn3+iXtIpkY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Pu1cHo7unn7suOYUoENiROacxNGRKFA3ma8NJ18uUdkIlSLazGO0r0PTJoOqd2T6t
 yLbfA4lSKXs1/b1q5hvCI9rpbPsMu+YrJrFS976MR9SMUPHpc6AK2zKDUmr87yBfFg
 CZrNLdeMWDAdEJP1phpdZ2qRtQ7YM4O0KOwH8iW/fbchh3rN1q/ceqjtGLngTx9d6z
 RJr4xm2b6rF/ZtlfX7WJkXT7CcXnXTGoetEXjSFn4FJApIP2zMdNGMmd/zombXN5f6
 FtgVJbW/LzB8D5rkBC5myzMGHwZQyGqoobbqWbE/HptXhqqGr10smSYjnzTKaE9qjD
 0ck4RQkcT9YFg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DE40DC05FCE; Thu, 10 Mar 2022 11:23:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215658] arch/powerpc/mm/mmu_context.o Assembler messages:
 Error: unrecognized opcode: `dssall' (PowerMac G4)
Date: Thu, 10 Mar 2022 11:23:47 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215658-206035-6PyqED4Rrb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215658-206035@https.bugzilla.kernel.org/>
References: <bug-215658-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215658

Christophe Leroy (christophe.leroy@csgroup.eu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |christophe.leroy@csgroup.eu

--- Comment #1 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
This description is puzzling.

Commit d51f86cfd8e3 ("powerpc/mm: Switch obsolete dssall to .long") is not =
in
v5.16.12

For me, applying that commit to v5.16.12 should fix your problem, not the
reverse.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

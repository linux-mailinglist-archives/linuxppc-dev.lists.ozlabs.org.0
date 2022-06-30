Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2595562231
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 20:38:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYnCr1Kt0z3dsD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 04:38:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GIPeve4N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GIPeve4N;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYnC62Lq9z3cdk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 04:38:10 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1D2BAB82CA6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 18:38:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8AF9C341C8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 18:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656614284;
	bh=C1oYd++/XDusS/ZYALKkXx0/5F3M/UfrN2I6U7zLn1g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GIPeve4NaG24vAJO0xuBZiIwZOuJAJLIE4ePcUFSXNFyuL3R0OskkeoCu0yB+3lEg
	 V3RoE92T9wJ3k69IyogqbLCHUG5nRJCHXjnmPfRtjYdAJAOhuasH5MfkhhZpW7IaqC
	 1BDVV7aWpCTv/uebQZNObzvs3XCz6vJwZ3CHiJFU5v4BFjoBELINxkMY652h/gGW6E
	 gpeSFp54KzjuSgMyN6IE9hxL8KzPYwwUqjHVbA4OpF5xJl+eJ8d91EOrW8/0y82yHl
	 YhkZFuiV5Wn04L+bkt7CGuK1lbZ8GIKqiY4VdWd3r2BSzZwcoiHga3fvxf+cpE3xNS
	 vNJeMXy8pjHdQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BECCBC05FD5; Thu, 30 Jun 2022 18:38:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216190] 5.19-rc4 kernel + KASAN fails to boot at very early
 stage when CONFIG_SMP=y is selected (PowerMac G4 3,6)
Date: Thu, 30 Jun 2022 18:38:04 +0000
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
Message-ID: <bug-216190-206035-1tXl8TcFTX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216190-206035@https.bugzilla.kernel.org/>
References: <bug-216190-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216190

--- Comment #2 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
Problem is likely due to commit 4291d085b0b0 ("powerpc/32s: Make pte_update=
()
non atomic on 603 core")

kasan_early_init() calls __set_pte_at(), which calls pte_update() if
CONFIG_SMP, and pte_update() calls mmu_has_feature() since above commit, but
that's too early for calling mmu_has_feature() so mmu_has_feature() tries to
warn using printk(), but that cannot work because the KASAN shadow is not s=
et.

Can you try with the change below ?

diff --git a/arch/powerpc/mm/kasan/init_32.c b/arch/powerpc/mm/kasan/init_3=
2.c
index f3e4d069e0ba..a70828a6d935 100644
--- a/arch/powerpc/mm/kasan/init_32.c
+++ b/arch/powerpc/mm/kasan/init_32.c
@@ -25,7 +25,7 @@ static void __init kasan_populate_pte(pte_t *ptep, pgprot=
_t
prot)
        int i;

        for (i =3D 0; i < PTRS_PER_PTE; i++, ptep++)
-               __set_pte_at(&init_mm, va, ptep, pfn_pte(PHYS_PFN(pa), prot=
),
0);
+               __set_pte_at(&init_mm, va, ptep, pfn_pte(PHYS_PFN(pa), prot=
),
1);
 }

 int __init kasan_init_shadow_page_tables(unsigned long k_start, unsigned l=
ong
k_end)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 191857BD296
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 06:37:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jf3TX3Hg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3mVR73B2z3cfT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 15:37:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jf3TX3Hg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3mTY18WRz3c9N
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 15:37:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id BDE9CB80ADD
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 04:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22137C433C9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 04:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696826219;
	bh=wdPlbDpY9Q9NWarV40nqashta+p0E/BNTq+XcOJHSFM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Jf3TX3HgHD0EsXecLM6B5fBz42cchpceBd/CB0ady5GyNvLHIbTFywE8XiBdMbQgY
	 8MhynU5aU5ZKlazpmDdQUMWI7BK8PQSCHp370UF/OoFXRUuHyO+J9xT1E1P+cFGMIz
	 npsFg1phUsbc1GIqOJ+ypgoOMAiAovSbkBaxXxMSudQJHBLXN4gVYdHEowC5pBnuRu
	 Jy1GbC/vwo7ULnmHNf/KMSsHuxJWEMMzffrRlVjqwG/toMqhoBaOzAvoy7HKvTumnY
	 gC8Ae+WoyjQVlspxhivuLDzCAkAhIYi9QOmG9GV5k/xmTvUnPgj8TmKvPSCUWhT/t9
	 j4ek3gq39Tiqw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 09B98C53BC6; Mon,  9 Oct 2023 04:36:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216156] [bisected] kmemleak: Not scanning unknown object at
 0xc00000007f000000
Date: Mon, 09 Oct 2023 04:36:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michael@ellerman.id.au
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc
Message-ID: <bug-216156-206035-floAnHKXAG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216156-206035@https.bugzilla.kernel.org/>
References: <bug-216156-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216156

Michael Ellerman (michael@ellerman.id.au) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |michael@ellerman.id.au

--- Comment #13 from Michael Ellerman (michael@ellerman.id.au) ---
Thanks for the bisect.

I think I see what's happening. pmac_probe() is called before
mem_topology_setup(), so the min/max PFN variables are still zero. That cau=
ses
kmemleak_alloc_phys() to ignore the allocation, because the checks against =
the
PFN fail. Then kmemleak_no_scan() can't find the allocation and prints that
warning.

Can you try this, it moves the kmemleak_no_scan() call later:

diff --git a/arch/powerpc/sysdev/dart_iommu.c
b/arch/powerpc/sysdev/dart_iommu.c
index 98096bbfd62e..3883cb8a747e 100644
--- a/arch/powerpc/sysdev/dart_iommu.c
+++ b/arch/powerpc/sysdev/dart_iommu.c
@@ -243,9 +243,6 @@ static void __init allocate_dart(void)
        if (!dart_tablebase)
                panic("Failed to allocate 16MB below 2GB for DART table\n");

-       /* There is no point scanning the DART space for leaks*/
-       kmemleak_no_scan((void *)dart_tablebase);
-
        /* Allocate a spare page to map all invalid DART pages. We need to =
do
         * that to work around what looks like a problem with the HT bridge
         * prefetching into invalid pages and corrupting data
@@ -435,6 +432,9 @@ static int __init iommu_init_late_dart(void)
        if (!dart_tablebase)
                return 0;

+       // There is no point scanning the DART table for leaks.
+       kmemleak_no_scan(dart_tablebase);
+
        ppc_md.iommu_restore =3D iommu_dart_restore;

        return 0;

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

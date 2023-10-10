Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C2F7BFAEE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 14:15:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K4fYi+Lm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Zc96gTpz3cP7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 23:15:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K4fYi+Lm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4ZbF1HvTz2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 23:14:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 006586160E
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 12:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C341CC433CA
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 12:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696940084;
	bh=B8hJ1X6IJVHHOIxyYaWlMYTveyKIjX/YQ3K8hBBSSTo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=K4fYi+LmfQ/qHCTpAP9pE+jXhl8s62vSdiXJ/nKTmsFLrgaIn98FXGy1/oB+57VFj
	 XGCLaCwYILigQ3u2qoX9bTPrzD23ZqFSIvDiVoJzOrXQDR/nBminUJzYQgG3izOQ+Y
	 2xLa8WzdvMx7JjRf1bSxyvyGo9P/ukOMLrGqJdEMnfFgE5YPylZKjuRl9ZHoXl5SFy
	 dgcjqQQeQCE6dBvL8qjgvjFDEFhUIjrYp7YShzAVPBFsjViA7UNpe6TPBiNzZSLgN2
	 h0tuw8km1TlcKoFqyNO3ZIZjuWsQmpMfmK9N41ZboYR/dBrQFRmfQ8djSLQkZQro8o
	 yGT46endXoV3g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A7D97C53BC6; Tue, 10 Oct 2023 12:14:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216156] [bisected] kmemleak: Not scanning unknown object at
 0xc00000007f000000
Date: Tue, 10 Oct 2023 12:14:44 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216156-206035-nABgmggMBs@https.bugzilla.kernel.org/>
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

--- Comment #15 from Michael Ellerman (michael@ellerman.id.au) ---
Yeah, facepalm. Calling kmemleak_no_scan() later doesn't help, because it's=
 the
early allocation that is ignored, leading to the warning.

So we can just drop the call to kmemleak_no_scan(), the table won't be scan=
ned
because kmemleak ignores it because it thinks it's outside of the valid PFN
ranges.

eg:

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

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 677A64C9545
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 20:58:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7Sj13WH3z3bv8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 06:57:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mMgvujD/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mMgvujD/; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7ShD5X78z30KZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 06:57:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 88BDA616BF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 19:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC3D2C340EE
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 19:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646164634;
 bh=0Ekae4IwvIzW42+xpUWsAWmGmiAhdO64HBhqTLAxak0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mMgvujD/0sKZsRqHPBBIwI3DdsQm4A1peUkebZ0z0YzChXvdFUC3mXGV8PXAtmkAe
 Kv9yewnDbUpmLDdNp37Q5hJySu9sXhlOOYzgXeIoc0dWJI4bfFY3pX6/4NBEKUfYW9
 UxlxDqMPiuXBxX3NxztPbaggybCcyB/tjXr3mT7IBimIV1oSj1tAQFNu8e43EVVUIa
 g4ITR88gjSjZg0RFQ4uEDQZ6M/ebUGUSJULSR9eIhNOUUNxLMtmaFPsEozUGlwVlBe
 6vEJYk19oq2XeqhRQYu41B/CMskHK1h8LXEHAtfOuDofb6I/fCSzIbNDnPrCDJuWvH
 zqosaIbgoShbA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D3B6AC05FF5; Tue,  1 Mar 2022 19:57:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215567] build failure when PPC_64S_HASH_MMU=n is selected in
 kernel .config
Date: Tue, 01 Mar 2022 19:57:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christophe.leroy@csgroup.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215567-206035-WQKtg7hPuq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215567-206035@https.bugzilla.kernel.org/>
References: <bug-215567-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215567

Christophe Leroy (christophe.leroy@csgroup.eu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |christophe.leroy@csgroup.eu

--- Comment #3 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
For this linking error, in arch/powerpc/include/asm/kexec_ranges.h change t=
he
#ifdef to CONFIG_PPC_64S_HASH_MMU instead of CONFIG_PPC_BOOK3S_64 and it sh=
ould
build.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

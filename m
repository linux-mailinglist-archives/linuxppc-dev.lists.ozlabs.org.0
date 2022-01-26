Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAAA49C4CA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 08:56:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JkGJT23XXz3bb0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 18:56:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sgadUZm+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sgadUZm+; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JkGHh0SQ3z2yPV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 18:55:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C8F1360B04
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 07:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A641C340E3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 07:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643183756;
 bh=wgaLvoLKxUH+FT9V34ucaGD4/ABV1r3Ej3pIwY5fdcU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sgadUZm+FwyPdgzQAbojgj56y+CfG3ZJTSPvUV+BuOPTSW9nmLtAKg6gAnrk3Pa9r
 Q75kGIOg5e059zQKMLuTA1r4ihPPVJwNhG9K2BP9vtBEVupPcyBuNjPXEGntA9sk6v
 3eH0KxFqgqf75CDxWXtePMMmPjekTrQR0beNNH/iEE4rPcXCOqm8nFK3nRQ4QsaZhy
 Dop/n02ObD18ePus/fee9UegyTLmGD6IgZ8+czTPIfrxHqcXBQ+4STc2+cIihEyyox
 zT0zk37bUcGyQJQYsDexrtaokjZxSMpUWvsdiAaN8nNPY+bptCok7TFYgK+lus2dn5
 VNzppJ4aLlFvg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2055ECC13A7; Wed, 26 Jan 2022 07:55:56 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] pagealloc: memory corruption at building glibc-2.33 and
 running its' testsuite
Date: Wed, 26 Jan 2022 07:55:55 +0000
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
Message-ID: <bug-215389-206035-rXk1WSnXMC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215389-206035@https.bugzilla.kernel.org/>
References: <bug-215389-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215389

--- Comment #8 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
Looking closer, in fact that might be a false positive.

The huge difference with that bad commit is that:
- Before the commit, the kernel is built _without_ CONFIG_VMAP_STACK
- After the commit, the kernel is built _with_ CONFIG_VMAP_STACK

Would you be able to perform following tests:
- Disable VMAP_STACK and see if the problem still occurs.
- Disable ADB_PMU and see it the problem still occurs.

With the version which preceeds the bad commit, can you disable ADB_PMU and
enable VMAP_STACK and see what happens ?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

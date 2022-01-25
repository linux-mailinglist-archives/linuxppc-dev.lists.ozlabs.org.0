Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A2049BE6C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 23:24:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jk1cZ0RWmz3cFf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 09:24:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I/rUKBXD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=I/rUKBXD; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jk1bn6t8cz3002
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 09:24:05 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CB913B81B7D
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 22:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 876F4C340E0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 22:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643149439;
 bh=RWTsPYyoVWwCQliFoMWwgtBLmKigxbfO4dvJQeUkXpY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=I/rUKBXDRuQRIqVoZ6FiEYytnYuacEkeqRt02FLh1Ns9wtRzV7jdmyM9H76yC4dxT
 x4GJC6u5IWLws66JjOToVXfcSh1Aiezj+mbOWxh+YnQsVl04CkDpWlJZdXgW9G6wpD
 R6uq7ctwCRzcuWQs/qlckOfMhocfotxDS9A7UJ2FF0083/F/2BUMU31hpoQrsYDDeP
 NGxPmuwC5f2nDErffL35k6kXc7Vox+A1lROcv7z/VEz5KHHsC/whUJu7gL9urA6dx3
 igVt8HH7ZVjUgTVZMNwFLkWEikLVUKn6GU+LXv5J8xBkF0bL1hM98x/N2ZOhOq3uv+
 ldTBVpEgjVBvA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 69EF1CC13A7; Tue, 25 Jan 2022 22:23:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] pagealloc: memory corruption at building glibc-2.33 and
 running its' testsuite
Date: Tue, 25 Jan 2022 22:23:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215389-206035-HHv186TjBd@https.bugzilla.kernel.org/>
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

--- Comment #6 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300318
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300318&action=3Dedit
bisect.log

Ok, finally got it. Interesting find:

 # git bisect bad
db972a3787d12b1ce9ba7a31ec376d8a79e04c47 is the first bad commit
commit db972a3787d12b1ce9ba7a31ec376d8a79e04c47
Author: Christophe Leroy <christophe.leroy@csgroup.eu>
Date:   Tue Dec 8 05:24:19 2020 +0000

    powerpc/powermac: Fix low_sleep_handler with CONFIG_VMAP_STACK

    low_sleep_handler() can't restore the context from standard
    stack because the stack can hardly be accessed with MMU OFF.

    Store everything in a global storage area instead of storing
    a pointer to the stack in that global storage area.

    To avoid a complete churn of the function, still use r1 as
    the pointer to the storage area during restore.

    Fixes: cd08f109e262 ("powerpc/32s: Enable CONFIG_VMAP_STACK")
    Reported-by: Giuseppe Sacco <giuseppe@sguazz.it>
    Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
    Tested-by: Giuseppe Sacco <giuseppe@sguazz.it>
    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
    Link:
https://lore.kernel.org/r/e3e0d8042a3ba75cb4a9546c19c408b5b5b28994.16074049=
31.git.christophe.leroy@csgroup.eu

 arch/powerpc/platforms/Kconfig.cputype  |   2 +-
 arch/powerpc/platforms/powermac/sleep.S | 132 ++++++++++++++--------------=
----
 2 files changed, 60 insertions(+), 74 deletions(-)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

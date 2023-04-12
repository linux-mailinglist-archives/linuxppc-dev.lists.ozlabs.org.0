Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2296DE88C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 02:41:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Px3mt4Jpqz3cdC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 10:41:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RPuoFZ7p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RPuoFZ7p;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Px3m22T3tz3bTJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 10:40:50 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 56BFC60F05
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 00:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B409AC433D2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 00:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681260045;
	bh=JnN0z6RqOyTN52QK0M2RBddAMPORB/BD3JHdL8igg4s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RPuoFZ7pU4TjoiquTWLQnbaZmE3G2WEN/6yP1D+UZGELMLamqnv16UveDaJGLk213
	 LMg7fJP1VahplzV/Yp1httFM11/RJloT4NsStMkX28puWt5OIgw8CdFiPeD3G3Jtt7
	 Mrr5kzAjpeyl06QdYng7Q4Ur23PkzwvuJpcTJEKlip/bFqylHR5pWUkXIGG8hY9liJ
	 SkjeF23ECuwmUzMlF0q2o9XB5bq5RlZF9Z4u34IEc11xKoHRGJmkXJdZ/eYnstrNKd
	 DZhHW3A7NCE7kidKGBJKN1gLVsvxt68PWgdcvsCuO2mFeuvxmVhcSG6FFBnp8lc4RO
	 df+pHMVYbDzQg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 99CBEC43142; Wed, 12 Apr 2023 00:40:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215470] Unable to boot NXP P2020 processor (freeze before any
 print to stdout)
Date: Wed, 12 Apr 2023 00:40:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michael@ellerman.id.au
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-215470-206035-ZoWVuYYxln@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215470-206035@https.bugzilla.kernel.org/>
References: <bug-215470-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215470

Michael Ellerman (michael@ellerman.id.au) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |michael@ellerman.id.au
         Resolution|---                         |CODE_FIX

--- Comment #1 from Michael Ellerman (michael@ellerman.id.au) ---
Fixed in v6.0 by commit
https://git.kernel.org/torvalds/c/18db466a9a306406dab3b134014d9f6ed642471c

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

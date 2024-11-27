Return-Path: <linuxppc-dev+bounces-3586-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D3C9DA48D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2024 10:12:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xytxj6X2Bz2yLr;
	Wed, 27 Nov 2024 20:12:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732698745;
	cv=none; b=B5VISLPtd4ISFs53r0uUp+OOrxw+KOlp/6fsJUJ2ocwgW4fUq9fVPzmgE0M9D7+eXrY1Zx4OKd70A+fXW2ITqcXRRyy0m8+BbyyYfMtdLpY8iiOSLlUtfyB1qkp0Rn22NV0flxrCkpLT3cCOWC0gZc1rjakTgNiHnlXZ6eNEDb8c8oEdd8sU8aHW+0afhywbzY/H6k8A7T3rJ7jNxMPZ45K0ZeWlNAtdJp9wLivI4mb1BXvy0BDn4z0Et2JlaDRRq0wIeaDWKZ7gLVWjAZYedSXNMK84KEj6vPin9GLi5tnNEzz26Wp4GkE9qDgRxp+qprRAcQtOGMyqTY47L1igJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732698745; c=relaxed/relaxed;
	bh=HqTgcD/izMHFOkZgxiQJ6DN+6jV05jH99ryxwE/lgLU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gOG+Tf+Db+BhgTYPrpLauqZIbMxp+eH3l/0zA1AXiXRvFejJRBhvhMAReYSqnke8utq1SDvDDnBQXnf4znle6l6NNLO8q5t9J7Zr/Ato9gENyPFTFV9zvhWJj7kYmtHUswp3TmOskRirP+1GOOCijsmObv4o7DoAQiii6Pm2GT8m9062ASHsrbMt0o/myRYKoxJ3pDFhovYQvphFAkVjHpsKoRjdGY414msiqcYtpXnpV+gMiJy2qz2q1iBWlPpqH8Bq0VwyTMpJwNJ//3QVnDV/O3wXB0adtEpg8NctotTa4DaIgfxRBke3FHagu9CqU9ee4oIeBXsf5WrYKsNksg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aHkfMob0; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aHkfMob0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xytxh6yx3z2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2024 20:12:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0A65BA40566
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2024 09:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B4CDC4CECC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2024 09:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732698741;
	bh=WR57GHtdZjmnnWQOh4dX7fs0Zq2tCnNn0ZD+4EOLfiY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aHkfMob0P/FM75rug7HWfbHC0cwx1yFHW1C2SRRBK4gv4Cu2e+zzLWkHkwNJel6lK
	 S8y5ExDsR3PgeoJ5mbnx9BikaU0xwTiVjCj4ZMAu9ogCTpjWPtT9w/4FLNva5irxRr
	 laMolsWKh8gdQsxKYyXDJdnkVYxbSRxmMmOPvRmNPIF+eEexe7WqBgfxN9/Lgo2FQQ
	 0RkFzVkLfPfaaddKqf1qvk4HGVJInZ3lWQLwGQPb2qbHx3j+P2dD35mt6kvQBi+qnT
	 mZSaLTPhdgNvOdusxeL5519A8dhn2Ll/U0kWM6oXENLjs76a7KkR4IhpYU2NWKGR69
	 gTNmZdxqhNnPA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 77F0AC53BC2; Wed, 27 Nov 2024 09:12:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 13650] Problem with alloc_arch_preferred_bootmem() on powerpc
Date: Wed, 27 Nov 2024 09:12:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: antoniodaniels990@gmail.com
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-13650-206035-KYo6xt3vfr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-13650-206035@https.bugzilla.kernel.org/>
References: <bug-13650-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D13650

Randolph Garrison (antoniodaniels990@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |antoniodaniels990@gmail.com

--- Comment #2 from Randolph Garrison (antoniodaniels990@gmail.com) ---
(In reply to Rafael J. Wysocki from comment #1)
> On Thursday 09 July 2009, Sean MacLennan wrote:
> > On Tue,  7 Jul 2009 01:49:28 +0200 (CEST)
> > "Rafael J. Wysocki" <rjw@sisk.pl> wrote:
> >=20
> > > This message has been generated automatically as a part of a report
> > > of recent regressions.
> > >=20
> > > The following bug entry is on the current list of known regressions
> > > from 2.6.30.  Please verify if it still should be listed and let me
> > > know (either way).
> > >=20
> > >=20
> > > Bug-Entry   : http://bugzilla.kernel.org/show_bug.cgi?id=3D13650
> > > Subject             : Problem with alloc_arch_preferred_bootmem()
> > > on powerpc Submitter        : Sean MacLennan <smaclennan@pikatech.com>
> > > Date                : 2009-06-20 19:48 (17 days old)
> > > References  :
> > > http://marc.info/?l=3Dlinuxppc-embedded&m=3D124552732411775&w=3D4
> > > https://motox3m-game.com/
> > >=20
> > >=20
> >=20
> > Fixed!

I fixed it

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


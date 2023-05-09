Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 420076FC2DE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 11:34:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFtK718CKz3fNg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 19:34:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bVYSKBdO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bVYSKBdO;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFtJC5T2mz3cFw
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 19:33:31 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1BC4A6147F
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 09:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 699BFC433D2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 09:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683624807;
	bh=G84L7jfGbP5KXh2zUsEeCxIzs1qz+B85cw8uakMkpic=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bVYSKBdOrsJCJ7xAmMPhmai3LtemGEYAki3JDbloGzRde1LCGTaRx1vzHGZMJMZ2+
	 4Tf+eovml8fcyClY+fPcCn4OGNw5B5GnzEzl4niwzo8/RIGG922fZT700SKgmJiJRt
	 DI1MA91kS3eytGDViRGQhNyqI6C4vgbHwG4p445/0YF8Nbr8zA6vYvkYvL6DJ7+fLy
	 b/fQBj4Dif7nKJIryizP9YqTakOgxCThmYl8dFKh8GuX0y9h9z3jWvNvmvxHKfbXGS
	 p7YiL94o5AptwVPxEX4eC5zasDDzclRIAQUnWBWKKDNwH9e0Dhev2jnfsQHIWJZF9N
	 HRH1z0HGx03Jg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4789CC43142; Tue,  9 May 2023 09:33:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 217350] kdump kernel hangs in powerkvm guest
Date: Tue, 09 May 2023 09:33:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: coiby.xu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217350-206035-S4t0qIP8j2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217350-206035@https.bugzilla.kernel.org/>
References: <bug-217350-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217350

Coiby (coiby.xu@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |clg@kaod.org,
                   |                            |coiby.xu@gmail.com

--- Comment #1 from Coiby (coiby.xu@gmail.com) ---
Hi C=C3=A9dric,

My bisection [1] shows this is a regression caused by your patch it's a
regression caused by "[PATCH 00/31] powerpc: Modernize the PCI/MSI support"=
.=20
Do you have any suggestion to fix this bug? Thanks!

[1] https://bugzilla.redhat.com/show_bug.cgi?id=3D2123723

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

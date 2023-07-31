Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF3176930D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 12:24:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kWfWLKGO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RDvVw0ZpLz3bXH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 20:24:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kWfWLKGO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RDvTC72Ltz2ytc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jul 2023 20:23:11 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2972C60DBF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jul 2023 10:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8617DC433C7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jul 2023 10:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690798989;
	bh=Z5RyeVNnsnOdsbkHUXS0lu29MsB2PG5zwBcrrCjO/zI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kWfWLKGOyTbAH4wCwJ9hfxC5HONs9Q4wR3ppqyOZBD6JLXOLzHIgQiAPcTXIDcm00
	 nRH4nSfytB4Hw73uQ8GNvi66TNRrFWZvBkv3WsmyWtdrx1bHtUM7RAyOpcI0Tms0uK
	 XXtyWQDSGuVeFnT2CZjpZsFWd5nR1/WCdo1RWvETrBihJf5JbJ8VtX+AhCkyzYLesx
	 cBsCz7zupLw3zn3lgFYadRk6ZUGLIMdRdede+TnDKEVsDsbJS1UTJuS14n3YVlrhTE
	 r0qkrlcpzDTTGxB2mDkMAPxsvtJ2ZDlFsEH9Dzqbibuh97vLeaQy3OWZQdMPoNWmnU
	 q9G4fK5VQmW6Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 75830C53BD1; Mon, 31 Jul 2023 10:23:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215862] clang-15 fails ppc64 BE kernel build - ld.lld: error:
 undefined symbol: .early_setup
Date: Mon, 31 Jul 2023 10:23:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christophe.leroy@csgroup.eu
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215862-206035-lWJACqcwPn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215862-206035@https.bugzilla.kernel.org/>
References: <bug-215862-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215862

--- Comment #6 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
I'm out of office until August 1st.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

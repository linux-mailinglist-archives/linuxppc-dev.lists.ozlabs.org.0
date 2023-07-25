Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1622F7608E3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 06:49:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=on1DqLuz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R94LW6xt7z3cPc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 14:49:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=on1DqLuz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R93mX2xBmz3cTs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 14:23:08 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 538E26150F
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 04:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B84DAC433C9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 04:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690258984;
	bh=YW93EqAioxTfopiRDYIW6Kql4gmHOifwVu2w6ikSkxc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=on1DqLuzaabZXeJRz+Z8t5dhDorlfyqqcD2mo6srApe3z+wwPR2DERfg2H7xVnB8K
	 EIZmNs7gxdoOAhwCtiud+QYnnUaO22vQgIil9qYmsDlS/T4std1TALabrqsrQvz/6K
	 x4hNSKO+Z5zBHDUIzQ3nxT3orkVD+ItxpHIXuYeDdDuKxfA7cVK0nS+ECD4Cj392nR
	 Twl61az1I1rEmNFGkNjEMr8FK96LWalTA49NQNr2rlDKPQfX7+HFjwDsXtLU5BIlsE
	 AYgIyARvh/20zIyCBuh7bKluzxFsbVLNh1ZV/FiDZ73YAMu21wo2cLbw0+raeApWM3
	 iMwzfj/MPNnvg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8E394C4332E; Tue, 25 Jul 2023 04:23:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 217702] makedumpfile can not open /proc/vmcore
Date: Tue, 25 Jul 2023 04:23:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michael@ellerman.id.au
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-217702-206035-yaw7nqaQXi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217702-206035@https.bugzilla.kernel.org/>
References: <bug-217702-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217702

Michael Ellerman (michael@ellerman.id.au) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |michael@ellerman.id.au
         Resolution|---                         |CODE_FIX

--- Comment #1 from Michael Ellerman (michael@ellerman.id.au) ---
This should be fixed in mainline due to the revert:

106ea7ffd56b ("Revert "powerpc/64s: Remove support for ELFv1 little endian
userspace"")

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

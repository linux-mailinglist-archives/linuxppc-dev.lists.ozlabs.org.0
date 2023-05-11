Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6726FEB39
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 07:33:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QH0t04fJPz3fN5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 15:33:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=baJbsaA+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=baJbsaA+;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QH0s919Mgz3c46
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 15:32:29 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 82D4764AB9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 05:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7B06C4339B
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 05:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683783143;
	bh=isjyf5jjbGcvrWlxqVCsRjGEJSW3FEpHBLkV24ug+5k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=baJbsaA+UJO0EumQ6hvPjNS8cbuN3DmXZo6IHsGbJIwCvu7f9wwxY9aASHjwkdsAf
	 +6LxbQE0cTBHMOQF3IGpwNaLI9pOD7n0KVi7nIBzR9N9x7Y78/5L3TUhCYS6fjh9Ji
	 vYAdOUwpsmq6iPZeb25mFAECEFHmTZGQItGbZWERzXpjzW/v4QhSsL/3pVBC3/pXHX
	 h3bt8MXC1N0/3KyHoQSQSNpDWSHFDKfSH81FHZ9cgx1wrdixHCg9sgx/aWNx/O1GXi
	 oZciRcgSSOv+WUax7gCoTbqcjxKvP2l/DL31lDBKKjBy91WAXKymNhov6zkubXuFDf
	 hF0F4s7MjNsGg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C7156C43142; Thu, 11 May 2023 05:32:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 217427] Linux 6.3.1 + AMD RX 570 on ppc64le 4K: Kernel
 attempted to read user page (1128) - exploit attempt? (uid: 0)
Date: Thu, 11 May 2023 05:32:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217427-206035-bOwHigFqGl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217427-206035@https.bugzilla.kernel.org/>
References: <bug-217427-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217427

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
Please also report to https://gitlab.freedesktop.org/drm/amd/-/issues

Performing git bisect would be nice:
https://docs.kernel.org/admin-guide/bug-bisect.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

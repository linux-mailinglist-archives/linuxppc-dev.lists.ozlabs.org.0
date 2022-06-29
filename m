Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAC555F6AF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 08:36:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXsDf22wzz3cgB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 16:36:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GkxR5HqD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GkxR5HqD;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXsCx306mz3bXR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 16:35:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2587C6197B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 06:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C15DC34114
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 06:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656484538;
	bh=blPzdZjLZe1yfGuta4zKBdGKs6y3oCyGIXU1FxvoQ1s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GkxR5HqD08/GPQmq2s2UQ2plaKXNd06GjkRtcE+Z2piQ0yGA5+Laga12Nc1qBdUxB
	 HXD9lQF3z5bG6lFbdb2xEHpcSLgKroNB8PiYdGNdw+/VLI8duCfgXXjoyken7DsEih
	 Z1EfEQuvJGftD9TQUDUjOIKKD+ydHRvhtbrYcwKYOaeEcs0eNW/t1i8uh3SsAwuiaT
	 xPqH0brF5x5KWLzNWLkXcDfT5dKzJRza5fBPheD8HwhJLxJmBvEPKotMiAC6Ywqrpv
	 Z6BDQkq9xZQ5h3timrJ8bWSBFn6cAvFDQG3eKSqc96z7ptV3l16LDmhaD+lCiEWa/9
	 HSlTROQEwgkRg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7B7BEC05FD2; Wed, 29 Jun 2022 06:35:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216183] Kernel 5.19-rc4 boots ok with CONFIG_PPC_RADIX_MMU=y
 but fails to boot with CONFIG_PPC_HASH_MMU_NATIVE=y
Date: Wed, 29 Jun 2022 06:35:38 +0000
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
X-Bugzilla-Changed-Fields: bug_status cc
Message-ID: <bug-216183-206035-vJFr1J9FWL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216183-206035@https.bugzilla.kernel.org/>
References: <bug-216183-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216183

Michael Ellerman (michael@ellerman.id.au) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |michael@ellerman.id.au

--- Comment #2 from Michael Ellerman (michael@ellerman.id.au) ---
I can't repro this on my Talos 2.

I have some different PCI devices, a different GPU and nvme controller. I c=
an't
see an obvious reason for this, will require some more digging.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

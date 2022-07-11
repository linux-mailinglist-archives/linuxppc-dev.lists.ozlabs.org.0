Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F895709B7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 20:08:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhX1t2sp8z3c6t
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 04:08:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jvnb9G9Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jvnb9G9Z;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhX191RL1z2xmc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 04:07:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 172F6B8111D
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 18:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCFF5C341C8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 18:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657562871;
	bh=uqSGp8pQ5QMgLK2e4i3dRS1iKFxGknlB5t3dfx1u0SE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Jvnb9G9ZjIUqWZMs7IZelfpro515nY9bFZuXCXEJcB3PUfsx7gtwzV8q1BSr7Gsq4
	 VCA2HR3ngxfaY7n3CVXGIwEQpsPUXttdw67DNRaNNimnhNa9ah/FJQwWTyrfO5ewtW
	 0bSuobq3NxM/iHeNZzVu6omdou+Vzf29k0DywvXw1eOGbVR4Sj1Pbfl3tFFHwR4N4l
	 Q0OJCvKgMkI8tVemK2BDIGDFJL7mra5kXYzSIQ60b5JJMvJjVMIg/xByH4QeOyUeCF
	 H+K6m/hrLjmvtCFr2fx5Q5oZsfa1Mfi/HdzYsVOQcx1Ii7Ee8oOEjF+823QFWaIvU7
	 5wvPSq+6J0NgQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AB011C05FD6; Mon, 11 Jul 2022 18:07:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216183] Kernel 5.19-rc4 boots ok with CONFIG_PPC_RADIX_MMU=y
 but fails to boot with CONFIG_PPC_HASH_MMU_NATIVE=y
Date: Mon, 11 Jul 2022 18:07:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216183-206035-qEl00WW4pz@https.bugzilla.kernel.org/>
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

--- Comment #6 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301395
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301395&action=3Dedit
kernel .config (kernel 5.10.129, Talos II)

Tried some LTS kernels and with 5.10.x I got a .config working to boot the
Talos 2 with HASH MMU on my system.

Also I found out that selecting CONFIG_PAGE_POISONING=3Dy in the working 5.=
10.x
config renders the kernel unbootable again. Though this seems a different
issue, as simply deselecting PAGE_POISONING in my 5.19-rc .config did not h=
elp.
So I opened bug #216238 for this issue.

5.11.x also boots with HASH MMU, but I got problems on 5.12.x again. 5.15 L=
TS
shows almost the same behaviour as described here for 5.19-rc.

At least I got a starting point now for a bisect.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

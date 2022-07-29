Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3242E584C77
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 09:18:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvJm070SZz3bhK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 17:18:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hxDq2pyS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hxDq2pyS;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvJlH0QXKz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 17:18:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B592061983
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 07:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26B7BC433D7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 07:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659079095;
	bh=s96qL+KvRfb7cARpZ4VctKsCDTeAlS4vPCOLZFQmzRg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hxDq2pyScU4fehcMvhTpVltkG7iDMX47lzAL7LKSSrJ0AMY8vYdEJbaCmgjgUHs5n
	 pg3v3cmpBAkw3uwWCnSsfyv25moEzrcaOS4fDmlck09uYGUl/lknkxpDS6Dg4Aunum
	 Xp2RUbMQU+NjXK+Oxx2V9ME7MhEMqXI9hlh4tCic/qiBUE4sJF63ymMLi6jU1i7Xwm
	 629rtEondld5o14aQn4IK3stRDfqWgvwB20QkQDNHddK0JKgmVG+5uIGooPW+zWVVX
	 4oxlyJ8bGOp11gWdHk25V5ecyCc5Q5oDTwrQCGv4S5ZBjUIjxgFvy03GlMTunbbxOM
	 g8tljDfgaKfWg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0F809C433E7; Fri, 29 Jul 2022 07:18:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215285] power9 le: amdgpu: *ERROR* hw_init of IP block <psp>
 failed -22
Date: Fri, 29 Jul 2022 07:18:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: michael@ellerman.id.au
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-215285-206035-NCN4fJJVob@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215285-206035@https.bugzilla.kernel.org/>
References: <bug-215285-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215285

Michael Ellerman (michael@ellerman.id.au) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |michael@ellerman.id.au
         Resolution|---                         |ANSWERED

--- Comment #2 from Michael Ellerman (michael@ellerman.id.au) ---
This would be better reported to the amdgpu developers:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

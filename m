Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E2556CE90
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Jul 2022 12:30:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LgjvH0nY7z3c99
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Jul 2022 20:30:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XgaxIweQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XgaxIweQ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LgjtZ6LfKz3bc1
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 20:29:26 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 35BECB802C7
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 10:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1908C341CA
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 10:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657448962;
	bh=L5w6wh8dY2SJQGPbfkGk3EdK98FsTguKFJ0C4Y+wuoY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XgaxIweQVvTK7xkZdIqWie030SgMsB+JspjEYJ1WqVTJrlr2aOwoi+lbUrC7m+ne5
	 sSHfqMrMe/f0Je7a1ByOcX67OGeOQ+ZFnroEg1kXrR5h5hbejbmIsAzejj6LeMh3Ih
	 YD0/0CMjSrIU+ScvG+Ss3jxTFoORGhkYLvLiuOEkiSpQeqig05ZchDWcWoo9HZx2vS
	 k98hPQ3ZvnmgMebTxLIEdJVlctnMbFgJpIrkEHFPWjoFXWTNjqnXub36Z/aTwlX2QE
	 qYq6JY7vRukiI5zr8+IbTiEocbAjYnzL+ODbgSg3zXW982Q42LzMtNKayIJV+Vpatf
	 T3NIp9TuvR8tg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D3687C05FD2; Sun, 10 Jul 2022 10:29:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216183] Kernel 5.19-rc4 boots ok with CONFIG_PPC_RADIX_MMU=y
 but fails to boot with CONFIG_PPC_HASH_MMU_NATIVE=y
Date: Sun, 10 Jul 2022 10:29:21 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216183-206035-S6wVLX3ZQx@https.bugzilla.kernel.org/>
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

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
Tried
https://cgit.freedesktop.org/drm/drm-misc/commit/?h=3Ddrm-misc-fixes&id=3D9=
25b6e59138cefa47275c67891c65d48d3266d57
suggested in https://gitlab.freedesktop.org/drm/amd/-/issues/2050#note_1461=
646
but it did not work out. This bug here seems an entirely different matter.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

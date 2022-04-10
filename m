Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E806C4FB0B7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 00:48:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kc6b75jRTz3bbp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 08:48:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fGsSrpWr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fGsSrpWr; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kc6ZS2Mfgz2xZW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 08:47:44 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EB96DB80EC8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 22:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93DC1C385A5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 22:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649630858;
 bh=tJ41C9fMx59N72LY85YKko5+/Bbs/yuA1b0jQIrr5tA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fGsSrpWrPE2DEWrcSMQDF6hHOWuE9FLe/ZfWd9nk5aWzFBYPUYm0VMhVH5Y5XI4D/
 8eP83MTizaG7KTnOM4SU0QU85G48Cqn84ztq7TzqjEMfyBDWWsCruf4Lrs/wdzirKd
 ugVHHhbfN/Y/fDEdsGwHDDKa/zBmBRU0xc/ucYyb2Nh3Xb78N3KKnaBBldacSUMmS6
 kQkfqJRbPmbrzJHjqTcYoFVZ2a6RP9yT3ocUdm0U0I/gn4iVDpxPZnIes22QcXV846
 ySRtS3/Wp0imM8/gdOivDlriJnTJX3RSmvhlcRzGOgzaL/jEXPhUI7pIwujWv6vI3d
 4n3yGzDG9y+sw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 82F17C05FD4; Sun, 10 Apr 2022 22:47:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215803] ppc64le(P9):  BUG: Kernel NULL pointer dereference on
 read at 0x00000060  NIP: do_remove_conflicting_framebuffers+0x184/0x1d0
Date: Sun, 10 Apr 2022 22:47:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: linux@octaforge.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215803-206035-78EJW5UvaE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215803-206035@https.bugzilla.kernel.org/>
References: <bug-215803-206035@https.bugzilla.kernel.org/>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D215803

--- Comment #4 from Daniel Kolesa (linux@octaforge.org) ---
Also, just to be clear, reverting the commit I linked above does fix the
problem for me. Here is a patch you can quickly test:
https://gist.github.com/q66/da01b4baecfdc24cd8fa3253d4e7f05a

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

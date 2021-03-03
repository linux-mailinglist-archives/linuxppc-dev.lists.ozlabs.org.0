Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 862BF32BA99
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 21:58:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrRCw3pn3z3d2W
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 07:58:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sGUGROZQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sGUGROZQ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrRCS36CYz30Ny
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 07:57:40 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id C0BC864EF8
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 20:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614805055;
 bh=YMCJBWTpTDiCmIegn6vABlw60Eghb/elYNXA6npJq6U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sGUGROZQN/iYe7DSsryHN/TJ4zhHwyi+TRsgPJU7ERt7D7xVksuV5ugCXMSr6yQVZ
 8Bs0gYZe4eO9iXzwSmw6twYrfy9DlmYqV6PEgScxxTonk2ICyUoLUJam1b1v7qS12a
 Y6z06lWONWSGYldOl4RxFLZBCBPM5/uyoUVHT2XmqQUHOOkK4FeaKz7D1wzY5l6ZyR
 TPb255+9VXzyGjGGdw7GG44nUnvqGufcU7Yx27OQyRDB/xaaWNRyJB/2TTZT2tDp8x
 YdmrirWRHg0XYBwVWalbPqdJIvblHR5/LIduTeVotfwOlck7AzKlyvmye07esJ9qLj
 fkRfpJbdiyNXA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B0F6A6536C; Wed,  3 Mar 2021 20:57:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 206203] kmemleak reports various leaks in drivers/of/unittest.c
Date: Wed, 03 Mar 2021 20:57:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-206203-206035-nBHQVev3Kf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206203-206035@https.bugzilla.kernel.org/>
References: <bug-206203-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206203

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #21 from Erhard F. (erhard_f@mailbox.org) ---
Kmemleak remains silent since at least 5.11.x on these machines. Which is a
good sign I guess. ;)

Closing for now. In case I hit these of: based memleaks again I will re-ope=
n.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

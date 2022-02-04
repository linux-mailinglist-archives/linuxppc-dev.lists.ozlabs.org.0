Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE2C4A9B88
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 15:57:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqzDP5G95z3bcp
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Feb 2022 01:57:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gCpye0WX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gCpye0WX; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqzCg6GR5z301M
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Feb 2022 01:57:19 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CF193B837C9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 14:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64DE5C004E1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 14:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643986634;
 bh=nwjynrj3+pJxZEuTeuXYT18fIC1m/YN9VvR5a9PYPjY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gCpye0WXiGRMG07WGIbdFYPAapc8oJweUPnw6WpY2T2p3Mvmj2taDpnUp0Ma9aizy
 hVuwDVpcFUxiGVoxoxuxyLfPCwLpxPsYNKTQWLKorBFRlGju0IXCbTrclzDTMieaq5
 CJYfl+56u2VyNcM0JrTjfF8tl+Hc47q4YGgHIJPkUThSbDo8wskhOCpyG6wOfxs9zZ
 IPTzqWGe4d7RMFUMxEmhv9/Lzcwj4c+q+NYV6jNG3XcC4vmhSdxAfbqYYNRpRHJ8ie
 ftuubcd6k+zRtNJPOjpjKdlA2/3zoBfpc8g7S/TlReyGjtY1t0WCPF//b4xD6KlpQ0
 OZkjfTxjtc8WA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4243FC05F98; Fri,  4 Feb 2022 14:57:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215169] UBSAN: shift-out-of-bounds in
 arch/powerpc/mm/kasan/book3s_32.c:22:23
Date: Fri, 04 Feb 2022 14:57:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215169-206035-W0yi9mKtQN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215169-206035@https.bugzilla.kernel.org/>
References: <bug-215169-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215169

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Fix landed in 5.16.3 and LTS-kernels. Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

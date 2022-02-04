Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D87F4A99D7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 14:20:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jqx4M0w24z3cPg
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Feb 2022 00:20:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PZP5aMJy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PZP5aMJy; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jqx3d6S0Cz30NB
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Feb 2022 00:20:13 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E43B5B83738
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 13:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCF00C340EF
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 13:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643980808;
 bh=QUaRCN+3ZbVnO3TW1szQzvoWr2waAq840U4eF+uMR5Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PZP5aMJyY18coa9ounmQ2QFSWR1nkpfA5Lz0oXjzBdf0dIfKXNfF6SUrM0qq0b8mM
 nyOcKSkWPDqx4tKx6tblUq2ZNwKTDdV+LCWtoq7EyVdsDiIgaPKkKSJQBW6EWrkGmh
 6RWLtonAlmQ+BmDoh1WMKtBDxLthofh0pyUN+2szmd7FH9LXWiXbPv7liAKXcLsLrU
 1o46YFUGwZsKlwR9hBwRY3gKvZJ6JNrseUCUgSkHuDP8Q2dN2nZEG7LgMgQEsTybyQ
 8wLyLPbF8AYpHSql5+CGz/yziAra8oAR9vfR6U7SBYtbJgwwyCX+PflsEkNDAHjmaa
 7hO/h5RnBfwJg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9DB7DC05FD2; Fri,  4 Feb 2022 13:20:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 214867] UBSAN: shift-out-of-bounds in
 drivers/of/unittest.c:1933:36
Date: Fri, 04 Feb 2022 13:20:08 +0000
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
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-214867-206035-Wev3wP7Wxz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214867-206035@https.bugzilla.kernel.org/>
References: <bug-214867-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214867

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
Fix landed in mainline meanwhile. At least I can replicate this no longer on
v5.17-rc2.

Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB3C45E424
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 02:49:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0d3L1ZC9z3cWf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 12:49:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qubPBX/I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qubPBX/I; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0d2b6WzPz2yQ9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 12:49:11 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9FA1D60551
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 01:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637891349;
 bh=+FQVW0Ro8l1AovpN/s4UwDcqzO5ObkC1dc9TZfZmyHw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qubPBX/INiUeLQMugyxOA9ow7IRZxFSZW4aW77MyxuLlbw2rGt3IiCP9Bo0uOQuSL
 cL9xW66dG0qTU6BS4SmOMDjnT+Fl67SBRaYLZA1/c1H6cYPm7mFig8nQ8RjPq7gZDg
 CMu1JffeNNVX51wW/HxNIp6srg97l2FvfETJsXE+HqCJvbQbjL5UX//NruSIOSEwHJ
 wg5jZh0LuxeaSGUwxPmUWskxMkEzJKL4eXKXcY9WrHUOhN1BqGW7YQ1kUZYIbwtUfi
 wqDkkoBbumrkaSxKaziKpGatOK3edPH0vp+wjB0pa6fUy4M1k8rscNRO/9p9cypfYr
 017dysMgScIDA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 962D660F39; Fri, 26 Nov 2021 01:49:09 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 205099] KASAN hit at raid6_pq: BUG: Unable to handle kernel
 data access at 0x00f0fd0d
Date: Fri, 26 Nov 2021 01:49:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-205099-206035-5CLrobIT8L@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205099-206035@https.bugzilla.kernel.org/>
References: <bug-205099-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205099

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #292347|0                           |1
        is obsolete|                            |

--- Comment #36 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 299715
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299715&action=3Dedit
kernel .config (5.15.5, PowerMac G4 DP)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

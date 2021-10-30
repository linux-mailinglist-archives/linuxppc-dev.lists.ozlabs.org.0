Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD1F44061D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 02:02:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hgzxy18lWz3bP4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 11:02:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I0ndcO1D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=I0ndcO1D; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgzxG0zR3z2ynb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Oct 2021 11:01:54 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id C24466103E
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Oct 2021 00:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635552110;
 bh=/4fLnET1VglumA1TCrmPnObwb6pOPKzFLbZppR3js3Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=I0ndcO1Dq0w1nHI5prT3Ddzrvo93ezjYK2ELen7ThWCb2/KFFoUGK7PEp1PcTrKWA
 MisKqg99P8xnJyJeic/4DvziIAWYGO2IQuCmcW1e/ZnMDiMXyMmQTf+a482khdubM1
 1GdlejhKqcI9qgV9yTXTXqKwzghYVAHlkJ/ncx6TeEldU16ZsPQaySchnH8JrKcA6a
 FnDIBmY9By/3zfj4Ntl89jzbZKdJUgrW6q/ZEJu/U8utTX7Lud2eHUtUkekdp05MFA
 hOgJ9R/ZpnMiP76T95xss67pHZK0GgNPJrWxoj/bjm8unZJAMcKjQMrlhp5e4RkuGl
 RkbCgbN9/1t5w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B307160F25; Sat, 30 Oct 2021 00:01:50 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 214867] UBSAN: shift-out-of-bounds in
 drivers/of/unittest.c:1933:36
Date: Sat, 30 Oct 2021 00:01:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugzilla.kernel.org@frowand.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214867-206035-cpMPZ8K3ne@https.bugzilla.kernel.org/>
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

--- Comment #3 from Frank Rowand (bugzilla.kernel.org@frowand.com) ---
I forwarded my email notification of this bug to the mail lists.  I prefer
discussion to occur there:

  https://lore.kernel.org/all/c474a371-b524-1da8-4a67-e72cf8f2b0f7@gmail.co=
m/

Thank you for the report.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

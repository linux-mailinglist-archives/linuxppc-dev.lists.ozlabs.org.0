Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6877D3E1347
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 12:53:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgQSd349Rz3d9H
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 20:53:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LskUSt/+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LskUSt/+; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgQS71H4Nz3cKv
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 20:52:55 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6D5E761078
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 10:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628160772;
 bh=jQ4YWpEOuk4jW73bpMW98EqnAtXG5QLozeCSYy+Nm00=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LskUSt/+ZAnbiejvphNz+hc8fbevjHXAvHmcuj1hWn2iCgd9NnPVpiQatr6cVjkys
 KNq3BhyE98827XI0HPxEHYXtloqdts7MdNSKFYcf1SLoDrA44vD0fGsj5cwPPXar2A
 1KX96VPHy9G0qmFd1soH86nYz6qUkfIt7ySG1EFc0sfpDDSCLp46Vi7e6uQG0yeXdj
 qlwbbJt+TmpdAxUwtJd3b1/x1ZXO5kYUQbakxYrfAAGk6TtN8X9FI2VVP/ovv84vXX
 ouXnwjqYFCcuilU1TpxBWdJ6N/SfwnRQS/ePeTGnUbPVSoaNGm3HEsYB6dDCQiyeND
 huhFuXMSsDSUQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5AC2460F36; Thu,  5 Aug 2021 10:52:52 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213961] Oops while loading radeon driver
Date: Thu, 05 Aug 2021 10:52:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: riesebie@lxtec.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213961-206035-sogs8mk5H0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213961-206035@https.bugzilla.kernel.org/>
References: <bug-213961-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213961

--- Comment #9 from Elimar Riesebieter (riesebie@lxtec.de) ---
Well, 5.13.8 just runs fine, though.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3777BAF66
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 01:44:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q8QXmDhV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1p7f6S3nz3vj0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 10:44:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q8QXmDhV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1p6g4C15z3vbp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Oct 2023 10:43:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0FE95B82724
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Oct 2023 23:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6AB69C433C8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Oct 2023 23:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696549431;
	bh=sYCTYzmCEWcu8eFFnDjQviamWWIlnbnl1B3y2NcHHcs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=q8QXmDhVZRWvRS4t531SQbcrXSO+Ek0fqhCFLAIUgul8GLQaVM5Y4HDGMJXcG+mG9
	 mD5gMe7x1Eicmt+6D+YtVHHZLNjGKp2kFoMXPuOWIdllYaquAlsIZcf1gn8p0mD1Rv
	 LHJFmWOI3FZPOh8yADJZf7EvFAuS4rk7BJGW8qkt3F25Wpn1Op2Mq/f3t9fZ1czFxl
	 2hCuUlJCc5c0wPD8kj7ePSFkP0Tp9RsRdRtrmXF6yQf4aGj+T90w6HJFvip0KAHF+A
	 FpF+RIQJXK4bSyABKWkoIXy9L/1ExmSFwNF6wBm7zdefg4hda7EIezsJYPptUf8K/r
	 gM870G//DQvrQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 53D8BC4332E; Thu,  5 Oct 2023 23:43:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216156] [bisected] kmemleak: Not scanning unknown object at
 0xc00000007f000000
Date: Thu, 05 Oct 2023 23:43:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216156-206035-bh2RDaYJN9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216156-206035@https.bugzilla.kernel.org/>
References: <bug-216156-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216156

--- Comment #12 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 305198
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305198&action=3Dedit
kernel .config (5.18, PowerMac G5 11,2)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2BC561B7E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 15:42:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYfdP5N31z3drw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 23:42:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tLNoEKYV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tLNoEKYV;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYfcj2fM7z2yJL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 23:41:25 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B915BB82AE1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 13:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 816D5C341CD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 13:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656596479;
	bh=6NXIL7YBtrDtmVFlCf5U/aVrAz469CbZRPWCPigyCw0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tLNoEKYVYSMAVbL+Mvbi3VlUuxcSthaidEyX74U6y6ZWo/zb2efHJfGLdWfCl8mGA
	 utfeqBn6A2jDD91NZlEsYV0LUqlHVyCT+Tpbkls0APa2Q2w5t5RiAXsCx39whUPp7d
	 ONcKXQW0iWbItpolTDGPHDvc7K0GzV7Xa+HLWNvBmrDFnAq9xKd0jORTF+mjuF2JiE
	 q9Z+J71E2Qd41p+K5WevuJ9wZU+EBMRlojrI6MWKl3G1hLyxse0P2RHl5gk19rhe3k
	 UT/46yeASSPmIhhRMw/kjKD80IaQCvM1vYqEWgbTMxKp4vcRBu7sPinWx+zbiLavmf
	 EY2SffpSoxrGQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6DEA6C05FD5; Thu, 30 Jun 2022 13:41:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] pagealloc: memory corruption at building glibc-2.33 and
 running its' testsuite
Date: Thu, 30 Jun 2022 13:41:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215389-206035-RGDQ8mllhY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215389-206035@https.bugzilla.kernel.org/>
References: <bug-215389-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215389

--- Comment #32 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Michael Ellerman from comment #30)
> It's a bit of a stab in the dark, but can you try turning preempt off?
>=20
> ie. CONFIG_PREEMPT_NONE=3Dy
Looks like your intuition was not bad at all. ;) CONFIG_PREEMPT_NONE=3Dy ha=
d no
effect but when I disable SMP at all '# CONFIG_SMP is not set' I get no mem=
ory
corruption and also no stack overflow issues.

Also no special treatment with Advanced Options or setting THREAD_SHIFT
manually was necessary. The G4 just does fine, albeit with 1 of it's 2 CPUs
only with disabled SMP.

For testing I did 6 of this glibc testsuite builds in a row without getting
issues. With SMP enabled I get memory corruption or stack overflow at the 1=
st
build allmost all of the time.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

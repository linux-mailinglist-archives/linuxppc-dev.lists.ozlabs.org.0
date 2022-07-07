Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 712CF569FEE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 12:31:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ldt3q2kzgz3c6J
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 20:31:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FA5+wxqX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FA5+wxqX;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ldt3742Wcz2xCB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 20:30:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1FBAEB82114
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 10:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF7A9C341CB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 10:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657189822;
	bh=LJ8kIcUgcbyvuhYKuWLU8oGvl96sZwquIj1gZMgN2sU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FA5+wxqX9p/UMoEJnFBVFTdJG7n0E5AiPEDTSjODEfSbfJbzo5R1CHIOUPVuJenV8
	 y7QIHmwCCaI6UrI4vwQKVnMgMdkKIKwJHn+Rty0W3fntd8bLa8TC2GDFcnP1Y8RoYk
	 9RqG2I79QwZA86rqkRHuJgGvK0wOxWTsfbkQ4yAZE6UjKsHuYm4+iyvvqKSaQLiKC9
	 tncWOhakpq9vrexNOV103vY+CQbq2nOi5oftmQqmNR3l5yka63GaRelAETP7anSftY
	 1HwCzpH6fDHL0gzZPzKtzV4KZlvHPckL4A1LK7jjVsOmYpWFD5LhFpfISlE43XfyWI
	 AzgaEhVtY1KeA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B81E2CC13B5; Thu,  7 Jul 2022 10:30:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213079] [bisected] IRQ problems and crashes on a PowerMac G5
 with 5.12.3
Date: Thu, 07 Jul 2022 10:30:22 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213079-206035-qxqALavFf8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213079-206035@https.bugzilla.kernel.org/>
References: <bug-213079-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213079

--- Comment #19 from Erhard F. (erhard_f@mailbox.org) ---
(Luckily) I am no longer able to reproduce this. Re-tested on 5.19-rc5.

Perhaps the problem was also specific for this specific NVMe SSD. I swapped=
 it
for another one and now I have not seen this issue so far.

I'll keep an eye on it and will close here if it stays like that for the ne=
xt
few stable kernels.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

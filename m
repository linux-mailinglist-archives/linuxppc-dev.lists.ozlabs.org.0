Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 795AC543F7A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 00:55:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJMyQ24Q4z3c7L
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 08:55:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GAkPpdgw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GAkPpdgw;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJMxj6Qjzz305b
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 08:55:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 0774FCE2C90
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jun 2022 22:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5419CC3411F
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jun 2022 22:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654728901;
	bh=zh4rYRU6VMB7e/ltgHy+K2i0SI+hZzM34Rfk5LlDuEU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GAkPpdgwSEdQhnuymfbpOKeb08dvhfldBSVNimMC0McDuX7lLPNlqXExOoQlQHfLC
	 ud9WVSO3ATkzgQ4TAXoJ1aJSrIF8arbK6mOuYKIhjkTH6GBvFu0WbdEtFbNhISUQIw
	 88PC0fmL5qqx3MEAS1c1w9H46GYPohGbG5KR1TfCTNLXpVrMrppHFk37qRR0U29rZf
	 QYsW7lHkZ05bTjovB0+Cr+Vehp8lFjiQLtdxurYHlWcYlRjhsSATwGPqjfPhrzwdMf
	 nbjYcheiX/Iz7xAgH2PtOfYAgl/4+PabzDwHS82SLMN8Fivafyc1cgBkV8837RSQ42
	 G6LwrZkh7IYRA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 37AAFC05FF5; Wed,  8 Jun 2022 22:55:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216041] Stack overflow at boot (do_IRQ: stack overflow: 1984)
 on a PowerMac G4 DP, KASAN debug build
Date: Wed, 08 Jun 2022 22:54:59 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216041-206035-PnqFGUu2Tj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216041-206035@https.bugzilla.kernel.org/>
References: <bug-216041-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216041

--- Comment #7 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301129
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301129&action=3Dedit
kernel .config (5.19-rc1, Outline KASAN + patches, PowerMac G4 DP)

Tried to reinvestigate this issue with a KASAN build of v5.19-rc1 but it se=
ems
it's not quite there.

I applied the 2 patches "powerpc-kasan-Force-thread-size-increase-with-KASA=
N"
and
"v2-powerpc-irq-Increase-stack_overflow-detection-limit-when-KASAN-is-enabl=
ed"
on top of v5.19-rc1 but I get a non-booting kernel. The kernel boots first =
but
gets stuck on a white screen reading

"done
found display: /pci@f0000000/ATY,AlteracParent@10/ATY,Alterac_B@1, opening.=
.."

Kernel with same config but with KFENCE instead of KASAN boots fine (see bug
#216095).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

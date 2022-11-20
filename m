Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A74631579
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Nov 2022 18:26:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFcrp35Mlz3dv1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 04:26:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rkkHvMQS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rkkHvMQS;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFcqN0583z3dvd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 04:25:35 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2BCD160C22
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Nov 2022 17:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91F25C433D6
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Nov 2022 17:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668965131;
	bh=for+dl0zonKHXej6k24yBYa1KuY98SvnUfdaP1LNNj8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rkkHvMQSWbzgkChxJCyd3HSaccki73X5Z8DSYg64mIsgxo3i6V6524hStpWVY5jWK
	 ufmgp27ctEPEV1AFW5HKdY1uV7T4aI7LmxjXiv0BLeMm7F03qV+hweg6U8pPefQR8l
	 CSTYxX3JR0uL45dNlOI1kh2tVfLGsGolsuFdWpVBmf4XwQVFBEgcmTCKy1Fys866cn
	 m+hBhbHl4FPsXouckl1mSgKtg9gi0u3ypI8qVKZVDjaZqH1zAIPqo7bJd8CJdH8wUB
	 i8rlbxkzGDiSnTAoMEUyRSzQH/4gz1ZeCiPWfe6Ca2YY8Haqcs2zaHqLLYx0j4ThYh
	 aRSsVveQ24Tug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 82A94C433E6; Sun, 20 Nov 2022 17:25:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 206203] kmemleak reports various leaks in drivers/of/unittest.c
Date: Sun, 20 Nov 2022 17:25:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-206203-206035-oPAU7ZSq1w@https.bugzilla.kernel.org/>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D206203

--- Comment #25 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 303241
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303241&action=3Dedit
kernel .config (kernel 6.1-rc5, PowerMac G4 3,6)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

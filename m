Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA99560AE1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 22:06:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYCBx5yPkz3dst
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 06:06:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JYhkj+48;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JYhkj+48;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYCBD0l5Nz3bls
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 06:05:24 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5FA95620D1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 20:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C15E2C34114
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 20:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656533120;
	bh=+ZOIFtsTqWJ/yv87B6INOX9j+TMPLlTXJD89Xj2JPHw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JYhkj+480iQifyVhyppRflMXoKq2iUSKO/DJwNBPpdweUFbBQ0d0ywt7g6yLtKJ9g
	 VcDwqkNtlffXdEm1HzGh9rfH3JXxSotf35L2gUWed/nuggmbp3M3Q13gWv4DmuK3Ei
	 St7vA27j9gcrV7Asv9NCeHWAwHvuL1kzoZLBQtvbUISRwr+vNfz9LnUu8OEc2rN1yM
	 ikKwZbO7m1Xm+FCGAJdhUE//BlCIK7SJBcnNuQLdl/ObbGXp6YN068z3mLKgd5ltm8
	 cGTbqFcnqFz+qeMUV5+eltgQRcW9IGhkvzIlMffjFslya1/GtcByX4OXJTcgjHWzqD
	 nGC64tK+TcbPA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AD1DBC05FD2; Wed, 29 Jun 2022 20:05:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216190] 5.19-rc4 kernel + KASAN fails to boot at very early
 stage when CONFIG_SMP=y is selected (PowerMac G4 3,6)
Date: Wed, 29 Jun 2022 20:05:20 +0000
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
Message-ID: <bug-216190-206035-GYTAa4UKcq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216190-206035@https.bugzilla.kernel.org/>
References: <bug-216190-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216190

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301308
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301308&action=3Dedit
dmesg (5.19-rc4, outline KASAN, without SMP, PowerMac G4 DP)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
